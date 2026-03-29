import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/offline/application/offline_packager.dart';

class OfflinePreflightSheet extends ConsumerStatefulWidget {
  final String itineraryId;

  const OfflinePreflightSheet({super.key, required this.itineraryId});

  @override
  ConsumerState<OfflinePreflightSheet> createState() =>
      _OfflinePreflightSheetState();
}

class _OfflinePreflightSheetState extends ConsumerState<OfflinePreflightSheet> {
  bool _estimating = true;
  int? _estimatedSize;
  bool _downloading = false;
  double _progress = 0.0;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _startEstimation();
  }

  Future<void> _startEstimation() async {
    final packager = ref.read(offlinePackagerProvider);
    final size = await packager.estimateDownloadSize(widget.itineraryId);

    if (mounted) {
      setState(() {
        _estimatedSize = size;
        _estimating = false;
      });
    }
  }

  void _startDownload() {
    setState(() {
      _downloading = true;
      _progress = 0.0;
    });

    final packager = ref.read(offlinePackagerProvider);
    // Hardcoded URLs for now until itinerary fetch is implemented
    packager
        .createBundle(
          itineraryId: widget.itineraryId,
          imageUrls: List.generate(10, (i) => 'http://mock/image_$i.jpg'),
        )
        .listen(
          (progress) {
            if (mounted) {
              setState(() {
                _progress = progress;
              });
            }
          },
          onDone: () {
            if (mounted) {
              setState(() {
                _downloading = false;
                _completed = true;
              });
            }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Make Available Offline',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          if (_estimating)
            const Center(child: CircularProgressIndicator())
          else if (_completed)
            _buildCompletedView(context)
          else if (_downloading)
            _buildDownloadingView(context)
          else
            _buildReadyView(context),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildReadyView(BuildContext context) {
    final sizeMb = (_estimatedSize ?? 0) / (1024 * 1024);
    return Column(
      children: [
        Text(
          'Estimated size: ${sizeMb.toStringAsFixed(1)} MB',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Includes maps, photos, and details for offline access.',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _startDownload,
          child: const Text('Download'),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Widget _buildDownloadingView(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(value: _progress),
        const SizedBox(height: 16),
        Text('${(_progress * 100).toInt()}% downloaded'),
      ],
    );
  }

  Widget _buildCompletedView(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 64),
        const SizedBox(height: 16),
        const Text('Download Complete!'),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Done'),
        ),
      ],
    );
  }
}
