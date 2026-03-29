import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPreviewButton extends StatefulWidget {
  final String audioUrl;

  const AudioPreviewButton({super.key, required this.audioUrl});

  @override
  State<AudioPreviewButton> createState() => _AudioPreviewButtonState();
}

class _AudioPreviewButtonState extends State<AudioPreviewButton> {
  final _player = AudioPlayer();
  bool _isPlaying = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _player.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state.playing && state.processingState != ProcessingState.completed;
          if (state.processingState == ProcessingState.completed) {
            _player.seek(Duration.zero);
            _player.pause();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _togglePlay() async {
    try {
      if (_isPlaying) {
        await _player.pause();
      } else {
        setState(() => _isLoading = true);
        if (_player.audioSource == null) {
          await _player.setUrl(widget.audioUrl);
        }
        await _player.play();
      }
    } catch (e) {
      debugPrint('Error playing audio preview: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _isLoading ? null : _togglePlay,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(
              _isPlaying ? Icons.stop_circle : Icons.play_circle_fill,
              color: Colors.blue,
              size: 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _isPlaying ? 'Playing sample...' : 'Listen to an audio sample',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            if (_isLoading)
               const SizedBox(
                 width: 16,
                 height: 16,
                 child: CircularProgressIndicator(strokeWidth: 2),
               )
          ],
        ),
      ),
    );
  }
}
