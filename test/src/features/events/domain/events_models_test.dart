import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';

void main() {
  group('EventsSearchRequest', () {
    test('should create with required fields', () {
      final request = EventsSearchRequest(
        itineraryId: 'itin-123',
        place: const EventPlace(
          granularity: PlaceGranularity.city,
          value: 'London, UK',
        ),
      );

      expect(request.itineraryId, 'itin-123');
      expect(request.place.value, 'London, UK');
    });

    test('should serialize and deserialize correctly', () {
      final request = EventsSearchRequest(
        itineraryId: 'itin-456',
        place: const EventPlace(
          granularity: PlaceGranularity.city,
          value: 'Paris',
        ),
        dateWindow: EventDateWindow(
          start: DateTime(2024, 7, 1),
          end: DateTime(2024, 7, 10),
        ),
        filters: const EventsFilters(
          categories: [EventCategory.concert, EventCategory.festival],
          duringMyDates: true,
        ),
      );

      final json = request.toJson();
      final restored = EventsSearchRequest.fromJson(json);

      expect(restored.itineraryId, request.itineraryId);
      expect(restored.place.value, request.place.value);
      expect(restored.dateWindow?.start, request.dateWindow?.start);
      expect(restored.filters?.duringMyDates, true);
    });

    test('should support all filter options', () {
      final request = EventsSearchRequest(
        itineraryId: 'itin-789',
        place: const EventPlace(
          granularity: PlaceGranularity.city,
          value: 'Berlin',
        ),
        filters: const EventsFilters(
          categories: [EventCategory.theatre],
          duringMyDates: true,
          free: true,
          familyFriendly: true,
        ),
        sort: EventsSort.date,
      );

      expect(request.filters?.categories, contains(EventCategory.theatre));
      expect(request.filters?.free, true);
      expect(request.filters?.familyFriendly, true);
      expect(request.sort, EventsSort.date);
    });
  });

  group('EventCard', () {
    test('should create with required fields', () {
      final card = EventCard(
        id: 'event-1',
        providerId: 'ticketmaster',
        externalId: 'tm_123',
        title: 'Summer Music Festival',
        category: EventCategory.festival,
        start: DateTime(2024, 7, 15, 18, 0),
        venue: const EventVenue(
          name: 'Hyde Park',
          latitude: 51.5073,
          longitude: -0.1657,
        ),
        leadImage: 'https://example.com/festival.jpg',
      );

      expect(card.id, 'event-1');
      expect(card.title, 'Summer Music Festival');
      expect(card.category, EventCategory.festival);
    });

    test('should serialize and deserialize correctly', () {
      final card = EventCard(
        id: 'event-2',
        providerId: 'eventbrite',
        externalId: 'eb_456',
        title: 'Tech Conference 2024',
        category: EventCategory.conference,
        start: DateTime(2024, 8, 20, 9, 0),
        end: DateTime(2024, 8, 22, 17, 0),
        venue: const EventVenue(
          name: 'Convention Center',
          latitude: 52.5200,
          longitude: 13.4050,
          address: 'Main Street 100, Berlin',
        ),
        leadImage: 'https://example.com/conf.jpg',
        distance: 1500,
        isFree: false,
        price: '€99',
      );

      final json = card.toJson();
      final restored = EventCard.fromJson(json);

      expect(restored.title, card.title);
      expect(restored.end, card.end);
      expect(restored.venue.name, 'Convention Center');
      expect(restored.distance, 1500);
    });

    test('should support all event categories', () {
      expect(EventCategory.values, contains(EventCategory.concert));
      expect(EventCategory.values, contains(EventCategory.theatre));
      expect(EventCategory.values, contains(EventCategory.sports));
      expect(EventCategory.values, contains(EventCategory.festival));
      expect(EventCategory.values, contains(EventCategory.exhibition));
      expect(EventCategory.values, contains(EventCategory.conference));
    });
  });

  group('EventDetail', () {
    test('should create with full details', () {
      final detail = EventDetail(
        id: 'detail-1',
        providerId: 'ticketmaster',
        externalId: 'tm_789',
        title: 'Rock Concert',
        category: EventCategory.concert,
        start: DateTime(2024, 9, 1, 20, 0),
        end: DateTime(2024, 9, 1, 23, 0),
        venue: const EventVenue(
          name: 'O2 Arena',
          latitude: 51.5030,
          longitude: 0.0032,
          address: 'Peninsula Square, London SE10 0DX',
        ),
        photos: [
          'https://example.com/photo1.jpg',
          'https://example.com/photo2.jpg',
        ],
        descriptionShort: 'An amazing night of rock music.',
        descriptionFull: 'Join us for an unforgettable evening...',
        website: 'https://concert.example.com',
        ticketUrl: 'https://tickets.example.com/buy',
        price: '£75',
        isFree: false,
        familyFriendly: false,
      );

      expect(detail.title, 'Rock Concert');
      expect(detail.photos, hasLength(2));
      expect(detail.ticketUrl, isNotNull);
    });

    test('should serialize and deserialize correctly', () {
      final detail = EventDetail(
        id: 'detail-2',
        providerId: 'local',
        externalId: 'local_123',
        title: 'Art Exhibition',
        category: EventCategory.exhibition,
        start: DateTime(2024, 10, 1),
        venue: const EventVenue(
          name: 'City Gallery',
          latitude: 48.8566,
          longitude: 2.3522,
        ),
        photos: ['https://example.com/art.jpg'],
        descriptionShort: 'Modern art showcase.',
        isFree: true,
        familyFriendly: true,
      );

      final json = detail.toJson();
      final restored = EventDetail.fromJson(json);

      expect(restored.title, detail.title);
      expect(restored.isFree, true);
      expect(restored.familyFriendly, true);
    });
  });

  group('EventDateWindow', () {
    test('should serialize and deserialize', () {
      final window = EventDateWindow(
        start: DateTime(2024, 7, 1),
        end: DateTime(2024, 7, 15),
      );

      final json = window.toJson();
      final restored = EventDateWindow.fromJson(json);

      expect(restored.start, window.start);
      expect(restored.end, window.end);
    });

    test('should calculate duration', () {
      final window = EventDateWindow(
        start: DateTime(2024, 7, 1),
        end: DateTime(2024, 7, 10),
      );

      // 9 days difference
      expect(window.end.difference(window.start).inDays, 9);
    });
  });

  group('EventVenue', () {
    test('should serialize and deserialize', () {
      const venue = EventVenue(
        name: 'Madison Square Garden',
        latitude: 40.7505,
        longitude: -73.9934,
        address: '4 Pennsylvania Plaza, New York, NY 10001',
      );

      final json = venue.toJson();
      final restored = EventVenue.fromJson(json);

      expect(restored.name, venue.name);
      expect(restored.latitude, venue.latitude);
      expect(restored.address, venue.address);
    });
  });

  group('EventsFilters', () {
    test('should support all filter combinations', () {
      const filters = EventsFilters(
        categories: [EventCategory.concert, EventCategory.sports],
        duringMyDates: true,
        free: false,
        familyFriendly: true,
        thisWeekend: true,
      );

      expect(filters.categories, hasLength(2));
      expect(filters.duringMyDates, true);
      expect(filters.thisWeekend, true);
    });

    test('should serialize and deserialize', () {
      const filters = EventsFilters(
        categories: [EventCategory.festival],
        free: true,
      );

      final json = filters.toJson();
      final restored = EventsFilters.fromJson(json);

      expect(restored.categories, contains(EventCategory.festival));
      expect(restored.free, true);
    });
  });
}
