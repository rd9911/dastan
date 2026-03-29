import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:dastan/src/features/transport/application/transport_providers.dart';

/// A calendar widget showing min prices per month
/// User can tap a month to select it for their search
class FlexibleCalendarWidget extends ConsumerStatefulWidget {
  final String origin;
  final String destination;
  final void Function(DateTime selectedDate) onDateSelected;

  const FlexibleCalendarWidget({
    super.key,
    required this.origin,
    required this.destination,
    required this.onDateSelected,
  });

  @override
  ConsumerState<FlexibleCalendarWidget> createState() =>
      _FlexibleCalendarWidgetState();
}

class _FlexibleCalendarWidgetState
    extends ConsumerState<FlexibleCalendarWidget> {
  DateTime _displayMonth = DateTime.now();
  Map<DateTime, double>? _prices;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPrices();
  }

  @override
  void didUpdateWidget(FlexibleCalendarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.origin != widget.origin ||
        oldWidget.destination != widget.destination) {
      _loadPrices();
    }
  }

  Future<void> _loadPrices() async {
    if (widget.origin.isEmpty || widget.destination.isEmpty) return;

    setState(() => _isLoading = true);

    try {
      final repo = ref.read(transportRepositoryProvider);
      final prices = await repo.getCalendarMinPrices(
        widget.origin,
        widget.destination,
        _displayMonth,
      );
      if (mounted) {
        setState(() {
          _prices = prices;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _changeMonth(int delta) {
    setState(() {
      _displayMonth = DateTime(_displayMonth.year, _displayMonth.month + delta);
    });
    _loadPrices();
  }

  @override
  Widget build(BuildContext context) {
    final monthFormat = DateFormat('MMMM yyyy');
    final daysInMonth = DateTime(
      _displayMonth.year,
      _displayMonth.month + 1,
      0,
    ).day;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => _changeMonth(-1),
                  tooltip: 'Previous month',
                ),
                Text(
                  monthFormat.format(_displayMonth),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => _changeMonth(1),
                  tooltip: 'Next month',
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_prices == null)
              const Center(child: Text('Enter origin and destination'))
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.2,
                ),
                itemCount: daysInMonth,
                itemBuilder: (context, index) {
                  final date = DateTime.utc(
                    _displayMonth.year,
                    _displayMonth.month,
                    index + 1,
                  );
                  final price = _prices![date];
                  final isPast = date.isBefore(DateTime.now());

                  final dayFormat = DateFormat('EEEE, MMMM d');
                  final priceLabel = price != null && !isPast
                      ? ', from \$${price.toInt()}'
                      : '';
                  final semanticLabel = isPast
                      ? '${dayFormat.format(date)}, unavailable'
                      : '${dayFormat.format(date)}$priceLabel, tap to select';

                  return Semantics(
                    label: semanticLabel,
                    button: !isPast,
                    enabled: !isPast,
                    child: GestureDetector(
                      onTap: isPast ? null : () => widget.onDateSelected(date),
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: isPast
                              ? Colors.grey[200]
                              : Colors.blue.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isPast ? Colors.grey : Colors.black,
                              ),
                            ),
                            if (price != null && !isPast)
                              Text(
                                '\$${price.toInt()}',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green[700],
                                ),
                              ),
                          ],
                        ),
                      ),
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
