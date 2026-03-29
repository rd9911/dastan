import 'package:flutter/material.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';

/// A lightweight calendar grid view showing the day plan entries.
class CalendarGridView extends StatelessWidget {
  final DayPlan plan;
  final void Function(DayPlanEntry entry)? onEntryTap;

  // Display hours (6 AM to 10 PM)
  static const int startHour = 6;
  static const int endHour = 22;

  const CalendarGridView({super.key, required this.plan, this.onEntryTap});

  @override
  Widget build(BuildContext context) {
    final hourHeight = 60.0;
    final totalHeight = (endHour - startHour) * hourHeight;

    return SingleChildScrollView(
      child: SizedBox(
        height: totalHeight + 40, // Extra space for headers
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hour labels
            SizedBox(
              width: 50,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  for (int hour = startHour; hour <= endHour; hour++)
                    SizedBox(
                      height: hourHeight,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            '${hour.toString().padLeft(2, '0')}:00',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Events column
            Expanded(
              child: Stack(
                children: [
                  // Grid lines
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      for (int hour = startHour; hour <= endHour; hour++)
                        Container(
                          height: hourHeight,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.grey.shade200),
                            ),
                          ),
                        ),
                    ],
                  ),
                  // Events
                  ...plan.entries.map(
                    (entry) => _buildEventBlock(context, entry, hourHeight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventBlock(
    BuildContext context,
    DayPlanEntry entry,
    double hourHeight,
  ) {
    if (entry.startTime == null) return const SizedBox.shrink();

    final startMinutes =
        (entry.startTime!.hour - startHour) * 60 + entry.startTime!.minute;
    final top = 20.0 + (startMinutes / 60.0) * hourHeight;
    final height = (entry.durationMinutes / 60.0) * hourHeight;

    if (top < 0) return const SizedBox.shrink();

    return Positioned(
      top: top,
      left: 4,
      right: 4,
      height: height.clamp(24, double.infinity),
      child: GestureDetector(
        onTap: onEntryTap != null ? () => onEntryTap!(entry) : null,
        child: Container(
          decoration: BoxDecoration(
            color: _getEntryColor(entry.type).withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _getEntryColor(entry.type)),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (height > 40)
                Text(
                  '${entry.durationMinutes} min',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 10,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getEntryColor(PlanEntryType type) {
    switch (type) {
      case PlanEntryType.fixed:
        return Colors.blue;
      case PlanEntryType.flex:
        return Colors.green;
      case PlanEntryType.custom:
        return Colors.purple;
    }
  }
}
