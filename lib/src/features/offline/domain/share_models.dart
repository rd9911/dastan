import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_models.freezed.dart';
part 'share_models.g.dart';

/// Privacy configuration for sharing an itinerary.
@freezed
abstract class ShareConfig with _$ShareConfig {
  const factory ShareConfig({
    /// Reduce location precision (e.g., city-level only)
    @Default(false) bool reduceLocationPrecision,

    /// Exclude personal notes
    @Default(true) bool excludeNotes,

    /// Exclude pricing information
    @Default(false) bool excludePricing,

    /// Expiry duration in days (null = no expiry)
    int? expiryDays,
  }) = _ShareConfig;

  factory ShareConfig.fromJson(Map<String, dynamic> json) =>
      _$ShareConfigFromJson(json);
}

/// Represents a generated share link.
@freezed
abstract class ShareLink with _$ShareLink {
  const factory ShareLink({
    required String id,
    required String itineraryId,
    required String url,
    required DateTime createdAt,
    DateTime? expiresAt,
    required String revocationToken,
    required ShareConfig config,
  }) = _ShareLink;

  factory ShareLink.fromJson(Map<String, dynamic> json) =>
      _$ShareLinkFromJson(json);
}
