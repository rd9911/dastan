import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';

void main() {
  group('EntertainmentSearchRequest', () {
    test('should create with required fields', () {
      final request = EntertainmentSearchRequest(
        itineraryId: 'itin-123',
        place: const EntertainmentPlace(
          granularity: PlaceGranularity.city,
          value: 'Paris, France',
        ),
      );

      expect(request.itineraryId, 'itin-123');
      expect(request.place.granularity, PlaceGranularity.city);
      expect(request.place.value, 'Paris, France');
    });

    test('should serialize and deserialize correctly', () {
      final request = EntertainmentSearchRequest(
        itineraryId: 'itin-456',
        place: const EntertainmentPlace(
          granularity: PlaceGranularity.region,
          value: 'Île-de-France',
        ),
        dateRange: DateTimeRange(
          start: DateTime(2024, 6, 15),
          end: DateTime(2024, 6, 20),
        ),
        tags: [EntertainmentTag.museum, EntertainmentTag.landmark],
        filters: const EntertainmentFilters(
          openNow: true,
          freeEntry: false,
          kidFriendly: true,
        ),
      );

      final json = request.toJson();
      final restored = EntertainmentSearchRequest.fromJson(json);

      expect(restored.itineraryId, request.itineraryId);
      expect(restored.place.value, request.place.value);
      expect(
        restored.tags,
        containsAll([EntertainmentTag.museum, EntertainmentTag.landmark]),
      );
      expect(restored.filters?.openNow, true);
      expect(restored.filters?.kidFriendly, true);
    });

    test('should support different place granularities', () {
      final cityRequest = EntertainmentSearchRequest(
        itineraryId: 'itin-1',
        place: const EntertainmentPlace(
          granularity: PlaceGranularity.city,
          value: 'Paris',
        ),
      );

      final poiRequest = EntertainmentSearchRequest(
        itineraryId: 'itin-2',
        place: const EntertainmentPlace(
          granularity: PlaceGranularity.poi,
          value: 'Eiffel Tower',
          latitude: 48.8584,
          longitude: 2.2945,
        ),
      );

      expect(cityRequest.place.granularity, PlaceGranularity.city);
      expect(poiRequest.place.granularity, PlaceGranularity.poi);
      expect(poiRequest.place.latitude, 48.8584);
    });
  });

  group('EntertainmentResultCard', () {
    test('should create with required fields', () {
      const card = EntertainmentResultCard(
        id: 'ent-1',
        providerId: 'google',
        externalId: 'place_123',
        name: 'Louvre Museum',
        thumbnail: 'https://example.com/louvre.jpg',
        tag: EntertainmentTag.museum,
        location: 'Paris, France',
        latitude: 48.8606,
        longitude: 2.3376,
      );

      expect(card.id, 'ent-1');
      expect(card.name, 'Louvre Museum');
      expect(card.tag, EntertainmentTag.museum);
      expect(card.latitude, 48.8606);
    });

    test('should serialize and deserialize correctly', () {
      const card = EntertainmentResultCard(
        id: 'ent-2',
        providerId: 'tripadvisor',
        externalId: 'place_456',
        name: 'Jardin du Luxembourg',
        thumbnail: 'https://example.com/jardin.jpg',
        tag: EntertainmentTag.garden,
        location: 'Paris, France',
        latitude: 48.8462,
        longitude: 2.3372,
        rating: 4.7,
        reviewCount: 2500,
        distance: 1200,
        website: 'https://www.senat.fr/visite/jardin/',
      );

      final json = card.toJson();
      final restored = EntertainmentResultCard.fromJson(json);

      expect(restored.name, card.name);
      expect(restored.tag, EntertainmentTag.garden);
      expect(restored.rating, 4.7);
      expect(restored.reviewCount, 2500);
      expect(restored.distance, 1200);
      expect(restored.website, isNotNull);
    });

    test('should support all entertainment tags', () {
      final tags = EntertainmentTag.values;

      expect(tags, contains(EntertainmentTag.museum));
      expect(tags, contains(EntertainmentTag.garden));
      expect(tags, contains(EntertainmentTag.landmark));
      expect(tags, contains(EntertainmentTag.architecture));
      expect(tags, contains(EntertainmentTag.viewpoint));
      expect(tags, contains(EntertainmentTag.park));
      expect(tags, contains(EntertainmentTag.historicSite));
      expect(tags, contains(EntertainmentTag.artGallery));
    });
  });

  group('EntertainmentPlaceDetail', () {
    test('should create with full details', () {
      final detail = EntertainmentPlaceDetail(
        id: 'ent-det-1',
        providerId: 'google',
        externalId: 'place_789',
        name: 'Musée d\'Orsay',
        tag: EntertainmentTag.museum,
        location: 'Paris, France',
        latitude: 48.8600,
        longitude: 2.3266,
        description: 'A famous impressionist art museum.',
        shortDescription: 'Impressionist museum',
        photos: [
          'https://example.com/orsay1.jpg',
          'https://example.com/orsay2.jpg',
        ],
        openingHours: const OpeningHours(
          monday: '9:30 - 18:00',
          tuesday: 'Closed',
          wednesday: '9:30 - 18:00',
          thursday: '9:30 - 21:45',
          friday: '9:30 - 18:00',
          saturday: '9:30 - 18:00',
          sunday: '9:30 - 18:00',
        ),
        rating: 4.8,
        reviewCount: 50000,
        website: 'https://www.musee-orsay.fr/',
        phone: '+33 1 40 49 48 14',
        priceLevel: 2,
        isFree: false,
        isKidFriendly: true,
        isAccessible: true,
        distanceFromCenter: 800,
      );

      expect(detail.name, 'Musée d\'Orsay');
      expect(detail.photos.length, 2);
      expect(detail.openingHours?.tuesday, 'Closed');
      expect(detail.priceLevel, 2);
      expect(detail.isKidFriendly, true);
    });

    test('should serialize and deserialize correctly', () {
      final detail = EntertainmentPlaceDetail(
        id: 'ent-det-2',
        providerId: 'foursquare',
        externalId: 'venue_abc',
        name: 'Arc de Triomphe',
        tag: EntertainmentTag.landmark,
        location: 'Paris, France',
        latitude: 48.8738,
        longitude: 2.2950,
        description: 'Iconic 19th-century monument.',
        photos: ['https://example.com/arc.jpg'],
        rating: 4.6,
        website: 'https://www.paris-arc-de-triomphe.fr/',
      );

      final json = detail.toJson();
      final restored = EntertainmentPlaceDetail.fromJson(json);

      expect(restored.name, detail.name);
      expect(restored.tag, EntertainmentTag.landmark);
      expect(restored.photos.length, 1);
      expect(restored.website, isNotNull);
    });
  });

  group('EntertainmentFilters', () {
    test('should support all filter options', () {
      const filters = EntertainmentFilters(
        openNow: true,
        freeEntry: true,
        kidFriendly: true,
        accessible: true,
        minRating: 4.0,
        maxDistance: 5000,
      );

      expect(filters.openNow, true);
      expect(filters.freeEntry, true);
      expect(filters.kidFriendly, true);
      expect(filters.accessible, true);
      expect(filters.minRating, 4.0);
      expect(filters.maxDistance, 5000);
    });
  });

  group('OpeningHours', () {
    test('should serialize and deserialize', () {
      const hours = OpeningHours(
        monday: '9:00 - 18:00',
        tuesday: '9:00 - 18:00',
        wednesday: '9:00 - 18:00',
        thursday: '9:00 - 18:00',
        friday: '9:00 - 18:00',
        saturday: '10:00 - 17:00',
        sunday: 'Closed',
      );

      final json = hours.toJson();
      final restored = OpeningHours.fromJson(json);

      expect(restored.monday, '9:00 - 18:00');
      expect(restored.sunday, 'Closed');
    });
  });
}
