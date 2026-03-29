import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/transport/application/transport_providers.dart';
import 'package:dastan/src/features/transport/data/transport_repository.dart';

/// A widget showing cities ranked by cheapest price for a region
class RegionDrilldownWidget extends ConsumerStatefulWidget {
  final String region;
  final void Function(String cityName) onCitySelected;

  const RegionDrilldownWidget({
    super.key,
    required this.region,
    required this.onCitySelected,
  });

  @override
  ConsumerState<RegionDrilldownWidget> createState() =>
      _RegionDrilldownWidgetState();
}

class _RegionDrilldownWidgetState extends ConsumerState<RegionDrilldownWidget> {
  List<RegionCity>? _cities;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  @override
  void didUpdateWidget(RegionDrilldownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.region != widget.region) {
      _loadCities();
    }
  }

  Future<void> _loadCities() async {
    if (widget.region.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final repo = ref.read(transportRepositoryProvider);
      final cities = await repo.getRegionCheapest(widget.region);
      if (mounted) {
        setState(() {
          _cities = cities;
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
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cheapest destinations in ${widget.region}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_error != null)
              Center(child: Text('Error: $_error'))
            else if (_cities == null || _cities!.isEmpty)
              const Center(child: Text('No cities found'))
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _cities!.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final city = _cities![index];
                  final semanticLabel =
                      '${city.name}, ${city.country}, from ${city.currency} ${city.minPrice.toStringAsFixed(0)}, tap to select';
                  return Semantics(
                    label: semanticLabel,
                    button: true,
                    child: ListTile(
                      onTap: () => widget.onCitySelected(city.name),
                      title: Text(city.name),
                      subtitle: Text(city.country),
                      trailing: Text(
                        '${city.currency} ${city.minPrice.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      leading: const Icon(Icons.flight_takeoff),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
