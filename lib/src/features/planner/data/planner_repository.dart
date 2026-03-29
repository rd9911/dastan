import 'package:drift/drift.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';

abstract class PlannerRepository {
  Stream<DayPlan?> watchDayPlan(String itineraryId, DateTime date);
  Future<DayPlan?> getDayPlan(String itineraryId, DateTime date);
  Future<void> saveDayPlan(DayPlan plan);
  Future<void> deleteDayPlan(String itineraryId, DateTime date);
}

class DriftPlannerRepository implements PlannerRepository {
  final AppDatabase _db;

  DriftPlannerRepository(this._db);

  @override
  Stream<DayPlan?> watchDayPlan(String itineraryId, DateTime date) {
    final query =
        _db.select(_db.dayPlans).join([
            leftOuterJoin(
              _db.dayPlanEntries,
              _db.dayPlanEntries.itineraryId.equalsExp(
                    _db.dayPlans.itineraryId,
                  ) &
                  _db.dayPlanEntries.date.equalsExp(_db.dayPlans.date),
            ),
          ])
          ..where(
            _db.dayPlans.itineraryId.equals(itineraryId) &
                _db.dayPlans.date.equals(date),
          )
          ..orderBy([OrderingTerm.asc(_db.dayPlanEntries.orderIndex)]);

    return query.watch().map((rows) {
      if (rows.isEmpty) return null;

      final planRow = rows.first.readTable(_db.dayPlans);

      // Filter out null entries (from left join) and map to domain
      final entries = rows
          .map((row) {
            final entryRow = row.readTableOrNull(_db.dayPlanEntries);
            return entryRow;
          })
          .where((e) => e != null)
          .cast<DayPlanEntryRow>()
          .toList();

      // Ensure sorted by orderIndex (though query orderBy should handle it, explicit sort is safer for joined results implementation dependent)
      entries.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));

      return _mapToDomain(planRow, entries);
    });
  }

  @override
  Future<DayPlan?> getDayPlan(String itineraryId, DateTime date) async {
    final stream = watchDayPlan(itineraryId, date);
    return stream.first;
  }

  @override
  Future<void> saveDayPlan(DayPlan plan) async {
    await _db.transaction(() async {
      // 1. Upsert DayPlan
      await _db
          .into(_db.dayPlans)
          .insertOnConflictUpdate(
            DayPlansCompanion(
              itineraryId: Value(plan.itineraryId),
              date: Value(plan.date),
              version: Value(plan.version),
              updatedAt: Value(plan.updatedAt ?? DateTime.now()),
            ),
          );

      // 2. Delete existing entries for this plan
      await (_db.delete(_db.dayPlanEntries)..where(
            (t) =>
                t.itineraryId.equals(plan.itineraryId) &
                t.date.equals(plan.date),
          ))
          .go();

      // 3. Insert new entries
      if (plan.entries.isNotEmpty) {
        final entryRows = plan.entries.asMap().entries.map((e) {
          final index = e.key;
          final entry = e.value;
          return DayPlanEntriesCompanion(
            id: Value(entry.id),
            itineraryId: Value(plan.itineraryId),
            date: Value(plan.date),
            savedItemId: Value(entry.savedItemId),
            title: Value(entry.title),
            type: Value(entry.type.name),
            startTime: Value(entry.startTime),
            endTime: Value(entry.endTime),
            durationMinutes: Value(entry.durationMinutes),
            commuteMode: Value(entry.commuteMode.name),
            commuteDurationMinutes: Value(entry.commuteDurationMinutes),
            bufferBeforeMinutes: Value(entry.bufferBeforeMinutes),
            notes: Value(entry.notes),
            orderIndex: Value(index),
          );
        }).toList();

        await _db.batch((batch) {
          batch.insertAll(_db.dayPlanEntries, entryRows);
        });
      }
    });
  }

  @override
  Future<void> deleteDayPlan(String itineraryId, DateTime date) async {
    await (_db.delete(_db.dayPlans)..where(
          (t) => t.itineraryId.equals(itineraryId) & t.date.equals(date),
        ))
        .go();
    // Entries are cascade deleted
  }

  DayPlan _mapToDomain(DayPlanRow planRow, List<DayPlanEntryRow> entryRows) {
    return DayPlan(
      itineraryId: planRow.itineraryId,
      date: planRow.date,
      version: planRow.version,
      updatedAt: planRow.updatedAt,
      entries: entryRows
          .map(
            (e) => DayPlanEntry(
              id: e.id,
              savedItemId: e.savedItemId,
              title: e.title,
              type: PlanEntryType.values.byName(e.type),
              startTime: e.startTime,
              endTime: e.endTime,
              durationMinutes: e.durationMinutes,
              commuteMode: TravelMode.values.byName(e.commuteMode),
              commuteDurationMinutes: e.commuteDurationMinutes,
              bufferBeforeMinutes: e.bufferBeforeMinutes,
              notes: e.notes,
            ),
          )
          .toList(),
    );
  }
}
