import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/transport/data/caching_transport_repository.dart';
import 'package:dastan/src/features/transport/data/mock_transport_repository.dart';

import 'package:dastan/src/features/transport/domain/transport_search_request.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late MockTransportRepository mockRepo;
  late CachingTransportRepository cachingRepo;

  setUp(() {
    db = AppDatabase.connect(NativeDatabase.memory());
    mockRepo = MockTransportRepository();
    cachingRepo = CachingTransportRepository(mockRepo, db);
  });

  tearDown(() async {
    await db.close();
  });

  group('TransportRepository Integration', () {
    final request = TransportSearchRequest(
      itineraryId: 'test-itin',
      tripType: TripType.oneWay,
      legs: [
        TransportSearchLeg(
          origin: 'NYC',
          destination: 'LON',
          departDate: DateTime.utc(2025, 12, 1),
          mode: TransportMode.flight,
        ),
      ],
    );

    test('search returns results and caches them', () async {
      // 1. First call - should go to mock (network)
      final results1 = await cachingRepo.search(request);
      expect(results1, isNotEmpty);
      expect(results1.first.id, contains('mock'));

      // Verify cache insertion
      final cacheEntry = await (db.select(db.transportCache)).getSingle();
      expect(cacheEntry.key, isNotEmpty);
      expect(cacheEntry.data, contains('mock'));

      // 2. Second call - should return same data from cache
      // To prove it's from cache, we could check separate functionality or
      // rely on the fact that Mock generates random items.
      // If we get EXACTLY the same items (same random IDs), it came from cache.

      final results2 = await cachingRepo.search(request);
      expect(results2.length, results1.length);
      expect(results2.first.id, results1.first.id);
    });

    test('calendarMinPrices returns results and caches them', () async {
      final month = DateTime.utc(2025, 12, 1);
      final prices1 = await cachingRepo.getCalendarMinPrices(
        'NYC',
        'LON',
        month,
      );
      expect(prices1, isNotEmpty);

      // Verify cache
      final cacheEntry = await (db.select(db.calendarCache)).getSingle();
      expect(cacheEntry.key, contains('NYC-LON-2025-12'));

      final prices2 = await cachingRepo.getCalendarMinPrices(
        'NYC',
        'LON',
        month,
      );
      expect(prices2.length, prices1.length);
      // Maps should be equal
      expect(prices2.keys, containsAll(prices1.keys));
      expect(prices2.values, containsAll(prices1.values));
    });
  });
}
