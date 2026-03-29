import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/itineraries/application/itinerary_service.dart';
import 'package:dastan/src/features/itineraries/presentation/active_itinerary_controller.dart';
import 'package:dastan/src/features/itineraries/presentation/itinerary_hub_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockItineraryService extends Mock implements ItineraryService {}

void main() {
  late MockItineraryService service;

  setUp(() {
    service = MockItineraryService();
  });

  testWidgets('shows empty state when no itineraries', (tester) async {
    when(
      () => service.watchAllItineraries(),
    ).thenAnswer((_) => Stream.value([]));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [itineraryServiceProvider.overrideWithValue(service)],
        child: const MaterialApp(home: ItineraryHubScreen()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('No itineraries yet.'), findsOneWidget);
    expect(find.text('Create Itinerary'), findsOneWidget);
  });

  testWidgets('shows list of itineraries', (tester) async {
    final itinerary = Itinerary(
      id: '1',
      title: 'Trip to Paris',
      destination: 'Paris',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    when(
      () => service.watchAllItineraries(),
    ).thenAnswer((_) => Stream.value([itinerary]));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          itineraryServiceProvider.overrideWithValue(service),
          activeItineraryControllerProvider.overrideWith(
            () => ActiveItineraryController(),
          ),
        ],
        child: const MaterialApp(home: ItineraryHubScreen()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Trip to Paris'), findsOneWidget);
    expect(find.text('Paris'), findsOneWidget);
  });
}
