import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/presentation/saved_tours/saved_tours_screen.dart';

class MockTourRepository extends Mock implements TourRepository {}

void main() {
  group('SavedToursScreen', () {
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
          child: const MaterialApp(home: SavedToursScreen()),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('shows empty state when no saved tours', (tester) async {
       when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async => []);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: SavedToursScreen()),
        ),
      );
      await tester.pump();
      await tester.pump(); // flush microtasks

      expect(find.text('No saved tours yet'), findsOneWidget);
    });

    testWidgets('shows clusters when tours are saved', (tester) async {
      final tourSummary = TourSummary(
        id: 't1', cityId: 'Paris_City_ID', type: TourType.single, name: 'Eiffel Tower',
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
          child: const MaterialApp(home: SavedToursScreen()),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.text('Paris_City_ID'), findsOneWidget);
      expect(find.text('1 tour saved'), findsOneWidget);
    });
  });
}
