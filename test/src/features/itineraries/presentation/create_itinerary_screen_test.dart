import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/itineraries/application/itinerary_service.dart';
import 'package:dastan/src/features/itineraries/presentation/active_itinerary_controller.dart';
import 'package:dastan/src/features/itineraries/presentation/create_itinerary_screen.dart';
import 'package:dastan/src/core/data/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockItineraryService extends Mock implements ItineraryService {}

class FakeItinerary extends Fake implements Itinerary {
  @override
  String get id => '1';
}

void main() {
  late MockItineraryService service;

  setUpAll(() {
    registerFallbackValue(FakeItinerary());
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    service = MockItineraryService();
  });

  testWidgets('validates title field', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: CreateItineraryScreen())),
    );

    await tester.tap(find.text('Create'));
    await tester.pump();

    expect(find.text('Please enter a title'), findsOneWidget);
  });

  testWidgets('calls createItinerary on valid submission', (tester) async {
    when(
      () => service.createItinerary(
        title: any(named: 'title'),
        destination: any(named: 'destination'),
      ),
    ).thenAnswer((_) async => FakeItinerary());

    final router = GoRouter(
      initialLocation: '/create',
      routes: [
        GoRoute(
          path: '/create',
          builder: (context, state) => const CreateItineraryScreen(),
        ),
        GoRoute(
          path: '/itinerary/:id',
          builder:
              (context, state) =>
                  const Scaffold(body: Text('Itinerary Details')),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          itineraryServiceProvider.overrideWithValue(service),
          activeItineraryControllerProvider.overrideWith(
            () => ActiveItineraryController(),
          ),
          sharedPreferencesProvider.overrideWith(
            (ref) => SharedPreferences.getInstance(),
          ),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );

    await tester.enterText(find.byType(TextFormField).first, 'My Trip');
    await tester.enterText(find.byType(TextFormField).last, 'London');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    verify(
      () => service.createItinerary(title: 'My Trip', destination: 'London'),
    ).called(1);
    expect(find.text('Itinerary Details'), findsOneWidget);
  });
}
