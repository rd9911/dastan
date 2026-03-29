// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransportResult _$TransportResultFromJson(Map<String, dynamic> json) =>
    _TransportResult(
      id: json['id'] as String,
      mode: $enumDecode(_$TransportModeEnumMap, json['mode']),
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      departAt: DateTime.parse(json['departAt'] as String),
      arriveAt: DateTime.parse(json['arriveAt'] as String),
      priceAmount: (json['priceAmount'] as num).toDouble(),
      currency: json['currency'] as String,
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      vendor: json['vendor'] as String?,
      vendorUrl: json['vendorUrl'] as String?,
      originAirportCode: json['originAirportCode'] as String?,
      destinationAirportCode: json['destinationAirportCode'] as String?,
      baggage: json['baggage'] as String?,
    );

Map<String, dynamic> _$TransportResultToJson(_TransportResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': _$TransportModeEnumMap[instance.mode]!,
      'origin': instance.origin,
      'destination': instance.destination,
      'departAt': instance.departAt.toIso8601String(),
      'arriveAt': instance.arriveAt.toIso8601String(),
      'priceAmount': instance.priceAmount,
      'currency': instance.currency,
      'durationMinutes': instance.durationMinutes,
      'vendor': instance.vendor,
      'vendorUrl': instance.vendorUrl,
      'originAirportCode': instance.originAirportCode,
      'destinationAirportCode': instance.destinationAirportCode,
      'baggage': instance.baggage,
    };

const _$TransportModeEnumMap = {
  TransportMode.flight: 'flight',
  TransportMode.train: 'train',
  TransportMode.bus: 'bus',
};
