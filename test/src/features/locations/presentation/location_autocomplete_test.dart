import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dastan/src/features/locations/data/location_repository.dart';
import 'package:dastan/src/features/locations/domain/location.dart';
import 'package:dastan/src/features/locations/presentation/location_autocomplete.dart';

class MockLocationRepository extends Mock implements LocationRepository {}

void main() {
  late MockLocationRepository mockRepository;

  setUp(() {
    mockRepository = MockLocationRepository();
  });

  testWidgets('LocationAutocomplete finds and selects a location', (
    tester,
  ) async {
    const mockLocation = Location(
      id: 'R123',
      name: 'Test City',
      country: 'Test Country',
      lat: 51.5074,
      lng: -0.1278,
    );

    when(
      () => mockRepository.searchLocations(any()),
    ).thenAnswer((_) async => [mockLocation]);

    Location? selectedLocation;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          locationRepositoryProvider.overrideWithValue(mockRepository),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: LocationAutocomplete(
              label: 'Origin',
              onSelected: (location) {
                selectedLocation = location;
              },
            ),
          ),
        ),
      ),
    );

    // Verify initial state
    expect(find.text('Origin'), findsOneWidget);

    // Enter text (at least 3 chars to trigger search)
    await tester.enterText(find.byType(TextFormField), 'Test');
    await tester.pump(const Duration(milliseconds: 600)); // Debounce
    await tester.pumpAndSettle();

    // Verify suggestions appear
    expect(find.text('Test City'), findsOneWidget);

    // Select the option
    await tester.tap(find.text('Test City'));
    await tester.pumpAndSettle();

    // Verify selection call
    expect(selectedLocation, equals(mockLocation));
  });
}
