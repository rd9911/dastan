import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/gastronomy/data/gastronomy_repository.dart';
import 'package:dastan/src/features/gastronomy/data/mock_gastronomy_repository.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';

void main() {
  late GastronomyRepository repository;

  setUp(() {
    repository = MockGastronomyRepository();
  });

  group('MockGastronomyRepository', () {
    group('search', () {
      test('should return results for a valid request', () async {
        final request = GastronomySearchRequest(
          itineraryId: 'itin-123',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Rome',
          ),
        );

        final result = await repository.search(request);

        expect(result.items, isNotEmpty);
        expect(result.totalCount, greaterThan(0));
      });

      test('should return consistent results for same place', () async {
        final request = GastronomySearchRequest(
          itineraryId: 'itin-456',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Paris',
          ),
        );

        final result1 = await repository.search(request);
        final result2 = await repository.search(request);

        expect(result1.items.length, result2.items.length);
        expect(result1.items.first.name, result2.items.first.name);
      });

      test('should paginate results', () async {
        final request = GastronomySearchRequest(
          itineraryId: 'itin-789',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Tokyo',
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

      test('should support dietary filters', () async {
        final request = GastronomySearchRequest(
          itineraryId: 'itin-abc',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Barcelona',
          ),
          filters: const GastronomyFilters(dietary: [DietaryOption.vegetarian]),
        );

        final result = await repository.search(request);

        expect(result.items, isNotEmpty);
      });

      test('should support price band filter', () async {
        final request = GastronomySearchRequest(
          itineraryId: 'itin-def',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'London',
          ),
          filters: const GastronomyFilters(priceBand: PriceBand.upscale),
        );

        final result = await repository.search(request);

        expect(result.items, isNotEmpty);
        // All items should have the requested price band
        expect(
          result.items.every((i) => i.priceBand == PriceBand.upscale),
          true,
        );
      });

      test('should return results with all required fields', () async {
        final request = GastronomySearchRequest(
          itineraryId: 'itin-ghi',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Berlin',
          ),
        );

        final result = await repository.search(request);
        final item = result.items.first;

        expect(item.id, isNotEmpty);
        expect(item.name, isNotEmpty);
        expect(item.thumbnail, isNotEmpty);
        expect(item.priceBand, isNotNull);
        expect(item.location, isNotEmpty);
      });
    });

    group('getDetail', () {
      test('should return full detail for a restaurant', () async {
        final detail = await repository.getDetail('mock', 'ext-12345');

        expect(detail.id, isNotEmpty);
        expect(detail.name, isNotEmpty);
        expect(detail.description, isNotEmpty);
        expect(detail.photos, isNotEmpty);
        expect(detail.menu, isNotEmpty);
        expect(detail.openingHours, isNotNull);
      });

      test('should return consistent detail for same external ID', () async {
        final detail1 = await repository.getDetail('google', 'place_abc');
        final detail2 = await repository.getDetail('google', 'place_abc');

        expect(detail1.name, detail2.name);
        expect(detail1.rating, detail2.rating);
        expect(detail1.priceBand, detail2.priceBand);
      });

      test('should include opening hours for all days', () async {
        final detail = await repository.getDetail('tripadvisor', 'venue_xyz');

        expect(detail.openingHours, isNotNull);
        expect(detail.openingHours?.monday, isNotNull);
        expect(detail.openingHours?.sunday, isNotNull);
      });

      test('should include menu items', () async {
        final detail = await repository.getDetail('yelp', 'rest_123');

        expect(detail.menu, isNotEmpty);
        expect(detail.menu.first.name, isNotEmpty);
        expect(detail.menu.first.price, isNotNull);
      });

      test('should include location coordinates', () async {
        final detail = await repository.getDetail('foursquare', 'fsq_456');

        expect(detail.latitude, isNotNull);
        expect(detail.longitude, isNotNull);
      });

      test('should include contact information', () async {
        final detail = await repository.getDetail('local', 'local_789');

        expect(detail.phone, isNotNull);
        expect(detail.website, isNotNull);
        expect(detail.address, isNotNull);
      });
    });

    group('cancelSearch', () {
      test('should not throw when cancelling', () {
        expect(() => repository.cancelSearch(), returnsNormally);
      });
    });
  });
}
