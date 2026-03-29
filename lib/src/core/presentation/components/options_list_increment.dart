import 'package:flutter/material.dart';

/// Configuration for an increment option.
class IncrementOption {
  final String label;
  final String? subtitle;
  final IconData? icon;
  final int defaultValue;
  final int minValue;
  final int maxValue;

  const IncrementOption({
    required this.label,
    this.subtitle,
    this.icon,
    this.defaultValue = 0,
    this.minValue = 0,
    this.maxValue = 10,
  });
}

/// A list of options where each option has increment/decrement controls.
class OptionsListIncrement extends StatefulWidget {
  /// The list of options to display.
  final List<IncrementOption> options;

  /// Current values for each option (by index).
  final Map<int, int>? initialValues;

  /// Callback when any value changes. Returns map of index -> value.
  final ValueChanged<Map<int, int>> onChanged;

  /// Optional title for the section.
  final String? title;

  const OptionsListIncrement({
    super.key,
    required this.options,
    this.initialValues,
    required this.onChanged,
    this.title,
  });

  @override
  State<OptionsListIncrement> createState() => _OptionsListIncrementState();
}

class _OptionsListIncrementState extends State<OptionsListIncrement> {
  late Map<int, int> _values;

  @override
  void initState() {
    super.initState();
    _values = widget.initialValues ?? {};
    // Initialize with default values
    for (int i = 0; i < widget.options.length; i++) {
      _values[i] ??= widget.options[i].defaultValue;
    }
  }

  void _increment(int index) {
    final option = widget.options[index];
    final currentValue = _values[index] ?? option.defaultValue;
    if (currentValue < option.maxValue) {
      setState(() {
        _values[index] = currentValue + 1;
      });
      widget.onChanged(_values);
    }
  }

  void _decrement(int index) {
    final option = widget.options[index];
    final currentValue = _values[index] ?? option.defaultValue;
    if (currentValue > option.minValue) {
      setState(() {
        _values[index] = currentValue - 1;
      });
      widget.onChanged(_values);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
        ],
        ...widget.options.asMap().entries.map((entry) {
          final index = entry.key;
          final option = entry.value;
          final currentValue = _values[index] ?? option.defaultValue;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                if (option.icon != null) ...[
                  Icon(option.icon, size: 24, color: Colors.grey[600]),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option.label,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (option.subtitle != null)
                        Text(
                          option.subtitle!,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                    ],
                  ),
                ),
                // Decrement button
                IconButton(
                  onPressed: currentValue > option.minValue
                      ? () => _decrement(index)
                      : null,
                  icon: const Icon(Icons.remove_circle_outline),
                  visualDensity: VisualDensity.compact,
                ),
                // Count display
                SizedBox(
                  width: 32,
                  child: Text(
                    '$currentValue',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                // Increment button
                IconButton(
                  onPressed: currentValue < option.maxValue
                      ? () => _increment(index)
                      : null,
                  icon: const Icon(Icons.add_circle_outline),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
