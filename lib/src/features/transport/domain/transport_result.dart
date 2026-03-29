import 'package:freezed_annotation/freezed_annotation.dart';

part 'transport_result.freezed.dart';
part 'transport_result.g.dart';

enum TransportMode { flight, train, bus }

@freezed
abstract class TransportResult with _$TransportResult {
  const factory TransportResult({
    required String id,
    required TransportMode mode,
    required String origin,
    required String destination,
    required DateTime departAt,
    required DateTime arriveAt,
    required double priceAmount,
    required String currency,
    required int durationMinutes,
    String? vendor,
    String? vendorUrl,
    String? originAirportCode,
    String? destinationAirportCode,
    String? baggage,
  }) = _TransportResult;

  factory TransportResult.fromJson(Map<String, dynamic> json) =>
      _$TransportResultFromJson(json);
}
