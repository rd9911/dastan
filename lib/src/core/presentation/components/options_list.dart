import 'package:flutter/material.dart';

/// Defines the selection type for OptionsList.
enum OptionsListType {
  /// Only one option can be selected at a time.
  single,

  /// Multiple options can be selected.
  multiple,
}

/// A flexible options list component supporting single or multiple selection.
class OptionsList<T> extends StatelessWidget {
  /// The label to display.
  final String label;

  /// The list of options to choose from.
  final List<T> options;

  /// The currently selected value (used for single selection).
  final T? selectedValue;

  /// The currently selected values (used for multiple selection).
  final List<T>? selectedValues;

  /// Callback when selection changes (used for single selection).
  final ValueChanged<T?>? onChanged;

  /// Callback when selection changes (used for multiple selection).
  final ValueChanged<List<T>>? onMultiChanged;

  /// Function to convert option to display string.
  final String Function(T)? displayBuilder;

  /// Whether this field is required.
  final bool isRequired;

  /// The selection type: single or multiple.
  ///
  final OptionsListType type;
  const OptionsList({
    super.key,
    required this.label,
    required this.options,
    this.selectedValue,
    required this.onChanged,
    this.selectedValues,
    this.onMultiChanged,
    this.displayBuilder,
    this.isRequired = false,
    this.type = OptionsListType.single,
  });
  @override
  Widget build(BuildContext context) {
    final displayLabel = isRequired ? '$label *' : label;
    if (type == OptionsListType.single) {
      return DropdownButtonFormField<T>(
        decoration: InputDecoration(labelText: displayLabel),
        items: options.map((option) {
          final displayText = displayBuilder?.call(option) ?? option.toString();
          return DropdownMenuItem<T>(value: option, child: Text(displayText));
        }).toList(),
        onChanged: onChanged,
      );
    }
    // Multiple selection mode
    final currentSelection = selectedValues ?? <T>[];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            displayLabel,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ...options.map((option) {
          final isSelected = currentSelection.contains(option);
          final displayText = displayBuilder?.call(option) ?? option.toString();
          return ListTile(
            title: Text(displayText),
            trailing: isSelected
                ? Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : Icon(
                    Icons.circle_outlined,
                    color: Theme.of(context).colorScheme.outline,
                  ),
            onTap: () {
              final newSelection = List<T>.from(currentSelection);
              if (isSelected) {
                newSelection.remove(option);
              } else {
                newSelection.add(option);
              }
              onMultiChanged?.call(newSelection);
            },
          );
        }),
      ],
    );
  }
}
