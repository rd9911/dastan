import '../domain/transport_item.dart';
import '../domain/transport_search_request.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Normalizes a transport item for UI display or deduplication
class TransportNormalizationHelper {
  /// Generates a unified cache key for the search request
  static String generateSearchCacheKey(TransportSearchRequest request) {
    // We normalize by creating a deterministic string from the request parameters
    // that affect the result (legs, passengers, cabin class).
    // Filters might or might not affect the underlying API call depending on backend.
    // Assuming backend filters, we include them.

    final buffer = StringBuffer();
    buffer.write('${request.tripType.name}|');

    for (final leg in request.legs) {
      buffer.write(
        '${leg.origin}-${leg.destination}-${leg.departDate.millisecondsSinceEpoch}-${leg.mode.name}|',
      );
      if (leg.returnDate != null) {
        buffer.write('ret:${leg.returnDate!.millisecondsSinceEpoch}|');
      }
    }

    // Sort passengers keys to ensure stable key
    final passengerKeys = request.passengers.keys.toList()..sort();
    for (final key in passengerKeys) {
      buffer.write('p:$key=${request.passengers[key]}|');
    }

    if (request.filters != null) {
      if (request.filters!.cabinClass != null) {
        buffer.write('c:${request.filters!.cabinClass}|');
      }
      if (request.filters!.maxStops != null) {
        buffer.write('s:${request.filters!.maxStops}|');
      }
    }

    // Hash it for a shorter key
    final bytes = utf8.encode(buffer.toString());
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Generates a deterministic dedupe key for saving transport items
  /// Format: transport-{mode}-{origin}-{destination}-{departAt}-{vendor}
  static String generateTransportDedupeKey(TransportItem item) {
    if (item.segments.isEmpty) return item.id;

    final firstSegment = item.segments.first;
    final lastSegment = item.segments.last;
    final mode = item.mode.name;
    final origin = firstSegment.origin;
    final destination = lastSegment.destination;
    final departAt = firstSegment.departure.millisecondsSinceEpoch;
    // Use first provider as vendor or fallback
    final vendor = item.providers.isNotEmpty
        ? item.providers.first.name
        : 'unknown';

    return 'transport-$mode-$origin-$destination-$departAt-$vendor'
        .toLowerCase();
  }

  /// Partitions items by mode for tabs
  static Map<TransportMode, List<TransportItem>> partitionByMode(
    List<TransportItem> items,
  ) {
    final Map<TransportMode, List<TransportItem>> buckets = {
      TransportMode.flight: [],
      TransportMode.train: [],
      TransportMode.bus: [],
    };

    for (final item in items) {
      if (buckets.containsKey(item.mode)) {
        buckets[item.mode]!.add(item);
      }
      // If 'any' or unknown, decide logic. For now, we only bucket strictly.
    }
    return buckets;
  }
}
