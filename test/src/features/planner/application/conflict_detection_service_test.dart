import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:dastan/src/features/planner/domain/conflict_models.dart';
import 'package:dastan/src/features/planner/application/conflict_detection_service.dart';

void main() {
  late ConflictDetectionService service;

  setUp(() {
    service = ConflictDetectionService();
  });

  group('detectConflicts', () {
    test('detects overlap conflict', () {
      final plan = DayPlan(
        itineraryId: 'i1',
        date: DateTime(2024, 1, 15),
        version: 1,
        entries: [
          DayPlanEntry(
            id: 'e1',
            title: 'Breakfast',
            type: PlanEntryType.fixed,
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 10, 30), // ends at 10:30
            durationMinutes: 90,
          ),
          DayPlanEntry(
            id: 'e2',
            title: 'Museum',
            type: PlanEntryType.flex,
            startTime: DateTime(
              2024,
              1,
              15,
              10,
              0,
            ), // starts at 10:00 - overlap!
            endTime: DateTime(2024, 1, 15, 12, 0),
            durationMinutes: 120,
          ),
        ],
      );

      final conflicts = service.detectConflicts(plan);

      expect(conflicts.length, 1);
      expect(conflicts.first.type, ConflictType.overlap);
      expect(conflicts.first.entryIds, contains('e1'));
      expect(conflicts.first.entryIds, contains('e2'));
      expect(conflicts.first.suggestions.length, greaterThan(0));
    });

    test('detects tight transfer conflict', () {
      final plan = DayPlan(
        itineraryId: 'i1',
        date: DateTime(2024, 1, 15),
        version: 1,
        entries: [
          DayPlanEntry(
            id: 'e1',
            title: 'Breakfast',
            type: PlanEntryType.fixed,
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 10, 0),
            durationMinutes: 60,
            commuteDurationMinutes: 30, // needs 30 min to get to next
          ),
          DayPlanEntry(
            id: 'e2',
            title: 'Museum',
            type: PlanEntryType.flex,
            startTime: DateTime(
              2024,
              1,
              15,
              10,
              15,
            ), // only 15 min gap - tight!
            endTime: DateTime(2024, 1, 15, 12, 0),
            durationMinutes: 105,
          ),
        ],
      );

      final conflicts = service.detectConflicts(plan);

      expect(conflicts.any((c) => c.type == ConflictType.tightTransfer), true);
    });

    test('detects outside itinerary conflict', () {
      final plan = DayPlan(
        itineraryId: 'i1',
        date: DateTime(2024, 1, 20), // Outside range
        version: 1,
        entries: [
          DayPlanEntry(
            id: 'e1',
            title: 'Activity',
            type: PlanEntryType.flex,
            durationMinutes: 60,
          ),
        ],
      );

      final conflicts = service.detectConflicts(
        plan,
        itineraryStart: DateTime(2024, 1, 10),
        itineraryEnd: DateTime(2024, 1, 15),
      );

      expect(
        conflicts.any((c) => c.type == ConflictType.outsideItinerary),
        true,
      );
    });

    test('returns empty list for conflict-free plan', () {
      final plan = DayPlan(
        itineraryId: 'i1',
        date: DateTime(2024, 1, 15),
        version: 1,
        entries: [
          DayPlanEntry(
            id: 'e1',
            title: 'Breakfast',
            type: PlanEntryType.fixed,
            startTime: DateTime(2024, 1, 15, 9, 0),
            endTime: DateTime(2024, 1, 15, 10, 0),
            durationMinutes: 60,
          ),
          DayPlanEntry(
            id: 'e2',
            title: 'Museum',
            type: PlanEntryType.flex,
            startTime: DateTime(2024, 1, 15, 11, 0), // 1 hour gap - fine
            endTime: DateTime(2024, 1, 15, 13, 0),
            durationMinutes: 120,
          ),
        ],
      );

      final conflicts = service.detectConflicts(plan);

      expect(conflicts.isEmpty, true);
    });
  });
}
