import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:intl/intl.dart';

class DayPlanTimeline extends ConsumerWidget {
  final DayPlan plan;
  final Function(int oldIndex, int newIndex) onReorder;
  final Function(DayPlanEntry entry)? onEntryTap;

  const DayPlanTimeline({
    super.key,
    required this.plan,
    required this.onReorder,
    this.onEntryTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (plan.entries.isEmpty) {
      return const Center(
        child: Text('No items in plan. Add items from Search.'),
      );
    }

    return ReorderableListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plan.entries.length,
      onReorder: onReorder,
      itemBuilder: (context, index) {
        final entry = plan.entries[index];
        return _TimelineItem(
          key: ValueKey(entry.id),
          entry: entry,
          index: index,
          isFirst: index == 0,
          isLast: index == plan.entries.length - 1,
          onTap: () => onEntryTap?.call(entry),
        );
      },
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final DayPlanEntry entry;
  final int index;
  final bool isFirst;
  final bool isLast;
  final VoidCallback? onTap;

  const _TimelineItem({
    super.key,
    required this.entry,
    required this.index,
    required this.isFirst,
    required this.isLast,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Basic timeline styling
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time Column
        SizedBox(
          width: 60,
          child: Column(
            children: [
              if (entry.startTime != null)
                Text(
                  DateFormat.jm().format(entry.startTime!),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (entry.type == PlanEntryType.flex)
                const Icon(
                  Icons.code,
                  size: 16,
                  color: Colors.grey,
                ), // Flex icon placeholder
            ],
          ),
        ),

        // Line & Dot
        Column(
          children: [
            Container(
              width: 2,
              height: 20,
              color: isFirst ? Colors.transparent : Colors.grey[300],
            ),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getColorForType(entry.type),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            Container(
              width: 2,
              height: 60, // approximate content height
              color: isLast ? Colors.transparent : Colors.grey[300],
            ),
          ],
        ),

        const SizedBox(width: 12),

        // Content Card
        Expanded(
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(entry.title),
              subtitle: Text(
                '${entry.durationMinutes} min • ${entry.type.name}',
              ),
              trailing: const Icon(Icons.drag_handle),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }

  Color _getColorForType(PlanEntryType type) {
    switch (type) {
      case PlanEntryType.fixed:
        return Colors.blue;
      case PlanEntryType.flex:
        return Colors.orange;
      case PlanEntryType.custom:
        return Colors.purple;
    }
  }
}
