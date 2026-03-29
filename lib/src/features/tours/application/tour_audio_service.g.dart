// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_audio_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Manages the entire playback session for a guided tour.
/// Wraps `just_audio` AudioPlayer and exposes [AudioPlaybackState].

@ProviderFor(TourAudioService)
const tourAudioServiceProvider = TourAudioServiceProvider._();

/// Manages the entire playback session for a guided tour.
/// Wraps `just_audio` AudioPlayer and exposes [AudioPlaybackState].
final class TourAudioServiceProvider
    extends $AsyncNotifierProvider<TourAudioService, AudioPlaybackState> {
  /// Manages the entire playback session for a guided tour.
  /// Wraps `just_audio` AudioPlayer and exposes [AudioPlaybackState].
  const TourAudioServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tourAudioServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tourAudioServiceHash();

  @$internal
  @override
  TourAudioService create() => TourAudioService();
}

String _$tourAudioServiceHash() => r'd3a3e5add6e318e19615dcd226f735804635986e';

/// Manages the entire playback session for a guided tour.
/// Wraps `just_audio` AudioPlayer and exposes [AudioPlaybackState].

abstract class _$TourAudioService extends $AsyncNotifier<AudioPlaybackState> {
  FutureOr<AudioPlaybackState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<AudioPlaybackState>, AudioPlaybackState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AudioPlaybackState>, AudioPlaybackState>,
              AsyncValue<AudioPlaybackState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
