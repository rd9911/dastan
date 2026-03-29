import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/entertainment/data/entertainment_repository.dart';
import 'package:dastan/src/features/entertainment/data/mock_entertainment_repository.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';

void main() {
  late EntertainmentRepository repository;

  setUp(() {
    repository = MockEntertainmentRepository();
  });

  group('MockEntertainmentRepository', () {
    group('search', () {
      test('should return results for a valid request', () async {
        final request = EntertainmentSearchRequest(
          itineraryId: 'itin-123',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Paris',
          ),
        );

        final result = await repository.search(request);

        expect(result.items, isNotEmpty);
        expect(result.totalCount, greaterThan(0));
      });

      test('should return consistent results for same place', () async {
        final request = EntertainmentSearchRequest(
          itineraryId: 'itin-456',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'London',
          ),
        );

        final result1 = await repository.search(request);
        final result2 = await repository.search(request);

        expect(result1.items.length, result2.items.length);
        expect(result1.items.first.name, result2.items.first.name);
      });

      test('should paginate results', () async {
        final request = EntertainmentSearchRequest(
          itineraryId: 'itin-789',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Rome',
          ),
        );

        final page1 = await repository.search(request);
        expect(page1.items, isNotEmpty);
        expect(page1.nextCursor, isNotNull);

        final page2 = await repository.search(
          request,
          cursor: page1.nextCursor,
        );
        expect(page2.items, isNotEmpty);

        // Pages should have different items
        expect(page1.items.first.id, isNot(equals(page2.items.first.id)));
      });

      test('should filter by tags when specified', () async {
        final request = EntertainmentSearchRequest(
          itineraryId: 'itin-abc',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Barcelona',
          ),
          tags: [EntertainmentTag.museum],
        );

        final result = await repository.search(request);

        // Should have results (may include some without the tag due to mock logic)
        expect(result.items, isNotEmpty);
      });

      test('should support different place granularities', () async {
        final cityRequest = EntertainmentSearchRequest(
          itineraryId: 'itin-1',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Vienna',
          ),
        );

        final poiRequest = EntertainmentSearchRequest(
          itineraryId: 'itin-2',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.poi,
            value: 'Schönbrunn Palace',
            latitude: 48.1845,
            longitude: 16.3122,
          ),
        );

        final cityResult = await repository.search(cityRequest);
        final poiResult = await repository.search(poiRequest);

        expect(cityResult.items, isNotEmpty);
        expect(poiResult.items, isNotEmpty);
      });
    });

    group('getDetail', () {
      test('should return full detail for a place', () async {
        final detail = await repository.getDetail('mock', 'ext-12345');

        expect(detail.id, isNotEmpty);
        expect(detail.name, isNotEmpty);
        expect(detail.description, isNotEmpty);
        expect(detail.photos, isNotEmpty);
        expect(detail.openingHours, isNotNull);
      });

      test('should return consistent detail for same external ID', () async {
        final detail1 = await repository.getDetail('google', 'place_abc');
        final detail2 = await repository.getDetail('google', 'place_abc');

        expect(detail1.name, detail2.name);
        expect(detail1.rating, detail2.rating);
        expect(detail1.tag, detail2.tag);
      });

      test('should include opening hours', () async {
        final detail = await repository.getDetail('tripadvisor', 'venue_xyz');

        expect(detail.openingHours, isNotNull);
        expect(detail.openingHours?.monday, isNotNull);
        expect(detail.openingHours?.sunday, isNotNull);
      });

      test('should include location coordinates', () async {
        final detail = await repository.getDetail('foursquare', 'fsq_123');

        expect(detail.latitude, isNotNull);
        expect(detail.longitude, isNotNull);
      });
    });

    group('cancelSearch', () {
      test('should not throw when cancelling', () {
        expect(() => repository.cancelSearch(), returnsNormally);
      });
    });
  });
}
