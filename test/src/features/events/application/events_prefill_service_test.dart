import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/events/application/events_prefill_service.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';
import 'package:dastan/src/core/domain/itinerary.dart';

void main() {
  late EventsPrefillService service;

  setUp(() {
    service = EventsPrefillService();
  });

  group('EventsPrefillService', () {
    group('generatePrefill', () {
      test('should prefill place and dates from full itinerary', () {
        final start = DateTime(2024, 6, 1);
        final end = DateTime(2024, 6, 7);
        final itinerary = Itinerary(
          id: 'itin-1',
          title: 'London Trip',
          destination: 'London, UK',
          startDate: start,
          endDate: end,
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.place, isNotNull);
        expect(result.place?.value, 'London, UK');
        expect(result.hasDestination, true);

        expect(result.dateWindow, isNotNull);
        expect(result.dateWindow?.start, start);
        expect(result.dateWindow?.end, end);
        expect(result.hasDates, true);
      });

      test('should handle itinerary without dates', () {
        final itinerary = Itinerary(
          id: 'itin-2',
          title: 'Future Trip',
          destination: 'Paris',
          travelers: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.place?.value, 'Paris');
        expect(result.dateWindow, isNull);
        expect(result.hasDates, false);
      });

      test('should handle itinerary without destination', () {
        final itinerary = Itinerary(
          id: 'itin-3',
          title: 'Undecided',
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
      test('should suggest "during my dates" if itinerary has dates', () {
        final itinerary = Itinerary(
          id: 'itin-4',
          title: 'Trip with dates',
          destination: 'Rome',
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 3)),
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final filters = service.suggestFilters(itinerary: itinerary);

        expect(filters.duringMyDates, true);
      });

      test('should return default filters if no dates', () {
        final itinerary = Itinerary(
          id: 'itin-5',
          title: 'No dates',
          destination: 'Rome',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final filters = service.suggestFilters(itinerary: itinerary);
        expect(filters.duringMyDates, null);
      });
    });

    group('suggestCategories', () {
      test('should return default recommendations', () {
        final itinerary = Itinerary(
          id: 'itin-6',
          title: 'Any Trip',
          travelers: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final categories = service.suggestCategories(itinerary: itinerary);
        expect(categories, contains(EventCategory.concert));
        expect(categories, contains(EventCategory.theatre));
      });
    });
  });
}
