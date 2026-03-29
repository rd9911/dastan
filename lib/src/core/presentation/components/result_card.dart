import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../features/accommodation/domain/accommodation_result.dart';
import '../../../features/entertainment/application/entertainment_normalization_helper.dart';
import '../../../features/entertainment/domain/entertainment_models.dart';
import '../../../features/events/application/events_normalization_helper.dart';
import '../../../features/events/domain/events_models.dart';
import '../../../features/gastronomy/application/gastronomy_normalization_helper.dart';
import '../../../features/gastronomy/domain/gastronomy_models.dart';
import '../../../features/trails/application/trails_normalization_helper.dart';
import '../../../features/trails/domain/trails_models.dart';
import '../../../features/transport/domain/transport_result.dart';

/// Sealed class hierarchy for result card data.
sealed class ResultCardData {
  const ResultCardData();
}

/// Transport result card data.
class TransportResultCardData extends ResultCardData {
  final TransportResult result;
  final VoidCallback onTap;
  final Widget? trailing;
  const TransportResultCardData({
    required this.result,
    required this.onTap,
    this.trailing,
  });
}

/// Accommodation result card data.
class AccommodationResultCardData extends ResultCardData {
  final AccommodationResult result;
  final VoidCallback onTap;
  final Widget? trailing;
  const AccommodationResultCardData({
    required this.result,
    required this.onTap,
    this.trailing,
  });
}

/// Entertainment result card data.
class EntertainmentResultCardData extends ResultCardData {
  final EntertainmentResultCard item;
  final VoidCallback onTap;
  final VoidCallback onSave;
  const EntertainmentResultCardData({
    required this.item,
    required this.onTap,
    required this.onSave,
  });
}

/// Event result card data.
class EventResultCardData extends ResultCardData {
  final EventCard item;
  final VoidCallback onTap;
  final VoidCallback onSave;
  const EventResultCardData({
    required this.item,
    required this.onTap,
    required this.onSave,
  });
}

/// Gastronomy result card data.
class GastronomyResultCardData extends ResultCardData {
  final GastronomyResultCard item;
  final VoidCallback onTap;
  final VoidCallback onSave;
  const GastronomyResultCardData({
    required this.item,
    required this.onTap,
    required this.onSave,
  });
}

/// Trail result card data.
class TrailResultCardData extends ResultCardData {
  final TrailCard item;
  final VoidCallback onTap;
  final VoidCallback onSave;
  const TrailResultCardData({
    required this.item,
    required this.onTap,
    required this.onSave,
  });
}

/// A unified result card component.
class ResultCard extends StatefulWidget {
  final ResultCardData data;
  const ResultCard({super.key, required this.data});
  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  int _currentPhotoIndex = 0;
  @override
  Widget build(BuildContext context) {
    return switch (widget.data) {
      TransportResultCardData data => _buildTransportCard(context, data),
      AccommodationResultCardData data => _buildAccommodationCard(
        context,
        data,
      ),
      EntertainmentResultCardData data => _buildEntertainmentCard(
        context,
        data,
      ),
      EventResultCardData data => _buildEventCard(context, data),
      GastronomyResultCardData data => _buildGastronomyCard(context, data),
      TrailResultCardData data => _buildTrailCard(context, data),
    };
  }

  // ─────────────────────────────────────────────────────────────────────────
  // TRANSPORT CARD (compact, no image)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildTransportCard(
    BuildContext context,
    TransportResultCardData data,
  ) {
    final result = data.result;
    final dateFormat = DateFormat('HH:mm');
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: data.onTap,
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
                      result.vendor ?? 'Unknown',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${result.currency} ${result.priceAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      if (data.trailing != null) ...[
                        const SizedBox(width: 8),
                        data.trailing!,
                      ],
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(_getModeIcon(result.mode), size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${result.origin} → ${result.destination}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${dateFormat.format(result.departAt)} - ${dateFormat.format(result.arriveAt)} (${result.durationMinutes} min)',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getModeIcon(TransportMode mode) {
    switch (mode) {
      case TransportMode.flight:
        return Icons.flight;
      case TransportMode.train:
        return Icons.train;
      case TransportMode.bus:
        return Icons.directions_bus;
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // ACCOMMODATION CARD (with image)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildAccommodationCard(
    BuildContext context,
    AccommodationResultCardData data,
  ) {
    final result = data.result;
    final dateFormat = DateFormat('MMM dd');
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: data.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            if (result.imageUrl != null)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  result.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      _getAccommodationTypeIcon(result.type),
                      size: 48,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          result.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${result.currency} ${result.pricePerNight.toStringAsFixed(0)}/night',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor,
                            ),
                          ),
                          if (data.trailing != null) ...[
                            const SizedBox(width: 8),
                            data.trailing!,
                          ],
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(_getAccommodationTypeIcon(result.type), size: 16),
                      const SizedBox(width: 8),
                      Text(result.type.name.toUpperCase()),
                      const Spacer(),
                      Text('⭐ ${result.rating?.toStringAsFixed(1) ?? "N/A"}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${dateFormat.format(result.checkIn)} - ${dateFormat.format(result.checkOut)}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getAccommodationTypeIcon(AccommodationType type) {
    switch (type) {
      case AccommodationType.hotel:
        return Icons.hotel;
      case AccommodationType.hostel:
        return Icons.single_bed;
      case AccommodationType.apartment:
        return Icons.apartment;
      case AccommodationType.resort:
        return Icons.beach_access;
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // ENTERTAINMENT CARD (rich with image)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildEntertainmentCard(
    BuildContext context,
    EntertainmentResultCardData data,
  ) {
    final item = data.item;
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: data.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                item.thumbnail,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: theme.colorScheme.outline,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (item.rating != null) ...[
                        Icon(Icons.star, size: 18, color: Colors.amber[700]),
                        const SizedBox(width: 4),
                        Text(
                          item.rating!.toStringAsFixed(1),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Tag and distance chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          EntertainmentNormalizationHelper.formatTag(item.tag),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ),
                      if (item.distance != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.directions_walk,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              EntertainmentNormalizationHelper.formatDistance(
                                item.distance,
                              ),
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      if (item.isOpen == true)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 14,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Open',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  // Description
                  if (item.shortDescription != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      item.shortDescription!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  // Actions
                  _buildActionButtons(
                    context,
                    onDetails: data.onTap,
                    onSave: data.onSave,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // EVENT CARD (rich with image)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildEventCard(BuildContext context, EventResultCardData data) {
    final item = data.item;
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: data.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                item.leadImage,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.event,
                    size: 48,
                    color: theme.colorScheme.outline,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        EventsNormalizationHelper.formatCategory(
                          item.category,
                        ).toUpperCase(),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      if (item.isFree == true)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'FREE',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        EventsNormalizationHelper.formatEventDateTime(
                          item.start,
                        ),
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.venue.name,
                          style: theme.textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Actions
                  _buildActionButtons(
                    context,
                    onDetails: data.onTap,
                    onSave: data.onSave,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // GASTRONOMY CARD (rich with image carousel)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildGastronomyCard(
    BuildContext context,
    GastronomyResultCardData data,
  ) {
    final item = data.item;
    final theme = Theme.of(context);
    final photos = item.photos.isNotEmpty ? item.photos : [item.thumbnail];
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: data.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Swipeable photo carousel
            Stack(
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
                                : theme.colorScheme.outline.withValues(
                                    alpha: 0.5,
                                  ),
                          ),
                        );
                      }),
                    ),
                  ),
                // Price tag badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      GastronomyNormalizationHelper.formatPriceTag(
                        item.priceBand,
                      ),
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and rating
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (item.rating != null) ...[
                        Icon(Icons.star, size: 18, color: Colors.amber[700]),
                        const SizedBox(width: 4),
                        Text(
                          item.rating!.toStringAsFixed(1),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Badges row
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      if (item.cuisines.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            GastronomyNormalizationHelper.formatCuisine(
                              item.cuisines.first,
                            ),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ),
                      if (item.distance != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.directions_walk,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              GastronomyNormalizationHelper.formatDistance(
                                item.distance,
                              ),
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      if (item.isOpen == true)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 14,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Open',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      // Dietary icons
                      for (final dietary in item.dietary.take(2))
                        Icon(
                          _getDietaryIcon(dietary),
                          size: 16,
                          color: Colors.green[700],
                        ),
                    ],
                  ),
                  // Short description
                  if (item.shortDescription != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      item.shortDescription!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  // Actions
                  _buildActionButtons(
                    context,
                    onDetails: data.onTap,
                    onSave: data.onSave,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getDietaryIcon(DietaryOption option) {
    switch (option) {
      case DietaryOption.vegan:
        return Icons.eco;
      case DietaryOption.vegetarian:
        return Icons.grass;
      case DietaryOption.halal:
        return Icons.verified;
      case DietaryOption.kosher:
        return Icons.stars;
      case DietaryOption.glutenFree:
        return Icons.no_food;
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  // TRAIL CARD (rich with image)
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildTrailCard(BuildContext context, TrailResultCardData data) {
    final item = data.item;
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: data.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                item.thumbnail,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(color: theme.colorScheme.surfaceContainerHighest),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: TrailsNormalizationHelper.getDifficultyColor(
                            item.difficulty,
                          ).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          TrailsNormalizationHelper.getDifficultyLabel(
                            item.difficulty,
                          ).toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: TrailsNormalizationHelper.getDifficultyColor(
                              item.difficulty,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.timer_outlined,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        TrailsNormalizationHelper.formatDuration(
                          item.durationMinutes,
                        ),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.straighten,
                        size: 14,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        TrailsNormalizationHelper.formatDistance(item.lengthKm),
                        style: theme.textTheme.bodySmall,
                      ),
                      if (item.elevationGainM != null) ...[
                        const SizedBox(width: 12),
                        Icon(
                          Icons.terrain,
                          size: 14,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${item.elevationGainM!.round()}m',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Actions
                  _buildActionButtons(
                    context,
                    onDetails: data.onTap,
                    onSave: data.onSave,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────
  // SHARED HELPERS
  // ─────────────────────────────────────────────────────────────────────────
  Widget _buildActionButtons(
    BuildContext context, {
    required VoidCallback onDetails,
    required VoidCallback onSave,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: onDetails,
          icon: const Icon(Icons.info_outline, size: 18),
          label: const Text('Details'),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            visualDensity: VisualDensity.compact,
          ),
        ),
        const SizedBox(width: 8),
        FilledButton.tonalIcon(
          onPressed: onSave,
          icon: const Icon(Icons.bookmark_add_outlined, size: 18),
          label: const Text('Save'),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            visualDensity: VisualDensity.compact,
          ),
        ),
      ],
    );
  }
}
