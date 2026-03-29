import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/core/presentation/save_button.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/trails/application/trails_providers.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';
import 'package:dastan/src/features/trails/application/trails_normalization_helper.dart';
import 'package:dastan/src/features/trails/application/external_map_launcher.dart';

/// Detailed view of a trail.
class TrailsDetailScreen extends ConsumerStatefulWidget {
  final TrailCard card;
  final String itineraryId;

  const TrailsDetailScreen({
    super.key,
    required this.card,
    required this.itineraryId,
  });

  @override
  ConsumerState<TrailsDetailScreen> createState() => _TrailsDetailScreenState();
}

class _TrailsDetailScreenState extends ConsumerState<TrailsDetailScreen> {
  TrailDetail? _detail;
  bool _isLoading = true;
  String? _errorMessage;
  int _currentPhotoIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    try {
      final repository = ref.read(trailsRepositoryProvider);
      final detail = await repository.getDetail(
        widget.card.providerId,
        widget.card.externalId,
      );

      if (mounted) {
        setState(() {
          _detail = detail;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(theme),
          if (_isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_errorMessage != null)
            SliverFillRemaining(child: Center(child: Text(_errorMessage!)))
          else if (_detail != null) ...[
            _buildPhotoCarousel(theme),
            _buildContent(theme),
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ],
      ),
      floatingActionButton: _detail != null
          ? FloatingActionButton.extended(
              onPressed: () => ExternalMapLauncher.launchMap(
                lat: _detail!.location.lat,
                lng: _detail!.location.lng,
                name: _detail!.name,
              ),
              icon: const Icon(Icons.map),
              label: const Text('Show on Map'),
            )
          : null,
    );
  }

  Widget _buildAppBar(ThemeData theme) {
    return SliverAppBar(
      expandedHeight: 0,
      pinned: true,
      title: Text(widget.card.name),
      actions: [
        SaveButton(
          section: ItinerarySection.trails,
          title: widget.card.name,
          details: {
            'providerId': widget.card.providerId,
            'externalId': widget.card.externalId,
            'duration': widget.card.durationMinutes,
            'difficulty': widget.card.difficulty.name,
            'length': widget.card.lengthKm,
            if (widget.card.elevationGainM != null)
              'elevation': widget.card.elevationGainM,
          },
          dedupeKey: TrailsNormalizationHelper.generateDedupeKey(
            itineraryId: widget.itineraryId,
            item: widget.card,
          ),
          externalData: SavedItemExternal(
            vendor: widget.card.providerId,
            vendorUrl: widget.card.website,
            externalId: widget.card.externalId,
          ),
          location: SavedItemLocation(
            name: widget.card.location.name,
            lat: widget.card.location.lat,
            lng: widget.card.location.lng,
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoCarousel(ThemeData theme) {
    final photos = _detail?.photos ?? [widget.card.thumbnail];
    if (photos.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          children: [
            PageView.builder(
              itemCount: photos.length,
              onPageChanged: (i) => setState(() => _currentPhotoIndex = i),
              itemBuilder: (context, index) {
                return Image.network(
                  photos[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(color: Colors.grey[300]),
                );
              },
            ),
            if (photos.length > 1)
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(photos.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPhotoIndex == index
                            ? theme.colorScheme.primary
                            : theme.colorScheme.outline.withValues(alpha: 0.5),
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    final detail = _detail!;
    final stats = [
      _Stat(
        'Duration',
        TrailsNormalizationHelper.formatDuration(detail.durationMinutes),
        Icons.timer,
      ),
      _Stat(
        'Difficulty',
        TrailsNormalizationHelper.getDifficultyLabel(detail.difficulty),
        Icons.show_chart,
        color: TrailsNormalizationHelper.getDifficultyColor(detail.difficulty),
      ),
      _Stat(
        'Length',
        TrailsNormalizationHelper.formatDistance(detail.lengthKm),
        Icons.straighten,
      ),
      if (detail.elevationGainM != null)
        _Stat('Elevation', '${detail.elevationGainM!.round()}m', Icons.terrain),
    ];

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Text(detail.name, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 4),
              Text(detail.location.name, style: theme.textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 24),

          // Stats Grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: stats.map((s) => _buildStatItem(theme, s)).toList(),
          ),

          const SizedBox(height: 24),
          Text('Description', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            detail.description ?? 'No description available',
            style: theme.textTheme.bodyMedium,
          ),
        ]),
      ),
    );
  }

  Widget _buildStatItem(ThemeData theme, _Stat stat) {
    return Column(
      children: [
        Icon(
          stat.icon,
          color: stat.color ?? theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(height: 4),
        Text(
          stat.label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
        Text(
          stat.value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: stat.color,
          ),
        ),
      ],
    );
  }
}

class _Stat {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;
  _Stat(this.label, this.value, this.icon, {this.color});
}
