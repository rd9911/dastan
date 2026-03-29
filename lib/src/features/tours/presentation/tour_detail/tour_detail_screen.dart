import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dastan/src/core/data/supabase_auth_service.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/application/tour_download_service.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/widgets/audio_preview_button.dart';
import 'package:dastan/src/features/tours/presentation/tour_detail/widgets/buy_fab.dart';

class TourDetailScreen extends ConsumerWidget {
  final String tourId;
  final bool isSaved;

  const TourDetailScreen({
    super.key,
    required this.tourId,
    this.isSaved = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(tourDetailProvider(tourId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              final val = detailAsync.whenOrNull(data: (d) => d);
              if (val != null) {
                Share.shareUri(Uri.parse('dastan://tours/city/${val.summary.cityId}/tour/$tourId'));
              }
            },
          ),
          if (isSaved) _DownloadTourButton(tourId: tourId),
        ],
      ),
      body: detailAsync.when(
        loading: () => const Center(key: Key('tour_detail_loading'), child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (detail) {
          final summary = detail.summary;
          final path = GoRouterState.of(context).uri.path;
          final prefix = path.contains('/saved') ? 'saved' : 'tour-hero';
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80), // for FAB
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Hero Image
                Hero(
                  tag: '$prefix-${summary.id}',
                  child: CachedNetworkImage(
                    imageUrl: summary.mainImageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Banner will go here in Phase 15.8 based on playback progress
                      if (isSaved) _ContinueLeftOffBanner(tourId: tourId),
                      Text(
                        summary.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        summary.tagline,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 16),
                      if (detail.audioVersions.isNotEmpty && detail.audioVersions.first.previewUrl != null) ...[
                        AudioPreviewButton(audioUrl: detail.audioVersions.first.previewUrl!),
                        const SizedBox(height: 16),
                      ],
                      _TourMetaRow(detail: detail),
                      const SizedBox(height: 16),
                      Text(
                        'What to expect',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(detail.fullDescription),
                      const SizedBox(height: 16),
                      _TourRouteSection(detail: detail),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: detailAsync.when(
        data: (detail) => BuyFab(
          tour: detail.summary,
          onPressed: () async {
            final userId = ref.read(supabaseAuthServiceProvider.notifier).currentUser?.id;
            if (userId != null) {
              await ref.read(tourPurchaseServiceProvider).purchaseTour(userId, tourId);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tour purchased! Check Saved Tours.')),
                );
                
                final basePath = isSaved 
                    ? '/tours/saved/${detail.summary.cityId}/tour/$tourId' 
                    : '/tours/city/${detail.summary.cityId}/tour/$tourId';
                context.push('$basePath/play');
              }
            } else {
              context.push('/auth');
            }
          },
        ),
        loading: () => null,
        error: (_, __) => null,
      ),
    );
  }
}

class _TourMetaRow extends StatelessWidget {
  final TourDetail detail;
  const _TourMetaRow({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (detail.summary.averageRating != null)
          _MetaItem(
            icon: Icons.star,
            label: '${detail.summary.averageRating!.toStringAsFixed(1)} (${detail.summary.reviewCount})',
            color: Colors.amber,
          ),
        _MetaItem(
          icon: Icons.schedule,
          label: '${detail.summary.durationMinutes}m',
        ),
        if (detail.waypoints.isNotEmpty)
          _MetaItem(
            icon: Icons.location_on_outlined,
            label: '${detail.waypoints.length} stops',
          ),
      ],
    );
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _MetaItem({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color ?? Colors.grey[700]),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _TourRouteSection extends StatelessWidget {
  final TourDetail detail;
  const _TourRouteSection({required this.detail});

  @override
  Widget build(BuildContext context) {
    if (detail.summary.type == TourType.multi && detail.childTours != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Included Single Tours', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...detail.childTours!.map((child) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.audio_file, color: Colors.blue),
                title: Text(child.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(child.tagline, maxLines: 1, overflow: TextOverflow.ellipsis),
              )),
        ],
      );
    } else if (detail.waypoints.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Route Highlights', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...detail.waypoints.map((wp) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.location_on, color: Colors.redAccent),
                title: Text(wp.label ?? 'Waypoint', style: const TextStyle(fontWeight: FontWeight.bold)),
              )),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}

class _ContinueLeftOffBanner extends ConsumerWidget {
  final String tourId;
  const _ContinueLeftOffBanner({required this.tourId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(tourPlaybackProgressProvider(tourId));

    return progressAsync.when(
      data: (progress) {
        if (progress == null || progress.completed || progress.audioPositionMs == 0) {
          return const SizedBox.shrink();
        }
        
        // Convert ms to minutes
        final mins = progress.audioPositionMs ~/ 60000;
        final positionText = mins > 0 ? '$mins min' : '${progress.audioPositionMs ~/ 1000} sec';

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.play_circle_fill, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Continue where you left off',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Resuming at $positionText',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _DownloadTourButton extends ConsumerStatefulWidget {
  final String tourId;
  const _DownloadTourButton({required this.tourId});

  @override
  ConsumerState<_DownloadTourButton> createState() => _DownloadTourButtonState();
}

class _DownloadTourButtonState extends ConsumerState<_DownloadTourButton> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(tourDetailProvider(widget.tourId));

    return detailAsync.when(
      data: (detail) {
        // Find best audio version to download (fallback to 'en')
        final audioVersions = detail.audioVersions;
        if (audioVersions.isEmpty) return const SizedBox.shrink();
        
        final lang = audioVersions.first.languageCode;
        final isDownloadedAsync = ref.watch(isTourDownloadedProvider(widget.tourId, lang));

        return isDownloadedAsync.when(
          data: (isDownloaded) {
            if (_progress != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(value: _progress),
                  ),
                ),
              );
            }
            return IconButton(
              icon: Icon(isDownloaded ? Icons.download_done : Icons.download_outlined),
              tooltip: 'Download for offline use',
              onPressed: isDownloaded ? null : () async {
                setState(() => _progress = 0.0);
                try {
                  await ref.read(tourDownloadServiceProvider.notifier).downloadTour(
                    detail: detail,
                    languageCode: lang,
                    onProgress: (p) => setState(() => _progress = p),
                  );
                  ref.invalidate(isTourDownloadedProvider(widget.tourId, lang));
                } finally {
                  if (mounted) setState(() => _progress = null);
                }
              },
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

