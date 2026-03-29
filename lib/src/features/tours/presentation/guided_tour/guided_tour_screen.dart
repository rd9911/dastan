import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/application/tour_audio_service.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/widgets/tour_map_layer.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/widgets/tour_bottom_sheet.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/widgets/tour_rating_sheet.dart';

/// Full guided tour experience screen.
/// Combines a full-screen map with a Spotify-style draggable bottom sheet
/// containing audio controls and the scrollable guide text.
class GuidedTourScreen extends ConsumerStatefulWidget {
  final String tourId;

  const GuidedTourScreen({super.key, required this.tourId});

  @override
  ConsumerState<GuidedTourScreen> createState() => _GuidedTourScreenState();
}

class _GuidedTourScreenState extends ConsumerState<GuidedTourScreen>
    with WidgetsBindingObserver {
  late DraggableScrollableController _sheetController;

  static const double _minChildSize = 0.12;
  static const double _maxChildSize = 0.75;
  static const double _initChildSize = 0.35;

  @override
  void initState() {
    super.initState();
    _sheetController = DraggableScrollableController();
    WakelockPlus.enable();
    WidgetsBinding.instance.addObserver(this);

    // Initialize the audio service after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initAudio();
    });
  }

  Future<void> _initAudio() async {
    final detail =
        await ref.read(tourDetailProvider(widget.tourId).future);
    final progress =
        await ref.read(tourPlaybackProgressProvider(widget.tourId).future);
    if (!mounted) return;
    await ref
        .read(tourAudioServiceProvider.notifier)
        .initTour(detail, savedProgress: progress);
  }

  @override
  void dispose() {
    _sheetController.dispose();
    WakelockPlus.disable();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(tourDetailProvider(widget.tourId));

    ref.listen<AsyncValue<AudioPlaybackState>>(tourAudioServiceProvider, (previous, next) {
      final wasCompleted = previous?.whenOrNull(data: (d) => d)?.isCompleted ?? false;
      final isCompleted = next.whenOrNull(data: (d) => d)?.isCompleted ?? false;

      if (!wasCompleted && isCompleted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Congratulations!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.celebration, size: 60, color: Colors.orange), // Fallback if lottie is missing
                SizedBox(height: 16),
                Text('You have completed the tour!'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  TourRatingSheet.show(context, widget.tourId);
                },
                child: const Text('Rate Tour'),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      }
    });

    return Scaffold(
      body: detailAsync.when(
        loading: () => const Center(
          key: Key('guided_tour_loading'),
          child: CircularProgressIndicator(),
        ),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (detail) => Stack(
          children: [
            // ── Full-screen map ──
            TourMapLayer(
              detail: detail,
              sheetController: _sheetController,
            ),
            // ── Close button top-left ──
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton.filled(
                  key: const Key('guided_tour_close'),
                  onPressed: () async {
                    await ref
                        .read(tourAudioServiceProvider.notifier)
                        .persistCurrentProgress();
                    if (context.mounted) Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .surface
                        .withValues(alpha: 0.85),
                  ),
                ),
              ),
            ),
            // ── Spotify-style bottom sheet ──
            DraggableScrollableSheet(
              controller: _sheetController,
              initialChildSize: _initChildSize,
              minChildSize: _minChildSize,
              maxChildSize: _maxChildSize,
              snap: true,
              snapSizes: const [
                _minChildSize,
                _initChildSize,
                _maxChildSize,
              ],
              builder: (context, scrollController) {
                return TourBottomSheet(
                  detail: detail,
                  scrollController: scrollController,
                  sheetController: _sheetController,
                  minChildSize: _minChildSize,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
