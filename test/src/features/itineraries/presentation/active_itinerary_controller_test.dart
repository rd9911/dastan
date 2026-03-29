import 'package:dastan/src/core/data/shared_preferences_provider.dart';
import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/itineraries/data/itinerary_repository.dart';
import 'package:dastan/src/features/itineraries/presentation/active_itinerary_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockItineraryRepository extends Mock implements ItineraryRepository {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late ProviderContainer container;
  late MockItineraryRepository repository;
  late MockSharedPreferences sharedPreferences;

  setUp(() {
    repository = MockItineraryRepository();
    sharedPreferences = MockSharedPreferences();

    // Default: no active itinerary in prefs
    when(() => sharedPreferences.getString(any())).thenReturn(null);

    // Default: setString/remove returns void (Future<bool>)
    when(
      () => sharedPreferences.setString(any(), any()),
    ).thenAnswer((_) async => true);
    when(() => sharedPreferences.remove(any())).thenAnswer((_) async => true);

    container = ProviderContainer(
      overrides: [
        itineraryRepositoryProvider.overrideWithValue(repository),
        sharedPreferencesProvider.overrideWith((ref) => sharedPreferences),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is null when no pref', () async {
    final state = await container.read(
      activeItineraryControllerProvider.future,
    );
    expect(state, isNull);
  });

  test('initial state loads from prefs', () async {
    when(
      () => sharedPreferences.getString('active_itinerary_id'),
    ).thenReturn('1');
    final itinerary = Itinerary(
      id: '1',
      title: 'Test',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    when(() => repository.getItinerary('1')).thenAnswer((_) async => itinerary);

    final state = await container.read(
      activeItineraryControllerProvider.future,
    );
    expect(state, itinerary);
  });

  test('setActiveItinerary updates state and prefs', () async {
    final itinerary = Itinerary(
      id: '1',
      title: 'Test',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await container
        .read(activeItineraryControllerProvider.notifier)
        .setActiveItinerary(itinerary);

    final state = await container.read(
      activeItineraryControllerProvider.future,
    );
    expect(state, itinerary);
    verify(
      () => sharedPreferences.setString('active_itinerary_id', '1'),
    ).called(1);
  });

  test('setActiveItinerary(null) clears state and prefs', () async {
    await container
        .read(activeItineraryControllerProvider.notifier)
        .setActiveItinerary(null);

    final state = await container.read(
      activeItineraryControllerProvider.future,
    );
    expect(state, isNull);
    verify(() => sharedPreferences.remove('active_itinerary_id')).called(1);
  });
}
