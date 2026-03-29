import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dastan/src/features/accommodation/data/accommodation_search_service.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_result.dart';
import 'package:dastan/src/features/accommodation/presentation/accommodation_search_screen.dart';
import 'package:dastan/src/features/locations/data/location_repository.dart';
import 'package:dastan/src/features/locations/data/photon_data_source.dart';

// Mock the Service
class MockAccommodationSearchService extends Mock
    implements AccommodationSearchService {}

class MockLocationService extends Mock implements LocationRepository {}

void main() {
  late MockAccommodationSearchService mockService;
  late MockLocationService mockLocationService;

  setUp(() {
    mockService = MockAccommodationSearchService();
    mockLocationService = MockLocationService();

    // Stub
    registerFallbackValue(AccommodationType.hotel);
    registerFallbackValue(LocationSearchType.citiesOnly);
    when(
      () => mockService.search(
        location: any(named: 'location'),
        checkIn: any(named: 'checkIn'),
        checkOut: any(named: 'checkOut'),
        type: any(named: 'type'),
        travelerAges: any(named: 'travelerAges'),
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
          accommodationSearchServiceProvider.overrideWithValue(mockService),
          locationRepositoryProvider.overrideWithValue(mockLocationService),
        ],
        child: const MaterialApp(home: AccommodationSearchScreen()),
      ),
    );
  }

  testWidgets('Accommodation Search Screen UI elements check', (tester) async {
    await pumpScreen(tester);
    await tester.pumpAndSettle();

    // Check for tabs
    expect(find.text('Single Trip'), findsOneWidget);
    expect(find.text('Multi-City'), findsOneWidget);

    // Check for form fields in Single Trip tab
    expect(find.text('Destination *'), findsOneWidget);
    expect(find.text('Type'), findsOneWidget);

    // Check for Search button
    expect(find.text('Search'), findsOneWidget);

    // Check for CustomScrollView and SliverAppBar
    expect(find.byType(CustomScrollView), findsWidgets);
    expect(find.byType(SliverAppBar), findsOneWidget);
  });
}
