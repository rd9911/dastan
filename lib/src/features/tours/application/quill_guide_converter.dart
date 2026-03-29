import 'package:dastan/src/features/tours/domain/tour_models.dart';

/// Converts between Quill Delta JSON and the [GuideContent] domain model.
///
/// Convention:
/// - H1 headers in Quill → [GuideSection.chapterTitle] boundaries
/// - Plain text paragraphs → [GuideBlock.text]
/// - Block quotes → [GuideBlock.highlight]
/// - Text starting with "📌" → [GuideBlock.fact] (label: value)
/// - Text starting with "📍" → [GuideBlock.location]
/// - Text starting with "🏷️" → [GuideBlock.yearBadge]
/// - Image embeds → [GuideBlock.image]
class QuillGuideConverter {
  /// Convert Quill Delta ops JSON list to [GuideContent].
  static GuideContent fromQuillDelta(List<dynamic> deltaOps, String tourId) {
    final sections = <GuideSection>[];
    var currentTitle = 'Untitled Section';
    var currentBlocks = <GuideBlock>[];
    var sectionId = 0;

    for (final op in deltaOps) {
      if (op is! Map<String, dynamic>) continue;
      final insert = op['insert'];
      final attributes = op['attributes'] as Map<String, dynamic>?;

      if (insert is String) {
        final lines = insert.split('\n');

        for (final line in lines) {
          final trimmed = line.trim();
          if (trimmed.isEmpty) continue;

          // Check if this is a header (next op may have header attribute)
          final isHeader = attributes?['header'] == 1;

          if (isHeader) {
            // Save current section if it has content
            if (currentBlocks.isNotEmpty || sectionId > 0) {
              sections.add(GuideSection(
                id: 'section_$sectionId',
                chapterTitle: currentTitle,
                blocks: List.from(currentBlocks),
              ));
              sectionId++;
              currentBlocks = [];
            }
            currentTitle = trimmed;
            continue;
          }

          // Check for special emoji-prefixed blocks
          if (trimmed.startsWith('📌')) {
            final factContent = trimmed.substring(2).trim();
            final colonIndex = factContent.indexOf(':');
            if (colonIndex > 0) {
              currentBlocks.add(GuideBlock.fact(
                label: factContent.substring(0, colonIndex).trim(),
                value: factContent.substring(colonIndex + 1).trim(),
              ));
            }
          } else if (trimmed.startsWith('📍')) {
            final address = trimmed.substring(2).trim();
            currentBlocks.add(GuideBlock.location(address: address));
          } else if (trimmed.startsWith('🏷️')) {
            final label = trimmed.substring(3).trim();
            currentBlocks.add(GuideBlock.yearBadge(label: label));
          } else if (attributes?['blockquote'] == true) {
            currentBlocks.add(GuideBlock.highlight(content: trimmed));
          } else {
            currentBlocks.add(GuideBlock.text(content: trimmed));
          }
        }
      } else if (insert is Map<String, dynamic>) {
        // Handle embeds (images)
        if (insert.containsKey('image')) {
          currentBlocks.add(GuideBlock.image(
            imageUrl: insert['image'] as String,
          ));
        }
      }
    }

    // Add the last section
    if (currentBlocks.isNotEmpty) {
      sections.add(GuideSection(
        id: 'section_$sectionId',
        chapterTitle: currentTitle,
        blocks: currentBlocks,
      ));
    }

    // If no sections were created, create a default empty one
    if (sections.isEmpty) {
      sections.add(const GuideSection(
        id: 'section_0',
        chapterTitle: 'Untitled Section',
        blocks: [],
      ));
    }

    return GuideContent(
      tourId: tourId,
      sections: sections,
      version: 1,
    );
  }

  /// Convert [GuideContent] back to Quill Delta ops JSON.
  /// Used when loading existing tours for editing.
  static List<Map<String, dynamic>> toQuillDelta(GuideContent content) {
    final ops = <Map<String, dynamic>>[];

    for (final section in content.sections) {
      // Insert chapter title as H1
      ops.add({'insert': '${section.chapterTitle}\n'});
      ops.add({
        'insert': '\n',
        'attributes': {'header': 1}
      });

      for (final block in section.blocks) {
        switch (block) {
          case GuideBlockText(:final content):
            ops.add({'insert': '$content\n'});
          case GuideBlockHighlight(:final content):
            ops.add({'insert': content});
            ops.add({
              'insert': '\n',
              'attributes': {'blockquote': true}
            });
          case GuideBlockImage(:final imageUrl):
            ops.add({
              'insert': {'image': imageUrl}
            });
            ops.add({'insert': '\n'});
          case GuideBlockFact(:final label, :final value):
            ops.add({'insert': '📌 $label: $value\n'});
          case GuideBlockLocation(:final address):
            ops.add({'insert': '📍 $address\n'});
          case GuideBlockYearBadge(:final label):
            ops.add({'insert': '🏷️ $label\n'});
          default:
            break;
        }
      }

      ops.add({'insert': '\n'});
    }

    return ops;
  }
}
