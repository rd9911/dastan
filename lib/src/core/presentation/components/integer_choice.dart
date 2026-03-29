import 'package:flutter/material.dart';

/// A button-triggered value picker component.
class IntegerChoice extends StatelessWidget {
  /// The label displayed before value is selected.
  final String label;

  /// The list of values to choose from.
  final List<int> values;

  /// The currently selected value.
  final int? selectedValue;

  /// Callback when a value is selected.
  final ValueChanged<int> onChanged;

  /// Whether this field is required.
  final bool isRequired;

  const IntegerChoice({
    super.key,
    required this.label,
    required this.values,
    this.selectedValue,
    required this.onChanged,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final displayLabel = isRequired ? '$label *' : label;

    return InkWell(
      onTap: () => _showPicker(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: displayLabel,
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          selectedValue?.toString() ?? 'Select',
          style: TextStyle(
            color: selectedValue != null
                ? Theme.of(context).textTheme.bodyLarge?.color
                : Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(height: 1),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: values.length,
                  itemBuilder: (context, index) {
                    final value = values[index];
                    final isSelected = value == selectedValue;

                    return ListTile(
                      title: Text(
                        value.toString(),
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : null,
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(
                              Icons.check,
                              color: Theme.of(context).primaryColor,
                            )
                          : null,
                      onTap: () {
                        onChanged(value);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
