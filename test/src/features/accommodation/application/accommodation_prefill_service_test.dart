import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/accommodation/application/accommodation_prefill_service.dart';
import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

void main() {
  group('AccommodationPrefillService', () {
    late AccommodationPrefillService service;

    setUp(() {
      service = AccommodationPrefillService();
    });

    group('generatePrefill', () {
      test('should prefill from itinerary without transport', () {
        final itinerary = Itinerary(
          id: 'itin-1',
          title: 'Paris Trip',
          destination: 'Paris, France',
          startDate: DateTime(2024, 6, 15),
          endDate: DateTime(2024, 6, 22),
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.place, 'Paris, France');
        expect(result.checkIn, DateTime(2024, 6, 15));
        expect(result.checkOut, DateTime(2024, 6, 22));
        expect(result.hasSmartDates, false);
        expect(result.guests, isNotNull);
      });

      test('should use Smart Dates from transport context', () {
        final itinerary = Itinerary(
          id: 'itin-2',
          title: 'London Trip',
          destination: 'London, UK',
          startDate: DateTime(2024, 7, 1),
          endDate: DateTime(2024, 7, 10),
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final transportItems = [
          SavedItem(
            id: 'save-1',
            itineraryId: 'itin-2',
            section: ItinerarySection.transport,
            title: 'Flight to London',
            details: {'origin': 'JFK', 'destination': 'LHR'},
            externalData: null,
            time: SavedItemTime(
              start: DateTime(2024, 7, 2, 10, 0),
              end: DateTime(2024, 7, 2, 22, 0),
            ),
            location: null,
            dedupeKey: 'transport-flight-1',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          SavedItem(
            id: 'save-2',
            itineraryId: 'itin-2',
            section: ItinerarySection.transport,
            title: 'Return Flight',
            details: {'origin': 'LHR', 'destination': 'JFK'},
            externalData: null,
            time: SavedItemTime(
              start: DateTime(2024, 7, 8, 14, 0),
              end: DateTime(2024, 7, 8, 22, 0),
            ),
            location: null,
            dedupeKey: 'transport-flight-2',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ];

        final result = service.generatePrefill(
          itinerary: itinerary,
          savedTransportItems: transportItems,
        );

        expect(result.hasSmartDates, true);
        expect(result.smartDatesDescription, isNotNull);
        // Should use earliest start and latest end from transport
        expect(result.checkIn, DateTime(2024, 7, 2, 10, 0));
        expect(result.checkOut, DateTime(2024, 7, 8, 22, 0));
      });

      test('should generate default guests for 2 travelers', () {
        final itinerary = Itinerary(
          id: 'itin-3',
          title: 'Trip',
          destination: 'Rome',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.guests, isNotNull);
        expect(result.guests!.length, 1); // 1 room
        expect(result.guests![0]?.length, 2); // 2 adults
      });

      test('should split travelers into multiple rooms', () {
        final itinerary = Itinerary(
          id: 'itin-4',
          title: 'Group Trip',
          destination: 'Barcelona',
          travelers: 5,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.guests, isNotNull);
        expect(result.guests!.length, 3); // 5 travelers = 3 rooms (2+2+1)
      });

      test('should handle missing destination', () {
        final itinerary = Itinerary(
          id: 'itin-5',
          title: 'TBD Trip',
          travelers: 2,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final result = service.generatePrefill(itinerary: itinerary);

        expect(result.place, isNull);
      });
    });

    group('adjustDates', () {
      test('should adjust check-in by delta', () {
        final original = AccommodationPrefillResult(
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
          hasSmartDates: true,
        );

        final adjusted = service.adjustDates(original, checkInDelta: 1);

        expect(adjusted.checkIn, DateTime(2024, 6, 16));
        expect(adjusted.checkOut, DateTime(2024, 6, 20));
        expect(
          adjusted.hasSmartDates,
          false,
        ); // Cleared after manual adjustment
      });

      test('should adjust check-out by delta', () {
        final original = AccommodationPrefillResult(
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
          hasSmartDates: true,
        );

        final adjusted = service.adjustDates(original, checkOutDelta: 2);

        expect(adjusted.checkIn, DateTime(2024, 6, 15));
        expect(adjusted.checkOut, DateTime(2024, 6, 22));
      });

      test('should handle negative deltas', () {
        final original = AccommodationPrefillResult(
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
        );

        final adjusted = service.adjustDates(
          original,
          checkInDelta: -1,
          checkOutDelta: -1,
        );

        expect(adjusted.checkIn, DateTime(2024, 6, 14));
        expect(adjusted.checkOut, DateTime(2024, 6, 19));
      });
    });
  });
}
