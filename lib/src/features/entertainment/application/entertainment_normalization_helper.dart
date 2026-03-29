import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';

/// Helper for entertainment deduplication and cache key generation.
///
/// Follows the Riverpod architecture - this is an application-layer utility
/// that provides pure functions for key generation without external dependencies.
class EntertainmentNormalizationHelper {
  /// Generates a deterministic dedupe key for an entertainment item.
  ///
  /// Key format: `entertainment-{itineraryId}-{name}-{tag}-{website?}`
  ///
  /// This ensures the same place for the same itinerary is deduplicated.
  /// The key is bound to the itinerary to allow saving the same place
  /// in different itineraries.
  static String generateDedupeKey({
    required String itineraryId,
    required EntertainmentResultCard item,
  }) {
    final name = item.name.toLowerCase().trim();
    final tag = item.tag.name;
    final website = item.website ?? '';

    return 'entertainment-$itineraryId-$name-$tag${website.isNotEmpty ? '-$website' : ''}';
  }

  /// Generates a deterministic dedupe key from detail.
  static String generateDedupeKeyFromDetail({
    required String itineraryId,
    required EntertainmentPlaceDetail detail,
  }) {
    final name = detail.name.toLowerCase().trim();
    final tag = detail.tag.name;
    final website = detail.website ?? '';

    return 'entertainment-$itineraryId-$name-$tag${website.isNotEmpty ? '-$website' : ''}';
  }

  /// Generates a cache key for a search request.
  ///
  /// Uses SHA-256 hash of normalized request parameters.
  /// Cache keys are used to avoid redundant API calls for identical searches.
  static String generateSearchCacheKey(EntertainmentSearchRequest request) {
    final buffer = StringBuffer();

    // Core parameters
    buffer.write('place:${request.place.value.toLowerCase().trim()}');
    buffer.write('|granularity:${request.place.granularity.name}');

    // Coordinates if present
    if (request.place.latitude != null) {
      buffer.write('|lat:${request.place.latitude}');
      buffer.write('|lng:${request.place.longitude}');
    }

    // Date range if present
    if (request.dateRange != null) {
      buffer.write('|start:${_formatDate(request.dateRange!.start)}');
      buffer.write('|end:${_formatDate(request.dateRange!.end)}');
    }

    // Tags (sorted for determinism)
    if (request.tags.isNotEmpty) {
      final sortedTags = List<String>.from(request.tags.map((t) => t.name))
        ..sort();
      buffer.write('|tags:${sortedTags.join(",")}');
    }

    // Sort
    buffer.write('|sort:${request.sort.name}');

    // Filters (if present)
    if (request.filters != null) {
      final f = request.filters!;
      if (f.openNow == true) buffer.write('|openNow');
      if (f.freeEntry == true) buffer.write('|free');
      if (f.kidFriendly == true) buffer.write('|kidFriendly');
      if (f.accessible == true) buffer.write('|accessible');
      if (f.minRating != null) buffer.write('|minRating:${f.minRating}');
      if (f.maxDistance != null) buffer.write('|maxDist:${f.maxDistance}');
    }

    // Hash the normalized string
    final bytes = utf8.encode(buffer.toString());
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Formats a date for use in cache keys.
  static String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  /// Returns a human-readable distance string.
  static String formatDistance(int? meters) {
    if (meters == null) return 'Unknown';
    if (meters < 1000) return '${meters}m';
    return '${(meters / 1000).toStringAsFixed(1)}km';
  }

  /// Returns a tag display name.
  static String formatTag(EntertainmentTag tag) {
    switch (tag) {
      case EntertainmentTag.museum:
        return 'Museum';
      case EntertainmentTag.garden:
        return 'Garden';
      case EntertainmentTag.landmark:
        return 'Landmark';
      case EntertainmentTag.architecture:
        return 'Architecture';
      case EntertainmentTag.viewpoint:
        return 'Viewpoint';
      case EntertainmentTag.park:
        return 'Park';
      case EntertainmentTag.historicSite:
        return 'Historic Site';
      case EntertainmentTag.artGallery:
        return 'Art Gallery';
      case EntertainmentTag.theater:
        return 'Theater';
      case EntertainmentTag.zoo:
        return 'Zoo';
      case EntertainmentTag.aquarium:
        return 'Aquarium';
      case EntertainmentTag.themePark:
        return 'Theme Park';
      case EntertainmentTag.beach:
        return 'Beach';
      case EntertainmentTag.natureReserve:
        return 'Nature Reserve';
      case EntertainmentTag.monument:
        return 'Monument';
    }
  }
}
