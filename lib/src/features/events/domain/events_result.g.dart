// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventsResult _$EventsResultFromJson(Map<String, dynamic> json) =>
    _EventsResult(
      id: json['id'] as String,
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      name: json['name'] as String,
      location: json['location'] as String,
      eventDate: DateTime.parse(json['eventDate'] as String),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      vendorUrl: json['vendorUrl'] as String?,
    );

Map<String, dynamic> _$EventsResultToJson(_EventsResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$EventTypeEnumMap[instance.type]!,
      'name': instance.name,
      'location': instance.location,
      'eventDate': instance.eventDate.toIso8601String(),
      'price': instance.price,
      'currency': instance.currency,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'vendorUrl': instance.vendorUrl,
    };

const _$EventTypeEnumMap = {
  EventType.concert: 'concert',
  EventType.festival: 'festival',
  EventType.sports: 'sports',
  EventType.conference: 'conference',
};
