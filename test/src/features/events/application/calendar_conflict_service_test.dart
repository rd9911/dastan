import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/events/application/calendar_conflict_service.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';

void main() {
  late CalendarConflictService service;

  setUp(() {
    service = CalendarConflictService();
  });

  group('CalendarConflictService', () {
    test('should return empty list if no conflicts', () {
      final event = EventCard(
        id: 'evt-1',
        providerId: 'prov',
        externalId: 'ext',
        title: 'Safe Event',
        category: EventCategory.concert,
        start: DateTime(2024, 6, 1, 10, 0),
        end: DateTime(2024, 6, 1, 12, 0),
        venue: const EventVenue(name: 'V', latitude: 0, longitude: 0),
        leadImage: '',
      );

      final savedItems = [
        SavedItem(
          id: 'item-1',
          itineraryId: 'itin-1',
          section: ItinerarySection.transport,
          title: 'Flight',
          details: {},
          externalData: null,
          time: SavedItemTime(
            start: DateTime(2024, 6, 2, 10, 0), // Different day
            end: DateTime(2024, 6, 2, 14, 0),
          ),
          location: null,
          dedupeKey: 'key',
          sync: const SavedItemSync(status: SyncStatus.synced),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      final conflicts = service.checkConflicts(
        event: event,
        savedItems: savedItems,
      );
      expect(conflicts, isEmpty);
    });

    test('should detect overlap with transport item', () {
      final eventDate = DateTime(
        2024,
        6,
        1,
        11,
        0,
      ); // 11:00 - 13:00 (assumed 2h)

      final event = EventCard(
        id: 'evt-2',
        providerId: 'prov',
        externalId: 'ext',
        title: 'Conflict Event',
        category: EventCategory.concert,
        start: eventDate,
        end: eventDate.add(const Duration(hours: 2)), // 11:00 - 13:00
        venue: const EventVenue(name: 'V', latitude: 0, longitude: 0),
        leadImage: '',
      );

      final savedItems = [
        SavedItem(
          id: 'item-2',
          itineraryId: 'itin-1',
          section: ItinerarySection.transport,
          title: 'Flight',
          details: {},
          externalData: null,
          time: SavedItemTime(
            start: DateTime(2024, 6, 1, 10, 0), // 10:00
            end: DateTime(2024, 6, 1, 12, 0), // 12:00
          ),
          location: null,
          dedupeKey: 'key',
          sync: const SavedItemSync(status: SyncStatus.synced),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      final conflicts = service.checkConflicts(
        event: event,
        savedItems: savedItems,
      );
      expect(conflicts, isNotEmpty);
      expect(conflicts.first.title, 'Flight');
    });

    test('should ignore non-transport items for now', () {
      final event = EventCard(
        id: 'evt-3',
        providerId: 'prov',
        externalId: 'ext',
        title: 'Overlap but ignored',
        category: EventCategory.concert,
        start: DateTime(2024, 6, 1, 10, 0),
        end: DateTime(2024, 6, 1, 12, 0),
        venue: const EventVenue(name: 'V', latitude: 0, longitude: 0),
        leadImage: '',
      );

      final savedItems = [
        SavedItem(
          id: 'item-3',
          itineraryId: 'itin-1',
          section: ItinerarySection.accommodation, // Not transport
          title: 'Hotel',
          details: {},
          externalData: null,
          time: SavedItemTime(
            start: DateTime(2024, 6, 1, 10, 0),
            end: DateTime(2024, 6, 2, 10, 0),
          ),
          location: null,
          dedupeKey: 'key',
          sync: const SavedItemSync(status: SyncStatus.synced),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      final conflicts = service.checkConflicts(
        event: event,
        savedItems: savedItems,
      );
      expect(conflicts, isEmpty);
    });
  });
}
