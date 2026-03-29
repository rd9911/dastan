import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';

/// Helper for events data normalization and key generation.
///
/// Following Riverpod architecture - pure functions in application layer.
class EventsNormalizationHelper {
  /// Generates a deterministic dedupe key for an event.
  ///
  /// Format: `events-{itineraryId}-{title}-{start}-{venue.name}-{website}`
  /// Used for SavedItem deduplication within an itinerary.
  static String generateDedupeKey({
    required String itineraryId,
    required EventCard item,
  }) {
    final normalizedTitle = item.title.toLowerCase();
    final venueName = item.venue.name.toLowerCase();
    final startStr = item.start.toIso8601String().split('T').first;
    final website = item.website ?? '';

    final parts = [
      'events',
      itineraryId,
      normalizedTitle,
      startStr,
      venueName,
      website,
    ].where((part) => part.isNotEmpty).join('-');

    return parts;
  }

  /// Generates a deterministic dedupe key from full detail.
  static String generateDedupeKeyFromDetail({
    required String itineraryId,
    required EventDetail detail,
  }) {
    final normalizedTitle = detail.title.toLowerCase();
    final venueName = detail.venue.name.toLowerCase();
    final startStr = detail.start.toIso8601String().split('T').first;
    final website = detail.website ?? '';

    final parts = [
      'events',
      itineraryId,
      normalizedTitle,
      startStr,
      venueName,
      website,
    ].where((part) => part.isNotEmpty).join('-');

    return parts;
  }

  /// Generates a SHA-256 cache key from search request.
  ///
  /// Includes place, date window, filters, and sort for cache differentiation.
  static String generateSearchCacheKey(EventsSearchRequest request) {
    final components = <String>[
      request.itineraryId,
      request.place.granularity.name,
      request.place.value.toLowerCase(),
      request.sort.name,
    ];

    // Add date window if present
    if (request.dateWindow != null) {
      components.add('start:${request.dateWindow!.start.toIso8601String()}');
      components.add('end:${request.dateWindow!.end.toIso8601String()}');
    }

    // Add filter components
    if (request.filters != null) {
      final filters = request.filters!;

      if (filters.categories.isNotEmpty) {
        final sortedCategories = List<String>.from(
          filters.categories.map((c) => c.name),
        )..sort();
        components.add('categories:${sortedCategories.join(',')}');
      }

      if (filters.duringMyDates == true) {
        components.add('duringMyDates');
      }

      if (filters.free == true) {
        components.add('free');
      }

      if (filters.familyFriendly == true) {
        components.add('familyFriendly');
      }

      if (filters.thisWeekend == true) {
        components.add('thisWeekend');
      }

      if (filters.today == true) {
        components.add('today');
      }
    }

    final combined = components.join('|');
    final bytes = utf8.encode(combined);
    final digest = sha256.convert(bytes);

    return digest.toString();
  }

  /// Formats event category for display.
  static String formatCategory(EventCategory category) {
    switch (category) {
      case EventCategory.concert:
        return 'Concert';
      case EventCategory.theatre:
        return 'Theatre';
      case EventCategory.sports:
        return 'Sports';
      case EventCategory.festival:
        return 'Festival';
      case EventCategory.exhibition:
        return 'Exhibition';
      case EventCategory.conference:
        return 'Conference';
      case EventCategory.comedy:
        return 'Comedy';
      case EventCategory.film:
        return 'Film';
      case EventCategory.food:
        return 'Food & Drink';
      case EventCategory.nightlife:
        return 'Nightlife';
      case EventCategory.community:
        return 'Community';
      case EventCategory.other:
        return 'Other';
    }
  }

  /// Formats date and time for display.
  static String formatEventDateTime(DateTime dateTime) {
    final dateFormat = DateFormat('d MMM');
    final timeFormat = DateFormat('HH:mm');
    return '${dateFormat.format(dateTime)} ${timeFormat.format(dateTime)}';
  }

  /// Formats date only for display.
  static String formatEventDate(DateTime date) {
    final dateFormat = DateFormat('d MMM yyyy');
    return dateFormat.format(date);
  }

  /// Formats time only for display.
  static String formatEventTime(DateTime time) {
    final timeFormat = DateFormat('HH:mm');
    return timeFormat.format(time);
  }

  /// Formats distance for display.
  static String formatDistance(int? meters) {
    if (meters == null) return 'Unknown';

    if (meters < 1000) {
      return '${meters}m';
    } else {
      final km = meters / 1000;
      return '${km.toStringAsFixed(1)}km';
    }
  }

  /// Gets an icon name for a category.
  static String getCategoryIcon(EventCategory category) {
    switch (category) {
      case EventCategory.concert:
        return 'music_note';
      case EventCategory.theatre:
        return 'theater_comedy';
      case EventCategory.sports:
        return 'sports';
      case EventCategory.festival:
        return 'celebration';
      case EventCategory.exhibition:
        return 'museum';
      case EventCategory.conference:
        return 'groups';
      case EventCategory.comedy:
        return 'sentiment_very_satisfied';
      case EventCategory.film:
        return 'movie';
      case EventCategory.food:
        return 'restaurant';
      case EventCategory.nightlife:
        return 'nightlife';
      case EventCategory.community:
        return 'people';
      case EventCategory.other:
        return 'event';
    }
  }
}
