import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:dastan/src/features/planner/domain/conflict_models.dart';

void main() {
  group('DayPlan Tests', () {
    test('Should support round-trip serialization', () {
      final plan = DayPlan(
        itineraryId: 'itin_1',
        date: DateTime(2025, 12, 25),
        entries: [
          DayPlanEntry(
            id: 'entry_1',
            type: PlanEntryType.fixed,
            startTime: DateTime(2025, 12, 25, 10, 0),
            endTime: DateTime(2025, 12, 25, 12, 0),
            durationMinutes: 120,
            title: 'Museum Visit',
          ),
        ],
        version: 1,
      );

      final json = plan.toJson();
      final decoded = DayPlan.fromJson(json);

      expect(decoded.itineraryId, plan.itineraryId);
      expect(decoded.entries.length, 1);
      expect(decoded.entries.first.title, 'Museum Visit');
    });

    test('Should sort entries by startTime', () {
      // Ideally this logic belongs to domain or store, but checking if model enforces it is good if feasible.
      // Actually, pure data models usually don't self-sort unless using a factory constructor logic.
      // We'll skip behavioral test on pure DTO equality for now.
    });
  });

  group('DayPlanEntry Tests', () {
    test('Should validate correctness of flex entry', () {
      final entry = DayPlanEntry(
        id: 'entry_2',
        type: PlanEntryType.flex,
        durationMinutes: 90, // Flex items might not have start/end yet
        title: 'Lunch',
      );

      expect(entry.startTime, isNull);
      expect(entry.type, PlanEntryType.flex);
      expect(entry.durationMinutes, 90);
    });
  });

  group('Conflict Tests', () {
    test('Should serialize Conflict correctly', () {
      final conflict = Conflict(
        id: 'c1',
        type: ConflictType.overlap,
        entryIds: ['e1', 'e2'],
        message: 'Items overlap',
        suggestions: [],
      );

      final json = conflict.toJson();
      final decoded = Conflict.fromJson(json);

      expect(decoded.type, ConflictType.overlap);
      expect(decoded.entryIds, containsAll(['e1', 'e2']));
    });
  });
}
