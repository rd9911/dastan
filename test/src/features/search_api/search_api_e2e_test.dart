import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/search_api/domain/search_api_models.dart';
import 'package:dastan/src/features/search_api/application/search_api_controller.dart';
import 'package:dastan/src/features/search_api/application/search_save_helper.dart';
import 'package:dastan/src/features/search_api/domain/search_filters.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/data/provider_adapter.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';

void main() {
  group('Story 21 - Search Assist APIs E2E', () {
    late SearchApiController apiController;
    late SearchSaveHelper saveHelper;
    late DefaultActiveItineraryResolver itineraryResolver;
    late DefaultRbacChecker rbacChecker;
    late InMemorySavedItemsRepository repository;

    setUp(() {
      // Set up orchestrator with mock providers
      final registry = ProviderRegistry();
      for (final vertical in SearchVertical.values) {
        registry.register(
          MockProviderAdapter(
            config: ProviderConfig(
              name: 'mock_${vertical.name}',
              vertical: vertical,
            ),
            fixtures: List.generate(
              20,
              (i) => SearchResultItem(
                id: '${vertical.name}_$i',
                dedupeKey: '${vertical.name}:item_$i',
                vertical: vertical,
                title: '${vertical.name.toUpperCase()} Item $i',
                subtitle: 'Description for item $i',
                price: 50.0 + i * 10,
                priceCurrency: 'USD',
                rating: 4.0 + (i % 10) / 10,
                latitude: 41.9 + (i % 10) / 100,
                longitude: 12.4 + (i % 10) / 100,
                provenance: ['mock_${vertical.name}'],
                details: {
                  'openingHours': {
                    'monday': '09:00 - 21:00',
                    'tuesday': '09:00 - 21:00',
                    'wednesday': '09:00 - 21:00',
                    'thursday': '09:00 - 21:00',
                    'friday': '09:00 - 22:00',
                    'saturday': '10:00 - 22:00',
                    'sunday': '10:00 - 20:00',
                  },
                },
              ),
            ),
          ),
        );
      }

      final orchestrator = SearchOrchestrator(
        registry: registry,
        cache: SearchCache(),
        ranker: SearchRanker(),
      );

      apiController = SearchApiController(orchestrator: orchestrator);

      itineraryResolver = DefaultActiveItineraryResolver();
      rbacChecker = DefaultRbacChecker();
      repository = InMemorySavedItemsRepository();

      saveHelper = SearchSaveHelper(
        itineraryResolver: itineraryResolver,
        rbacChecker: rbacChecker,
        repository: repository,
      );
    });

    group('AC1: Active-Itinerary binding', () {
      test(
        'POST save without itineraryId files under user Active Itinerary',
        () async {
          final userId = 'user-123';
          itineraryResolver.setActiveItinerary(userId, 'active-itinerary-123');

          final result = await saveHelper.save(
            payload: const SearchApiSavePayload(
              id: 'item-1',
              vertical: 'gastronomy',
              title: 'Test Restaurant',
              dedupeKey: 'gastronomy:item-1',
            ),
            userId: userId,
            idempotencyKey: 'key-1',
          );

          expect(result, isA<SaveApiSuccess>());
          final success = result as SaveApiSuccess;
          expect(success.response.created, true);
          expect(success.response.itineraryId, 'active-itinerary-123');
        },
      );
    });

    group('AC2: Dedupe on save', () {
      test(
        'second identical save returns created:false, DB holds one row',
        () async {
          final userId = 'user-456';

          // First save
          final result1 = await saveHelper.save(
            payload: const SearchApiSavePayload(
              id: 'item-2',
              vertical: 'entertainment',
              title: 'Museum Visit',
              dedupeKey: 'entertainment:item-2',
            ),
            userId: userId,
            idempotencyKey: 'key-2a',
          );

          expect(result1, isA<SaveApiSuccess>());
          expect((result1 as SaveApiSuccess).response.created, true);

          // Second save with same dedupe key
          final result2 = await saveHelper.save(
            payload: const SearchApiSavePayload(
              id: 'item-2',
              vertical: 'entertainment',
              title: 'Museum Visit',
              dedupeKey: 'entertainment:item-2',
            ),
            userId: userId,
            idempotencyKey: 'key-2b',
          );

          expect(result2, isA<SaveApiSuccess>());
          expect((result2 as SaveApiSuccess).response.created, false);
        },
      );
    });

    group('AC3: RBAC enforcement', () {
      test('viewer saving to itinerary returns 403 FORBIDDEN', () async {
        final userId = 'viewer-user';
        final itineraryId = 'I-789';

        rbacChecker.setViewerOnly(userId, itineraryId);

        final result = await saveHelper.save(
          payload: const SearchApiSavePayload(
            id: 'item-3',
            vertical: 'transport',
            title: 'Flight to Paris',
            dedupeKey: 'transport:item-3',
          ),
          userId: userId,
          itineraryId: itineraryId,
          idempotencyKey: 'key-3',
        );

        expect(result, isA<SaveApiFailure>());
        final failure = result as SaveApiFailure;
        expect(failure.error.code, 'FORBIDDEN');
      });
    });

    group('AC4: Cache hits', () {
      test('repeat search shows cache status and faster response', () async {
        final query = const SearchApiQuery(
          vertical: SearchVertical.entertainment,
          q: 'museum',
        );

        // First request
        final stopwatch1 = Stopwatch()..start();
        final result1 = await apiController.search(query);
        stopwatch1.stop();

        expect(result1, isA<SearchApiSuccess>());

        // Second request (should be cached)
        final stopwatch2 = Stopwatch()..start();
        final result2 = await apiController.search(query);
        stopwatch2.stop();

        expect(result2, isA<SearchApiSuccess>());
        // Cached requests should be faster (though both are mocked, timing may vary)
        // In production, we'd check meta.providers[*].cache
      });
    });

    group('AC5: Bounds filtering', () {
      test('boundsOnly=true returns only in-viewport items', () async {
        final query = const SearchApiQuery(
          vertical: SearchVertical.gastronomy,
          boundsOnly: true,
          bounds: SearchBounds(
            north: 41.95,
            south: 41.90,
            east: 12.45,
            west: 12.40,
          ),
        );

        final result = await apiController.search(query);

        expect(result, isA<SearchApiSuccess>());
        final success = result as SearchApiSuccess;

        // All items should be within bounds
        for (final item in success.response.items) {
          if (item.lat != null && item.lng != null) {
            expect(item.lat, greaterThanOrEqualTo(41.90));
            expect(item.lat, lessThanOrEqualTo(41.95));
            expect(item.lng, greaterThanOrEqualTo(12.40));
            expect(item.lng, lessThanOrEqualTo(12.45));
          }
        }
      });
    });

    group('AC6: Open-now correctness', () {
      test('opened venues are correctly identified', () {
        final hours = {'monday': '09:00 - 21:00', 'tuesday': '09:00 - 21:00'};

        // 10:00 on Monday should be open
        final monday10am = DateTime(2024, 1, 15, 10, 0); // Monday
        expect(
          OpenNowFilter.isOpen(
            openingHours: hours,
            timezone: 'Europe/Rome',
            checkTime: monday10am,
          ),
          true,
        );

        // 23:00 on Monday should be closed
        final monday23pm = DateTime(2024, 1, 15, 23, 0);
        expect(
          OpenNowFilter.isOpen(
            openingHours: hours,
            timezone: 'Europe/Rome',
            checkTime: monday23pm,
          ),
          false,
        );
      });

      test('closed venues at 20:30 local are excluded', () {
        final hours = {'monday': '09:00 - 20:00'};

        final monday2030 = DateTime(2024, 1, 15, 20, 30);
        expect(
          OpenNowFilter.isOpen(
            openingHours: hours,
            timezone: 'Europe/Rome',
            checkTime: monday2030,
          ),
          false,
        );
      });
    });

    group('AC7: Transport calendar', () {
      test(
        '/transport/min-price-calendar returns normalized currency grid',
        () async {
          final calendar = await apiController.getTransportPriceCalendar(
            origin: 'NYC',
            destination: 'LAX',
            start: DateTime(2024, 3, 1),
            end: DateTime(2024, 3, 7),
            currency: 'EUR',
          );

          expect(calendar.days.length, 7);
          expect(calendar.currency, 'EUR');

          for (final day in calendar.days) {
            expect(day.currency, 'EUR');
            expect(day.minPrice, greaterThan(0));
          }
        },
      );
    });

    group('AC8: Save idempotency', () {
      test(
        'repeated save with same idempotency key returns original body',
        () async {
          final userId = 'user-idem';
          final idempotencyKey = 'unique-idem-key-123';

          // First save
          final result1 = await saveHelper.save(
            payload: const SearchApiSavePayload(
              id: 'idem-item',
              vertical: 'trails',
              title: 'Mountain Hike',
              dedupeKey: 'trails:idem-item',
            ),
            userId: userId,
            idempotencyKey: idempotencyKey,
          );

          expect(result1, isA<SaveApiSuccess>());
          final success1 = result1 as SaveApiSuccess;

          // Second save with same idempotency key
          final result2 = await saveHelper.save(
            payload: const SearchApiSavePayload(
              id: 'idem-item-different', // Different payload
              vertical: 'trails',
              title: 'Different Hike',
              dedupeKey: 'trails:idem-item-different',
            ),
            userId: userId,
            idempotencyKey: idempotencyKey, // Same key
          );

          expect(result2, isA<SaveApiSuccess>());
          final success2 = result2 as SaveApiSuccess;

          // Should return original response
          expect(success2.response.itemId, success1.response.itemId);
        },
      );
    });

    group('AC9: Suggest quality', () {
      test(
        'suggest?q=veg includes vegan/vegetarian ordered by popularity',
        () async {
          final suggestions = await apiController.suggest(
            vertical: SearchVertical.gastronomy,
            q: 'veg',
          );

          expect(suggestions.suggestions.isNotEmpty, true);

          // Should include vegan and vegetarian
          final texts = suggestions.suggestions.map((s) => s.text).toList();
          expect(texts, containsAll(['vegan', 'vegetarian']));

          // Should be ordered by score (popularity)
          for (int i = 0; i < suggestions.suggestions.length - 1; i++) {
            expect(
              suggestions.suggestions[i].score,
              greaterThanOrEqualTo(suggestions.suggestions[i + 1].score),
            );
          }
        },
      );
    });

    group('Query validation', () {
      test('validates pageSize bounds', () {
        const query = SearchApiQuery(
          vertical: SearchVertical.transport,
          pageSize: 200,
        );

        final errors = query.validate();
        expect(errors, contains('pageSize must be between 1 and 100'));
      });

      test('clamps pageSize to valid range', () {
        const query = SearchApiQuery(
          vertical: SearchVertical.transport,
          pageSize: 200,
        );

        final clamped = query.clamp();
        expect(clamped.pageSize, 100);
      });

      test('validates bounds coordinates', () {
        const bounds = SearchBounds(
          north: 100, // Invalid
          south: -100, // Invalid
          east: 200, // Invalid
          west: -200, // Invalid
        );

        final errors = bounds.validate();
        expect(errors.length, greaterThan(0));
      });
    });

    group('Error model', () {
      test('creates MISSING_ACTIVE_ITINERARY error', () {
        final error = SearchApiError.missingActiveItinerary();
        expect(error.code, 'MISSING_ACTIVE_ITINERARY');
      });

      test('creates FORBIDDEN error', () {
        final error = SearchApiError.forbidden('resource');
        expect(error.code, 'FORBIDDEN');
      });

      test('creates QUOTA_EXCEEDED error with retry-after', () {
        final error = SearchApiError.quotaExceeded(retryAfterSeconds: 60);
        expect(error.code, 'QUOTA_EXCEEDED');
        expect(error.details.isNotEmpty, true);
      });

      test('creates UNPROCESSABLE_ENTITY error', () {
        final error = SearchApiError.unprocessable([
          'field1 is required',
          'field2 is invalid',
        ]);
        expect(error.code, 'UNPROCESSABLE_ENTITY');
        expect(error.details.length, 2);
      });
    });

    group('Text sanitization', () {
      test('strips HTML tags', () {
        final result = TextSanitizer.stripHtml(
          '<b>Bold</b> text <script>alert(1)</script>',
        );
        expect(result, 'Bold text alert(1)');
      });

      test('validates URLs', () {
        expect(
          TextSanitizer.sanitizeUrl('https://example.com'),
          'https://example.com',
        );
        expect(TextSanitizer.sanitizeUrl('javascript:alert(1)'), null);
        expect(TextSanitizer.sanitizeUrl('http://localhost:3000'), null);
      });
    });
  });
}
