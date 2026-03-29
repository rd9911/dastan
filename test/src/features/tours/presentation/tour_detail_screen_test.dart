import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/tour_detail_screen.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/widgets/buy_fab.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/widgets/audio_preview_button.dart';

class MockTourRepository extends Mock implements TourRepository {}

void main() {
  group('TourDetailScreen', () {
    late MockTourRepository mockRepo;

    final mockSummary = TourSummary(
      id: 't1',
      cityId: 'c1',
      type: TourType.single,
      name: 'Eiffel Tower Audio Guide',
      tagline: 'See the iconic tower',
      mainImageUrl: 'img.jpg',
      durationMinutes: 120,
      priceUsd: 9.99,
      isFree: false,
      averageRating: 4.8,
      reviewCount: 150,
      categories: [const TourCategory(id: 'cat1', name: 'landmarks')],
    );

    final mockDetail = TourDetail(
      summary: mockSummary,
      creatorId: 'user1',
      creatorName: 'Dastan Guides',
      fullDescription: 'An amazing view of Paris.',
      guideContent: const GuideContent(
        tourId: 't1',
        version: 1,
        sections: [
          GuideSection(
            id: 's1',
            chapterTitle: 'Introduction',
            blocks: [GuideBlock.text(content: 'Welcome to Eiffel Tower.')],
          )
        ],
      ),
      waypoints: [
        const TourWaypoint(id: 'wp1', tourId: 't1', orderIndex: 0, latitude: 0, longitude: 0, radiusMeters: 50, label: 'Arc de Triomphe'),
      ],
      audioVersions: [
        const AudioVersion(id: 'a1', tourId: 't1', languageCode: 'en', previewUrl: 'audio.mp3', status: AudioStatus.ready),
      ],
    );

    setUp(() {
      mockRepo = MockTourRepository();
    });

    testWidgets('shows loading state initially', (tester) async {
      final completer = Completer<TourDetail>();
      when(() => mockRepo.getTourDetail('t1')).thenAnswer((_) => completer.future);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: TourDetailScreen(tourId: 't1')),
        ),
      );

      // Expect a loading indicator
      expect(find.byKey(const Key('tour_detail_loading')), findsOneWidget);
    });

    testWidgets('shows tour detail data correctly', (tester) async {
      when(() => mockRepo.getTourDetail('t1')).thenAnswer((_) async => mockDetail);
      // We also mock saved tours to false
      when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async => []);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: TourDetailScreen(tourId: 't1')),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Eiffel Tower Audio Guide'), findsOneWidget);
      expect(find.text('See the iconic tower'), findsOneWidget);
      expect(find.text('An amazing view of Paris.'), findsOneWidget);

      // Meta row
      expect(find.text('4.8 (150)'), findsOneWidget);
      expect(find.text('120m'), findsOneWidget);
      expect(find.text('1 stops'), findsOneWidget);

      // Route
      expect(find.text('Route Highlights'), findsOneWidget);
      expect(find.text('Arc de Triomphe'), findsOneWidget);

      // Buttons
      expect(find.byType(BuyFab), findsOneWidget);
      expect(find.byType(AudioPreviewButton), findsOneWidget);
    });

    testWidgets('shows multi-tour included tours correctly', (tester) async {
      final multiMockSummary = mockSummary.copyWith(type: TourType.multi);
      final childTour = mockSummary.copyWith(id: 't2', name: 'Child Tour', tagline: 'A child tour');
      final multiTourDetail = mockDetail.copyWith(
        summary: multiMockSummary,
        childTours: [childTour],
      );

      when(() => mockRepo.getTourDetail('t1')).thenAnswer((_) async => multiTourDetail);
      when(() => mockRepo.getSavedTours(any())).thenAnswer((_) async => []);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourRepositoryProvider.overrideWithValue(mockRepo),
          ],
          child: const MaterialApp(home: TourDetailScreen(tourId: 't1')),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Included Single Tours'), findsOneWidget);
      expect(find.text('Child Tour'), findsOneWidget);
      expect(find.text('A child tour'), findsOneWidget);
    });
  });
}
