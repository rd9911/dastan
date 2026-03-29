import 'package:freezed_annotation/freezed_annotation.dart';

part 'accommodation_result.freezed.dart';
part 'accommodation_result.g.dart';

enum AccommodationType { hotel, hostel, apartment, resort }

@freezed
abstract class AccommodationResult with _$AccommodationResult {
  const factory AccommodationResult({
    required String id,

    /// Provider ID (e.g., "mock", "booking")
    required String providerId,

    /// External ID for detail lookup
    required String externalId,
    required AccommodationType type,
    required String name,
    required String location,
    required DateTime checkIn,
    required DateTime checkOut,
    required double pricePerNight,
    required String currency,
    int? rating,
    String? imageUrl,
    String? vendorUrl,
  }) = _AccommodationResult;

  factory AccommodationResult.fromJson(Map<String, dynamic> json) =>
      _$AccommodationResultFromJson(json);
}
