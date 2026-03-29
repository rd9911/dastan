import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dastan/src/features/gastronomy/application/gastronomy_normalization_helper.dart';
import 'package:dastan/src/features/gastronomy/application/gastronomy_providers.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';
import 'package:dastan/src/core/presentation/save_button.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

/// Detail screen for a restaurant or café.
///
/// Features:
/// - Photo carousel with swipeable images
/// - Menu section with items and prices
/// - Facilities badges (dogs/kids/noise)
/// - Opening hours table (Mon-Sun)
/// - Phone and website buttons
/// - Save button in app bar
class GastronomyDetailScreen extends ConsumerStatefulWidget {
  final GastronomyResultCard card;
  final String itineraryId;

  const GastronomyDetailScreen({
    super.key,
    required this.card,
    required this.itineraryId,
  });

  @override
  ConsumerState<GastronomyDetailScreen> createState() =>
      _GastronomyDetailScreenState();
}

class _GastronomyDetailScreenState
    extends ConsumerState<GastronomyDetailScreen> {
  GastronomyPlaceDetail? _detail;
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
      final repository = ref.read(gastronomyRepositoryProvider);
      final detail = await repository.getDetail(
        widget.card.providerId,
        widget.card.externalId,
      );

      setState(() {
        _detail = detail;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
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
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(_errorMessage!),
                    const SizedBox(height: 16),
                    FilledButton.tonal(
                      onPressed: _loadDetail,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            )
          else if (_detail != null) ...[
            _buildPhotoCarousel(theme),
            _buildContent(theme),
          ],
        ],
      ),
      bottomNavigationBar: _detail != null ? _buildBottomBar(theme) : null,
    );
  }

  Widget _buildAppBar(ThemeData theme) {
    return SliverAppBar(
      expandedHeight: 0,
      pinned: true,
      title: Text(widget.card.name),
      actions: [
        SaveButton(
          section: ItinerarySection.gastronomy,
          title: widget.card.name,
          details: {
            'providerId': widget.card.providerId,
            'externalId': widget.card.externalId,
            'priceBand': widget.card.priceBand.name,
            'location': widget.card.location,
          },
          dedupeKey: GastronomyNormalizationHelper.generateDedupeKey(
            itineraryId: widget.itineraryId,
            item: widget.card,
          ),
          externalData: SavedItemExternal(
            vendor: widget.card.providerId,
            vendorUrl: widget.card.website,
            externalId: widget.card.externalId,
          ),
          location: SavedItemLocation(
            name: widget.card.location,
            lat: widget.card.latitude,
            lng: widget.card.longitude,
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoCarousel(ThemeData theme) {
    final photos = _detail?.photos ?? [];
    if (photos.isEmpty) {
      return SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            widget.card.thumbnail,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: theme.colorScheme.surfaceContainerHighest,
              child: Icon(
                Icons.restaurant,
                size: 48,
                color: theme.colorScheme.outline,
              ),
            ),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: PageView.builder(
              itemCount: photos.length,
              onPageChanged: (index) {
                setState(() => _currentPhotoIndex = index);
              },
              itemBuilder: (context, index) {
                return Image.network(
                  photos[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.restaurant,
                      size: 48,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                );
              },
            ),
          ),
          // Photo indicator
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
    );
  }

  Widget _buildContent(ThemeData theme) {
    final detail = _detail!;

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          // Header with name and rating
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(detail.name, style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 4),
                    Text(
                      detail.location,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (detail.rating != null) _buildRatingBadge(theme, detail),
            ],
          ),

          const SizedBox(height: 16),

          // Price and cuisine chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: const Icon(Icons.attach_money, size: 16),
                label: Text(
                  GastronomyNormalizationHelper.formatPriceTag(
                    detail.priceBand,
                  ),
                ),
              ),
              for (final cuisine in detail.cuisines)
                Chip(
                  label: Text(
                    GastronomyNormalizationHelper.formatCuisine(cuisine),
                  ),
                ),
              for (final dietary in detail.dietary)
                Chip(
                  avatar: const Icon(Icons.eco, size: 16, color: Colors.green),
                  label: Text(
                    GastronomyNormalizationHelper.formatDietary(dietary),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16),

          // Facilities
          _buildFacilities(theme, detail),

          const SizedBox(height: 24),

          // Description
          if (detail.description != null) ...[
            Text('About', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(detail.description!, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 16),
          ],

          // Menu section
          if (detail.menu.isNotEmpty) ...[
            Text('Menu', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            _buildMenu(theme, detail.menu),
            const SizedBox(height: 24),
          ],

          // Opening hours
          if (detail.openingHours != null) ...[
            Text('Opening Hours', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            _buildOpeningHours(theme, detail.openingHours!),
            const SizedBox(height: 24),
          ],

          // Address
          if (detail.address != null) ...[
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Address'),
              subtitle: Text(detail.address!),
              contentPadding: EdgeInsets.zero,
            ),
          ],

          // Phone
          if (detail.phone != null) ...[
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle: Text(detail.phone!),
              contentPadding: EdgeInsets.zero,
              onTap: () => _callPhone(detail.phone!),
            ),
          ],

          const SizedBox(height: 80), // Space for bottom bar
        ]),
      ),
    );
  }

  Widget _buildRatingBadge(ThemeData theme, GastronomyPlaceDetail detail) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.amber[700], size: 20),
              const SizedBox(width: 4),
              Text(
                detail.rating!.toStringAsFixed(1),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (detail.reviewCount != null)
            Text(
              '${detail.reviewCount} reviews',
              style: theme.textTheme.labelSmall,
            ),
        ],
      ),
    );
  }

  Widget _buildFacilities(ThemeData theme, GastronomyPlaceDetail detail) {
    final facilities = <Widget>[];

    if (detail.kidFriendly == true) {
      facilities.add(
        Chip(
          avatar: const Icon(Icons.child_care, size: 16),
          label: const Text('Kid-Friendly'),
        ),
      );
    }

    if (detail.dogFriendly == true) {
      facilities.add(
        Chip(
          avatar: const Icon(Icons.pets, size: 16),
          label: const Text('Dog-Friendly'),
        ),
      );
    }

    if (detail.noiseLevel != null) {
      facilities.add(
        Chip(
          avatar: Icon(
            detail.noiseLevel == NoiseLevel.quiet
                ? Icons.volume_off
                : detail.noiseLevel == NoiseLevel.moderate
                ? Icons.volume_down
                : Icons.volume_up,
            size: 16,
          ),
          label: Text(
            GastronomyNormalizationHelper.formatNoiseLevel(detail.noiseLevel!),
          ),
        ),
      );
    }

    if (facilities.isEmpty) return const SizedBox.shrink();

    return Wrap(spacing: 8, runSpacing: 8, children: facilities);
  }

  Widget _buildMenu(ThemeData theme, List<MenuItem> menu) {
    return Column(
      children: menu.map((item) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              Expanded(child: Text(item.name)),
              if (item.price != null)
                Text(
                  '${item.currency ?? '€'}${item.price!.toStringAsFixed(2)}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          subtitle: item.description != null
              ? Text(
                  item.description!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                )
              : null,
          trailing: item.dietary.isNotEmpty
              ? Wrap(
                  spacing: 4,
                  children: item.dietary
                      .map(
                        (d) => Icon(Icons.eco, size: 14, color: Colors.green),
                      )
                      .toList(),
                )
              : null,
        );
      }).toList(),
    );
  }

  Widget _buildOpeningHours(ThemeData theme, GastronomyOpeningHours hours) {
    final days = [
      ('Monday', hours.monday),
      ('Tuesday', hours.tuesday),
      ('Wednesday', hours.wednesday),
      ('Thursday', hours.thursday),
      ('Friday', hours.friday),
      ('Saturday', hours.saturday),
      ('Sunday', hours.sunday),
    ];

    return Column(
      children: days.map((day) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(day.$1, style: theme.textTheme.bodyMedium),
              ),
              Expanded(
                child: Text(
                  day.$2 ?? 'Closed',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: day.$2 == 'Closed' || day.$2 == null
                        ? theme.colorScheme.error
                        : theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomBar(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (_detail?.phone != null)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _callPhone(_detail!.phone!),
                  icon: const Icon(Icons.phone),
                  label: const Text('Call'),
                ),
              ),
            if (_detail?.phone != null && _detail?.website != null)
              const SizedBox(width: 12),
            if (_detail?.website != null)
              Expanded(
                child: FilledButton.icon(
                  onPressed: _openWebsite,
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Website'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _openWebsite() async {
    final website = _detail?.website;
    if (website == null) return;

    final uri = Uri.tryParse(website);
    if (uri == null) return;

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open website')));
      }
    }
  }

  Future<void> _callPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
