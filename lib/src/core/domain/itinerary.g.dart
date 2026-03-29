// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Itinerary _$ItineraryFromJson(Map<String, dynamic> json) => _Itinerary(
  id: json['id'] as String,
  title: json['title'] as String,
  destination: json['destination'] as String?,
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  travelers: (json['travelers'] as num?)?.toInt() ?? 1,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ItineraryToJson(_Itinerary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'destination': instance.destination,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'travelers': instance.travelers,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
