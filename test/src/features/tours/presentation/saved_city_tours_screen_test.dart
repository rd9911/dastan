import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/presentation/saved_tours/saved_city_tours_screen.dart';
import 'package:dastan/src/features/tours/presentation/city_tours/widgets/tour_list_card.dart';

class MockTourRepository extends Mock implements TourRepository {}

void main() {
  group('SavedCityToursScreen', () {
    late MockTourRepository mockRepo;

    setUp(() {
      mockRepo = MockTourRepository();
    });

    testWidgets('shows loading state initially', (tester) async {
      when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 1));
        return [];
      });

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: SavedCityToursScreen(cityId: 'Paris_City')),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('shows empty state if city cluster not found', (tester) async {
      when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async => []);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: SavedCityToursScreen(cityId: 'Paris_City')),
        ),
      );
      await tester.pump();
      await tester.pump(); // flush microtasks

      expect(find.text('No tours found for this city.'), findsOneWidget);
    });

    testWidgets('shows list of TourListCards for valid city', (tester) async {
      final tourSummary = TourSummary(
        id: 't1', cityId: 'Paris_City', type: TourType.single, name: 'Eiffel Tower', 
        tagline: 'See it', mainImageUrl: 'img', durationMinutes: 60, 
        priceUsd: 10, isFree: false, categories: [], reviewCount: 1,
      );
      final savedTour = SavedTour(id: 'st1', tourId: 't1', userId: 'user1', savedAt: DateTime(2023), tourSummary: tourSummary);

      when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async => [savedTour]);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: SavedCityToursScreen(cityId: 'Paris_City')),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.text('Paris_City'), findsOneWidget); // Appbar title
      expect(find.byType(TourListCard), findsOneWidget);
      expect(find.text('Eiffel Tower'), findsOneWidget);
    });
  });
}
