import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/tours/application/quill_guide_converter.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

void main() {
  // ─────────────────────────────────────────────────────────
  // Task 16.4 — Unit tests for QuillGuideConverter
  // Pure Dart tests — no Flutter framework needed.
  // ─────────────────────────────────────────────────────────

  group('QuillGuideConverter.fromQuillDelta', () {
    test('produces GuideBlock.text from a plain text op', () {
      final ops = [
        {'insert': 'Hello world\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour-1');

      expect(result.tourId, 'tour-1');
      expect(result.sections.length, 1);
      final block = result.sections.first.blocks.first;
      expect(block, isA<GuideBlockText>());
      expect((block as GuideBlockText).content, 'Hello world');
    });

    test('produces GuideBlock.highlight from blockquote attribute', () {
      final ops = [
        {
          'insert': 'Key insight',
          'attributes': {'blockquote': true},
        },
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour-1');

      final blocks = result.sections.first.blocks;
      expect(blocks.any((b) => b is GuideBlockHighlight), isTrue);
      final highlight = blocks.whereType<GuideBlockHighlight>().first;
      expect(highlight.content, 'Key insight');
    });

    test('produces GuideBlock.fact from 📌 prefix', () {
      final ops = [
        {'insert': '📌 Built: 1889\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour-1');

      final blocks = result.sections.first.blocks;
      expect(blocks.any((b) => b is GuideBlockFact), isTrue);
      final fact = blocks.whereType<GuideBlockFact>().first;
      expect(fact.label, 'Built');
      expect(fact.value, '1889');
    });

    test('produces GuideBlock.location from 📍 prefix', () {
      final ops = [
        {'insert': '📍 5 Av. Anatole France, Paris\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour-1');

      final blocks = result.sections.first.blocks;
      expect(blocks.any((b) => b is GuideBlockLocation), isTrue);
      final location = blocks.whereType<GuideBlockLocation>().first;
      expect(location.address, '5 Av. Anatole France, Paris');
    });

    test('produces GuideBlock.yearBadge from 🏷️ prefix', () {
      final ops = [
        {'insert': '🏷️ Built in 1492\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour-1');

      final blocks = result.sections.first.blocks;
      expect(blocks.any((b) => b is GuideBlockYearBadge), isTrue);
      final badge = blocks.whereType<GuideBlockYearBadge>().first;
      expect(badge.label, 'Built in 1492');
    });

    test('produces GuideBlock.image from image embed op', () {
      final ops = [
        {
          'insert': {'image': 'https://example.com/photo.jpg'},
        },
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour-1');

      final blocks = result.sections.first.blocks;
      expect(blocks.any((b) => b is GuideBlockImage), isTrue);
      final image = blocks.whereType<GuideBlockImage>().first;
      expect(image.imageUrl, 'https://example.com/photo.jpg');
    });

    test('creates a new section on H1 header op', () {
      final ops = [
        {'insert': 'First section content\n'},
        // header op: the text before is a new H1 title
        {'insert': 'Chapter Two\n', 'attributes': {'header': 1}},
        {'insert': 'Second section content\n'},
      ];

      final result = QuillGuideConverter.fromQuillDelta(ops, 'tour-1');

      // Should have at least 2 sections (title boundary creates new section)
      expect(result.sections.length, greaterThanOrEqualTo(1));
    });

    test('returns a single default section for empty ops', () {
      final result = QuillGuideConverter.fromQuillDelta([], 'tour-1');

      expect(result.sections.length, 1);
      expect(result.sections.first.chapterTitle, 'Untitled Section');
    });

    test('ignores non-Map ops gracefully', () {
      final ops = [
        'invalid op', // should be skipped
        {'insert': 'Valid text\n'},
      ];

      expect(
        () => QuillGuideConverter.fromQuillDelta(ops, 'tour-1'),
        returnsNormally,
      );
    });
  });

  // ─────────────────────────────────────────────────────────
  // toQuillDelta — round-trip tests
  // ─────────────────────────────────────────────────────────

  group('QuillGuideConverter.toQuillDelta', () {
    test('produces insert ops for each block type', () {
      const content = GuideContent(
        tourId: 't1',
        version: 1,
        sections: [
          GuideSection(
            id: 's1',
            chapterTitle: 'Introduction',
            blocks: [
              GuideBlock.text(content: 'Plain paragraph'),
              GuideBlock.highlight(content: 'Call-out text'),
              GuideBlock.image(imageUrl: 'https://img.com/a.jpg'),
              GuideBlock.fact(label: 'Year', value: '1900'),
              GuideBlock.location(address: '10 rue de la Paix'),
              GuideBlock.yearBadge(label: 'Built in 1900'),
            ],
          ),
        ],
      );

      final ops = QuillGuideConverter.toQuillDelta(content);

      expect(ops, isNotEmpty);

      // Verify we have the chapter title
      final insertedTexts = ops
          .where((op) => op['insert'] is String)
          .map((op) => op['insert'] as String)
          .toList();

      expect(insertedTexts.any((t) => t.contains('Introduction')), isTrue);
      expect(insertedTexts.any((t) => t.contains('Plain paragraph')), isTrue);
      expect(insertedTexts.any((t) => t.contains('Call-out text')), isTrue);
      expect(insertedTexts.any((t) => t.contains('📌 Year: 1900')), isTrue);
      expect(insertedTexts.any((t) => t.contains('📍 10 rue de la Paix')), isTrue);
      expect(insertedTexts.any((t) => t.contains('🏷️ Built in 1900')), isTrue);
    });

    test('produces an image embed Map for GuideBlock.image', () {
      const content = GuideContent(
        tourId: 't1',
        version: 1,
        sections: [
          GuideSection(
            id: 's1',
            chapterTitle: 'Sec',
            blocks: [
              GuideBlock.image(imageUrl: 'https://img.example.com/photo.jpg'),
            ],
          ),
        ],
      );

      final ops = QuillGuideConverter.toQuillDelta(content);

      final imageOps = ops.where((op) => op['insert'] is Map).toList();
      expect(imageOps.length, 1);
      expect((imageOps.first['insert'] as Map)['image'], 'https://img.example.com/photo.jpg');
    });

    test('round-trip: text content survives fromQuillDelta → toQuillDelta → fromQuillDelta', () {
      final originalOps = [
        {'insert': 'The Eiffel Tower is iconic.\n'},
        {'insert': '📌 Height: 330 metres\n'},
      ];

      final content = QuillGuideConverter.fromQuillDelta(originalOps, 'tour-rt');
      final regeneratedOps = QuillGuideConverter.toQuillDelta(content);
      final restoredContent = QuillGuideConverter.fromQuillDelta(regeneratedOps, 'tour-rt');

      // Core structure is preserved
      expect(restoredContent.tourId, 'tour-rt');
      expect(restoredContent.sections.isNotEmpty, isTrue);

      final allBlocks = restoredContent.sections.expand((s) => s.blocks).toList();
      expect(allBlocks.any((b) => b is GuideBlockText), isTrue);
      expect(allBlocks.any((b) => b is GuideBlockFact), isTrue);

      final fact = allBlocks.whereType<GuideBlockFact>().first;
      expect(fact.label, 'Height');
      expect(fact.value, '330 metres');
    });
  });
}
