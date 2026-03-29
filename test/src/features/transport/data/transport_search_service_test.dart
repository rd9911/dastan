import 'package:dastan/src/features/transport/data/transport_search_service.dart';
import 'package:dastan/src/features/transport/domain/transport_result.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/data/provider_adapter.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late TransportSearchService service;
  late SearchOrchestrator orchestrator;

  setUp(() {
    // Create a registry with mock transport provider
    final registry = ProviderRegistry();
    registry.register(
      MockProviderAdapter(
        config: const ProviderConfig(
          name: 'mock_transport',
          vertical: SearchVertical.transport,
        ),
        fixtures: List.generate(
          10,
          (i) => SearchResultItem(
            id: 'transport_$i',
            dedupeKey: 'transport:jfk|lax|2024-01-15|AA|$i',
            vertical: SearchVertical.transport,
            title: 'Flight ${100 + i}',
            subtitle: 'New York → London',
            price: 300.0 + (i * 50),
            priceCurrency: 'USD',
            rating: 4.0,
            provenance: ['mock_transport'],
            details: {
              'origin': 'New York',
              'destination': 'London',
              'departAt': DateTime.now()
                  .add(Duration(hours: i + 6))
                  .toIso8601String(),
              'arriveAt': DateTime.now()
                  .add(Duration(hours: i + 14))
                  .toIso8601String(),
              'durationMinutes': 480,
              'vendor': ['United', 'Delta', 'American'][i % 3],
              'originCode': 'JFK',
              'destCode': 'LHR',
            },
          ),
        ),
      ),
    );

    orchestrator = SearchOrchestrator(
      registry: registry,
      cache: SearchCache(),
      ranker: SearchRanker(),
    );
    service = TransportSearchService(orchestrator);
  });

  test('search supports round trip and return date', () async {
    final results = await service.search(
      origin: 'New York',
      destination: 'London',
      departDate: DateTime.now(),
      mode: TransportMode.flight,
      isRoundTrip: true,
      returnDate: DateTime.now().add(const Duration(days: 5)),
    );

    // Service returns results from the SearchOrchestrator
    expect(results, isA<List<TransportResult>>());
    expect(results, isNotEmpty);
  });

  test('search supports travelers and age', () async {
    final results = await service.search(
      origin: 'New York',
      destination: 'London',
      departDate: DateTime.now(),
      mode: TransportMode.flight,
      travelerAges: [25, 30],
    );

    expect(results, isA<List<TransportResult>>());
    expect(results, isNotEmpty);
  });

  test(
    'search converts SearchResultItem to TransportResult correctly',
    () async {
      final results = await service.search(
        origin: 'New York',
        destination: 'London',
        departDate: DateTime.now(),
        mode: TransportMode.flight,
      );

      expect(results.first.mode, TransportMode.flight);
      expect(results.first.origin, 'New York');
      expect(results.first.destination, 'London');
      expect(results.first.priceAmount, greaterThan(0));
    },
  );
}
