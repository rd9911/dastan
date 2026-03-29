import 'package:dastan/src/features/transport/application/transport_search_controller.dart';
import 'package:dastan/src/features/transport/data/transport_search_service.dart';
import 'package:dastan/src/features/transport/domain/transport_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

class MockTransportSearchService extends Mock
    implements TransportSearchService {}

void main() {
  late MockTransportSearchService service;
  late ProviderContainer container;

  setUpAll(() {
    registerFallbackValue(DateTime.now());
    registerFallbackValue(TransportMode.flight);
  });

  setUp(() {
    service = MockTransportSearchService();
    container = ProviderContainer(
      overrides: [transportSearchServiceProvider.overrideWithValue(service)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is empty list', () {
    final state = container.read(transportSearchControllerProvider(0));
    expect(state.value, []);
  });

  test('search populates results', () async {
    final mockResults = [
      TransportResult(
        id: '1',
        mode: TransportMode.flight,
        origin: 'NYC',
        destination: 'LAX',
        departAt: DateTime(2024, 1, 1, 10, 0),
        arriveAt: DateTime(2024, 1, 1, 13, 0),
        priceAmount: 299.0,
        currency: 'USD',
        durationMinutes: 180,
      ),
    ];

    when(
      () => service.search(
        origin: any(named: 'origin'),
        destination: any(named: 'destination'),
        departDate: any(named: 'departDate'),
        mode: any(named: 'mode'),
        travelerAges: any(named: 'travelerAges'),
        isRoundTrip: any(named: 'isRoundTrip'),
        returnDate: any(named: 'returnDate'),
      ),
    ).thenAnswer((_) async => mockResults);

    await container
        .read(transportSearchControllerProvider(0).notifier)
        .search(
          SimpleTransportSearchRequest(
            origin: 'NYC',
            destination: 'LAX',
            departDate: DateTime(2024, 1, 1),
            mode: TransportMode.flight,
          ),
        );

    final state = container.read(transportSearchControllerProvider(0));
    expect(state.value, mockResults);
  });

  test('clearResults resets to empty', () async {
    final mockResults = [
      TransportResult(
        id: '1',
        mode: TransportMode.flight,
        origin: 'NYC',
        destination: 'LAX',
        departAt: DateTime(2024, 1, 1, 10, 0),
        arriveAt: DateTime(2024, 1, 1, 13, 0),
        priceAmount: 299.0,
        currency: 'USD',
        durationMinutes: 180,
      ),
    ];

    when(
      () => service.search(
        origin: any(named: 'origin'),
        destination: any(named: 'destination'),
        departDate: any(named: 'departDate'),
        mode: any(named: 'mode'),
        travelerAges: any(named: 'travelerAges'),
        isRoundTrip: any(named: 'isRoundTrip'),
        returnDate: any(named: 'returnDate'),
      ),
    ).thenAnswer((_) async => mockResults);

    await container
        .read(transportSearchControllerProvider(0).notifier)
        .search(
          SimpleTransportSearchRequest(
            origin: 'NYC',
            destination: 'LAX',
            departDate: DateTime(2024, 1, 1),
            mode: TransportMode.flight,
          ),
        );

    container
        .read(transportSearchControllerProvider(0).notifier)
        .clearResults();

    final state = container.read(transportSearchControllerProvider(0));
    expect(state.value, []);
  });
}
