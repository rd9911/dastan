import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dastan/src/features/accommodation/application/accommodation_providers.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';
import 'package:intl/intl.dart';

/// Detail screen for an accommodation property.
class AccommodationDetailScreen extends ConsumerStatefulWidget {
  final PropertyItem summary;

  const AccommodationDetailScreen({super.key, required this.summary});

  @override
  ConsumerState<AccommodationDetailScreen> createState() =>
      _AccommodationDetailScreenState();
}

class _AccommodationDetailScreenState
    extends ConsumerState<AccommodationDetailScreen> {
  PropertyItem? _fullDetail;
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
      final repository = ref.read(accommodationRepositoryProvider);
      final detail = await repository.getPropertyDetail(
        widget.summary.providerId,
        widget.summary.externalId,
      );

      if (mounted) {
        setState(() {
          _fullDetail = detail;
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
    final item = _fullDetail ?? widget.summary;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(theme, item),
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
          else ...[
            _buildGallery(theme, item),
            _buildContent(theme, item),
          ],
        ],
      ),
      bottomNavigationBar: _buildBottomBar(theme, item),
    );
  }

  Widget _buildAppBar(ThemeData theme, PropertyItem item) {
    return SliverAppBar(
      expandedHeight: 0,
      pinned: true,
      title: Text(item.name),
    );
  }

  Widget _buildGallery(ThemeData theme, PropertyItem item) {
    final images = item.imageUrls.isNotEmpty
        ? item.imageUrls
        : (item.thumbnailUrl != null ? [item.thumbnailUrl!] : []);

    if (images.isEmpty) {
      return SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: theme.colorScheme.surfaceContainerHighest,
            child: Icon(
              Icons.image_not_supported,
              size: 48,
              color: theme.colorScheme.outline,
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
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() => _currentPhotoIndex = index);
              },
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.image_not_supported,
                      size: 48,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                );
              },
            ),
          ),
          if (images.length > 1)
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
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

  Widget _buildContent(ThemeData theme, PropertyItem item) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            item.location,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buildRatingBadge(theme, item),
            ],
          ),

          const SizedBox(height: 16),

          // Amenities
          if (item.amenities.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: item.amenities.map((amenity) {
                return Chip(
                  label: Text(amenity),
                  visualDensity: VisualDensity.compact,
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],

          // Rooms
          if (item.roomMatrix.isNotEmpty) ...[
            Text('Available Rooms', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            ...item.roomMatrix.map((room) => _buildRoomCard(theme, room)),
            const SizedBox(height: 24),
          ],

          // Policies
          if (item.policies != null) ...[
            Text('Policies', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            _buildPolicies(theme, item.policies!),
            const SizedBox(height: 24),
          ],

          const SizedBox(height: 80),
        ]),
      ),
    );
  }

  Widget _buildRatingBadge(ThemeData theme, PropertyItem item) {
    if (item.starRating == null && item.reviewScore == null) {
      return const SizedBox();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          if (item.reviewScore != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.reviewScore!.toStringAsFixed(1),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          if (item.reviewCount != null)
            Text(
              '${item.reviewCount} reviews',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          if (item.starRating != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                item.starRating!,
                (index) => Icon(Icons.star, size: 12, color: Colors.amber[700]),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRoomCard(ThemeData theme, RoomOption room) {
    final currencyFormatter = NumberFormat.currency(
      symbol: room.price.currency,
      decimalDigits: 0,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    room.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  currencyFormatter.format(room.price.total),
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person, size: 16, color: theme.colorScheme.outline),
                const SizedBox(width: 4),
                Text(
                  'Max ${room.maxOccupancy} guests',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(width: 16),
                if (room.boardPlan.isNotEmpty) ...[
                  Icon(
                    Icons.restaurant,
                    size: 16,
                    color: theme.colorScheme.outline,
                  ),
                  const SizedBox(width: 4),
                  Text(room.boardPlan, style: theme.textTheme.bodyMedium),
                ],
              ],
            ),
            if (room.bedConfig != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.bed, size: 16, color: theme.colorScheme.outline),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      room.bedConfig!,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 12),
            if (room.refundable)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Free Cancellation',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Non-refundable',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicies(ThemeData theme, Policies policies) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (policies.houseRules?.checkInTime != null)
              _buildPolicyRow(
                theme,
                'Check-in',
                policies.houseRules!.checkInTime!,
                Icons.login,
              ),
            if (policies.houseRules?.checkOutTime != null)
              _buildPolicyRow(
                theme,
                'Check-out',
                policies.houseRules!.checkOutTime!,
                Icons.logout,
              ),
            if (policies.cancellation?.description != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        policies.cancellation!.description!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyRow(
    ThemeData theme,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Text(label, style: theme.textTheme.bodyMedium),
          const Spacer(),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(ThemeData theme, PropertyItem item) {
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
        child: FilledButton.icon(
          onPressed: () => _openVendorUrl(item.vendorUrl),
          icon: const Icon(Icons.open_in_new),
          label: const Text('View Deal'),
        ),
      ),
    );
  }

  Future<void> _openVendorUrl(String? url) async {
    if (url == null) return;
    final uri = Uri.tryParse(url);
    if (uri == null) return;

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
