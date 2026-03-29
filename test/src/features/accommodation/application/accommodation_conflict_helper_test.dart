import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/accommodation/application/accommodation_conflict_helper.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

void main() {
  group('AccommodationConflictHelper', () {
    group('detectConflicts', () {
      test('should detect departure overlap', () {
        final transportItems = [
          SavedItem(
            id: 'flight-1',
            itineraryId: 'itin-1',
            section: ItinerarySection.transport,
            title: 'Departure Flight',
            details: {'origin': 'Paris', 'destination': 'JFK'},
            externalData: null,
            time: SavedItemTime(
              start: DateTime(2024, 6, 20, 10, 0), // Departure at 10 AM
              end: DateTime(2024, 6, 20, 18, 0),
            ),
            location: null,
            dedupeKey: 'transport-flight-1',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ];

        // Check-out on same day but after departure
        final conflicts = AccommodationConflictHelper.detectConflicts(
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20, 11, 0), // Check-out at 11 AM
          destination: 'Paris',
          transportItems: transportItems,
        );

        expect(conflicts.length, 1);
        expect(conflicts.first.type, ConflictType.departureOverlap);
        expect(conflicts.first.message, contains('departure flight'));
        expect(conflicts.first.suggestedFix, isNotNull);
      });

      test('should detect arrival overlap', () {
        final transportItems = [
          SavedItem(
            id: 'flight-2',
            itineraryId: 'itin-1',
            section: ItinerarySection.transport,
            title: 'Arrival Flight',
            details: {'origin': 'JFK', 'destination': 'London'},
            externalData: null,
            time: SavedItemTime(
              start: DateTime(2024, 7, 2, 8, 0),
              end: DateTime(2024, 7, 2, 20, 0), // Arrival at 8 PM
            ),
            location: null,
            dedupeKey: 'transport-flight-2',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ];

        // Check-in before arrival day
        final conflicts = AccommodationConflictHelper.detectConflicts(
          checkIn: DateTime(2024, 7, 1), // Day before arrival
          checkOut: DateTime(2024, 7, 10),
          destination: 'London',
          transportItems: transportItems,
        );

        expect(conflicts.length, 1);
        expect(conflicts.first.type, ConflictType.arrivalOverlap);
        expect(conflicts.first.message, contains('arrival'));
      });

      test('should not detect conflict when dates align', () {
        final transportItems = [
          SavedItem(
            id: 'flight-3',
            itineraryId: 'itin-1',
            section: ItinerarySection.transport,
            title: 'Flight',
            details: {'origin': 'JFK', 'destination': 'Rome'},
            externalData: null,
            time: SavedItemTime(
              start: DateTime(2024, 8, 1, 10, 0),
              end: DateTime(2024, 8, 1, 22, 0),
            ),
            location: null,
            dedupeKey: 'transport-flight-3',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ];

        // Check-in on arrival day (no conflict)
        final conflicts = AccommodationConflictHelper.detectConflicts(
          checkIn: DateTime(2024, 8, 1),
          checkOut: DateTime(2024, 8, 7),
          destination: 'Rome',
          transportItems: transportItems,
        );

        expect(conflicts, isEmpty);
      });

      test('should ignore non-transport items', () {
        final items = [
          SavedItem(
            id: 'activity-1',
            itineraryId: 'itin-1',
            section: ItinerarySection.entertainment,
            title: 'Museum Visit',
            details: {},
            externalData: null,
            time: SavedItemTime(
              start: DateTime(2024, 6, 18),
              end: DateTime(2024, 6, 18),
            ),
            location: null,
            dedupeKey: 'entertainment-1',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ];

        final conflicts = AccommodationConflictHelper.detectConflicts(
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
          destination: 'Paris',
          transportItems: items,
        );

        expect(conflicts, isEmpty);
      });

      test('should ignore transport without time', () {
        final transportItems = [
          SavedItem(
            id: 'flight-4',
            itineraryId: 'itin-1',
            section: ItinerarySection.transport,
            title: 'Flight',
            details: {'origin': 'Paris', 'destination': 'London'},
            externalData: null,
            time: null, // No time
            location: null,
            dedupeKey: 'transport-flight-4',
            sync: const SavedItemSync(status: SyncStatus.synced),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ];

        final conflicts = AccommodationConflictHelper.detectConflicts(
          checkIn: DateTime(2024, 6, 15),
          checkOut: DateTime(2024, 6, 20),
          destination: 'Paris',
          transportItems: transportItems,
        );

        expect(conflicts, isEmpty);
      });
    });

    group('areDatesValid', () {
      test('should return true for valid date range', () {
        final valid = AccommodationConflictHelper.areDatesValid(
          DateTime(2024, 6, 15),
          DateTime(2024, 6, 20),
        );
        expect(valid, true);
      });

      test('should return false for same dates', () {
        final invalid = AccommodationConflictHelper.areDatesValid(
          DateTime(2024, 6, 15),
          DateTime(2024, 6, 15),
        );
        expect(invalid, false);
      });

      test('should return false for check-out before check-in', () {
        final invalid = AccommodationConflictHelper.areDatesValid(
          DateTime(2024, 6, 20),
          DateTime(2024, 6, 15),
        );
        expect(invalid, false);
      });
    });

    group('calculateNights', () {
      test('should calculate nights correctly', () {
        expect(
          AccommodationConflictHelper.calculateNights(
            DateTime(2024, 6, 15),
            DateTime(2024, 6, 20),
          ),
          5,
        );
      });

      test('should handle month boundaries', () {
        expect(
          AccommodationConflictHelper.calculateNights(
            DateTime(2024, 6, 28),
            DateTime(2024, 7, 3),
          ),
          5,
        );
      });
    });
  });
}
