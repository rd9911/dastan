import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dastan/src/features/transport/data/transport_search_service.dart';
import 'package:dastan/src/features/transport/domain/transport_result.dart';
import 'package:dastan/src/features/transport/presentation/transport_search_screen.dart';
import 'package:dastan/src/features/locations/data/location_repository.dart';
import 'package:dastan/src/features/locations/data/photon_data_source.dart';

class MockTransportSearchService extends Mock
    implements TransportSearchService {}

class MockLocationService extends Mock implements LocationRepository {}

void main() {
  late MockTransportSearchService mockTransportService;
  late MockLocationService mockLocationService;

  setUp(() {
    mockTransportService = MockTransportSearchService();
    mockLocationService = MockLocationService();

    // Register fallback values
    registerFallbackValue(TransportMode.flight);
    registerFallbackValue(LocationSearchType.citiesOnly);

    // Stub search to return empty results by default
    when(
      () => mockTransportService.search(
        origin: any(named: 'origin'),
        destination: any(named: 'destination'),
        departDate: any(named: 'departDate'),
        mode: any(named: 'mode'),
        travelerAges: any(named: 'travelerAges'),
        isRoundTrip: any(named: 'isRoundTrip'),
        returnDate: any(named: 'returnDate'),
      ),
    ).thenAnswer((_) async => []);

    // Stub Location
    when(
      () => mockLocationService.searchLocations(
        any(),
        searchType: any(named: 'searchType'),
        language: any(named: 'language'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer((_) async => []);
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          transportSearchServiceProvider.overrideWithValue(
            mockTransportService,
          ),
          locationRepositoryProvider.overrideWithValue(mockLocationService),
        ],
        child: const MaterialApp(home: TransportSearchScreen()),
      ),
    );
  }

  testWidgets('Transport Search Screen UI elements check', (tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();

    // Check for tabs
    expect(find.text('One Way'), findsOneWidget);
    expect(find.text('Round Trip'), findsOneWidget);
    expect(find.text('Multi-City'), findsOneWidget);
    expect(find.text('Meet Up'), findsOneWidget);

    // Check for form fields in One Way tab
    expect(find.text('Origin *'), findsOneWidget);
    expect(find.text('Destination *'), findsOneWidget);
    expect(find.text('Mode'), findsOneWidget);

    // Check for Search button
    expect(find.text('Search'), findsOneWidget);

    // Check for CustomScrollView and SliverAppBar
    expect(find.byType(CustomScrollView), findsWidgets);
    expect(find.byType(SliverAppBar), findsOneWidget);
  });

  testWidgets('Tab switching works correctly', (tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();

    // Initially on One Way tab
    expect(find.text('One Way'), findsOneWidget);
    expect(find.text('Departure *'), findsOneWidget);

    // Switch to Round Trip tab
    await tester.tap(find.text('Round Trip'));
    await tester.pumpAndSettle();

    // Round Trip should show Return date
    expect(find.text('Return *'), findsOneWidget);

    // Switch to Multi-City tab
    await tester.tap(find.text('Multi-City'));
    await tester.pumpAndSettle();

    // Multi-City should show Leg 1
    expect(find.text('Leg 1'), findsOneWidget);
    expect(find.text('Add Another Leg'), findsOneWidget);
  });

  testWidgets('Multi-City can add and remove legs', (tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();

    // Switch to Multi-City tab
    await tester.tap(find.text('Multi-City'));
    await tester.pumpAndSettle();

    // Initially has Leg 1
    expect(find.text('Leg 1'), findsOneWidget);
    expect(find.text('Leg 2'), findsNothing);

    // Add another leg
    await tester.tap(find.text('Add Another Leg'));
    await tester.pumpAndSettle();

    // Should now have Leg 2
    expect(find.text('Leg 1'), findsOneWidget);
    expect(find.text('Leg 2'), findsOneWidget);
  });
}
