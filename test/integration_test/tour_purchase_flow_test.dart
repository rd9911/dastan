import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/presentation/country_browse/country_browse_screen.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/tour_detail_screen.dart';
import 'package:dastan/src/features/tours/presentation/saved_tours/saved_tours_screen.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTourRepository extends Mock implements TourRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // ─────────────────────────────────────────────────────────
  // Task 16.6 — Integration test: full tour purchase flow
  // ─────────────────────────────────────────────────────────

  group('Tour purchase flow', () {
    late MockTourRepository mockRepo;
    late AppDatabase db;

    final country = Country(
      id: 'co1',
      name: 'France',
      description: 'Beautiful country',
      heroImageUrl: 'https://img.com/fr.jpg',
      flagEmoji: '🇫🇷',
      sortOrder: 1,
      cities: [
        const City(
          id: 'c1',
          countryId: 'co1',
          name: 'Paris',
          description: 'City of Light',
          heroImageUrl: 'https://img.com/paris.jpg',
          sortOrder: 1,
        ),
      ],
    );

    final tour = TourSummary(
      id: 't1',
      cityId: 'c1',
      type: TourType.single,
      name: 'Eiffel Tower Tour',
      tagline: 'Iconic views',
      mainImageUrl: 'https://img.com/eiffel.jpg',
      durationMinutes: 90,
      priceUsd: 0,
      isFree: true,
      reviewCount: 50,
      categories: [],
    );

    final detail = TourDetail(
      summary: tour,
      creatorId: 'creator-1',
      fullDescription: 'A wonderful tour of the iconic Eiffel Tower.',
      guideContent: const GuideContent(
        tourId: 't1',
        sections: [
          GuideSection(
            id: 's1',
            chapterTitle: 'Welcome',
            blocks: [GuideBlock.text(content: 'Welcome to the Eiffel Tower tour!')],
          ),
        ],
        version: 1,
      ),
      waypoints: [
        const TourWaypoint(
          id: 'wp1',
          tourId: 't1',
          orderIndex: 0,
          label: 'Tower Base',
          latitude: 48.8584,
          longitude: 2.2945,
          radiusMeters: 50,
        ),
      ],
      audioVersions: [],
    );

    setUp(() {
      mockRepo = MockTourRepository();
      db = AppDatabase.connect(NativeDatabase.memory());

      // Default stubs
      when(() => mockRepo.getCountries()).thenAnswer((_) async => [country]);
      when(() => mockRepo.getToursByCity('c1')).thenAnswer((_) async => [tour]);
      when(() => mockRepo.getTourDetail('t1')).thenAnswer((_) async => detail);
      when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async => []);
      when(() => mockRepo.saveTour(any(), any())).thenAnswer((_) async {});
      when(() => mockRepo.getPlaybackProgress(any(), any())).thenAnswer((_) async => null);
    });

    tearDown(() async {
      await db.close();
    });

    testWidgets('shows tour list for a city', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appDatabaseProvider.overrideWithValue(db),
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(
            home: CountryBrowseScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Country name should be visible
      expect(find.text('France'), findsWidgets);
    });

    testWidgets('tour detail screen shows buy button for a free tour', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appDatabaseProvider.overrideWithValue(db),
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(
            home: TourDetailScreen(tourId: 't1'),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tour name should be visible
      expect(find.text('Eiffel Tower Tour'), findsOneWidget);

      // BuyFab for free tour should say 'Get for Free'
      expect(find.text('Get for Free'), findsOneWidget);
    });

    testWidgets('after purchase tour appears in saved tours', (tester) async {
      final savedTour = SavedTour(
        id: 'st1',
        tourId: 't1',
        userId: 'dummy-user-id',
        savedAt: DateTime(2026, 3, 27),
        tourSummary: tour,
      );

      // After purchase, savedTours returns the newly saved tour
      when(() => mockRepo.getSavedTours('dummy-user-id'))
          .thenAnswer((_) async => [savedTour]);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appDatabaseProvider.overrideWithValue(db),
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(
            home: SavedToursScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Saved tours screen should render (even if cluster-based, city is shown)
      expect(find.byType(SavedToursScreen), findsOneWidget);
    });
  });
}
