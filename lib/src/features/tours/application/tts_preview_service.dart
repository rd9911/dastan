import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tts_preview_service.g.dart';

/// Text-to-speech preview service.
/// Falls back to device TTS when no pre-recorded audio preview is available.
@riverpod
class TtsPreviewService extends _$TtsPreviewService {
  final FlutterTts _tts = FlutterTts();
  bool _isSpeaking = false;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => _tts.stop());
  }

  /// Speak a preview of the given text (~200 chars ≈ ~30 seconds).
  Future<void> speakPreview(String text) async {
    if (_isSpeaking) {
      await _tts.stop();
      _isSpeaking = false;
      return;
    }
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.9);
    // Take first 200 characters (~30 seconds of speech)
    final preview = text.length > 200 ? text.substring(0, 200) : text;
    await _tts.speak(preview);
    _isSpeaking = true;
  }

  /// Stop any ongoing speech.
  Future<void> stop() async {
    await _tts.stop();
    _isSpeaking = false;
  }

  /// Whether TTS is currently speaking.
  bool get isSpeaking => _isSpeaking;
}
