import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';
import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accommodation_prefill_service.freezed.dart';

/// Result of accommodation prefill from itinerary and transport context.
@freezed
abstract class AccommodationPrefillResult with _$AccommodationPrefillResult {
  const factory AccommodationPrefillResult({
    /// Prefilled place (city/region)
    String? place,

    /// Prefilled check-in date
    DateTime? checkIn,

    /// Prefilled check-out date
    DateTime? checkOut,

    /// Prefilled guest configuration
    RoomGuests? guests,

    /// Whether Smart Dates were derived from transport context
    @Default(false) bool hasSmartDates,

    /// Smart Dates details (for chip display)
    String? smartDatesDescription,
  }) = _AccommodationPrefillResult;
}

/// Service to prefill accommodation search from Active Itinerary and Transport context.
class AccommodationPrefillService {
  /// Generates prefill data from itinerary and optional saved transport items.
  ///
  /// Smart Dates logic:
  /// - If transport items exist, use arrival date as checkIn, departure as checkOut
  /// - Otherwise, use itinerary dates
  AccommodationPrefillResult generatePrefill({
    required Itinerary itinerary,
    List<SavedItem>? savedTransportItems,
  }) {
    String? place;
    DateTime? checkIn;
    DateTime? checkOut;
    bool hasSmartDates = false;
    String? smartDatesDescription;

    // Extract place from itinerary destination
    if (itinerary.destination != null && itinerary.destination!.isNotEmpty) {
      place = itinerary.destination;
    }

    // Try to get Smart Dates from transport context
    if (savedTransportItems != null && savedTransportItems.isNotEmpty) {
      final transportDates = _extractTransportDates(savedTransportItems);
      if (transportDates != null) {
        checkIn = transportDates.arrival;
        checkOut = transportDates.departure;
        hasSmartDates = true;
        smartDatesDescription =
            'Based on your flights: ${_formatDate(checkIn)} - ${_formatDate(checkOut)}';
      }
    }

    // Fall back to itinerary dates if no transport dates
    if (checkIn == null || checkOut == null) {
      checkIn = itinerary.startDate;
      checkOut = itinerary.endDate;
    }

    // Generate default guests from itinerary travelers count
    final guests = _generateDefaultGuests(itinerary.travelers);

    return AccommodationPrefillResult(
      place: place,
      checkIn: checkIn,
      checkOut: checkOut,
      guests: guests,
      hasSmartDates: hasSmartDates,
      smartDatesDescription: smartDatesDescription,
    );
  }

  /// Adjusts Smart Dates by ±1 day (for quick toggle chips).
  AccommodationPrefillResult adjustDates(
    AccommodationPrefillResult current, {
    int checkInDelta = 0,
    int checkOutDelta = 0,
  }) {
    final newCheckIn = current.checkIn?.add(Duration(days: checkInDelta));
    final newCheckOut = current.checkOut?.add(Duration(days: checkOutDelta));

    return current.copyWith(
      checkIn: newCheckIn,
      checkOut: newCheckOut,
      // Clear Smart Dates flag if manually adjusted
      hasSmartDates: false,
      smartDatesDescription: null,
    );
  }

  /// Extracts arrival and departure dates from saved transport items.
  _TransportDates? _extractTransportDates(List<SavedItem> transportItems) {
    DateTime? earliestArrival;
    DateTime? latestDeparture;

    for (final item in transportItems) {
      if (item.time?.start != null) {
        final start = item.time!.start;
        if (earliestArrival == null || start.isBefore(earliestArrival)) {
          earliestArrival = start;
        }
      }
      if (item.time?.end != null) {
        final end = item.time!.end;
        if (latestDeparture == null || end.isAfter(latestDeparture)) {
          latestDeparture = end;
        }
      }
    }

    if (earliestArrival != null && latestDeparture != null) {
      return _TransportDates(earliestArrival, latestDeparture);
    }
    return null;
  }

  /// Generates default room/guest configuration from traveler count.
  ///
  /// Logic: 2 adults = 1 room, 3-4 adults = 2 rooms, etc.
  RoomGuests _generateDefaultGuests(int travelerCount) {
    if (travelerCount <= 0) {
      // Default to 2 adults, 1 room
      return {
        0: [30, 30],
      };
    }

    if (travelerCount <= 2) {
      // 1-2 travelers: 1 room
      final ages = List.generate(travelerCount, (_) => 30);
      return {0: ages};
    }

    // 3+ travelers: split into rooms (2 per room)
    final rooms = <int, List<int>>{};
    var roomIdx = 0;
    var remaining = travelerCount;

    while (remaining > 0) {
      final inRoom = remaining >= 2 ? 2 : 1;
      rooms[roomIdx] = List.generate(inRoom, (_) => 30);
      remaining -= inRoom;
      roomIdx++;
    }

    return rooms;
  }

  String _formatDate(DateTime date) {
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
}

class _TransportDates {
  final DateTime arrival;
  final DateTime departure;
  _TransportDates(this.arrival, this.departure);
}
