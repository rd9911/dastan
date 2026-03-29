import 'package:freezed_annotation/freezed_annotation.dart';

part 'transport_search_request.freezed.dart';
part 'transport_search_request.g.dart';

enum TripType { oneWay, roundTrip, multiCity }

enum TransportMode { flight, train, bus, any }

@freezed
abstract class TransportSearchRequest with _$TransportSearchRequest {
  const factory TransportSearchRequest({
    required String itineraryId,
    required TripType tripType,
    required List<TransportSearchLeg> legs,
    @Default({'adults': 1}) Map<String, int> passengers,
    TransportFilters? filters,
  }) = _TransportSearchRequest;

  factory TransportSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$TransportSearchRequestFromJson(json);
}

@freezed
abstract class TransportSearchLeg with _$TransportSearchLeg {
  const factory TransportSearchLeg({
    required String origin,
    required String destination,
    required DateTime departDate,
    DateTime?
    returnDate, // Only used for roundTrip logic if needed, usually legs are linear
    @Default(TransportMode.any) TransportMode mode,
  }) = _TransportSearchLeg;

  factory TransportSearchLeg.fromJson(Map<String, dynamic> json) =>
      _$TransportSearchLegFromJson(json);
}

@freezed
abstract class TransportFilters with _$TransportFilters {
  const factory TransportFilters({
    int? maxStops,
    String? cabinClass,
    bool? refundableOnly,
    // Add other filters as needed
  }) = _TransportFilters;

  factory TransportFilters.fromJson(Map<String, dynamic> json) =>
      _$TransportFiltersFromJson(json);
}
