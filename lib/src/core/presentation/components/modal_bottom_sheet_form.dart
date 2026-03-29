import 'package:flutter/material.dart';
import 'package:dastan/src/core/presentation/components/options_list_increment.dart';

/// Types of questions supported in ModalBottomSheetForm.
enum QuestionType { singleChoice, multipleChoice, increment, freeText }

/// Configuration for an option in a question.
class OptionConfig {
  final String label;
  final String? subtitle;
  final IconData? icon;
  final int defaultValue;
  final int minValue;
  final int maxValue;

  const OptionConfig({
    required this.label,
    this.subtitle,
    this.icon,
    this.defaultValue = 0,
    this.minValue = 0,
    this.maxValue = 10,
  });
}

/// Configuration for a question in the form.
class QuestionConfig {
  final String text;
  final QuestionType type;
  final List<dynamic> options; // String for choice, OptionConfig for increment
  final dynamic defaultValue;
  final IconData? icon;

  const QuestionConfig({
    required this.text,
    required this.type,
    required this.options,
    this.defaultValue,
    this.icon,
  });
}

/// Holds the current values for a form.
class FormValues {
  final Map<int, dynamic> values;

  const FormValues(this.values);

  T? getValue<T>(int questionIndex) => values[questionIndex] as T?;
}

/// A button that triggers a modal bottom sheet with a dynamic form.
class ModalBottomSheetForm extends StatefulWidget {
  /// The configuration for all questions in the form.
  final List<QuestionConfig> config;

  /// The text displayed on the trigger button.
  final String buttonText;

  /// The icon displayed on the trigger button.
  final IconData? buttonIcon;

  /// Callback when form is completed.
  final ValueChanged<FormValues>? onDone;

  /// Initial values for the form.
  final FormValues? initialValues;

  const ModalBottomSheetForm({
    super.key,
    required this.config,
    this.buttonText = 'Options',
    this.buttonIcon = Icons.tune,
    this.onDone,
    this.initialValues,
  });

  @override
  State<ModalBottomSheetForm> createState() => _ModalBottomSheetFormState();
}

class _ModalBottomSheetFormState extends State<ModalBottomSheetForm> {
  late Map<int, dynamic> _values;

  @override
  void initState() {
    super.initState();
    _initializeValues();
  }

  void _initializeValues() {
    _values = widget.initialValues?.values ?? {};

    for (int i = 0; i < widget.config.length; i++) {
      if (_values[i] == null) {
        final question = widget.config[i];
        switch (question.type) {
          case QuestionType.singleChoice:
            _values[i] =
                question.defaultValue ??
                (question.options.isNotEmpty ? question.options.last : null);
            break;
          case QuestionType.multipleChoice:
            _values[i] = question.defaultValue ?? <String>[];
            break;
          case QuestionType.increment:
            // Initialize as map of option index -> value
            final opts = question.options.cast<OptionConfig>();
            final Map<int, int> incrementValues = {};
            for (int j = 0; j < opts.length; j++) {
              incrementValues[j] = opts[j].defaultValue;
            }
            _values[i] = incrementValues;
            break;
          case QuestionType.freeText:
            _values[i] = question.defaultValue ?? '';
            break;
        }
      }
    }
  }

  String _buildSummary() {
    final summaryParts = <String>[];

    for (int i = 0; i < widget.config.length; i++) {
      final question = widget.config[i];
      final value = _values[i];

      switch (question.type) {
        case QuestionType.singleChoice:
          if (value != null) {
            summaryParts.add(value.toString());
          }
          break;
        case QuestionType.increment:
          final incrementValues = value as Map<int, int>?;
          if (incrementValues != null) {
            final opts = question.options.cast<OptionConfig>();
            for (int j = 0; j < opts.length; j++) {
              final count = incrementValues[j] ?? 0;
              if (count > 0) {
                summaryParts.add('$count ${opts[j].label}');
              }
            }
          }
          break;
        case QuestionType.multipleChoice:
          final selected = value as List<String>?;
          if (selected != null && selected.isNotEmpty) {
            summaryParts.addAll(selected);
          }
          break;
        case QuestionType.freeText:
          if (value != null && value.toString().isNotEmpty) {
            final text = value.toString();
            summaryParts.add(
              text.length > 6 ? '${text.substring(0, 6)}...' : text,
            );
          }
          break;
      }
    }

    return summaryParts.isEmpty ? widget.buttonText : summaryParts.join(' • ');
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.4,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return Column(
                  children: [
                    // Handle bar
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    // Content
                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: widget.config.length,
                        separatorBuilder: (_, __) => const Divider(height: 32),
                        itemBuilder: (context, index) {
                          return _buildQuestion(index, setSheetState);
                        },
                      ),
                    ),
                    // Done button
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              widget.onDone?.call(FormValues(_values));
                              Navigator.pop(context);
                              setState(() {}); // Update summary
                            },
                            child: const Text('Done'),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildQuestion(int index, StateSetter setSheetState) {
    final question = widget.config[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (question.icon != null) ...[
              Icon(question.icon, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              question.text,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildQuestionContent(index, question, setSheetState),
      ],
    );
  }

  Widget _buildQuestionContent(
    int index,
    QuestionConfig question,
    StateSetter setSheetState,
  ) {
    switch (question.type) {
      case QuestionType.singleChoice:
        return _buildSingleChoice(index, question, setSheetState);
      case QuestionType.multipleChoice:
        return _buildMultipleChoice(index, question, setSheetState);
      case QuestionType.increment:
        return _buildIncrement(index, question, setSheetState);
      case QuestionType.freeText:
        return _buildFreeText(index, question, setSheetState);
    }
  }

  Widget _buildSingleChoice(
    int index,
    QuestionConfig question,
    StateSetter setSheetState,
  ) {
    final options = question.options.cast<String>();
    final selected = _values[index] as String?;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = option == selected;
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (sel) {
            setSheetState(() {
              _values[index] = option;
            });
            setState(() {});
          },
        );
      }).toList(),
    );
  }

  Widget _buildMultipleChoice(
    int index,
    QuestionConfig question,
    StateSetter setSheetState,
  ) {
    final options = question.options.cast<String>();
    final selected =
        (_values[index] as List<dynamic>?)?.cast<String>() ?? <String>[];

    return Column(
      children: options.map((option) {
        final isSelected = selected.contains(option);
        return CheckboxListTile(
          title: Text(option),
          value: isSelected,
          onChanged: (value) {
            setSheetState(() {
              if (value == true) {
                _values[index] = [...selected, option];
              } else {
                _values[index] = selected.where((s) => s != option).toList();
              }
            });
            setState(() {});
          },
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildIncrement(
    int index,
    QuestionConfig question,
    StateSetter setSheetState,
  ) {
    final opts = question.options.cast<OptionConfig>();
    final values = _values[index] as Map<int, int>? ?? {};

    return OptionsListIncrement(
      options: opts
          .map(
            (o) => IncrementOption(
              label: o.label,
              subtitle: o.subtitle,
              icon: o.icon,
              defaultValue: o.defaultValue,
              minValue: o.minValue,
              maxValue: o.maxValue,
            ),
          )
          .toList(),
      initialValues: values,
      onChanged: (newValues) {
        setSheetState(() {
          _values[index] = newValues;
        });
        setState(() {});
      },
    );
  }

  Widget _buildFreeText(
    int index,
    QuestionConfig question,
    StateSetter setSheetState,
  ) {
    return TextFormField(
      initialValue: _values[index]?.toString() ?? '',
      decoration: const InputDecoration(
        hintText: 'Enter text...',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        _values[index] = value;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showBottomSheet,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (widget.buttonIcon != null) ...[
              Icon(widget.buttonIcon, color: Colors.grey[600]),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                _buildSummary(),
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
