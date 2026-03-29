import 'package:uuid/uuid.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:dastan/src/features/planner/domain/conflict_models.dart';

/// Service for detecting conflicts in a day plan.
class ConflictDetectionService {
  final Uuid _uuid = const Uuid();

  /// Detects all conflicts in a day plan.
  List<Conflict> detectConflicts(
    DayPlan plan, {
    DateTime? itineraryStart,
    DateTime? itineraryEnd,
  }) {
    final conflicts = <Conflict>[];

    // 1. Detect overlaps
    conflicts.addAll(_detectOverlaps(plan.entries));

    // 2. Detect tight transfers
    conflicts.addAll(_detectTightTransfers(plan.entries));

    // 3. Detect outside itinerary dates
    if (itineraryStart != null && itineraryEnd != null) {
      conflicts.addAll(
        _detectOutsideItinerary(plan, itineraryStart, itineraryEnd),
      );
    }

    return conflicts;
  }

  List<Conflict> _detectOverlaps(List<DayPlanEntry> entries) {
    final conflicts = <Conflict>[];
    final sortedEntries = List<DayPlanEntry>.from(entries)
      ..sort(
        (a, b) => (a.startTime ?? DateTime(2099)).compareTo(
          b.startTime ?? DateTime(2099),
        ),
      );

    for (int i = 0; i < sortedEntries.length - 1; i++) {
      final current = sortedEntries[i];
      final next = sortedEntries[i + 1];

      if (current.startTime == null ||
          current.endTime == null ||
          next.startTime == null) {
        continue;
      }

      if (current.endTime!.isAfter(next.startTime!)) {
        final overlapMinutes = current.endTime!
            .difference(next.startTime!)
            .inMinutes;
        conflicts.add(
          Conflict(
            id: _uuid.v4(),
            type: ConflictType.overlap,
            entryIds: [current.id, next.id],
            message:
                '"${current.title}" overlaps with "${next.title}" by $overlapMinutes minutes',
            suggestions: [
              ConflictSuggestion(
                id: _uuid.v4(),
                label: 'Shift earlier',
                description:
                    'Move "${current.title}" earlier by $overlapMinutes min',
                action: ConflictFixAction.shiftEarlier,
                params: {'entryId': current.id, 'minutes': overlapMinutes},
              ),
              ConflictSuggestion(
                id: _uuid.v4(),
                label: 'Push later',
                description:
                    'Move "${next.title}" later by $overlapMinutes min',
                action: ConflictFixAction.shiftLater,
                params: {'entryId': next.id, 'minutes': overlapMinutes},
              ),
              ConflictSuggestion(
                id: _uuid.v4(),
                label: 'Swap order',
                description: 'Swap the order of these activities',
                action: ConflictFixAction.swapOrder,
                params: {'entryId1': current.id, 'entryId2': next.id},
              ),
            ],
            detectedAt: DateTime.now(),
          ),
        );
      }
    }

    return conflicts;
  }

  List<Conflict> _detectTightTransfers(List<DayPlanEntry> entries) {
    final conflicts = <Conflict>[];
    final sortedEntries = List<DayPlanEntry>.from(entries)
      ..sort(
        (a, b) => (a.startTime ?? DateTime(2099)).compareTo(
          b.startTime ?? DateTime(2099),
        ),
      );

    for (int i = 0; i < sortedEntries.length - 1; i++) {
      final current = sortedEntries[i];
      final next = sortedEntries[i + 1];

      if (current.endTime == null || next.startTime == null) continue;

      final gapMinutes = next.startTime!.difference(current.endTime!).inMinutes;
      final requiredTransfer = current.commuteDurationMinutes ?? 0;

      if (gapMinutes < requiredTransfer && gapMinutes >= 0) {
        final shortfall = requiredTransfer - gapMinutes;
        conflicts.add(
          Conflict(
            id: _uuid.v4(),
            type: ConflictType.tightTransfer,
            entryIds: [current.id, next.id],
            message:
                'Only $gapMinutes min between activities, need $requiredTransfer min for travel',
            suggestions: [
              ConflictSuggestion(
                id: _uuid.v4(),
                label: 'Extend gap',
                description: 'Push "${next.title}" later by $shortfall min',
                action: ConflictFixAction.shiftLater,
                params: {'entryId': next.id, 'minutes': shortfall},
              ),
              ConflictSuggestion(
                id: _uuid.v4(),
                label: 'Shorten activity',
                description:
                    'Reduce "${current.title}" duration by $shortfall min',
                action: ConflictFixAction.reduceDuration,
                params: {'entryId': current.id, 'minutes': shortfall},
              ),
            ],
            detectedAt: DateTime.now(),
          ),
        );
      }
    }

    return conflicts;
  }

  List<Conflict> _detectOutsideItinerary(
    DayPlan plan,
    DateTime start,
    DateTime end,
  ) {
    final conflicts = <Conflict>[];

    if (plan.date.isBefore(start) || plan.date.isAfter(end)) {
      conflicts.add(
        Conflict(
          id: _uuid.v4(),
          type: ConflictType.outsideItinerary,
          entryIds: plan.entries.map((e) => e.id).toList(),
          message:
              'This day (${plan.date.toIso8601String().split('T')[0]}) is outside itinerary dates',
          suggestions: [
            ConflictSuggestion(
              id: _uuid.v4(),
              label: 'Move to valid date',
              description: 'Move all entries to a date within the itinerary',
              action: ConflictFixAction.remove,
              params: {},
            ),
          ],
          detectedAt: DateTime.now(),
        ),
      );
    }

    return conflicts;
  }
}
