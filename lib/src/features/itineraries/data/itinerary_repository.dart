import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import '../../../core/data/drift_database.dart';
import '../../../core/data/database_provider.dart';
import '../../../core/domain/itinerary.dart';

part 'itinerary_repository.g.dart';

class ItineraryRepository {
  final AppDatabase _db;

  ItineraryRepository(this._db);

  Future<List<Itinerary>> getAllItineraries() async {
    final query = _db.select(_db.itineraries)
      ..orderBy([
        (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
      ]);

    final rows = await query.get();
    return rows
        .map(
          (row) => Itinerary(
            id: row.id,
            title: row.title,
            destination: row.destination,
            startDate: row.startDate,
            endDate: row.endDate,
            travelers: row.travelers,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();
  }

  Future<Itinerary?> getItinerary(String id) async {
    final row = await (_db.select(
      _db.itineraries,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return Itinerary(
      id: row.id,
      title: row.title,
      destination: row.destination,
      startDate: row.startDate,
      endDate: row.endDate,
      travelers: row.travelers,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  Future<void> createItinerary(Itinerary itinerary) async {
    await _db
        .into(_db.itineraries)
        .insert(
          ItinerariesCompanion(
            id: Value(itinerary.id),
            title: Value(itinerary.title),
            destination: Value(itinerary.destination),
            startDate: Value(itinerary.startDate),
            endDate: Value(itinerary.endDate),
            travelers: Value(itinerary.travelers),
            createdAt: Value(itinerary.createdAt),
            updatedAt: Value(itinerary.updatedAt),
          ),
        );
  }

  Future<void> updateItinerary(Itinerary itinerary) async {
    await (_db.update(
      _db.itineraries,
    )..where((t) => t.id.equals(itinerary.id))).write(
      ItinerariesCompanion(
        title: Value(itinerary.title),
        destination: Value(itinerary.destination),
        startDate: Value(itinerary.startDate),
        endDate: Value(itinerary.endDate),
        travelers: Value(itinerary.travelers),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteItinerary(String id) async {
    await (_db.delete(_db.itineraries)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<Itinerary>> watchAllItineraries() {
    final query = _db.select(_db.itineraries)
      ..orderBy([
        (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
      ]);

    return query.watch().map(
      (rows) => rows
          .map(
            (row) => Itinerary(
              id: row.id,
              title: row.title,
              destination: row.destination,
              startDate: row.startDate,
              endDate: row.endDate,
              travelers: row.travelers,
              createdAt: row.createdAt,
              updatedAt: row.updatedAt,
            ),
          )
          .toList(),
    );
  }
}

@Riverpod(keepAlive: true)
ItineraryRepository itineraryRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return ItineraryRepository(db);
}
