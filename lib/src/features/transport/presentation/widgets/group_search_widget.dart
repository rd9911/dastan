import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/transport/application/transport_providers.dart';
import 'package:dastan/src/features/transport/data/transport_repository.dart';

/// Widget for group search - finds mutual destinations for multiple origins
class GroupSearchWidget extends ConsumerStatefulWidget {
  final void Function(String destination) onDestinationSelected;

  const GroupSearchWidget({super.key, required this.onDestinationSelected});

  @override
  ConsumerState<GroupSearchWidget> createState() => _GroupSearchWidgetState();
}

class _GroupSearchWidgetState extends ConsumerState<GroupSearchWidget> {
  final List<String> _origins = [];
  final _originController = TextEditingController();
  List<GroupDestination>? _results;
  bool _isLoading = false;
  String? _error;

  void _addOrigin() {
    final origin = _originController.text.trim();
    if (origin.isNotEmpty &&
        !_origins.contains(origin) &&
        _origins.length < 3) {
      setState(() {
        _origins.add(origin);
        _originController.clear();
      });
    }
  }

  void _removeOrigin(String origin) {
    setState(() {
      _origins.remove(origin);
      _results = null;
    });
  }

  Future<void> _search() async {
    if (_origins.length < 2) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Add at least 2 origins')));
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repo = ref.read(transportRepositoryProvider);
      final results = await repo.searchGroupDestinations(_origins);
      if (mounted) {
        setState(() {
          _results = results;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _originController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Group Search',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Find destinations that work for everyone',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),

            // Origin input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _originController,
                    decoration: const InputDecoration(
                      labelText: 'Origin city',
                      hintText: 'e.g., New York',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onSubmitted: (_) => _addOrigin(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _origins.length < 3 ? _addOrigin : null,
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add origin',
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Origin chips
            if (_origins.isNotEmpty)
              Wrap(
                spacing: 8,
                children: _origins
                    .map(
                      (o) => Semantics(
                        label: '$o origin, tap to remove',
                        child: Chip(
                          label: Text(o),
                          onDeleted: () => _removeOrigin(o),
                          deleteButtonTooltipMessage: 'Remove $o',
                        ),
                      ),
                    )
                    .toList(),
              ),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _origins.length >= 2 ? _search : null,
                child: const Text('Find Mutual Destinations'),
              ),
            ),

            // Results
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_error != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Error: $_error',
                  style: const TextStyle(color: Colors.red),
                ),
              )
            else if (_results != null) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                'Best destinations for your group:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _results!.length,
                itemBuilder: (context, index) {
                  final dest = _results![index];
                  final priceBreakdown = dest.pricePerOrigin.entries
                      .map((e) => '${e.key}: \$${e.value.toInt()}')
                      .join(' • ');
                  final semanticLabel =
                      'Rank ${index + 1}: ${dest.destination}, total \$${dest.totalPrice.toInt()}, $priceBreakdown, tap to select';
                  return Semantics(
                    label: semanticLabel,
                    button: true,
                    child: ListTile(
                      onTap: () =>
                          widget.onDestinationSelected(dest.destination),
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(dest.destination),
                      subtitle: Text(priceBreakdown),
                      trailing: Text(
                        '\$${dest.totalPrice.toInt()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
