import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';

/// Helper for accommodation deduplication and cache key generation.
class AccommodationNormalizationHelper {
  /// Generates a deterministic dedupe key for a property item.
  ///
  /// Key format: `accommodation-{providerId}-{externalId}-{checkIn}-{checkOut}`
  /// This ensures the same property for the same dates is deduplicated.
  static String generateDedupeKey({
    required PropertyItem item,
    required DateTime checkIn,
    required DateTime checkOut,
  }) {
    final checkInStr = _formatDate(checkIn);
    final checkOutStr = _formatDate(checkOut);
    return 'accommodation-${item.providerId}-${item.externalId}-$checkInStr-$checkOutStr';
  }

  /// Generates a cache key for a search request.
  ///
  /// Uses SHA-256 hash of normalized request parameters.
  static String generateSearchCacheKey(AccommodationSearchRequest request) {
    final buffer = StringBuffer();

    // Core parameters
    buffer.write('place:${request.place.toLowerCase().trim()}');
    buffer.write('|checkIn:${_formatDate(request.checkIn)}');
    buffer.write('|checkOut:${_formatDate(request.checkOut)}');

    // Guests - sorted for determinism
    final sortedRooms = request.guests.keys.toList()..sort();
    for (final roomIdx in sortedRooms) {
      final ages = List<int>.from(request.guests[roomIdx]!)..sort();
      buffer.write('|room$roomIdx:${ages.join(",")}');
    }

    // Sort
    buffer.write('|sort:${request.sort.name}');

    // Filters (if present)
    if (request.filters != null) {
      final f = request.filters!;
      if (f.minPrice != null) buffer.write('|minPrice:${f.minPrice}');
      if (f.maxPrice != null) buffer.write('|maxPrice:${f.maxPrice}');
      if (f.propertyTypes != null && f.propertyTypes!.isNotEmpty) {
        final types = f.propertyTypes!.map((t) => t.name).toList()..sort();
        buffer.write('|types:${types.join(",")}');
      }
      if (f.minStarRating != null) {
        buffer.write('|stars:${f.minStarRating}');
      }
      if (f.minReviewScore != null) {
        buffer.write('|review:${f.minReviewScore}');
      }
      if (f.freeCancellation == true) buffer.write('|freeCancellation');
      if (f.payAtProperty == true) buffer.write('|payAtProperty');
      if (f.breakfastIncluded == true) buffer.write('|breakfast');
      if (f.wifi == true) buffer.write('|wifi');
      if (f.parking == true) buffer.write('|parking');
      if (f.pool == true) buffer.write('|pool');
      if (f.petFriendly == true) buffer.write('|pets');
      if (f.accessible == true) buffer.write('|accessible');
    }

    // Hash the normalized string
    final bytes = utf8.encode(buffer.toString());
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Counts total guests across all rooms.
  static int totalGuests(RoomGuests guests) {
    return guests.values.fold<int>(0, (sum, ages) => sum + ages.length);
  }

  /// Counts adults (age >= 18) across all rooms.
  static int totalAdults(RoomGuests guests) {
    return guests.values.fold<int>(
      0,
      (sum, ages) => sum + ages.where((a) => a >= 18).length,
    );
  }

  /// Counts children (age < 18) across all rooms.
  static int totalChildren(RoomGuests guests) {
    return guests.values.fold<int>(
      0,
      (sum, ages) => sum + ages.where((a) => a < 18).length,
    );
  }

  /// Number of rooms
  static int roomCount(RoomGuests guests) => guests.length;

  /// Calculates number of nights between dates.
  static int calculateNights(DateTime checkIn, DateTime checkOut) {
    return checkOut.difference(checkIn).inDays;
  }

  static String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
