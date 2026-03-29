import 'package:freezed_annotation/freezed_annotation.dart';

part 'photon_dto.freezed.dart';
part 'photon_dto.g.dart';

/// DTO for Photon API GeoJSON response.
///
/// Photon returns GeoJSON FeatureCollection with features like:
/// ```json
/// {
///   "type": "FeatureCollection",
///   "features": [
///     {
///       "type": "Feature",
///       "geometry": { "coordinates": [13.4, 52.5], "type": "Point" },
///       "properties": {
///         "osm_id": 240109189,
///         "osm_type": "N",
///         "country": "Germany",
///         "city": "Berlin",
///         "name": "Berlin"
///       }
///     }
///   ]
/// }
/// ```
@freezed
abstract class PhotonResponse with _$PhotonResponse {
  const factory PhotonResponse({
    required String type,
    required List<PhotonFeature> features,
  }) = _PhotonResponse;

  factory PhotonResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotonResponseFromJson(json);
}

@freezed
abstract class PhotonFeature with _$PhotonFeature {
  const factory PhotonFeature({
    required String type,
    required PhotonGeometry geometry,
    required PhotonProperties properties,
  }) = _PhotonFeature;

  factory PhotonFeature.fromJson(Map<String, dynamic> json) =>
      _$PhotonFeatureFromJson(json);
}

@freezed
abstract class PhotonGeometry with _$PhotonGeometry {
  const factory PhotonGeometry({
    required String type,

    /// [longitude, latitude] - note the order!
    required List<double> coordinates,
  }) = _PhotonGeometry;

  factory PhotonGeometry.fromJson(Map<String, dynamic> json) =>
      _$PhotonGeometryFromJson(json);
}

@freezed
abstract class PhotonProperties with _$PhotonProperties {
  const factory PhotonProperties({
    @JsonKey(name: 'osm_id') int? osmId,
    @JsonKey(name: 'osm_type') String? osmType,
    @JsonKey(name: 'osm_key') String? osmKey,
    @JsonKey(name: 'osm_value') String? osmValue,
    String? name,
    String? country,
    String? state,
    String? city,
    String? street,
    String? postcode,
    @JsonKey(name: 'housenumber') String? houseNumber,

    /// OSM feature type (e.g., "city", "town", "village", "aerodrome")
    String? type,
  }) = _PhotonProperties;

  factory PhotonProperties.fromJson(Map<String, dynamic> json) =>
      _$PhotonPropertiesFromJson(json);
}
