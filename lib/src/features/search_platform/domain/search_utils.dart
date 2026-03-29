import 'package:dastan/src/features/search_platform/domain/search_models.dart';

/// Utility class for generating semantic dedupe keys.
/// Identical entities from different providers should produce the same key.
class DedupeKeyGenerator {
  /// Generate dedupe key based on vertical and item properties.
  static String makeDedupeKey(
    SearchVertical vertical,
    Map<String, dynamic> item,
  ) {
    switch (vertical) {
      case SearchVertical.transport:
        return _transportKey(item);
      case SearchVertical.accommodation:
        return _accommodationKey(item);
      case SearchVertical.entertainment:
        return _entertainmentKey(item);
      case SearchVertical.gastronomy:
        return _gastronomyKey(item);
      case SearchVertical.events:
        return _eventsKey(item);
      case SearchVertical.trails:
        return _trailsKey(item);
    }
  }

  /// Transport: origin|dest|depart|carrier|number
  static String _transportKey(Map<String, dynamic> item) {
    final origin = _normalize(item['origin'] ?? item['originCode'] ?? '');
    final dest = _normalize(item['destination'] ?? item['destCode'] ?? '');
    final depart = _normalizeDateTime(
      item['departureTime'] ?? item['departure'],
    );
    final carrier = _normalize(item['carrier'] ?? item['airline'] ?? '');
    final number = _normalize(item['flightNumber'] ?? item['number'] ?? '');
    return 'transport:$origin|$dest|$depart|$carrier|$number';
  }

  /// Accommodation: name|geo|address
  static String _accommodationKey(Map<String, dynamic> item) {
    final name = _normalize(item['name'] ?? item['title'] ?? '');
    final lat = _normalizeCoord(item['latitude'] ?? item['lat']);
    final lng = _normalizeCoord(
      item['longitude'] ?? item['lng'] ?? item['lon'],
    );
    final address = _normalize(item['address'] ?? '');
    return 'accommodation:$name|$lat,$lng|$address';
  }

  /// Entertainment: name|geo|type
  static String _entertainmentKey(Map<String, dynamic> item) {
    final name = _normalize(item['name'] ?? item['title'] ?? '');
    final lat = _normalizeCoord(item['latitude'] ?? item['lat']);
    final lng = _normalizeCoord(
      item['longitude'] ?? item['lng'] ?? item['lon'],
    );
    final type = _normalize(item['type'] ?? item['category'] ?? '');
    return 'entertainment:$name|$lat,$lng|$type';
  }

  /// Gastronomy: name|geo|cuisine
  static String _gastronomyKey(Map<String, dynamic> item) {
    final name = _normalize(item['name'] ?? item['title'] ?? '');
    final lat = _normalizeCoord(item['latitude'] ?? item['lat']);
    final lng = _normalizeCoord(
      item['longitude'] ?? item['lng'] ?? item['lon'],
    );
    final cuisine = _normalize(item['cuisine'] ?? item['cuisineType'] ?? '');
    return 'gastronomy:$name|$lat,$lng|$cuisine';
  }

  /// Events: name|venue|startTime
  static String _eventsKey(Map<String, dynamic> item) {
    final name = _normalize(item['name'] ?? item['title'] ?? '');
    final venue = _normalize(item['venue'] ?? item['location'] ?? '');
    final start = _normalizeDateTime(item['startTime'] ?? item['date']);
    return 'events:$name|$venue|$start';
  }

  /// Trails: name|geo|distance
  static String _trailsKey(Map<String, dynamic> item) {
    final name = _normalize(item['name'] ?? item['title'] ?? '');
    final lat = _normalizeCoord(item['latitude'] ?? item['lat']);
    final lng = _normalizeCoord(
      item['longitude'] ?? item['lng'] ?? item['lon'],
    );
    final distance = item['distance'] ?? item['length'] ?? 0;
    return 'trails:$name|$lat,$lng|${distance.toString()}';
  }

  /// Normalize string: lowercase, trim, remove extra spaces.
  static String _normalize(String value) {
    return value.toLowerCase().trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Normalize coordinate to 4 decimal places.
  static String _normalizeCoord(dynamic value) {
    if (value == null) return '0';
    final num = double.tryParse(value.toString()) ?? 0;
    return num.toStringAsFixed(4);
  }

  /// Normalize datetime to ISO date (YYYY-MM-DD).
  static String _normalizeDateTime(dynamic value) {
    if (value == null) return '';
    if (value is DateTime) {
      return '${value.year}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}';
    }
    // Try parsing string
    try {
      final dt = DateTime.parse(value.toString());
      return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return value.toString();
    }
  }
}

/// Validator for search queries and responses.
class SearchValidator {
  /// Validate a SearchQuery.
  static List<String> validateQuery(SearchQuery query) {
    final errors = <String>[];

    // Validate page size
    if (query.pageSize < 1) {
      errors.add('pageSize must be at least 1');
    }
    if (query.pageSize > 100) {
      errors.add('pageSize must be at most 100');
    }

    // Validate page number
    if (query.page < 0) {
      errors.add('page must be >= 0');
    }

    // Validate context
    if (query.context.locale.isEmpty) {
      errors.add('locale is required');
    }
    if (query.context.currency.isEmpty) {
      errors.add('currency is required');
    }

    return errors;
  }

  /// Validate a SearchResultItem.
  static List<String> validateItem(SearchResultItem item) {
    final errors = <String>[];

    if (item.id.isEmpty) {
      errors.add('id is required');
    }
    if (item.dedupeKey.isEmpty) {
      errors.add('dedupeKey is required');
    }
    if (item.title.isEmpty) {
      errors.add('title is required');
    }

    // Validate coordinates if present
    if (item.latitude != null) {
      if (item.latitude! < -90 || item.latitude! > 90) {
        errors.add('latitude must be between -90 and 90');
      }
    }
    if (item.longitude != null) {
      if (item.longitude! < -180 || item.longitude! > 180) {
        errors.add('longitude must be between -180 and 180');
      }
    }

    // Validate rating if present
    if (item.rating != null) {
      if (item.rating! < 0 || item.rating! > 5) {
        errors.add('rating must be between 0 and 5');
      }
    }

    return errors;
  }

  /// Sanitize URL to remove tracking params and validate format.
  static String? sanitizeUrl(String? url) {
    if (url == null || url.isEmpty) return null;

    try {
      final uri = Uri.parse(url);
      // Only allow http/https
      if (uri.scheme != 'http' && uri.scheme != 'https') {
        return null;
      }
      // Remove common tracking params
      final cleanParams = Map<String, dynamic>.from(uri.queryParameters)
        ..removeWhere(
          (key, _) =>
              key.startsWith('utm_') ||
              key == 'ref' ||
              key == 'source' ||
              key == 'fbclid' ||
              key == 'gclid',
        );
      return uri
          .replace(
            queryParameters: cleanParams.isEmpty ? null : cleanParams.cast(),
          )
          .toString();
    } catch (_) {
      return null;
    }
  }
}
