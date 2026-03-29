import 'package:dastan/src/features/accommodation/application/accommodation_search_controller.dart';
import 'package:dastan/src/features/accommodation/data/accommodation_search_service.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

class MockAccommodationSearchService extends Mock
    implements AccommodationSearchService {}

void main() {
  late MockAccommodationSearchService service;
  late ProviderContainer container;

  setUpAll(() {
    registerFallbackValue(DateTime.now());
    registerFallbackValue(AccommodationType.hotel);
  });

  setUp(() {
    service = MockAccommodationSearchService();
    container = ProviderContainer(
      overrides: [
        accommodationSearchServiceProvider.overrideWithValue(service),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is empty list', () {
    final state = container.read(accommodationSearchControllerProvider);
    expect(state.value, []);
  });

  test('search populates results', () async {
    final mockResults = [
      AccommodationResult(
        id: '1',
        providerId: 'mock',
        externalId: 'ext-1',
        type: AccommodationType.hotel,
        name: 'Test Hotel',
        location: 'Paris',
        checkIn: DateTime(2024, 1, 1),
        checkOut: DateTime(2024, 1, 3),
        pricePerNight: 150.0,
        currency: 'USD',
      ),
    ];

    when(
      () => service.search(
        location: any(named: 'location'),
        checkIn: any(named: 'checkIn'),
        checkOut: any(named: 'checkOut'),
        type: any(named: 'type'),
      ),
    ).thenAnswer((_) async => mockResults);

    await container
        .read(accommodationSearchControllerProvider.notifier)
        .search(
          location: 'Paris',
          checkIn: DateTime(2024, 1, 1),
          checkOut: DateTime(2024, 1, 3),
        );

    final state = container.read(accommodationSearchControllerProvider);
    expect(state.value, mockResults);
  });
}
