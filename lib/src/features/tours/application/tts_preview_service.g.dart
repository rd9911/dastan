// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tts_preview_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Text-to-speech preview service.
/// Falls back to device TTS when no pre-recorded audio preview is available.

@ProviderFor(TtsPreviewService)
const ttsPreviewServiceProvider = TtsPreviewServiceProvider._();

/// Text-to-speech preview service.
/// Falls back to device TTS when no pre-recorded audio preview is available.
final class TtsPreviewServiceProvider
    extends $AsyncNotifierProvider<TtsPreviewService, void> {
  /// Text-to-speech preview service.
  /// Falls back to device TTS when no pre-recorded audio preview is available.
  const TtsPreviewServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ttsPreviewServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ttsPreviewServiceHash();

  @$internal
  @override
  TtsPreviewService create() => TtsPreviewService();
}

String _$ttsPreviewServiceHash() => r'677a5d1609442a99262d44c6b86e1a355415a9cc';

/// Text-to-speech preview service.
/// Falls back to device TTS when no pre-recorded audio preview is available.

abstract class _$TtsPreviewService extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
