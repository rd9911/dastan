import 'package:dastan/src/features/accommodation/data/accommodation_search_service.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_result.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/data/provider_adapter.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AccommodationSearchService service;
  late SearchOrchestrator orchestrator;

  setUp(() {
    final registry = ProviderRegistry();
    registry.register(
      MockProviderAdapter(
        config: const ProviderConfig(
          name: 'mock_accommodation',
          vertical: SearchVertical.accommodation,
        ),
        fixtures: List.generate(
          10,
          (i) => SearchResultItem(
            id: 'accommodation_$i',
            dedupeKey: 'accommodation:hotel_$i',
            vertical: SearchVertical.accommodation,
            title: 'Hotel ${['Grand', 'Central', 'Sunset'][i % 3]} ${i + 1}',
            price: 100.0 + (i * 25),
            priceCurrency: 'USD',
            rating: 4.0 + (i % 2) * 0.5,
            provenance: ['mock_accommodation'],
            details: {'type': 'hotel', 'location': 'New York'},
          ),
        ),
      ),
    );

    orchestrator = SearchOrchestrator(
      registry: registry,
      cache: SearchCache(),
      ranker: SearchRanker(),
    );
    service = AccommodationSearchService(orchestrator);
  });

  test('search supports travelers and age', () async {
    final results = await service.search(
      location: 'New York',
      checkIn: DateTime.now(),
      checkOut: DateTime.now().add(const Duration(days: 3)),
      type: AccommodationType.hotel,
      travelerAges: [25, 30],
    );

    expect(results, isA<List<AccommodationResult>>());
    expect(results, isNotEmpty);
  });

  test(
    'search converts SearchResultItem to AccommodationResult correctly',
    () async {
      final results = await service.search(
        location: 'Paris',
        checkIn: DateTime.now(),
        checkOut: DateTime.now().add(const Duration(days: 2)),
      );

      expect(results.first.name, isNotEmpty);
      expect(results.first.pricePerNight, greaterThan(0));
    },
  );
}
