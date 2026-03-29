// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransportSearchRequest _$TransportSearchRequestFromJson(
  Map<String, dynamic> json,
) => _TransportSearchRequest(
  itineraryId: json['itineraryId'] as String,
  tripType: $enumDecode(_$TripTypeEnumMap, json['tripType']),
  legs: (json['legs'] as List<dynamic>)
      .map((e) => TransportSearchLeg.fromJson(e as Map<String, dynamic>))
      .toList(),
  passengers:
      (json['passengers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {'adults': 1},
  filters: json['filters'] == null
      ? null
      : TransportFilters.fromJson(json['filters'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TransportSearchRequestToJson(
  _TransportSearchRequest instance,
) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'tripType': _$TripTypeEnumMap[instance.tripType]!,
  'legs': instance.legs.map((e) => e.toJson()).toList(),
  'passengers': instance.passengers,
  'filters': instance.filters?.toJson(),
};

const _$TripTypeEnumMap = {
  TripType.oneWay: 'oneWay',
  TripType.roundTrip: 'roundTrip',
  TripType.multiCity: 'multiCity',
};

_TransportSearchLeg _$TransportSearchLegFromJson(Map<String, dynamic> json) =>
    _TransportSearchLeg(
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      departDate: DateTime.parse(json['departDate'] as String),
      returnDate: json['returnDate'] == null
          ? null
          : DateTime.parse(json['returnDate'] as String),
      mode:
          $enumDecodeNullable(_$TransportModeEnumMap, json['mode']) ??
          TransportMode.any,
    );

Map<String, dynamic> _$TransportSearchLegToJson(_TransportSearchLeg instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'departDate': instance.departDate.toIso8601String(),
      'returnDate': instance.returnDate?.toIso8601String(),
      'mode': _$TransportModeEnumMap[instance.mode]!,
    };

const _$TransportModeEnumMap = {
  TransportMode.flight: 'flight',
  TransportMode.train: 'train',
  TransportMode.bus: 'bus',
  TransportMode.any: 'any',
};

_TransportFilters _$TransportFiltersFromJson(Map<String, dynamic> json) =>
    _TransportFilters(
      maxStops: (json['maxStops'] as num?)?.toInt(),
      cabinClass: json['cabinClass'] as String?,
      refundableOnly: json['refundableOnly'] as bool?,
    );

Map<String, dynamic> _$TransportFiltersToJson(_TransportFilters instance) =>
    <String, dynamic>{
      'maxStops': instance.maxStops,
      'cabinClass': instance.cabinClass,
      'refundableOnly': instance.refundableOnly,
    };
