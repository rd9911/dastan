import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/tours/application/quill_guide_converter.dart';
import 'package:dastan/src/features/tours/application/word_importer.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

void main() {
  group('QuillGuideConverter', () {
    test('fromQuillDelta creates a section for plain text', () {
      final ops = [
        {'insert': 'Hello, this is a test.\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour1');

      expect(result.tourId, 'tour1');
      expect(result.sections.length, 1);
      expect(result.sections[0].chapterTitle, 'Untitled Section');
      expect(result.sections[0].blocks.length, 1);
      expect(result.sections[0].blocks[0], isA<GuideBlockText>());
    });

    test('fromQuillDelta splits sections on H1 headers', () {
      final ops = [
        {'insert': 'Intro text\n'},
        {
          'insert': 'Chapter One\n',
          'attributes': {'header': 1}
        },
        {'insert': 'Content of chapter one.\n'},
        {
          'insert': 'Chapter Two\n',
          'attributes': {'header': 1}
        },
        {'insert': 'Content of chapter two.\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour2');

      expect(result.sections.length, 3);
      expect(result.sections[0].chapterTitle, 'Untitled Section');
      expect(result.sections[1].chapterTitle, 'Chapter One');
      expect(result.sections[2].chapterTitle, 'Chapter Two');
    });

    test('fromQuillDelta parses emoji-prefixed fact blocks', () {
      final ops = [
        {'insert': '📌 Founded: 1492\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour3');

      expect(result.sections[0].blocks.length, 1);
      final block = result.sections[0].blocks[0] as GuideBlockFact;
      expect(block.label, 'Founded');
      expect(block.value, '1492');
    });

    test('fromQuillDelta parses location blocks', () {
      final ops = [
        {'insert': '📍 123 Main Street\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour4');

      final block = result.sections[0].blocks[0] as GuideBlockLocation;
      expect(block.address, '123 Main Street');
    });

    test('fromQuillDelta parses year badge blocks', () {
      final ops = [
        {'insert': '🏷️ Built in 1847\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour5');

      final block = result.sections[0].blocks[0] as GuideBlockYearBadge;
      expect(block.label, 'Built in 1847');
    });

    test('toQuillDelta round-trips correctly', () {
      const content = GuideContent(
        tourId: 'tour_rt',
        version: 1,
        sections: [
          GuideSection(
            id: 's1',
            chapterTitle: 'Test Chapter',
            blocks: [
              GuideBlock.text(content: 'A paragraph.'),
              GuideBlock.fact(label: 'Year', value: '2024'),
              GuideBlock.location(address: '456 Oak Ave'),
              GuideBlock.yearBadge(label: 'Founded 1776'),
            ],
          ),
        ],
      );

      final delta = QuillGuideConverter.toQuillDelta(content);

      expect(delta, isNotEmpty);
      // The first op should be the chapter title
      expect(delta[0]['insert'], contains('Test Chapter'));
    });
  });

  group('WordImporter', () {
    test('fromPlainText parses sections from markdown-like text', () {
      const text = '''
# Introduction
Welcome to the tour.
> This is a highlighted quote.

# History
The history of this place is long.
[FACT:Founded:1492]
[YEAR:Built in 1492]
[LOC:123 Main Street]
''';

      final result = WordImporter.fromPlainText(text, 'tourW');

      expect(result.sections.length, 2);
      expect(result.sections[0].chapterTitle, 'Introduction');
      expect(result.sections[0].blocks.length, 2);
      expect(result.sections[0].blocks[0], isA<GuideBlockText>());
      expect(result.sections[0].blocks[1], isA<GuideBlockHighlight>());

      expect(result.sections[1].chapterTitle, 'History');
      expect(result.sections[1].blocks.length, 4);
      expect(result.sections[1].blocks[0], isA<GuideBlockText>());
      expect(result.sections[1].blocks[1], isA<GuideBlockFact>());
      expect(result.sections[1].blocks[2], isA<GuideBlockYearBadge>());
      expect(result.sections[1].blocks[3], isA<GuideBlockLocation>());
    });

    test('fromPlainText defaults to Introduction when no H1', () {
      const text = 'Just a simple paragraph.';
      final result = WordImporter.fromPlainText(text, 'tourW2');

      expect(result.sections.length, 1);
      expect(result.sections[0].chapterTitle, 'Introduction');
      expect(result.sections[0].blocks.length, 1);
    });

    test('fromPlainText parses fact tags correctly', () {
      const text = '[FACT:Population:1.5 million]';
      final result = WordImporter.fromPlainText(text, 'tourW3');

      final block = result.sections[0].blocks[0] as GuideBlockFact;
      expect(block.label, 'Population');
      expect(block.value, '1.5 million');
    });
  });
}
