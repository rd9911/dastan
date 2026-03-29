// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gastronomy_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GastronomyResult _$GastronomyResultFromJson(Map<String, dynamic> json) =>
    _GastronomyResult(
      id: json['id'] as String,
      type: $enumDecode(_$GastronomyTypeEnumMap, json['type']),
      name: json['name'] as String,
      location: json['location'] as String,
      cuisine: json['cuisine'] as String,
      priceRange: json['priceRange'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      vendorUrl: json['vendorUrl'] as String?,
    );

Map<String, dynamic> _$GastronomyResultToJson(_GastronomyResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$GastronomyTypeEnumMap[instance.type]!,
      'name': instance.name,
      'location': instance.location,
      'cuisine': instance.cuisine,
      'priceRange': instance.priceRange,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
      'vendorUrl': instance.vendorUrl,
    };

const _$GastronomyTypeEnumMap = {
  GastronomyType.restaurant: 'restaurant',
  GastronomyType.cafe: 'cafe',
  GastronomyType.bar: 'bar',
  GastronomyType.foodTour: 'foodTour',
};
