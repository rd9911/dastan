import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A component with Departure and Return date pickers.
/// Validates that return date is >= departure date.
/// Auto-opens return picker after departure is selected.
class RoundDate extends StatefulWidget {
  /// The currently selected departure date.
  final DateTime? departureDate;

  /// The currently selected return date.
  final DateTime? returnDate;

  /// Callback when departure date is selected.
  final ValueChanged<DateTime> onDepartureSelected;

  /// Callback when return date is selected.
  final ValueChanged<DateTime> onReturnSelected;

  /// Label for departure field. Defaults to "Departure".
  final String departureLabel;

  /// Label for return field. Defaults to "Return".
  final String returnLabel;

  /// Date format pattern. Defaults to 'MMM dd, yyyy'.
  final String dateFormat;

  const RoundDate({
    super.key,
    this.departureDate,
    this.returnDate,
    required this.onDepartureSelected,
    required this.onReturnSelected,
    this.departureLabel = 'Departure',
    this.returnLabel = 'Return',
    this.dateFormat = 'MMM dd, yyyy',
  });

  @override
  State<RoundDate> createState() => _RoundDateState();
}

class _RoundDateState extends State<RoundDate> {
  String? _errorMessage;

  Future<void> _selectDepartureDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: widget.departureDate ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 730)),
    );

    if (picked != null) {
      widget.onDepartureSelected(picked);
      _validateDates(picked, widget.returnDate);

      // Auto-open return date picker
      if (mounted) {
        await Future.delayed(const Duration(milliseconds: 300));
        if (mounted && context.mounted) {
          _selectReturnDate(context, picked);
        }
      }
    }
  }

  Future<void> _selectReturnDate(
    BuildContext context, [
    DateTime? minDate,
  ]) async {
    final departure = minDate ?? widget.departureDate ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: widget.returnDate ?? departure,
      firstDate: departure,
      lastDate: departure.add(const Duration(days: 730)),
    );

    if (picked != null) {
      widget.onReturnSelected(picked);
      _validateDates(widget.departureDate, picked);
    }
  }

  void _validateDates(DateTime? departure, DateTime? returnDate) {
    if (departure != null &&
        returnDate != null &&
        returnDate.isBefore(departure)) {
      setState(() {
        _errorMessage = 'Return date must be after departure date';
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat(widget.dateFormat);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => _selectDepartureDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: '${widget.departureLabel} *',
                    suffixIcon: const Icon(Icons.calendar_today, size: 20),
                  ),
                  child: Text(
                    widget.departureDate != null
                        ? formatter.format(widget.departureDate!)
                        : 'Select',
                    style: TextStyle(
                      color: widget.departureDate != null
                          ? Theme.of(context).textTheme.bodyLarge?.color
                          : Theme.of(context).hintColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InkWell(
                onTap: () => _selectReturnDate(context),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: '${widget.returnLabel} *',
                    suffixIcon: const Icon(Icons.calendar_today, size: 20),
                  ),
                  child: Text(
                    widget.returnDate != null
                        ? formatter.format(widget.returnDate!)
                        : 'Select',
                    style: TextStyle(
                      color: widget.returnDate != null
                          ? Theme.of(context).textTheme.bodyLarge?.color
                          : Theme.of(context).hintColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 8),
          Text(
            _errorMessage!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
