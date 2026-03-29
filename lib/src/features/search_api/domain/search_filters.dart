import 'package:dastan/src/features/search_platform/domain/search_models.dart';

/// Open-now filter for gastronomy/entertainment venues.
/// Implements Phase D of Story 21.
class OpenNowFilter {
  /// Check if a venue is currently open.
  /// Takes into account the itinerary timezone.
  static bool isOpen({
    required Map<String, String>? openingHours,
    required String timezone,
    DateTime? checkTime,
  }) {
    if (openingHours == null || openingHours.isEmpty) {
      return false;
    }

    final now = checkTime ?? DateTime.now();
    final dayOfWeek = _getDayName(now.weekday);
    final hoursString = openingHours[dayOfWeek];

    if (hoursString == null || hoursString.toLowerCase() == 'closed') {
      return false;
    }

    return _isWithinHours(hoursString, now);
  }

  /// Parse hours string and check if current time is within range.
  static bool _isWithinHours(String hoursString, DateTime now) {
    // Parse format: "HH:MM - HH:MM"
    final parts = hoursString.split(' - ');
    if (parts.length != 2) return false;

    final open = _parseTime(parts[0].trim());
    final close = _parseTime(parts[1].trim());

    if (open == null || close == null) return false;

    final currentMinutes = now.hour * 60 + now.minute;

    // Handle overnight hours (e.g., "22:00 - 02:00")
    if (close < open) {
      return currentMinutes >= open || currentMinutes <= close;
    }

    return currentMinutes >= open && currentMinutes <= close;
  }

  /// Parse time string to minutes since midnight.
  static int? _parseTime(String time) {
    final parts = time.split(':');
    if (parts.length != 2) return null;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) return null;
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) return null;

    return hour * 60 + minute;
  }

  /// Get day name from weekday number.
  static String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'monday';
      case 2:
        return 'tuesday';
      case 3:
        return 'wednesday';
      case 4:
        return 'thursday';
      case 5:
        return 'friday';
      case 6:
        return 'saturday';
      case 7:
        return 'sunday';
      default:
        return 'monday';
    }
  }

  /// Normalize opening hours from various formats to standard format.
  static Map<String, String> normalizeHours(Map<String, dynamic>? input) {
    if (input == null) return {};

    final result = <String, String>{};
    for (final entry in input.entries) {
      final key = entry.key.toLowerCase();
      final value = entry.value?.toString() ?? 'closed';
      result[key] = value;
    }
    return result;
  }
}

/// Bounds filter for viewport-based filtering.
class BoundsFilter {
  /// Filter items to only those within bounds.
  static List<SearchResultItem> filterByBounds(
    List<SearchResultItem> items,
    double north,
    double south,
    double east,
    double west,
  ) {
    return items.where((item) {
      if (item.latitude == null || item.longitude == null) return false;
      return _isWithinBounds(
        item.latitude!,
        item.longitude!,
        north,
        south,
        east,
        west,
      );
    }).toList();
  }

  /// Check if a point is within bounds.
  static bool _isWithinBounds(
    double lat,
    double lng,
    double north,
    double south,
    double east,
    double west,
  ) {
    final latOk = lat >= south && lat <= north;

    // Handle crossing the antimeridian
    bool lngOk;
    if (west <= east) {
      lngOk = lng >= west && lng <= east;
    } else {
      // Crosses antimeridian
      lngOk = lng >= west || lng <= east;
    }

    return latOk && lngOk;
  }
}

/// Text sanitizer for security.
class TextSanitizer {
  /// Strip HTML tags from text.
  static String stripHtml(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '');
  }

  /// Validate and sanitize URLs.
  static String? sanitizeUrl(String? url) {
    if (url == null) return null;

    // Check for allowed protocols
    final uri = Uri.tryParse(url);
    if (uri == null) return null;

    if (!['http', 'https'].contains(uri.scheme.toLowerCase())) {
      return null;
    }

    // Block suspicious domains
    final suspiciousDomains = ['localhost', '127.0.0.1', '0.0.0.0'];
    if (suspiciousDomains.contains(uri.host.toLowerCase())) {
      return null;
    }

    return url;
  }

  /// Sanitize text content.
  static String sanitizeText(String text, {int maxLength = 1000}) {
    final cleaned = stripHtml(text);
    return cleaned.length > maxLength
        ? cleaned.substring(0, maxLength)
        : cleaned;
  }
}
