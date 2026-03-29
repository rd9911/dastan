// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccommodationResult _$AccommodationResultFromJson(Map<String, dynamic> json) =>
    _AccommodationResult(
      id: json['id'] as String,
      providerId: json['providerId'] as String,
      externalId: json['externalId'] as String,
      type: $enumDecode(_$AccommodationTypeEnumMap, json['type']),
      name: json['name'] as String,
      location: json['location'] as String,
      checkIn: DateTime.parse(json['checkIn'] as String),
      checkOut: DateTime.parse(json['checkOut'] as String),
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
      currency: json['currency'] as String,
      rating: (json['rating'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      vendorUrl: json['vendorUrl'] as String?,
    );

Map<String, dynamic> _$AccommodationResultToJson(
  _AccommodationResult instance,
) => <String, dynamic>{
  'id': instance.id,
  'providerId': instance.providerId,
  'externalId': instance.externalId,
  'type': _$AccommodationTypeEnumMap[instance.type]!,
  'name': instance.name,
  'location': instance.location,
  'checkIn': instance.checkIn.toIso8601String(),
  'checkOut': instance.checkOut.toIso8601String(),
  'pricePerNight': instance.pricePerNight,
  'currency': instance.currency,
  'rating': instance.rating,
  'imageUrl': instance.imageUrl,
  'vendorUrl': instance.vendorUrl,
};

const _$AccommodationTypeEnumMap = {
  AccommodationType.hotel: 'hotel',
  AccommodationType.hostel: 'hostel',
  AccommodationType.apartment: 'apartment',
  AccommodationType.resort: 'resort',
};
