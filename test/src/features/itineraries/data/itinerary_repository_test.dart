import 'package:dastan/src/core/data/drift_database.dart' as drift_db;
import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/itineraries/data/itinerary_repository.dart';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late drift_db.AppDatabase db;
  late ItineraryRepository repository;

  setUp(() {
    db = drift_db.AppDatabase.connect(NativeDatabase.memory());
    repository = ItineraryRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('createItinerary inserts itinerary into database', () async {
    final itinerary = Itinerary(
      id: '1',
      title: 'Test Itinerary',
      destination: 'Paris',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await repository.createItinerary(itinerary);

    final result = await repository.getItinerary('1');
    expect(result, isNotNull);
    expect(result!.title, 'Test Itinerary');
    expect(result.destination, 'Paris');
  });

  test(
    'getAllItineraries returns all itineraries ordered by updatedAt desc',
    () async {
      final itinerary1 = Itinerary(
        id: '1',
        title: 'Itinerary 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      );
      final itinerary2 = Itinerary(
        id: '2',
        title: 'Itinerary 2',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repository.createItinerary(itinerary1);
      await repository.createItinerary(itinerary2);

      final results = await repository.getAllItineraries();
      expect(results.length, 2);
      expect(results[0].id, '2');
      expect(results[1].id, '1');
    },
  );

  test('updateItinerary updates existing itinerary', () async {
    final itinerary = Itinerary(
      id: '1',
      title: 'Old Title',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await repository.createItinerary(itinerary);

    final updatedItinerary = itinerary.copyWith(title: 'New Title');
    await repository.updateItinerary(updatedItinerary);

    final result = await repository.getItinerary('1');
    expect(result!.title, 'New Title');
  });

  test('deleteItinerary removes itinerary from database', () async {
    final itinerary = Itinerary(
      id: '1',
      title: 'To Delete',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await repository.createItinerary(itinerary);
    await repository.deleteItinerary('1');

    final result = await repository.getItinerary('1');
    expect(result, isNull);
  });
}
