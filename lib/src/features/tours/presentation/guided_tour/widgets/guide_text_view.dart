import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/application/tour_audio_service.dart';

/// Renders the structured guide content with read/unread opacity.
/// Sections already played are full opacity; future sections are dimmed.
class GuideTextView extends ConsumerWidget {
  final GuideContent guideContent;
  final ScrollController scrollController;

  const GuideTextView({
    super.key,
    required this.guideContent,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioState = ref.watch(tourAudioServiceProvider).value;
    final currentSectionIndex = audioState?.currentSection ?? 0;

    return ListView.builder(
      key: const Key('guide_text_list'),
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
      itemCount: guideContent.sections.length,
      itemBuilder: (_, sectionIndex) {
        final section = guideContent.sections[sectionIndex];
        final isRead = sectionIndex < currentSectionIndex;
        final isCurrent = sectionIndex == currentSectionIndex;
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: isRead || isCurrent ? 1.0 : 0.5,
          child: GuideSectionView(
            section: section,
            isRead: isRead,
            isCurrent: isCurrent,
          ),
        );
      },
    );
  }
}

/// Renders a single guide section with chapter title and content blocks.
class GuideSectionView extends StatelessWidget {
  final GuideSection section;
  final bool isRead;
  final bool isCurrent;

  const GuideSectionView({
    super.key,
    required this.section,
    required this.isRead,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        // Chapter title
        Text(
          section.chapterTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
        ),
        const SizedBox(height: 16),
        // Content blocks
        ...section.blocks.map((block) => GuideBlockView(block: block)),
      ],
    );
  }
}

/// Renders a single guide block based on its type variant.
class GuideBlockView extends StatelessWidget {
  final GuideBlock block;

  const GuideBlockView({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    return switch (block) {
      GuideBlockText(:final content) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            content,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(height: 1.6),
          ),
        ),
      GuideBlockHighlight(:final content) => Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 4,
              ),
            ),
            color: Theme.of(context)
                .colorScheme
                .primaryContainer
                .withValues(alpha: 0.3),
          ),
          child: Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      GuideBlockImage(:final imageUrl, :final caption, :final isLeading) =>
        Padding(
          padding: EdgeInsets.symmetric(vertical: isLeading ? 0 : 16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(isLeading ? 0 : 12),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: isLeading ? 240 : 200,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    height: isLeading ? 240 : 200,
                    color: Colors.grey[300],
                  ),
                  errorWidget: (_, __, ___) => Container(
                    height: isLeading ? 240 : 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image),
                  ),
                ),
              ),
              if (caption != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    caption,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
            ],
          ),
        ),
      GuideBlockFact(:final label, :final value) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Text('$label: ',
                  style: Theme.of(context).textTheme.labelLarge),
              Expanded(
                child: Text(value,
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
      GuideBlockLocation(:final address) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(Icons.location_on,
                  color: Theme.of(context).colorScheme.primary, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(address,
                    style: Theme.of(context).textTheme.bodySmall),
              ),
            ],
          ),
        ),
      GuideBlockYearBadge(:final label) => Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
