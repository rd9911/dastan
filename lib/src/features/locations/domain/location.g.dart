// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  id: json['id'] as String,
  name: json['name'] as String,
  country: json['country'] as String,
  state: json['state'] as String?,
  city: json['city'] as String?,
  code: json['code'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  formattedAddress: json['formattedAddress'] as String?,
  osmType: json['osmType'] as String?,
  osmId: (json['osmId'] as num?)?.toInt(),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country': instance.country,
  'state': instance.state,
  'city': instance.city,
  'code': instance.code,
  'lat': instance.lat,
  'lng': instance.lng,
  'formattedAddress': instance.formattedAddress,
  'osmType': instance.osmType,
  'osmId': instance.osmId,
};
