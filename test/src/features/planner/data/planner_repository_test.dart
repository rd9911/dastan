import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/planner/data/planner_repository.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late PlannerRepository repository;

  setUp(() async {
    db = AppDatabase.connect(NativeDatabase.memory());
    await db.customStatement('PRAGMA foreign_keys = ON');

    // Insert dummy itinerary for FK constraint
    await db
        .into(db.itineraries)
        .insert(
          ItinerariesCompanion.insert(
            id: 'itinerary_1',
            title: 'Test Itinerary',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );

    repository = DriftPlannerRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  const itineraryId = 'itinerary_1';
  final date = DateTime(2023, 10, 27);

  final testEntry = DayPlanEntry(
    id: 'entry_1',
    title: 'Breakfast',
    type: PlanEntryType.fixed,
    durationMinutes: 45,
    commuteMode: TravelMode.none,
  );

  final testPlan = DayPlan(
    itineraryId: itineraryId,
    date: date,
    entries: [testEntry],
  );

  test('should return null when no plan exists', () async {
    final result = await repository.getDayPlan(itineraryId, date);
    expect(result, isNull);
  });

  test('should save and retrieve a day plan with entries', () async {
    await repository.saveDayPlan(testPlan);

    final retrieved = await repository.getDayPlan(itineraryId, date);
    expect(retrieved, isNotNull);
    expect(retrieved!.itineraryId, itineraryId);
    expect(retrieved.date, date);
    expect(retrieved.entries, hasLength(1));
    expect(retrieved.entries.first.title, 'Breakfast');
    expect(retrieved.entries.first.id, 'entry_1');
  });

  test('should update plan and replace entries', () async {
    await repository.saveDayPlan(testPlan);

    final updatedEntry = testEntry.copyWith(title: 'Updated Breakfast');
    final newEntry = DayPlanEntry(
      id: 'entry_2',
      title: 'Lunch',
      type: PlanEntryType.flex,
    );

    final updatedPlan = testPlan.copyWith(
      entries: [updatedEntry, newEntry],
      version: 2,
    );

    await repository.saveDayPlan(updatedPlan);

    final retrieved = await repository.getDayPlan(itineraryId, date);
    expect(retrieved, isNotNull);
    expect(retrieved!.entries, hasLength(2));
    expect(retrieved.entries[0].title, 'Updated Breakfast');
    expect(retrieved.entries[1].title, 'Lunch');
    expect(retrieved.version, 2);
  });

  test('should delete day plan and cascade entries', () async {
    await repository.saveDayPlan(testPlan);
    await repository.deleteDayPlan(itineraryId, date);

    final retrieved = await repository.getDayPlan(itineraryId, date);
    expect(retrieved, isNull);

    // Verify entries are gone from DB directly
    final entries = await db.select(db.dayPlanEntries).get();
    expect(entries, isEmpty);
  });

  test('watchDayPlan should emit updates', () async {
    final stream = repository.watchDayPlan(itineraryId, date);

    expectLater(
      stream,
      emitsInOrder([
        isNull,
        isNotNull, // after save
        isNull, // after delete
      ]),
    );

    await Future.delayed(Duration(milliseconds: 100));
    await repository.saveDayPlan(testPlan);
    await Future.delayed(Duration(milliseconds: 100));
    await repository.deleteDayPlan(itineraryId, date);
  });
}
