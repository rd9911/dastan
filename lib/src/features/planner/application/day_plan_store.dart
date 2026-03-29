import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/features/planner/data/planner_repository.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/saved_item_repository.dart';
import 'package:dastan/src/features/itineraries/presentation/active_itinerary_controller.dart';
import 'package:dastan/src/features/planner/application/eta_service.dart';

part 'day_plan_store.g.dart';

@riverpod
PlannerRepository plannerRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return DriftPlannerRepository(db);
}

@riverpod
class DayPlanStore extends _$DayPlanStore {
  @override
  Stream<DayPlan?> build(DateTime date) {
    final repository = ref.watch(plannerRepositoryProvider);
    final activeItinerary = ref.watch(activeItineraryControllerProvider);

    return activeItinerary.when(
      data: (itinerary) {
        if (itinerary == null) return Stream.value(null);
        return repository.watchDayPlan(itinerary.id, date);
      },
      loading: () => const Stream.empty(),
      error: (_, __) => const Stream.empty(), // Or handle error
    );
  }

  Future<void> savePlan(DayPlan plan) async {
    final repository = ref.read(plannerRepositoryProvider);
    await repository.saveDayPlan(plan);
  }

  Future<void> addEntry(DateTime date, DayPlanEntry entry) async {
    final currentPlan = await future;
    if (currentPlan == null) {
      // Create new plan if missing?
      final activeItinerary = ref.read(activeItineraryControllerProvider).value;
      if (activeItinerary == null) throw Exception('No active itinerary');

      final newPlan = DayPlan(
        itineraryId: activeItinerary.id,
        date: date,
        entries: [entry],
      );

      final planWithCommutes = await _updateSchedule(newPlan);
      await savePlan(planWithCommutes);
    } else {
      final updatedentries = [...currentPlan.entries, entry];
      final updatedPlan = currentPlan.copyWith(
        entries: updatedentries,
        updatedAt: DateTime.now(),
      );

      final planWithCommutes = await _updateSchedule(updatedPlan);
      await savePlan(planWithCommutes);
    }
  }

  Future<void> updateEntry(DayPlanEntry entry) async {
    final currentPlan = await future;
    if (currentPlan == null) return;

    final updatedEntries = currentPlan.entries.map((e) {
      if (e.id == entry.id) return entry;
      return e;
    }).toList();

    final updatedPlan = currentPlan.copyWith(
      entries: updatedEntries,
      updatedAt: DateTime.now(),
    );

    final planWithCommutes = await _updateSchedule(updatedPlan);
    await savePlan(planWithCommutes);
  }

  Future<void> reorderEntries(int oldIndex, int newIndex) async {
    final currentPlan = await future;
    if (currentPlan == null) return;

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final entries = List<DayPlanEntry>.from(currentPlan.entries);
    final item = entries.removeAt(oldIndex);
    entries.insert(newIndex, item);

    final updatedPlan = currentPlan.copyWith(
      entries: entries,
      updatedAt: DateTime.now(),
    );

    final planWithCommutes = await _updateSchedule(updatedPlan);
    await savePlan(planWithCommutes);
  }

  Future<DayPlan> _updateSchedule(DayPlan plan) async {
    final savedItemRepo = ref.read(savedItemRepositoryProvider);
    final etaService = ref.read(etaServiceProvider.notifier);

    if (plan.entries.isEmpty) return plan;

    final newEntries = List<DayPlanEntry>.from(plan.entries);
    bool changed = false;

    // Start tracking time from the beginning of the day?
    // Or from the first Fixed item?
    // Default to 8:00 AM if no previous context, or just use first item's start if fixed.

    // For now, we propagate times strictly based on the list order.
    // If Item 0 is Flex, when does it start?
    // Let's assume a default start time for the day if not specified.
    DateTime currentTime = plan.date.add(
      const Duration(hours: 9),
    ); // 9 AM default

    for (int i = 0; i < newEntries.length; i++) {
      var entry = newEntries[i];

      // 1. Calculate Commute from previous
      if (i > 0) {
        final prev = newEntries[i - 1];
        // Only calc commute if not already set or we want to auto-update
        // For C2/C3 auto-calc is good.
        if (prev.savedItemId != null && entry.savedItemId != null) {
          // ... (Commute logic from before, but simplified access) ...
          final fromItem = await savedItemRepo.getSavedItem(prev.savedItemId!);
          final toItem = await savedItemRepo.getSavedItem(entry.savedItemId!);

          if (fromItem?.location != null && toItem?.location != null) {
            final travelTime = await etaService.getTravelTime(
              fromItem!.location!,
              toItem!.location!,
            );
            if (travelTime != null) {
              final minutes = travelTime.inMinutes;
              if (entry.commuteDurationMinutes != minutes) {
                entry = entry.copyWith(
                  commuteDurationMinutes: minutes,
                  commuteMode: TravelMode.transit,
                );
                changed = true;
              }
            }
          }
        }
      }

      // 2. Propagate Time
      // Effective start time depends on previous end + commute
      if (i > 0) {
        final prev = newEntries[i - 1];
        final prevEnd = prev.endTime ?? currentTime; // Fallback
        final commute = entry.commuteDurationMinutes ?? 0;
        final arrivalTime = prevEnd.add(Duration(minutes: commute));

        if (entry.type == PlanEntryType.flex) {
          // Flex item starts at arrival time
          if (entry.startTime != arrivalTime) {
            entry = entry.copyWith(startTime: arrivalTime);
            changed = true;
          }
          // End time is start + duration
          final endTime = arrivalTime.add(
            Duration(minutes: entry.durationMinutes),
          );
          if (entry.endTime != endTime) {
            entry = entry.copyWith(endTime: endTime);
            changed = true;
          }
          currentTime = endTime;
        } else if (entry.type == PlanEntryType.fixed) {
          // Fixed item has its own start time.
          // We just update currentTime to its end.
          // (We could check conflict here: if arrivalTime > entry.startTime)
          if (entry.startTime != null) {
            // If arrival is late, we might flag conflict.
            // For now, we assume Fixed time is truth.
            currentTime =
                entry.endTime ??
                entry.startTime!.add(Duration(minutes: entry.durationMinutes));
          } else {
            // Fixed but no time? Treat as Flex? Or Invalid?
            // Let's treat as Flex for calculation if time missing.
            final endTime = arrivalTime.add(
              Duration(minutes: entry.durationMinutes),
            );
            entry = entry.copyWith(startTime: arrivalTime, endTime: endTime);
            changed = true;
            currentTime = endTime;
          }
        }
      } else {
        // First Item
        if (entry.type == PlanEntryType.flex) {
          // Starts at default day start (9 AM)
          if (entry.startTime != currentTime) {
            entry = entry.copyWith(startTime: currentTime);
            changed = true;
          }
          final endTime = currentTime.add(
            Duration(minutes: entry.durationMinutes),
          );
          if (entry.endTime != endTime) {
            entry = entry.copyWith(endTime: endTime);
            changed = true;
          }
          currentTime = endTime;
        } else if (entry.type == PlanEntryType.fixed &&
            entry.startTime != null) {
          currentTime =
              entry.endTime ??
              entry.startTime!.add(Duration(minutes: entry.durationMinutes));
        }
      }

      newEntries[i] = entry;
    }

    if (changed) {
      return plan.copyWith(entries: newEntries);
    }
    return plan;
  }
}
