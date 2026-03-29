import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/gastronomy/application/gastronomy_normalization_helper.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';

void main() {
  group('GastronomyNormalizationHelper', () {
    group('generateDedupeKey', () {
      test('should generate deterministic key from restaurant and itinerary', () {
        const card = GastronomyResultCard(
          id: 'rest-1',
          providerId: 'google',
          externalId: 'place_123',
          name: 'Trattoria Roma',
          thumbnail: 'https://example.com/trattoria.jpg',
          priceBand: PriceBand.moderate,
          location: 'Rome, Italy',
          latitude: 41.9028,
          longitude: 12.4964,
          website: 'https://trattoria-roma.com',
          address: 'Via Roma 123',
        );

        final key = GastronomyNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        expect(
          key,
          'gastronomy-itin-123-trattoria roma-via roma 123-https://trattoria-roma.com',
        );
      });

      test('should generate different keys for different itineraries', () {
        const card = GastronomyResultCard(
          id: 'rest-2',
          providerId: 'google',
          externalId: 'place_456',
          name: 'Le Bistro',
          thumbnail: 'https://example.com/bistro.jpg',
          priceBand: PriceBand.upscale,
          location: 'Paris, France',
          latitude: 48.8566,
          longitude: 2.3522,
          website: 'https://le-bistro.fr',
          address: 'Rue de Paris 45',
        );

        final key1 = GastronomyNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-A',
          item: card,
        );

        final key2 = GastronomyNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-B',
          item: card,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should be deterministic for identical inputs', () {
        const card = GastronomyResultCard(
          id: 'rest-3',
          providerId: 'tripadvisor',
          externalId: 'venue_789',
          name: 'Sushi House',
          thumbnail: 'https://example.com/sushi.jpg',
          priceBand: PriceBand.moderate,
          location: 'Tokyo, Japan',
          latitude: 35.6762,
          longitude: 139.6503,
          address: 'Shibuya 1-2-3',
        );

        final key1 = GastronomyNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        final key2 = GastronomyNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        expect(key1, equals(key2));
      });

      test('should handle missing website gracefully', () {
        const card = GastronomyResultCard(
          id: 'rest-4',
          providerId: 'local',
          externalId: 'local_123',
          name: 'Local Café',
          thumbnail: 'https://example.com/cafe.jpg',
          priceBand: PriceBand.budget,
          location: 'Barcelona',
          latitude: 41.3851,
          longitude: 2.1734,
          address: 'Carrer Major 10',
        );

        final key = GastronomyNormalizationHelper.generateDedupeKey(
          itineraryId: 'itin-123',
          item: card,
        );

        expect(key, contains('gastronomy-itin-123-local café'));
        expect(key, isNot(contains('null')));
      });
    });

    group('generateSearchCacheKey', () {
      test('should generate deterministic cache key', () {
        final request = GastronomySearchRequest(
          itineraryId: 'itin-123',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Rome',
          ),
        );

        final key1 = GastronomyNormalizationHelper.generateSearchCacheKey(
          request,
        );
        final key2 = GastronomyNormalizationHelper.generateSearchCacheKey(
          request,
        );

        expect(key1, equals(key2));
        expect(key1.length, 64); // SHA-256 hex length
      });

      test('should generate different keys for different places', () {
        final request1 = GastronomySearchRequest(
          itineraryId: 'itin-1',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Rome',
          ),
        );

        final request2 = GastronomySearchRequest(
          itineraryId: 'itin-1',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Paris',
          ),
        );

        final key1 = GastronomyNormalizationHelper.generateSearchCacheKey(
          request1,
        );
        final key2 = GastronomyNormalizationHelper.generateSearchCacheKey(
          request2,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should include filters in cache key', () {
        final requestNoFilters = GastronomySearchRequest(
          itineraryId: 'itin-1',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Barcelona',
          ),
        );

        final requestWithFilters = GastronomySearchRequest(
          itineraryId: 'itin-1',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Barcelona',
          ),
          filters: const GastronomyFilters(dietary: [DietaryOption.vegan]),
        );

        final key1 = GastronomyNormalizationHelper.generateSearchCacheKey(
          requestNoFilters,
        );
        final key2 = GastronomyNormalizationHelper.generateSearchCacheKey(
          requestWithFilters,
        );

        expect(key1, isNot(equals(key2)));
      });

      test('should include sort in cache key', () {
        final request1 = GastronomySearchRequest(
          itineraryId: 'itin-1',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Berlin',
          ),
          sort: GastronomySort.rating,
        );

        final request2 = GastronomySearchRequest(
          itineraryId: 'itin-1',
          place: const GastronomyPlace(
            granularity: PlaceGranularity.city,
            value: 'Berlin',
          ),
          sort: GastronomySort.price,
        );

        final key1 = GastronomyNormalizationHelper.generateSearchCacheKey(
          request1,
        );
        final key2 = GastronomyNormalizationHelper.generateSearchCacheKey(
          request2,
        );

        expect(key1, isNot(equals(key2)));
      });
    });

    group('formatPriceTag', () {
      test('should format price bands correctly', () {
        expect(
          GastronomyNormalizationHelper.formatPriceTag(PriceBand.budget),
          r'$',
        );
        expect(
          GastronomyNormalizationHelper.formatPriceTag(PriceBand.moderate),
          r'$$',
        );
        expect(
          GastronomyNormalizationHelper.formatPriceTag(PriceBand.upscale),
          r'$$$',
        );
        expect(
          GastronomyNormalizationHelper.formatPriceTag(PriceBand.fine),
          r'$$$$',
        );
      });
    });

    group('formatDietary', () {
      test('should format dietary options with display names', () {
        expect(
          GastronomyNormalizationHelper.formatDietary(DietaryOption.vegan),
          'Vegan',
        );
        expect(
          GastronomyNormalizationHelper.formatDietary(DietaryOption.vegetarian),
          'Vegetarian',
        );
        expect(
          GastronomyNormalizationHelper.formatDietary(DietaryOption.halal),
          'Halal',
        );
        expect(
          GastronomyNormalizationHelper.formatDietary(DietaryOption.kosher),
          'Kosher',
        );
        expect(
          GastronomyNormalizationHelper.formatDietary(DietaryOption.glutenFree),
          'Gluten-Free',
        );
      });
    });

    group('formatCuisine', () {
      test('should format cuisine types with display names', () {
        expect(
          GastronomyNormalizationHelper.formatCuisine(CuisineType.italian),
          'Italian',
        );
        expect(
          GastronomyNormalizationHelper.formatCuisine(CuisineType.french),
          'French',
        );
        expect(
          GastronomyNormalizationHelper.formatCuisine(CuisineType.asian),
          'Asian',
        );
        expect(
          GastronomyNormalizationHelper.formatCuisine(CuisineType.mexican),
          'Mexican',
        );
      });
    });

    group('formatDistance', () {
      test('should format meters for short distances', () {
        expect(GastronomyNormalizationHelper.formatDistance(500), '500m');
        expect(GastronomyNormalizationHelper.formatDistance(999), '999m');
      });

      test('should format kilometers for long distances', () {
        expect(GastronomyNormalizationHelper.formatDistance(1000), '1.0km');
        expect(GastronomyNormalizationHelper.formatDistance(2500), '2.5km');
      });

      test('should handle null', () {
        expect(GastronomyNormalizationHelper.formatDistance(null), 'Unknown');
      });
    });
  });
}
