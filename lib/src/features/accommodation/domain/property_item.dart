import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_item.freezed.dart';
part 'property_item.g.dart';

/// Full property item with room matrix and policies
@freezed
abstract class PropertyItem with _$PropertyItem {
  const factory PropertyItem({
    /// Internal ID
    required String id,

    /// Provider/vendor ID (e.g., "booking", "expedia")
    required String providerId,

    /// External property ID from the provider
    required String externalId,

    /// Property name
    required String name,

    /// Property type
    required PropertyType type,

    /// Location description
    required String location,

    /// Coordinates
    required double latitude,
    required double longitude,

    /// Star rating (1-5)
    int? starRating,

    /// Review score (0-10)
    double? reviewScore,

    /// Number of reviews
    int? reviewCount,

    /// Thumbnail image URL
    String? thumbnailUrl,

    /// Gallery image URLs
    @Default([]) List<String> imageUrls,

    /// Amenities list
    @Default([]) List<String> amenities,

    /// Room options matrix
    @Default([]) List<RoomOption> roomMatrix,

    /// Policies (cancellation, payment)
    Policies? policies,

    /// Distance to POI in meters (if POI was specified)
    int? distanceToPoi,

    /// ETA to POI in minutes (if calculated)
    int? etaToPoi,

    /// Vendor booking URL
    String? vendorUrl,
  }) = _PropertyItem;

  factory PropertyItem.fromJson(Map<String, dynamic> json) =>
      _$PropertyItemFromJson(json);
}

/// Property type enum
enum PropertyType {
  hotel,
  hostel,
  apartment,
  resort,
  villa,
  guesthouse,
  bedAndBreakfast,
  motel,
}

/// Room option in the matrix
@freezed
abstract class RoomOption with _$RoomOption {
  const factory RoomOption({
    /// Room ID
    required String id,

    /// Room name/description
    required String name,

    /// Board plan (e.g., "Room Only", "Breakfast", "Half Board", "Full Board")
    required String boardPlan,

    /// Maximum occupancy
    required int maxOccupancy,

    /// Bed configuration description
    String? bedConfig,

    /// Price breakdown for this room
    required PriceBreakdown price,

    /// Number of rooms available
    int? availability,

    /// Is this option refundable?
    @Default(false) bool refundable,

    /// Cancellation deadline (if refundable)
    DateTime? cancellationDeadline,
  }) = _RoomOption;

  factory RoomOption.fromJson(Map<String, dynamic> json) =>
      _$RoomOptionFromJson(json);
}

/// Price breakdown with taxes and fees
@freezed
abstract class PriceBreakdown with _$PriceBreakdown {
  const factory PriceBreakdown({
    /// Base price before taxes/fees
    required double basePrice,

    /// Taxes amount
    @Default(0) double taxes,

    /// Fees amount (resort fee, cleaning fee, etc.)
    @Default(0) double fees,

    /// Total price including taxes and fees
    required double total,

    /// Currency code
    required String currency,

    /// Price per night (for display)
    double? pricePerNight,

    /// Number of nights
    int? nights,
  }) = _PriceBreakdown;

  factory PriceBreakdown.fromJson(Map<String, dynamic> json) =>
      _$PriceBreakdownFromJson(json);
}

/// Cancellation and payment policies
@freezed
abstract class Policies with _$Policies {
  const factory Policies({
    /// Cancellation policy
    CancellationPolicy? cancellation,

    /// Payment policy
    PaymentPolicy? payment,

    /// House rules (check-in time, check-out time, etc.)
    HouseRules? houseRules,
  }) = _Policies;

  factory Policies.fromJson(Map<String, dynamic> json) =>
      _$PoliciesFromJson(json);
}

/// Cancellation policy details
@freezed
abstract class CancellationPolicy with _$CancellationPolicy {
  const factory CancellationPolicy({
    /// Is free cancellation available?
    @Default(false) bool freeCancellation,

    /// Deadline for free cancellation (local time)
    DateTime? deadline,

    /// Penalty amount if cancelled after deadline
    double? penaltyAmount,

    /// Penalty as percentage of total
    double? penaltyPercentage,

    /// Human-readable description
    String? description,
  }) = _CancellationPolicy;

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) =>
      _$CancellationPolicyFromJson(json);
}

/// Payment policy details
@freezed
abstract class PaymentPolicy with _$PaymentPolicy {
  const factory PaymentPolicy({
    /// Requires prepayment?
    @Default(false) bool prepay,

    /// Can pay at property?
    @Default(false) bool payAtProperty,

    /// Accepted payment methods
    @Default([]) List<String> acceptedMethods,

    /// Deposit required?
    double? depositAmount,
  }) = _PaymentPolicy;

  factory PaymentPolicy.fromJson(Map<String, dynamic> json) =>
      _$PaymentPolicyFromJson(json);
}

/// House rules
@freezed
abstract class HouseRules with _$HouseRules {
  const factory HouseRules({
    /// Check-in time (e.g., "15:00")
    String? checkInTime,

    /// Check-out time (e.g., "11:00")
    String? checkOutTime,

    /// Pets allowed?
    @Default(false) bool petsAllowed,

    /// Smoking allowed?
    @Default(false) bool smokingAllowed,

    /// Parties/events allowed?
    @Default(false) bool partiesAllowed,

    /// Additional rules
    @Default([]) List<String> additionalRules,
  }) = _HouseRules;

  factory HouseRules.fromJson(Map<String, dynamic> json) =>
      _$HouseRulesFromJson(json);
}
