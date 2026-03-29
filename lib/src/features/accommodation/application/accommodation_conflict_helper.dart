import 'package:dastan/src/core/domain/saved_item.dart';

/// Helper to detect conflicts between accommodation and transport dates.
class AccommodationConflictHelper {
  /// Checks if an accommodation stay conflicts with saved transport items.
  ///
  /// A conflict exists when:
  /// - Check-out date is after a departure flight date
  /// - Check-in date is before an arrival flight date at the destination
  ///
  /// Returns a list of conflicts found.
  static List<AccommodationConflict> detectConflicts({
    required DateTime checkIn,
    required DateTime checkOut,
    required String destination,
    required List<SavedItem> transportItems,
  }) {
    final conflicts = <AccommodationConflict>[];

    for (final item in transportItems) {
      if (item.section != ItinerarySection.transport) continue;
      if (item.time == null) continue;

      final transportStart = item.time!.start;
      final transportEnd = item.time!.end;

      // Check if this is a departure flight from the destination
      // (i.e., the transport starts at the destination location)
      final details = item.details;
      final origin = details['origin'] as String?;
      final dest = details['destination'] as String?;

      // Case 1: Departure from destination overlaps with stay
      // If flying OUT from the accommodation location, check-out must be on or before departure
      if (origin?.toLowerCase().contains(destination.toLowerCase()) == true) {
        if (checkOut.isAfter(transportStart)) {
          conflicts.add(
            AccommodationConflict(
              type: ConflictType.departureOverlap,
              transportItem: item,
              message:
                  'Check-out (${_formatDate(checkOut)}) is after your '
                  'departure flight at ${_formatTime(transportStart)}',
              suggestedFix:
                  'Change check-out to ${_formatDate(_sameDateWithCheckout(transportStart))}',
            ),
          );
        }
      }

      // Case 2: Arrival at destination overlaps with start of stay
      // If flying IN to the accommodation location, check-in should be on or after arrival
      if (dest?.toLowerCase().contains(destination.toLowerCase()) == true) {
        // Only flag if check-in is significantly before arrival (same day is fine)
        final arrivalDate = DateTime(
          transportEnd.year,
          transportEnd.month,
          transportEnd.day,
        );
        final checkInDate = DateTime(checkIn.year, checkIn.month, checkIn.day);

        if (checkInDate.isBefore(arrivalDate)) {
          conflicts.add(
            AccommodationConflict(
              type: ConflictType.arrivalOverlap,
              transportItem: item,
              message:
                  'Check-in (${_formatDate(checkIn)}) is before your '
                  'arrival on ${_formatDate(transportEnd)}',
              suggestedFix: 'Change check-in to ${_formatDate(arrivalDate)}',
            ),
          );
        }
      }
    }

    return conflicts;
  }

  /// Checks if dates are valid (check-out after check-in).
  static bool areDatesValid(DateTime checkIn, DateTime checkOut) {
    return checkOut.isAfter(checkIn);
  }

  /// Calculates the number of nights.
  static int calculateNights(DateTime checkIn, DateTime checkOut) {
    return checkOut.difference(checkIn).inDays;
  }

  static String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  static String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '${_formatDate(dateTime)} at $hour:$minute';
  }

  static DateTime _sameDateWithCheckout(DateTime departureTime) {
    // Suggest check-out on the same day as departure, assuming 11:00 checkout
    return DateTime(departureTime.year, departureTime.month, departureTime.day);
  }
}

/// Type of accommodation-transport conflict.
enum ConflictType {
  /// Check-out is after a departure flight
  departureOverlap,

  /// Check-in is before arrival at destination
  arrivalOverlap,
}

/// A detected conflict between accommodation and transport.
class AccommodationConflict {
  final ConflictType type;
  final SavedItem transportItem;
  final String message;
  final String? suggestedFix;

  const AccommodationConflict({
    required this.type,
    required this.transportItem,
    required this.message,
    this.suggestedFix,
  });
}
