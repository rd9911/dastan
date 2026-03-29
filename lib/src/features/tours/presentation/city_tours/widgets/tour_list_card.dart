import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

class TourListCard extends StatelessWidget {
  const TourListCard({
    super.key,
    required this.tour,
    this.onTap,
    this.heroTagPrefix = 'tour-hero',
  });

  final TourSummary tour;
  final VoidCallback? onTap;
  final String heroTagPrefix;

  String _formatDuration(int minutes) {
    if (minutes < 60) return '${minutes}m';
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (mins == 0) return '${hours}h';
    return '${hours}h ${mins}m';
  }

  String _formatPrice() {
    if (tour.isFree) return 'Free';
    return '\$${tour.priceUsd.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Thumbnail
              SizedBox(
                width: 120,
                child: Hero(
                  tag: '$heroTagPrefix-${tour.id}',
                  child: CachedNetworkImage(
                    imageUrl: tour.mainImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.error, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              // Details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tour.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tour.tagline,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            _formatDuration(tour.durationMinutes),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
                          ),
                          const Spacer(),
                          if (tour.averageRating != null) ...[
                            const Icon(Icons.star, size: 16, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              tour.averageRating!.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(${tour.reviewCount})',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                            ),
                            const SizedBox(width: 12),
                          ],
                          Text(
                            _formatPrice(),
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: tour.isFree ? Colors.green : null,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
