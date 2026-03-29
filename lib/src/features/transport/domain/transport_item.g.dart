// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransportItem _$TransportItemFromJson(Map<String, dynamic> json) =>
    _TransportItem(
      id: json['id'] as String,
      providers: (json['providers'] as List<dynamic>)
          .map((e) => TransportProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      segments: (json['segments'] as List<dynamic>)
          .map((e) => TransportSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
      totalDuration: Duration(
        microseconds: (json['totalDuration'] as num).toInt(),
      ),
      departure: DateTime.parse(json['departure'] as String),
      arrival: DateTime.parse(json['arrival'] as String),
      mode: $enumDecode(_$TransportModeEnumMap, json['mode']),
      bookingUrl: json['bookingUrl'] as String?,
    );

Map<String, dynamic> _$TransportItemToJson(_TransportItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'providers': instance.providers.map((e) => e.toJson()).toList(),
      'segments': instance.segments.map((e) => e.toJson()).toList(),
      'price': instance.price.toJson(),
      'totalDuration': instance.totalDuration.inMicroseconds,
      'departure': instance.departure.toIso8601String(),
      'arrival': instance.arrival.toIso8601String(),
      'mode': _$TransportModeEnumMap[instance.mode]!,
      'bookingUrl': instance.bookingUrl,
    };

const _$TransportModeEnumMap = {
  TransportMode.flight: 'flight',
  TransportMode.train: 'train',
  TransportMode.bus: 'bus',
  TransportMode.any: 'any',
};

_TransportProvider _$TransportProviderFromJson(Map<String, dynamic> json) =>
    _TransportProvider(
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$TransportProviderToJson(_TransportProvider instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'code': instance.code,
    };

_TransportSegment _$TransportSegmentFromJson(Map<String, dynamic> json) =>
    _TransportSegment(
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      departure: DateTime.parse(json['departure'] as String),
      arrival: DateTime.parse(json['arrival'] as String),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      carrier: json['carrier'] as String,
      transportIdentifier: json['transportIdentifier'] as String,
      mode: $enumDecode(_$TransportModeEnumMap, json['mode']),
    );

Map<String, dynamic> _$TransportSegmentToJson(_TransportSegment instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'departure': instance.departure.toIso8601String(),
      'arrival': instance.arrival.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
      'carrier': instance.carrier,
      'transportIdentifier': instance.transportIdentifier,
      'mode': _$TransportModeEnumMap[instance.mode]!,
    };

_Price _$PriceFromJson(Map<String, dynamic> json) => _Price(
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$PriceToJson(_Price instance) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
};
