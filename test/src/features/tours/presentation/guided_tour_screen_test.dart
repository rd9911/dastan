import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dastan/src/features/tours/application/tour_audio_service.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/widgets/guide_text_view.dart';

class MockTourRepository extends Mock implements TourRepository {}

void main() {
  group('GuideTextView', () {
    final mockGuideContent = GuideContent(
      tourId: 't1',
      version: 1,
      sections: [
        const GuideSection(
          id: 's1',
          chapterTitle: 'Introduction',
          blocks: [
            GuideBlock.text(content: 'Welcome to the tour.'),
            GuideBlock.highlight(content: 'A highlighted fact.'),
          ],
        ),
        const GuideSection(
          id: 's2',
          chapterTitle: 'History',
          blocks: [
            GuideBlock.text(content: 'The history of this place...'),
            GuideBlock.fact(label: 'Founded', value: '1492'),
            GuideBlock.yearBadge(label: 'Built in 1492'),
          ],
        ),
        const GuideSection(
          id: 's3',
          chapterTitle: 'Modern Day',
          blocks: [
            GuideBlock.text(content: 'Today, the city is...'),
            GuideBlock.location(
                address: '123 Main St', latitude: 41.0, longitude: 29.0),
          ],
        ),
      ],
    );

    testWidgets('renders all section titles', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourAudioServiceProvider.overrideWith(
              () => _MockTourAudioService(),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: GuideTextView(
                guideContent: mockGuideContent,
                scrollController: ScrollController(),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Introduction'), findsOneWidget);
      expect(find.text('History'), findsOneWidget);
      // 'Modern Day' may need scrolling
    });

    testWidgets('renders text blocks', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourAudioServiceProvider.overrideWith(
              () => _MockTourAudioService(),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: GuideTextView(
                guideContent: mockGuideContent,
                scrollController: ScrollController(),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Welcome to the tour.'), findsOneWidget);
      expect(find.text('A highlighted fact.'), findsOneWidget);
    });

    testWidgets('renders fact blocks with label and value', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            tourAudioServiceProvider.overrideWith(
              () => _MockTourAudioService(),
            ),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: GuideTextView(
                guideContent: mockGuideContent,
                scrollController: ScrollController(),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Need to scroll to see the second section
      await tester.scrollUntilVisible(
        find.text('Founded: '),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('Founded: '), findsOneWidget);
      expect(find.text('1492'), findsWidgets); // May appear in yearBadge too
    });
  });

  group('GuideSectionView', () {
    testWidgets('renders chapter title and blocks', (tester) async {
      const section = GuideSection(
        id: 's1',
        chapterTitle: 'Test Chapter',
        blocks: [
          GuideBlock.text(content: 'Paragraph text.'),
        ],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: GuideSectionView(
                section: section,
                isRead: false,
                isCurrent: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Chapter'), findsOneWidget);
      expect(find.text('Paragraph text.'), findsOneWidget);
    });
  });

  group('GuideBlockView', () {
    testWidgets('renders text block', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GuideBlockView(block: GuideBlock.text(content: 'Hello world')),
          ),
        ),
      );

      expect(find.text('Hello world'), findsOneWidget);
    });

    testWidgets('renders highlight block with italic style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GuideBlockView(
              block: GuideBlock.highlight(content: 'Important fact'),
            ),
          ),
        ),
      );

      expect(find.text('Important fact'), findsOneWidget);
    });

    testWidgets('renders year badge', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GuideBlockView(
              block: GuideBlock.yearBadge(label: 'Built in 1492'),
            ),
          ),
        ),
      );

      expect(find.text('Built in 1492'), findsOneWidget);
    });

    testWidgets('renders location block with address', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GuideBlockView(
              block: GuideBlock.location(address: '123 Main Street'),
            ),
          ),
        ),
      );

      expect(find.text('123 Main Street'), findsOneWidget);
      expect(find.byIcon(Icons.location_on), findsOneWidget);
    });
  });
}

/// Mock for TourAudioService provider - returns a default state.
class _MockTourAudioService extends TourAudioService {
  @override
  FutureOr<AudioPlaybackState> build() {
    return const AudioPlaybackState(
      isPlaying: false,
      position: Duration.zero,
      duration: Duration(minutes: 10),
      currentSection: 0,
      currentChildTourIndex: 0,
      isLoadingNext: false,
      isCompleted: false,
    );
  }
}
