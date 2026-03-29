import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/gastronomy/application/gastronomy_prefill_service.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';
import 'package:dastan/src/core/domain/itinerary.dart';

void main() {
  late GastronomyPrefillService service;

  setUp(() {
    service = GastronomyPrefillService();
  });

  group('GastronomyPrefillService', () {
    group('generatePrefill', () {
      test('should prefill place from itinerary destination', () {
        final itinerary = Itinerary(
          id: 'itin-1',
          title: 'Rome Trip',
          destination: 'Rome, Italy',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.place, isNotNull);
        expect(result.place?.value, 'Rome, Italy');
        expect(result.place?.granularity, PlaceGranularity.city);
        expect(result.hasDestination, true);
      });

      test('should return null place if no destination in itinerary', () {
        final itinerary = Itinerary(
          id: 'itin-2',
          title: 'Quick Trip',
          destination: null,
          travelers: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.place, isNull);
        expect(result.hasDestination, false);
      });
    });

    group('suggestFilters', () {
      test('should return default filters', () {
        final itinerary = Itinerary(
          id: 'itin-3',
          title: 'Food Tour',
          destination: 'Paris',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final filters = service.suggestFilters(itinerary: itinerary);

        expect(filters, isNotNull);
        expect(filters.dietary, isEmpty);
      });
    });

    group('suggestCuisines', () {
      test('should suggest Italian for Italy destination', () {
        final itinerary = Itinerary(
          id: 'itin-4',
          title: 'Italian Adventure',
          destination: 'Rome, Italy',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final cuisines = service.suggestCuisines(itinerary: itinerary);

        expect(cuisines, contains(CuisineType.italian));
      });

      test('should suggest French for Paris destination', () {
        final itinerary = Itinerary(
          id: 'itin-5',
          title: 'Paris Visit',
          destination: 'Paris, France',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final cuisines = service.suggestCuisines(itinerary: itinerary);

        expect(cuisines, contains(CuisineType.french));
      });

      test('should suggest Japanese for Tokyo destination', () {
        final itinerary = Itinerary(
          id: 'itin-6',
          title: 'Japan Trip',
          destination: 'Tokyo, Japan',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final cuisines = service.suggestCuisines(itinerary: itinerary);

        expect(cuisines, contains(CuisineType.japanese));
      });

      test('should return default variety for unknown destination', () {
        final itinerary = Itinerary(
          id: 'itin-7',
          title: 'Random Trip',
          destination: 'Reykjavik',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final cuisines = service.suggestCuisines(itinerary: itinerary);

        expect(cuisines, isNotEmpty);
        expect(cuisines.length, greaterThan(1));
      });
    });
  });
}
