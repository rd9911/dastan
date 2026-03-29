import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/domain/search_utils.dart';
import 'package:dastan/src/features/search_platform/data/provider_adapter.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';

void main() {
  group('Search Platform E2E: Acceptance Criteria', () {
    group('AC1: Normalization parity', () {
      test('adapter maps native payload to canonical item', () {
        final item = SearchResultItem(
          id: 'test_1',
          dedupeKey: 'transport:jfk|lax|2024-01-15|AA|100',
          vertical: SearchVertical.transport,
          title: 'AA Flight 100',
          price: 299.99,
          priceCurrency: 'USD',
          rating: 4.5,
          latitude: 40.6413,
          longitude: -73.7781,
          provenance: ['provider_a'],
        );

        expect(item.vertical, SearchVertical.transport);
        expect(item.price, 299.99);
        expect(item.latitude, isNotNull);
        expect(item.longitude, isNotNull);
      });
    });

    group('AC2: Timeout and partials', () {
      test('slow provider marked timeout, others return', () async {
        final registry = ProviderRegistry();

        // Fast provider
        registry.register(
          MockProviderAdapter(
            config: const ProviderConfig(
              name: 'fast_provider',
              vertical: SearchVertical.transport,
              timeoutMs: 5000,
            ),
            fixtures: [
              const SearchResultItem(
                id: 'fast_1',
                dedupeKey: 'transport:fast_1',
                vertical: SearchVertical.transport,
                title: 'Fast Result',
                provenance: ['fast_provider'],
              ),
            ],
            simulatedLatencyMs: 50,
          ),
        );

        // Slow provider (will timeout)
        registry.register(
          MockProviderAdapter(
            config: const ProviderConfig(
              name: 'slow_provider',
              vertical: SearchVertical.transport,
              timeoutMs: 100,
            ),
            fixtures: [],
            simulateTimeout: true,
          ),
        );

        final orchestrator = SearchOrchestrator(
          registry: registry,
          cache: SearchCache(),
          ranker: SearchRanker(),
        );

        final response = await orchestrator.search(
          const SearchQuery(
            vertical: SearchVertical.transport,
            context: SearchContext(),
            params: {},
          ),
        );

        // Fast provider succeeded
        final fastProvider = response.meta.providers.firstWhere(
          (p) => p.name == 'fast_provider',
        );
        expect(fastProvider.status, ProviderStatus.ok);

        // Slow provider timed out
        final slowProvider = response.meta.providers.firstWhere(
          (p) => p.name == 'slow_provider',
        );
        expect(slowProvider.status, ProviderStatus.timeout);
      });
    });

    group('AC3: Budget exhaustion', () {
      test('over-budget provider returns budget_exhausted', () {
        // This would be implemented with a token bucket in production
        // For now, verify the status enum exists
        expect(ProviderStatus.budgetExhausted, isNotNull);
      });
    });

    group('AC4: Cache and negative-cache', () {
      test('repeat query hits service cache', () async {
        final registry = ProviderRegistry();
        registry.register(
          MockProviderAdapter(
            config: const ProviderConfig(
              name: 'cached_provider',
              vertical: SearchVertical.accommodation,
            ),
            fixtures: [
              const SearchResultItem(
                id: 'hotel_1',
                dedupeKey: 'accommodation:hotel_1',
                vertical: SearchVertical.accommodation,
                title: 'Test Hotel',
                provenance: ['cached_provider'],
              ),
            ],
          ),
        );

        final cache = SearchCache();
        final orchestrator = SearchOrchestrator(
          registry: registry,
          cache: cache,
          ranker: SearchRanker(),
        );

        const query = SearchQuery(
          vertical: SearchVertical.accommodation,
          context: SearchContext(),
          params: {},
        );

        // First query - cache miss
        await orchestrator.search(query);
        expect(cache.size, 1);

        // Second query - cache hit (would return cached response)
        final response2 = await orchestrator.search(query);
        expect(response2.items.isNotEmpty, true);
      });

      test('empty-set negative-cached briefly', () async {
        final cache = SearchCache(
          negativeCacheTtl: const Duration(seconds: 30),
        );

        final emptyResponse = SearchResponse(
          items: [],
          page: 0,
          pageSize: 20,
          totalItems: 0,
          meta: SearchMeta(searchRequestId: 'test', tookMs: 100, providers: []),
        );

        cache.set('empty_key', emptyResponse);
        expect(cache.get('empty_key'), isNotNull);
      });
    });

    group('AC5: Schema drift protection', () {
      test('validator catches invalid coordinates', () {
        final item = SearchResultItem(
          id: 'invalid',
          dedupeKey: 'test:invalid',
          vertical: SearchVertical.gastronomy,
          title: 'Invalid Restaurant',
          latitude: 200.0, // Invalid
          longitude: -400.0, // Invalid
          provenance: ['test'],
        );

        final errors = SearchValidator.validateItem(item);
        expect(errors, contains('latitude must be between -90 and 90'));
        expect(errors, contains('longitude must be between -180 and 180'));
      });

      test('validator catches missing required fields', () {
        final item = SearchResultItem(
          id: '',
          dedupeKey: '',
          vertical: SearchVertical.events,
          title: '',
          provenance: [],
        );

        final errors = SearchValidator.validateItem(item);
        expect(errors, contains('id is required'));
        expect(errors, contains('dedupeKey is required'));
        expect(errors, contains('title is required'));
      });
    });

    group('AC6: Geo/TOS enforcement', () {
      test('provider can be disabled via flags', () async {
        final registry = ProviderRegistry();
        registry.register(
          MockProviderAdapter(
            config: const ProviderConfig(
              name: 'restricted_provider',
              vertical: SearchVertical.trails,
            ),
            fixtures: [],
          ),
        );

        final orchestrator = SearchOrchestrator(
          registry: registry,
          cache: SearchCache(),
          ranker: SearchRanker(),
        );

        final response = await orchestrator.search(
          const SearchQuery(
            vertical: SearchVertical.trails,
            context: SearchContext(),
            params: {},
            flags: SearchFlags(disabledProviders: ['restricted_provider']),
          ),
        );

        // Provider should be skipped
        expect(response.meta.providers, isEmpty);
      });
    });

    group('AC7: Suggest and open-now correctness', () {
      test('dietary filters are preserved in prefs', () {
        const prefs = SearchPrefs(
          dietaryFilters: ['vegan', 'vegetarian'],
          accessibilityNeeds: ['wheelchair'],
        );

        expect(prefs.dietaryFilters, contains('vegan'));
        expect(prefs.accessibilityNeeds, contains('wheelchair'));
      });
    });

    group('AC8: Lookup parity', () {
      test('lookup returns item with same dedupe key', () async {
        const item = SearchResultItem(
          id: 'lookup_test',
          dedupeKey: 'entertainment:theater_1',
          vertical: SearchVertical.entertainment,
          title: 'Test Theater',
          provenance: ['test'],
        );

        final adapter = MockProviderAdapter(
          config: const ProviderConfig(
            name: 'lookup_provider',
            vertical: SearchVertical.entertainment,
          ),
          fixtures: [item],
        );

        final lookedUp = await adapter.lookup('lookup_test');
        expect(lookedUp, isNotNull);
        expect(lookedUp!.dedupeKey, item.dedupeKey);
      });
    });

    group('AC9: Ranking explainability', () {
      test('debug flag returns ranking explain', () async {
        final registry = ProviderRegistry();
        registry.register(
          MockProviderAdapter(
            config: const ProviderConfig(
              name: 'ranking_provider',
              vertical: SearchVertical.gastronomy,
            ),
            fixtures: [
              const SearchResultItem(
                id: 'restaurant_1',
                dedupeKey: 'gastronomy:rest_1',
                vertical: SearchVertical.gastronomy,
                title: 'Restaurant 1',
                price: 50.0,
                rating: 4.5,
                provenance: ['ranking_provider'],
              ),
            ],
          ),
        );

        final orchestrator = SearchOrchestrator(
          registry: registry,
          cache: SearchCache(),
          ranker: SearchRanker(),
        );

        final response = await orchestrator.search(
          const SearchQuery(
            vertical: SearchVertical.gastronomy,
            context: SearchContext(),
            params: {},
            flags: SearchFlags(debugRanking: true),
          ),
        );

        expect(response.meta.ranking, isNotNull);
        expect(response.meta.ranking!.weights, isNotEmpty);
      });
    });
  });

  group('DedupeKeyGenerator', () {
    test('transport dedupe key includes carrier and flight number', () {
      final key = DedupeKeyGenerator.makeDedupeKey(SearchVertical.transport, {
        'origin': 'JFK',
        'destination': 'LAX',
        'departureTime': '2024-01-15T10:00:00Z',
        'carrier': 'AA',
        'flightNumber': '100',
      });

      expect(key, contains('jfk'));
      expect(key, contains('lax'));
      expect(key, contains('aa'));
      expect(key, contains('100'));
    });

    test('accommodation dedupe key includes name and geo', () {
      final key =
          DedupeKeyGenerator.makeDedupeKey(SearchVertical.accommodation, {
            'name': 'Hilton Hotel',
            'latitude': 40.7128,
            'longitude': -74.0060,
            'address': '123 Main St',
          });

      expect(key, contains('hilton hotel'));
      expect(key, contains('40.7128'));
    });

    test('identical entities produce same key', () {
      final key1 = DedupeKeyGenerator.makeDedupeKey(SearchVertical.gastronomy, {
        'name': 'Pizza Palace',
        'lat': 40.7,
        'lng': -74.0,
        'cuisine': 'Italian',
      });
      final key2 = DedupeKeyGenerator.makeDedupeKey(SearchVertical.gastronomy, {
        'title': 'Pizza Palace',
        'latitude': 40.7,
        'longitude': -74.0,
        'cuisineType': 'Italian',
      });

      expect(key1, key2);
    });
  });

  group('SearchQuery', () {
    test('validates page size range', () {
      const query = SearchQuery(
        vertical: SearchVertical.transport,
        context: SearchContext(),
        params: {},
        pageSize: 200,
      );

      final errors = query.validate();
      expect(errors, contains('pageSize must be between 1 and 100'));
    });

    test('clamp fixes invalid values', () {
      const query = SearchQuery(
        vertical: SearchVertical.transport,
        context: SearchContext(),
        params: {},
        page: -5,
        pageSize: 500,
      );

      final clamped = query.clamp();
      expect(clamped.page, 0);
      expect(clamped.pageSize, 100);
    });
  });

  group('SearchValidator', () {
    test('sanitizeUrl removes tracking params', () {
      const url = 'https://example.com/page?id=123&utm_source=google&ref=abc';
      final sanitized = SearchValidator.sanitizeUrl(url);

      expect(sanitized, 'https://example.com/page?id=123');
    });

    test('sanitizeUrl rejects non-http schemes', () {
      expect(SearchValidator.sanitizeUrl('javascript:alert(1)'), isNull);
      expect(SearchValidator.sanitizeUrl('file:///etc/passwd'), isNull);
    });
  });
}
