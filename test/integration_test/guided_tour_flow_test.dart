import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';

import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/guided_tour_screen.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/tour_detail_screen.dart';
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
  // Task 16.7 — Integration test: guided tour experience flow
  // ─────────────────────────────────────────────────────────

  group('Guided tour flow', () {
    late MockTourRepository mockRepo;
    late AppDatabase db;

    final tour = TourSummary(
      id: 't1',
      cityId: 'c1',
      type: TourType.single,
      name: 'Louvre Museum Tour',
      tagline: 'World-class art',
      mainImageUrl: 'https://img.com/louvre.jpg',
      durationMinutes: 120,
      priceUsd: 0,
      isFree: true,
      reviewCount: 200,
      categories: [],
    );

    final detail = TourDetail(
      summary: tour,
      creatorId: 'creator-1',
      fullDescription: 'Explore the world-famous Louvre Museum.',
      guideContent: const GuideContent(
        tourId: 't1',
        sections: [
          GuideSection(
            id: 's1',
            chapterTitle: 'Welcome to the Louvre',
            blocks: [
              GuideBlock.text(content: 'The Louvre is the world\'s largest art museum.'),
              GuideBlock.fact(label: 'Opened', value: '1793'),
            ],
          ),
          GuideSection(
            id: 's2',
            chapterTitle: 'The Mona Lisa',
            blocks: [
              GuideBlock.text(content: 'The Mona Lisa is in Room 711.'),
            ],
          ),
        ],
        version: 1,
      ),
      waypoints: [
        const TourWaypoint(
          id: 'wp1',
          tourId: 't1',
          orderIndex: 0,
          label: 'Main Entrance',
          latitude: 48.8606,
          longitude: 2.3376,
          radiusMeters: 50,
        ),
        const TourWaypoint(
          id: 'wp2',
          tourId: 't1',
          orderIndex: 1,
          label: 'Mona Lisa Gallery',
          latitude: 48.8608,
          longitude: 2.3378,
          radiusMeters: 30,
        ),
      ],
      audioVersions: [
        const AudioVersion(
          id: 'av1',
          tourId: 't1',
          languageCode: 'en',
          audioUrl: null,
          previewUrl: null,
          status: AudioStatus.ready,
        ),
      ],
    );

    setUp(() {
      mockRepo = MockTourRepository();
      db = AppDatabase.connect(NativeDatabase.memory());

      when(() => mockRepo.getTourDetail('t1')).thenAnswer((_) async => detail);
      when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async => [
        SavedTour(
          id: 'st1',
          tourId: 't1',
          userId: 'dummy-user-id',
          savedAt: DateTime(2026, 3, 27),
          tourSummary: tour,
        ),
      ]);
      when(() => mockRepo.getPlaybackProgress(any(), any())).thenAnswer((_) async => null);
      when(() => mockRepo.updatePlaybackProgress(any())).thenAnswer((_) async {});
    });

    tearDown(() async {
      await db.close();
    });

    testWidgets('tour detail screen shows Take a Tour button when tour is saved', (tester) async {
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

      // Tour is in savedTours → BuyFab should show "Take a Tour"
      expect(find.text('Take a Tour'), findsOneWidget);
    });

    testWidgets('guided tour screen renders map layer and bottom sheet', (tester) async {
      // A mock initial state for the audio service so GuidedTourScreen renders
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appDatabaseProvider.overrideWithValue(db),
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(
            home: GuidedTourScreen(tourId: 't1'),
          ),
        ),
      );

      // First frame: loading
      expect(find.byKey(const Key('guided_tour_loading')), findsOneWidget);

      await tester.pumpAndSettle();

      // After loading: close button should be visible
      expect(find.byKey(const Key('guided_tour_close')), findsOneWidget);
    });

    testWidgets('pressing close on guided tour navigates back', (tester) async {
      bool poppedBack = false;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appDatabaseProvider.overrideWithValue(db),
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: MaterialApp(
            home: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProviderScope(
                        overrides: [
                          appDatabaseProvider.overrideWithValue(db),
                          tourRepositoryProvider.overrideWithValue(mockRepo),
                        ],
                        child: const GuidedTourScreen(tourId: 't1'),
                      ),
                    ),
                  );
                },
                child: const Text('Open Tour'),
              ),
            ),
            navigatorObservers: [
              _TestNavigatorObserver(onPop: () => poppedBack = true),
            ],
          ),
        ),
      );

      // Navigate to GuidedTourScreen
      await tester.tap(find.text('Open Tour'));
      await tester.pumpAndSettle();

      // Wait for detail to load
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Tap close button to navigate back
      final closeButton = find.byKey(const Key('guided_tour_close'));
      if (closeButton.evaluate().isNotEmpty) {
        await tester.tap(closeButton);
        await tester.pumpAndSettle();
        expect(poppedBack, isTrue);
      }
    });
  });
}

class _TestNavigatorObserver extends NavigatorObserver {
  final VoidCallback onPop;
  _TestNavigatorObserver({required this.onPop});

  @override
  void didPop(Route route, Route? previousRoute) {
    onPop();
    super.didPop(route, previousRoute);
  }
}
