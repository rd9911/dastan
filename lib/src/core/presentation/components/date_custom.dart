import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A single date picker component with configurable label and required state.
class DateCustom extends StatelessWidget {
  /// The label to display. Defaults to "Departure".
  final String label;

  /// Whether this field is required.
  final bool isRequired;

  /// The currently selected date.
  final DateTime? selectedDate;

  /// Callback when a date is selected.
  final ValueChanged<DateTime> onSelected;

  /// The earliest selectable date. Defaults to today.
  final DateTime? firstDate;

  /// The latest selectable date. Defaults to 2 years from now.
  final DateTime? lastDate;

  /// Date format pattern. Defaults to 'MMM dd, yyyy'.
  final String dateFormat;

  const DateCustom({
    super.key,
    this.label = 'Departure',
    this.isRequired = true,
    this.selectedDate,
    required this.onSelected,
    this.firstDate,
    this.lastDate,
    this.dateFormat = 'MMM dd, yyyy',
  });

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat(dateFormat);
    final displayLabel = isRequired ? '$label *' : label;

    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: displayLabel,
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        child: Text(
          selectedDate != null
              ? formatter.format(selectedDate!)
              : 'Select date',
          style: TextStyle(
            color: selectedDate != null
                ? Theme.of(context).textTheme.bodyLarge?.color
                : Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: firstDate ?? now,
      lastDate: lastDate ?? now.add(const Duration(days: 730)),
    );

    if (picked != null) {
      onSelected(picked);
    }
  }
}
