import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/widgets/audio_player_bar.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/widgets/guide_text_view.dart';

/// Spotify-style bottom sheet for the guided tour experience.
/// Collapsed: shows mini audio player bar only.
/// Expanded: shows audio player bar + scrollable guide text.
class TourBottomSheet extends ConsumerWidget {
  final TourDetail detail;
  final ScrollController scrollController;
  final DraggableScrollableController sheetController;
  final double minChildSize;

  const TourBottomSheet({
    super.key,
    required this.detail,
    required this.scrollController,
    required this.sheetController,
    required this.minChildSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedBuilder(
      animation: sheetController,
      builder: (context, _) {
        final size =
            sheetController.isAttached ? sheetController.size : 0.35;
        final isCollapsed = size <= minChildSize + 0.02;

        return Container(
          key: const Key('tour_bottom_sheet'),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: const [
              BoxShadow(blurRadius: 20, color: Colors.black26),
            ],
          ),
          child: Column(
            children: [
              // Drag handle
              const _DragHandle(),
              // Mini player (always visible)
              AudioPlayerBar(tourId: detail.summary.id),
              // Expanded content (guide text)
              if (!isCollapsed)
                Expanded(
                  child: GuideTextView(
                    guideContent: detail.guideContent,
                    scrollController: scrollController,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
