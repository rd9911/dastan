import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/events/application/events_normalization_helper.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';

void main() {
  group('EventsNormalizationHelper', () {
    group('generateDedupeKey', () {
      test('should generate deterministic key from event and itinerary', () {
        final card = EventCard(
          id: 'event-1',
          providerId: 'ticketmaster',
          externalId: 'tm_123',
          title: 'Summer Festival',
          category: EventCategory.festival,
          start: DateTime(2024, 7, 15, 18, 0),
          venue: const EventVenue(
            name: 'Hyde Park',
            latitude: 51.5073,
            longitude: -0.1657,
          ),
          leadImage: 'https://example.com/festival.jpg',
          website: 'https://summerfest.com',
        );

        final key = EventsNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        expect(key, contains('events-itin-123'));
        expect(key, contains('summer festival'));
        expect(key, contains('hyde park'));
      });

      test('should generate different keys for different itineraries', () {
        final card = EventCard(
          id: 'event-2',
          providerId: 'eventbrite',
          externalId: 'eb_456',
          title: 'Tech Conference',
          category: EventCategory.conference,
          start: DateTime(2024, 8, 20, 9, 0),
          venue: const EventVenue(
            name: 'Convention Center',
            latitude: 52.5200,
            longitude: 13.4050,
          ),
          leadImage: 'https://example.com/conf.jpg',
        );

        final key1 = EventsNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-A',
          item: card,
        );

        final key2 = EventsNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-B',
          item: card,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should be deterministic for identical inputs', () {
        final card = EventCard(
          id: 'event-3',
          providerId: 'local',
          externalId: 'local_789',
          title: 'Art Exhibition',
          category: EventCategory.exhibition,
          start: DateTime(2024, 9, 1, 10, 0),
          venue: const EventVenue(
            name: 'City Gallery',
            latitude: 48.8566,
            longitude: 2.3522,
          ),
          leadImage: 'https://example.com/art.jpg',
        );

        final key1 = EventsNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        final key2 = EventsNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        expect(key1, equals(key2));
      });

      test('should include start time in key for uniqueness', () {
        final card1 = EventCard(
          id: 'event-4a',
          providerId: 'test',
          externalId: 'test_1',
          title: 'Concert',
          category: EventCategory.concert,
          start: DateTime(2024, 7, 15, 18, 0),
          venue: const EventVenue(
            name: 'Stadium',
            latitude: 51.5,
            longitude: -0.1,
          ),
          leadImage: 'https://example.com/concert.jpg',
        );

        final card2 = EventCard(
          id: 'event-4b',
          providerId: 'test',
          externalId: 'test_2',
          title: 'Concert',
          category: EventCategory.concert,
          start: DateTime(2024, 7, 16, 18, 0), // Different date
          venue: const EventVenue(
            name: 'Stadium',
            latitude: 51.5,
            longitude: -0.1,
          ),
          leadImage: 'https://example.com/concert.jpg',
        );

        final key1 = EventsNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card1,
        );

        final key2 = EventsNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card2,
        );

        expect(key1, isNot(equals(key2)));
      });
    });

    group('generateSearchCacheKey', () {
      test('should generate deterministic cache key', () {
        final request = EventsSearchRequest(
          itineraryId: 'itin-123',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'London',
          ),
        );

        final key1 = EventsNormalizationHelper.generateSearchCacheKey(request);
        final key2 = EventsNormalizationHelper.generateSearchCacheKey(request);

        expect(key1, equals(key2));
        expect(key1.length, 64); // SHA-256 hex length
      });

      test('should generate different keys for different places', () {
        final request1 = EventsSearchRequest(
          itineraryId: 'itin-1',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'London',
          ),
        );

        final request2 = EventsSearchRequest(
          itineraryId: 'itin-1',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'Paris',
          ),
        );

        final key1 = EventsNormalizationHelper.generateSearchCacheKey(request1);
        final key2 = EventsNormalizationHelper.generateSearchCacheKey(request2);

        expect(key1, isNot(equals(key2)));
      });

      test('should include date window in cache key', () {
        final requestNoWindow = EventsSearchRequest(
          itineraryId: 'itin-1',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'Berlin',
          ),
        );

        final requestWithWindow = EventsSearchRequest(
          itineraryId: 'itin-1',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'Berlin',
          ),
          dateWindow: EventDateWindow(
            start: DateTime(2024, 7, 1),
            end: DateTime(2024, 7, 10),
          ),
        );

        final key1 = EventsNormalizationHelper.generateSearchCacheKey(
          requestNoWindow,
        );
        final key2 = EventsNormalizationHelper.generateSearchCacheKey(
          requestWithWindow,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should include filters in cache key', () {
        final requestNoFilters = EventsSearchRequest(
          itineraryId: 'itin-1',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'Tokyo',
          ),
        );

        final requestWithFilters = EventsSearchRequest(
          itineraryId: 'itin-1',
          place: const EventPlace(
            granularity: PlaceGranularity.city,
            value: 'Tokyo',
          ),
          filters: const EventsFilters(categories: [EventCategory.concert]),
        );

        final key1 = EventsNormalizationHelper.generateSearchCacheKey(
          requestNoFilters,
        );
        final key2 = EventsNormalizationHelper.generateSearchCacheKey(
          requestWithFilters,
        );

        expect(key1, isNot(equals(key2)));
      });
    });

    group('formatCategory', () {
      test('should format categories correctly', () {
        expect(
          EventsNormalizationHelper.formatCategory(EventCategory.concert),
          'Concert',
        );
        expect(
          EventsNormalizationHelper.formatCategory(EventCategory.theatre),
          'Theatre',
        );
        expect(
          EventsNormalizationHelper.formatCategory(EventCategory.sports),
          'Sports',
        );
        expect(
          EventsNormalizationHelper.formatCategory(EventCategory.festival),
          'Festival',
        );
        expect(
          EventsNormalizationHelper.formatCategory(EventCategory.exhibition),
          'Exhibition',
        );
        expect(
          EventsNormalizationHelper.formatCategory(EventCategory.conference),
          'Conference',
        );
      });
    });

    group('formatEventDateTime', () {
      test('should format date and time', () {
        final dateTime = DateTime(2024, 7, 15, 20, 30);
        final formatted = EventsNormalizationHelper.formatEventDateTime(
          dateTime,
        );

        expect(formatted, contains('15'));
        expect(formatted, contains('20:30'));
      });

      test('should format date only', () {
        final date = DateTime(2024, 12, 25);
        final formatted = EventsNormalizationHelper.formatEventDate(date);

        expect(formatted, contains('25'));
        expect(formatted, contains('Dec'));
      });
    });

    group('formatDistance', () {
      test('should format meters for short distances', () {
        expect(EventsNormalizationHelper.formatDistance(500), '500m');
        expect(EventsNormalizationHelper.formatDistance(999), '999m');
      });

      test('should format kilometers for long distances', () {
        expect(EventsNormalizationHelper.formatDistance(1000), '1.0km');
        expect(EventsNormalizationHelper.formatDistance(2500), '2.5km');
      });

      test('should handle null', () {
        expect(EventsNormalizationHelper.formatDistance(null), 'Unknown');
      });
    });
  });
}
