import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/tours/application/tour_audio_service.dart';

/// Mini audio player bar always visible in the guided tour bottom sheet.
/// Shows slider, play/pause, skip controls.
class AudioPlayerBar extends ConsumerWidget {
  final String tourId;

  const AudioPlayerBar({super.key, required this.tourId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioState = ref.watch(tourAudioServiceProvider);

    return Padding(
      key: const Key('audio_player_bar'),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress bar
          audioState.when(
            loading: () => const LinearProgressIndicator(),
            error: (_, __) => const SizedBox.shrink(),
            data: (state) => SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 6),
                trackHeight: 3,
              ),
              child: Slider(
                value: state.position.inMilliseconds.toDouble(),
                max: state.duration.inMilliseconds
                    .toDouble()
                    .clamp(1, double.infinity),
                onChanged: (val) => ref
                    .read(tourAudioServiceProvider.notifier)
                    .seekTo(Duration(milliseconds: val.toInt())),
              ),
            ),
          ),
          // Time labels
          audioState.whenOrNull(
                data: (state) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(state.position),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        _formatDuration(state.duration),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ) ??
              const SizedBox.shrink(),
          const SizedBox(height: 4),
          // Controls row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                key: const Key('skip_back_button'),
                icon: const Icon(Icons.replay_10),
                onPressed: () => ref
                    .read(tourAudioServiceProvider.notifier)
                    .skipBack(),
              ),
              audioState.when(
                loading: () => const SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(),
                ),
                error: (_, __) => const Icon(Icons.error),
                data: (state) => IconButton.filled(
                  key: const Key('play_pause_button'),
                  icon: Icon(
                    state.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 28,
                  ),
                  onPressed: () => ref
                      .read(tourAudioServiceProvider.notifier)
                      .togglePlayPause(),
                  style: IconButton.styleFrom(
                    fixedSize: const Size(56, 56),
                    backgroundColor:
                        Theme.of(context).colorScheme.primary,
                    foregroundColor:
                        Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              IconButton(
                key: const Key('skip_forward_button'),
                icon: const Icon(Icons.forward_30),
                onPressed: () => ref
                    .read(tourAudioServiceProvider.notifier)
                    .skipForward(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (d.inHours > 0) {
      return '${d.inHours}:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }
}
