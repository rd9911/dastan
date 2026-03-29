// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotonResponse _$PhotonResponseFromJson(Map<String, dynamic> json) =>
    _PhotonResponse(
      type: json['type'] as String,
      features: (json['features'] as List<dynamic>)
          .map((e) => PhotonFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PhotonResponseToJson(_PhotonResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'features': instance.features.map((e) => e.toJson()).toList(),
    };

_PhotonFeature _$PhotonFeatureFromJson(Map<String, dynamic> json) =>
    _PhotonFeature(
      type: json['type'] as String,
      geometry: PhotonGeometry.fromJson(
        json['geometry'] as Map<String, dynamic>,
      ),
      properties: PhotonProperties.fromJson(
        json['properties'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PhotonFeatureToJson(_PhotonFeature instance) =>
    <String, dynamic>{
      'type': instance.type,
      'geometry': instance.geometry.toJson(),
      'properties': instance.properties.toJson(),
    };

_PhotonGeometry _$PhotonGeometryFromJson(Map<String, dynamic> json) =>
    _PhotonGeometry(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$PhotonGeometryToJson(_PhotonGeometry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

_PhotonProperties _$PhotonPropertiesFromJson(Map<String, dynamic> json) =>
    _PhotonProperties(
      osmId: (json['osm_id'] as num?)?.toInt(),
      osmType: json['osm_type'] as String?,
      osmKey: json['osm_key'] as String?,
      osmValue: json['osm_value'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      postcode: json['postcode'] as String?,
      houseNumber: json['housenumber'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$PhotonPropertiesToJson(_PhotonProperties instance) =>
    <String, dynamic>{
      'osm_id': instance.osmId,
      'osm_type': instance.osmType,
      'osm_key': instance.osmKey,
      'osm_value': instance.osmValue,
      'name': instance.name,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'street': instance.street,
      'postcode': instance.postcode,
      'housenumber': instance.houseNumber,
      'type': instance.type,
    };
