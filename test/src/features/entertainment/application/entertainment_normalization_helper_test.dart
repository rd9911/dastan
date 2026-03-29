import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/entertainment/application/entertainment_normalization_helper.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';

void main() {
  group('EntertainmentNormalizationHelper', () {
    group('generateDedupeKey', () {
      test('should generate deterministic key from place and itinerary', () {
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
          website: 'https://www.louvre.fr',
        );

        final key = EntertainmentNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        expect(
          key,
          'entertainment-itin-123-louvre museum-museum-https://www.louvre.fr',
        );
      });

      test('should generate different keys for different itineraries', () {
        const card = EntertainmentResultCard(
          id: 'ent-2',
          providerId: 'google',
          externalId: 'place_456',
          name: 'Eiffel Tower',
          thumbnail: 'https://example.com/eiffel.jpg',
          tag: EntertainmentTag.landmark,
          location: 'Paris, France',
          latitude: 48.8584,
          longitude: 2.2945,
          website: 'https://www.toureiffel.paris',
        );

        final key1 = EntertainmentNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-A',
          item: card,
        );

        final key2 = EntertainmentNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-B',
          item: card,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should be deterministic for identical inputs', () {
        const card = EntertainmentResultCard(
          id: 'ent-3',
          providerId: 'tripadvisor',
          externalId: 'venue_789',
          name: 'Notre-Dame Cathedral',
          thumbnail: 'https://example.com/notre-dame.jpg',
          tag: EntertainmentTag.historicSite,
          location: 'Paris, France',
          latitude: 48.8530,
          longitude: 2.3499,
          website: 'https://www.notredamedeparis.fr',
        );

        final key1 = EntertainmentNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        final key2 = EntertainmentNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        expect(key1, equals(key2));
      });

      test('should handle missing website gracefully', () {
        const card = EntertainmentResultCard(
          id: 'ent-4',
          providerId: 'local',
          externalId: 'local_123',
          name: 'Local Park',
          thumbnail: 'https://example.com/park.jpg',
          tag: EntertainmentTag.park,
          location: 'Paris, France',
          latitude: 48.85,
          longitude: 2.35,
        );

        final key = EntertainmentNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        expect(key, contains('entertainment-itin-123-local park-park'));
        expect(key, isNot(contains('null')));
      });
    });

    group('generateSearchCacheKey', () {
      test('should generate deterministic cache key', () {
        final request = EntertainmentSearchRequest(
          itineraryId: 'itin-123',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Paris',
          ),
        );

        final key1 = EntertainmentNormalizationHelper.generateSearchCacheKey(
          request,
        );
        final key2 = EntertainmentNormalizationHelper.generateSearchCacheKey(
          request,
        );

        expect(key1, equals(key2));
        expect(key1.length, 64); // SHA-256 hex length
      });

      test('should generate different keys for different places', () {
        final request1 = EntertainmentSearchRequest(
          itineraryId: 'itin-1',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Paris',
          ),
        );

        final request2 = EntertainmentSearchRequest(
          itineraryId: 'itin-1',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'London',
          ),
        );

        final key1 = EntertainmentNormalizationHelper.generateSearchCacheKey(
          request1,
        );
        final key2 = EntertainmentNormalizationHelper.generateSearchCacheKey(
          request2,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should include tags in cache key', () {
        final requestNoTags = EntertainmentSearchRequest(
          itineraryId: 'itin-1',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Rome',
          ),
        );

        final requestWithTags = EntertainmentSearchRequest(
          itineraryId: 'itin-1',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Rome',
          ),
          tags: [EntertainmentTag.museum],
        );

        final key1 = EntertainmentNormalizationHelper.generateSearchCacheKey(
          requestNoTags,
        );
        final key2 = EntertainmentNormalizationHelper.generateSearchCacheKey(
          requestWithTags,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should include filters in cache key', () {
        final requestNoFilters = EntertainmentSearchRequest(
          itineraryId: 'itin-1',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Barcelona',
          ),
        );

        final requestWithFilters = EntertainmentSearchRequest(
          itineraryId: 'itin-1',
          place: const EntertainmentPlace(
            granularity: PlaceGranularity.city,
            value: 'Barcelona',
          ),
          filters: const EntertainmentFilters(openNow: true),
        );

        final key1 = EntertainmentNormalizationHelper.generateSearchCacheKey(
          requestNoFilters,
        );
        final key2 = EntertainmentNormalizationHelper.generateSearchCacheKey(
          requestWithFilters,
        );

        expect(key1, isNot(equals(key2)));
      });
    });

    group('formatDistance', () {
      test('should format meters for short distances', () {
        expect(EntertainmentNormalizationHelper.formatDistance(500), '500m');
        expect(EntertainmentNormalizationHelper.formatDistance(999), '999m');
      });

      test('should format kilometers for long distances', () {
        expect(EntertainmentNormalizationHelper.formatDistance(1000), '1.0km');
        expect(EntertainmentNormalizationHelper.formatDistance(2500), '2.5km');
      });

      test('should handle null', () {
        expect(
          EntertainmentNormalizationHelper.formatDistance(null),
          'Unknown',
        );
      });
    });

    group('formatTag', () {
      test('should format tags with proper display names', () {
        expect(
          EntertainmentNormalizationHelper.formatTag(EntertainmentTag.museum),
          'Museum',
        );
        expect(
          EntertainmentNormalizationHelper.formatTag(
            EntertainmentTag.historicSite,
          ),
          'Historic Site',
        );
        expect(
          EntertainmentNormalizationHelper.formatTag(
            EntertainmentTag.artGallery,
          ),
          'Art Gallery',
        );
        expect(
          EntertainmentNormalizationHelper.formatTag(
            EntertainmentTag.themePark,
          ),
          'Theme Park',
        );
      });
    });
  });
}
