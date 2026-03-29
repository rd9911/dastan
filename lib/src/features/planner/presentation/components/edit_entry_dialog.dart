import 'package:flutter/material.dart';
import '../../domain/planner_models.dart';

class EditEntryDialog extends StatefulWidget {
  final DayPlanEntry entry;
  final DateTime planDate;

  const EditEntryDialog({
    super.key,
    required this.entry,
    required this.planDate,
  });

  @override
  State<EditEntryDialog> createState() => _EditEntryDialogState();
}

class _EditEntryDialogState extends State<EditEntryDialog> {
  late TextEditingController _notesController;
  late int _durationMinutes;
  late PlanEntryType _type;
  late TimeOfDay? _startTime;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.entry.notes);
    _durationMinutes = widget.entry.durationMinutes;
    _type = widget.entry.type;
    _startTime = widget.entry.startTime != null
        ? TimeOfDay.fromDateTime(widget.entry.startTime!)
        : null;
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit ${widget.entry.title}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Type Selector
            DropdownButtonFormField<PlanEntryType>(
              initialValue: _type,
              // If I use initialValue, and set state, it won't update?
              // Let's try ignoring the warning or verify if value allows updates.
              // Actually, if we use value, we are "controlled". Deprecation might be for "Form" usage where generic FormField handles it?
              // Let's try suppressing or using value.
              // Warning text: "'value' is deprecated... use initialValue instead."
              // I will stick with value for now as I need reactivity.
              // But unrelated: I will remove intl import if still there (I did it in step 5043? tool said completed).
              decoration: const InputDecoration(labelText: 'Type'),
              items: const [
                DropdownMenuItem(
                  value: PlanEntryType.fixed,
                  child: Text('Fixed Time'),
                ),
                DropdownMenuItem(
                  value: PlanEntryType.flex,
                  child: Text('Flexible'),
                ),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() => _type = val);
                }
              },
            ),
            const SizedBox(height: 16),

            // Start Time (Only if Fixed)
            if (_type == PlanEntryType.fixed)
              ListTile(
                title: const Text('Start Time'),
                subtitle: Text(_startTime?.format(context) ?? 'Not set'),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        _startTime ?? const TimeOfDay(hour: 9, minute: 0),
                  );
                  if (time != null) {
                    setState(() => _startTime = time);
                  }
                },
              ),

            const SizedBox(height: 16),
            // Duration
            TextFormField(
              initialValue: _durationMinutes.toString(),
              decoration: const InputDecoration(
                labelText: 'Duration (minutes)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                final parsed = int.tryParse(val);
                if (parsed != null) {
                  _durationMinutes = parsed;
                }
              },
            ),
            const SizedBox(height: 16),
            // Notes
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            // Reconstruct entry
            DateTime? newStart;

            if (_startTime != null) {
              // Use planDate for year/month/day
              newStart = DateTime(
                widget.planDate.year,
                widget.planDate.month,
                widget.planDate.day,
                _startTime!.hour,
                _startTime!.minute,
              );
            }

            final updated = widget.entry.copyWith(
              type: _type,
              durationMinutes: _durationMinutes,
              notes: _notesController.text,
              startTime: newStart,
            );

            Navigator.pop(context, updated);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
