import 'dart:typed_data';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

/// Imports .docx Word files and converts them to [GuideContent].
///
/// Parsing conventions:
/// - H1 headings → [GuideSection.chapterTitle]
/// - Plain paragraphs → [GuideBlock.text]
/// - Block quotes → [GuideBlock.highlight]
/// - Images → uploaded to Supabase Storage, [GuideBlock.image]
/// - Inline `[FACT:label:value]` → [GuideBlock.fact]
/// - Inline `[YEAR:label]` → [GuideBlock.yearBadge]
/// - Inline `[LOC:address]` → [GuideBlock.location]
class WordImporter {
  /// Accept a .docx file as bytes and convert to [GuideContent].
  ///
  /// NOTE: Full .docx parsing requires a dedicated library (e.g. 'docx' package).
  /// This is a stub implementation that extracts basic text structure.
  static Future<GuideContent> importDocx(
    Uint8List bytes,
    String tourId,
  ) async {
    // TODO: Implement full .docx XML parsing
    // Note: We currently don't have a docx parsing library in pubspec.yaml.
    // For now, throw an informative error directing users to the editor.
    throw UnimplementedError(
      'Word .docx file import is not supported in this version. '
      'Please use the visual editor to create guide content, '
      'or paste your text directly into the editor.',
    );
  }

  /// Parse a plain text string with conventions into [GuideContent].
  /// This is useful as a simpler alternative to full .docx parsing.
  static GuideContent fromPlainText(String text, String tourId) {
    final lines = text.split('\n');
    final sections = <GuideSection>[];
    var currentTitle = 'Introduction';
    var currentBlocks = <GuideBlock>[];
    var sectionId = 0;

    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) continue;

      // H1: lines starting with "# "
      if (trimmed.startsWith('# ')) {
        if (currentBlocks.isNotEmpty) {
          sections.add(GuideSection(
            id: 'section_$sectionId',
            chapterTitle: currentTitle,
            blocks: List.from(currentBlocks),
          ));
          sectionId++;
          currentBlocks = [];
        }
        currentTitle = trimmed.substring(2).trim();
        continue;
      }

      // Inline tags
      final factMatch = RegExp(r'\[FACT:(.+?):(.+?)\]').firstMatch(trimmed);
      if (factMatch != null) {
        currentBlocks.add(GuideBlock.fact(
          label: factMatch.group(1)!.trim(),
          value: factMatch.group(2)!.trim(),
        ));
        continue;
      }

      final yearMatch = RegExp(r'\[YEAR:(.+?)\]').firstMatch(trimmed);
      if (yearMatch != null) {
        currentBlocks.add(GuideBlock.yearBadge(
          label: yearMatch.group(1)!.trim(),
        ));
        continue;
      }

      final locMatch = RegExp(r'\[LOC:(.+?)\]').firstMatch(trimmed);
      if (locMatch != null) {
        currentBlocks.add(GuideBlock.location(
          address: locMatch.group(1)!.trim(),
        ));
        continue;
      }

      // Block quotes: lines starting with "> "
      if (trimmed.startsWith('> ')) {
        currentBlocks.add(GuideBlock.highlight(
          content: trimmed.substring(2).trim(),
        ));
        continue;
      }

      // Regular text
      currentBlocks.add(GuideBlock.text(content: trimmed));
    }

    // Add final section
    if (currentBlocks.isNotEmpty) {
      sections.add(GuideSection(
        id: 'section_$sectionId',
        chapterTitle: currentTitle,
        blocks: currentBlocks,
      ));
    }

    return GuideContent(
      tourId: tourId,
      sections: sections,
      version: 1,
    );
  }
}
