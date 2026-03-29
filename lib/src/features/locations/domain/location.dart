import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

/// Domain model for a geographic location used across all search verticals.
///
/// This model supports:
/// - Autocomplete results (basic info: id, name, country)
/// - Full geocoding (lat, lng, viewport)
/// - Reverse geocoding results
@freezed
abstract class Location with _$Location {
  const factory Location({
    /// Unique identifier (OSM place_id or osm_type + osm_id)
    required String id,

    /// Display name of the location (city, landmark, etc.)
    required String name,

    /// Country name
    required String country,

    /// State/province/region (optional)
    String? state,

    /// City name if different from name (optional)
    String? city,

    /// Airport IATA code if applicable (optional)
    String? code,

    /// Latitude coordinate
    double? lat,

    /// Longitude coordinate
    double? lng,

    /// Full formatted address
    String? formattedAddress,

    /// OSM type: 'N' (node), 'W' (way), 'R' (relation)
    String? osmType,

    /// OSM numeric ID
    int? osmId,
  }) = _Location;

  const Location._();

  /// Creates a Location from JSON (for freezed)
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  /// Display string for autocomplete dropdown
  String get displayName {
    if (state != null && state!.isNotEmpty) {
      return '$name, $state, $country';
    }
    return '$name, $country';
  }

  /// Whether this location has coordinates
  bool get hasCoordinates => lat != null && lng != null;

  /// OSM ID in format expected by lookup API (e.g., "N123", "W456", "R789")
  String? get osmIdFormatted {
    if (osmType != null && osmId != null) {
      return '$osmType$osmId';
    }
    return null;
  }
}
