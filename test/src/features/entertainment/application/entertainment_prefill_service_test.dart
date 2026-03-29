import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/entertainment/application/entertainment_prefill_service.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';
import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

void main() {
  late EntertainmentPrefillService service;

  setUp(() {
    service = EntertainmentPrefillService();
  });

  group('EntertainmentPrefillService', () {
    group('generatePrefill', () {
      test('should prefill place from itinerary destination', () {
        final itinerary = Itinerary(
          id: 'itin-1',
          title: 'Paris Trip',
          destination: 'Paris, France',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.place, isNotNull);
        expect(result.place?.value, 'Paris, France');
        expect(result.place?.granularity, PlaceGranularity.city);
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
      });

      test('should derive date range from itinerary dates', () {
        final startDate = DateTime(2024, 7, 1);
        final endDate = DateTime(2024, 7, 10);

        final itinerary = Itinerary(
          id: 'itin-3',
          title: 'Summer Trip',
          destination: 'Barcelona',
          startDate: startDate,
          endDate: endDate,
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.dateRange, isNotNull);
        expect(result.dateRange?.start, startDate);
        expect(result.dateRange?.end, endDate);
      });

      test('should derive Smart Dates from saved items', () {
        final itinerary = Itinerary(
          id: 'itin-4',
          title: 'London Trip',
          destination: 'London',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final savedItems = [
          SavedItem(
            id: 'item-1',
            itineraryId: 'itin-4',
            section: ItinerarySection.transport,
            title: 'Flight to London',
            details: {},
            externalData: null,
            time: SavedItemTime(
              start: DateTime(2024, 8, 5, 10, 0),
              end: DateTime(2024, 8, 5, 14, 0),
            ),
            location: null,
            dedupeKey: 'transport-1',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          SavedItem(
            id: 'item-2',
            itineraryId: 'itin-4',
            section: ItinerarySection.accommodation,
            title: 'Hotel Checkout',
            details: {},
            externalData: null,
            time: SavedItemTime(
              start: DateTime(2024, 8, 5),
              end: DateTime(2024, 8, 10),
            ),
            location: null,
            dedupeKey: 'accommodation-1',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ];

        final result = service.generatePrefill(
          itinerary: itinerary,
          savedItems: savedItems,
        );

        expect(result.hasSmartDates, true);
        expect(result.dateRange, isNotNull);
        // Accommodation starts at midnight (earlier than flight at 10:00)
        expect(result.dateRange?.start, DateTime(2024, 8, 5));
        expect(result.dateRange?.end, DateTime(2024, 8, 10));
      });

      test('should return false for hasSmartDates when no saved items', () {
        final itinerary = Itinerary(
          id: 'itin-5',
          title: 'Weekend Trip',
          destination: 'Amsterdam',
          travelers: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.hasSmartDates, false);
      });
    });

    group('suggestTags', () {
      test('should return default tag suggestions', () {
        final itinerary = Itinerary(
          id: 'itin-6',
          title: 'Culture Trip',
          destination: 'Vienna',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final tags = service.suggestTags(itinerary: itinerary);

        expect(tags, isNotEmpty);
        expect(tags, contains(EntertainmentTag.museum));
        expect(tags, contains(EntertainmentTag.landmark));
      });
    });
  });
}
