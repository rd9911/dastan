import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/itineraries/data/itinerary_repository.dart';
import 'package:dastan/src/features/itineraries/presentation/active_itinerary_controller.dart';
import 'package:dastan/src/features/itineraries/presentation/itinerary_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/core/application/save_item_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockItineraryRepository extends Mock implements ItineraryRepository {}

class MockActiveItineraryController extends ActiveItineraryController {
  final Itinerary? initialItinerary;
  MockActiveItineraryController(this.initialItinerary);

  @override
  Future<Itinerary?> build() async {
    return initialItinerary;
  }
}

void main() {
  late MockItineraryRepository mockRepository;

  setUp(() {
    mockRepository = MockItineraryRepository();
  });

  final itinerary = Itinerary(
    id: '1',
    title: 'Paris Trip',
    destination: 'Paris',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  testWidgets('shows edit and delete options in app bar', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          activeItineraryControllerProvider.overrideWith(
            () => MockActiveItineraryController(itinerary),
          ),
          itineraryRepositoryProvider.overrideWithValue(mockRepository),
          savedItemsProvider.overrideWith((ref) => Stream.value([])),
        ],
        child: const MaterialApp(home: ItineraryOverviewScreen()),
      ),
    );
    await tester.pumpAndSettle();

    // Open popup menu
    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    expect(find.text('Edit'), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget);
  });

  testWidgets('delete flow shows confirmation and calls repository', (
    tester,
  ) async {
    when(() => mockRepository.deleteItinerary(any())).thenAnswer((_) async {});

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          activeItineraryControllerProvider.overrideWith(
            () => MockActiveItineraryController(itinerary),
          ),
          itineraryRepositoryProvider.overrideWithValue(mockRepository),
          savedItemsProvider.overrideWith((ref) => Stream.value([])),
        ],
        child: const MaterialApp(home: ItineraryOverviewScreen()),
      ),
    );
    await tester.pumpAndSettle();

    // Open popup menu
    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle();

    // Tap Delete (from menu)
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    // Verify confirmation dialog
    expect(find.text('Delete Itinerary?'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Delete'), findsOneWidget); // The button in dialog

    // Tap Confirm Delete (in dialog)
    await tester.tap(find.text('Delete').last);
    await tester.pumpAndSettle();

    // Verify repository call
    verify(() => mockRepository.deleteItinerary('1')).called(1);
  });
}
