import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:dastan/src/features/planner/application/day_plan_store.dart';
import 'package:dastan/src/features/planner/presentation/components/day_plan_timeline.dart';
import 'package:dastan/src/core/presentation/widgets/active_itinerary_guard.dart';
import 'package:dastan/src/features/planner/application/autobuild_service.dart';
import 'package:dastan/src/features/planner/domain/autobuild_models.dart';
import 'package:dastan/src/core/data/saved_item_repository.dart';
import 'package:dastan/src/features/planner/presentation/components/add_items_sheet.dart';
import 'package:dastan/src/features/planner/presentation/components/edit_entry_dialog.dart';
import 'package:dastan/src/features/planner/application/saved_item_mapper.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';

// Simple notifier for the selected date in planner
class PlannerDateNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime(2023, 10, 27);
  }

  void setDate(DateTime date) {
    state = date;
  }
}

final plannerDateProvider = NotifierProvider<PlannerDateNotifier, DateTime>(
  PlannerDateNotifier.new,
);

class PlannerScreen extends ConsumerWidget {
  const PlannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the selected date
    final selectedDate = ref.watch(plannerDateProvider);

    return ActiveItineraryGuard(
      title: 'Planner',
      message: 'Please select an itinerary to view your daily plans.',
      builder: (context, itinerary) {
        final planAsync = ref.watch(dayPlanStoreProvider(selectedDate));

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: InkWell(
              onTap: () => _pickDate(context, ref, selectedDate),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(DateFormat.MMMMEEEEd().format(selectedDate)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.auto_fix_high),
                tooltip: 'Auto Build Plan',
                onPressed: () => _showAutoBuildDialog(
                  context,
                  ref,
                  itinerary.id,
                  selectedDate,
                ),
              ),
            ],
          ),
          body: planAsync.when(
            data: (plan) {
              if (plan == null || plan.entries.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No plan for this day yet.'),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => _showAutoBuildDialog(
                          context,
                          ref,
                          itinerary.id,
                          selectedDate,
                        ),
                        icon: const Icon(Icons.auto_fix_high),
                        label: const Text('Auto Build for Me'),
                      ),
                    ],
                  ),
                );
              }
              return DayPlanTimeline(
                plan: plan,
                onReorder: (oldIndex, newIndex) {
                  ref
                      .read(dayPlanStoreProvider(selectedDate).notifier)
                      .reorderEntries(oldIndex, newIndex);
                },
                onEntryTap: (entry) =>
                    _showEditDialog(context, ref, entry, selectedDate),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                _showAddItemsDialog(context, ref, itinerary.id, selectedDate),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Future<void> _pickDate(
    BuildContext context,
    WidgetRef ref,
    DateTime currentDate,
  ) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (newDate != null) {
      ref.read(plannerDateProvider.notifier).setDate(newDate);
    }
  }

  Future<void> _showAddItemsDialog(
    BuildContext context,
    WidgetRef ref,
    String itineraryId,
    DateTime date,
  ) async {
    // Fetch all items and current plan
    final allItems = await ref
        .read(savedItemRepositoryProvider)
        .getSavedItems(itineraryId);
    final currentPlan = ref.read(dayPlanStoreProvider(date)).value;

    if (context.mounted) {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) => AddItemsSheet(
          allItems: allItems,
          currentPlanEntries: currentPlan?.entries ?? [],
          onAdd: (item) {
            final entry = SavedItemMapper.mapToEntry(item, date);
            ref.read(dayPlanStoreProvider(date).notifier).addEntry(date, entry);
            Navigator.pop(context); // Close sheet after adding
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Added ${item.title}')));
          },
        ),
      );
    }
  }

  Future<void> _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    DayPlanEntry entry,
    DateTime date,
  ) async {
    final updatedEntry = await showDialog<DayPlanEntry>(
      context: context,
      builder: (context) => EditEntryDialog(entry: entry, planDate: date),
    );

    if (updatedEntry != null) {
      // We need a method to update a single entry in the store.
      // Assuming addEntry handles update if ID matches?
      // Checking DayPlanStore implementation...
      // "final updatedentries = [...currentPlan.entries, entry];" -> It appends!
      // I need an updateEntry method in DayPlanStore.
      // For now, I will assume I need to ADD that method or use addEntry if I modified logic there.
      // Wait, DayPlanStore logic:
      // "final updatedentries = [...currentPlan.entries, entry];"
      // It blindly appends. I need `updateEntry`.

      await ref
          .read(dayPlanStoreProvider(date).notifier)
          .updateEntry(updatedEntry);
    }
  }

  Future<void> _showAutoBuildDialog(
    BuildContext context,
    WidgetRef ref,
    String itineraryId,
    DateTime date,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Auto-Build Plan?'),
        content: const Text(
          'This will collect all your saved items and arrange them into a feasible schedule. '
          'Any existing plan for this day will be overwritten.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Build It'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      // Show loading indicator? For now just async block.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Generating plan...')));

      try {
        // 1. Fetch Candidates
        final items = await ref
            .read(savedItemRepositoryProvider)
            .getSavedItems(itineraryId);

        // 2. Build Request
        final request = AutoBuildRequest(
          itineraryId: itineraryId,
          date: date,
          candidates: items,
          // Use default preferences for MVP
          preferences: const AutoBuildPreferences(),
        );

        // 3. Generate
        final newPlan = await ref
            .read(autoBuildServiceProvider.notifier)
            .generatePlan(request);

        // 4. Save
        await ref.read(dayPlanStoreProvider(date).notifier).savePlan(newPlan);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Plan generated successfully!')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to generate plan: $e')),
          );
        }
      }
    }
  }
}
