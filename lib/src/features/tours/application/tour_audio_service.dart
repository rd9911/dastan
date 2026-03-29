import 'dart:async';
import 'dart:ui';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/core/data/supabase_auth_service.dart';

part 'tour_audio_service.g.dart';

/// Represents the current audio playback state for a guided tour.
class AudioPlaybackState {
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final int currentSection;
  final int currentChildTourIndex;
  final bool isLoadingNext;
  final bool isCompleted;

  const AudioPlaybackState({
    required this.isPlaying,
    required this.position,
    required this.duration,
    required this.currentSection,
    required this.currentChildTourIndex,
    required this.isLoadingNext,
    required this.isCompleted,
  });

  AudioPlaybackState copyWith({
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    int? currentSection,
    int? currentChildTourIndex,
    bool? isLoadingNext,
    bool? isCompleted,
  }) {
    return AudioPlaybackState(
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      currentSection: currentSection ?? this.currentSection,
      currentChildTourIndex:
          currentChildTourIndex ?? this.currentChildTourIndex,
      isLoadingNext: isLoadingNext ?? this.isLoadingNext,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

/// Manages the entire playback session for a guided tour.
/// Wraps `just_audio` AudioPlayer and exposes [AudioPlaybackState].
@riverpod
class TourAudioService extends _$TourAudioService {
  late AudioPlayer _player;
  TourDetail? _detail;
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<PlayerState>? _playerStateSub;

  @override
  FutureOr<AudioPlaybackState> build() async {
    _player = AudioPlayer();
    ref.onDispose(() {
      _positionSub?.cancel();
      _playerStateSub?.cancel();
      _player.dispose();
    });
    return const AudioPlaybackState(
      isPlaying: false,
      position: Duration.zero,
      duration: Duration.zero,
      currentSection: 0,
      currentChildTourIndex: 0,
      isLoadingNext: false,
      isCompleted: false,
    );
  }

  /// Initialize playback for a tour, optionally restoring saved progress.
  Future<void> initTour(
    TourDetail detail, {
    PlaybackProgress? savedProgress,
  }) async {
    _detail = detail;
    final audioVersion = _pickAudioVersion(detail);
    if (audioVersion == null || audioVersion.audioUrl == null) return;

    // Essential for just_audio_background to work correctly
    await _player.setAudioSource(
      AudioSource.uri(
        Uri.parse(audioVersion.audioUrl!),
        tag: MediaItem(
          id: detail.summary.id,
          album: detail.summary.cityId,
          title: detail.summary.name,
          artUri: Uri.parse(detail.summary.mainImageUrl),
        ),
      ),
    );

    // Restore position if available
    if (savedProgress != null && savedProgress.audioPositionMs > 0) {
      await _player.seek(
        Duration(milliseconds: savedProgress.audioPositionMs),
      );
    }

    _setupListeners(detail);
  }

  AudioVersion? _pickAudioVersion(TourDetail detail) {
    final versions = detail.audioVersions
        .where((v) => v.status == AudioStatus.ready && v.audioUrl != null)
        .toList();
    final deviceLanguage = PlatformDispatcher.instance.locale.languageCode;
    
    // Exact match
    try {
      return versions.firstWhere((v) => v.languageCode == deviceLanguage);
    } catch (_) {
      // Fallback
      return versions.firstWhere(
        (v) => v.languageCode == 'en',
        orElse: () => versions.first,
      );
    }
  }

  void _setupListeners(TourDetail detail) {
    _positionSub?.cancel();
    _playerStateSub?.cancel();

    _positionSub = _player.positionStream.listen((position) {
      final duration = _player.duration ?? Duration.zero;
      final sectionIndex = _mapPositionToSection(
        position,
        duration,
        detail.guideContent,
      );

      final current = state.value;
      if (current != null) {
        state = AsyncData(current.copyWith(
          position: position,
          duration: duration,
          currentSection: sectionIndex,
        ));

        // Persist progress periodically (every 5 seconds)
        if (position.inSeconds > 0 && position.inSeconds % 5 == 0) {
          _persistProgress(detail, position, sectionIndex);
        }
      }
    });

    _playerStateSub = _player.playerStateStream.listen((playerState) {
      final current = state.value;
      if (current != null) {
        final isCompleted = playerState.processingState == ProcessingState.completed;
        state = AsyncData(current.copyWith(
          isPlaying: playerState.playing,
          isCompleted: isCompleted,
        ));
        if (isCompleted) {
          _onTrackCompleted(detail);
        }
      }
    });
  }

  /// Maps audio position to guide content section index using equal time slices.
  int _mapPositionToSection(
    Duration position,
    Duration duration,
    GuideContent content,
  ) {
    if (duration.inMilliseconds == 0 || content.sections.isEmpty) return 0;
    final sectionCount = content.sections.length;
    final sectionDuration = duration.inMilliseconds / sectionCount;
    final index = (position.inMilliseconds / sectionDuration).floor();
    return index.clamp(0, sectionCount - 1);
  }

  Future<void> _onTrackCompleted(TourDetail detail) async {
    if (detail.summary.type == TourType.single) {
      _persistProgress(detail, Duration.zero, 0, completed: true);
    }
    // Multi-tour completion handled by MultiTourLocationService
  }

  void _persistProgress(
    TourDetail detail,
    Duration position,
    int sectionIndex, {
    bool completed = false,
  }) {
    final repo = ref.read(tourRepositoryProvider);
    final userId = ref.read(supabaseAuthServiceProvider.notifier).currentUser?.id ?? 'anonymous';
    final progress = PlaybackProgress(
      tourId: detail.summary.id,
      userId: userId,
      audioPositionMs: position.inMilliseconds,
      currentSection: sectionIndex,
      completed: completed,
      lastUpdatedAt: DateTime.now(),
    );
    repo.updatePlaybackProgress(progress);
  }

  /// Toggle between play and pause.
  Future<void> togglePlayPause() async {
    _player.playing ? await _player.pause() : await _player.play();
  }

  /// Seek to a specific position.
  Future<void> seekTo(Duration position) => _player.seek(position);

  /// Skip backward 10 seconds.
  Future<void> skipBack() =>
      _player.seek(_player.position - const Duration(seconds: 10));

  /// Skip forward 30 seconds.
  Future<void> skipForward() =>
      _player.seek(_player.position + const Duration(seconds: 30));

  /// Persist the current playback progress (called on screen exit).
  Future<void> persistCurrentProgress() async {
    if (_detail == null) return;
    final current = state.value;
    if (current == null) return;
    _persistProgress(
      _detail!,
      current.position,
      current.currentSection,
    );
  }
}
