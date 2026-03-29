// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conflict_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConflictSuggestion _$ConflictSuggestionFromJson(Map<String, dynamic> json) =>
    _ConflictSuggestion(
      id: json['id'] as String,
      label: json['label'] as String,
      description: json['description'] as String,
      action: $enumDecode(_$ConflictFixActionEnumMap, json['action']),
      params: json['params'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ConflictSuggestionToJson(_ConflictSuggestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'description': instance.description,
      'action': _$ConflictFixActionEnumMap[instance.action]!,
      'params': instance.params,
    };

const _$ConflictFixActionEnumMap = {
  ConflictFixAction.shiftEarlier: 'shiftEarlier',
  ConflictFixAction.shiftLater: 'shiftLater',
  ConflictFixAction.swapOrder: 'swapOrder',
  ConflictFixAction.extendDuration: 'extendDuration',
  ConflictFixAction.reduceDuration: 'reduceDuration',
  ConflictFixAction.replaceNearby: 'replaceNearby',
  ConflictFixAction.remove: 'remove',
};

_Conflict _$ConflictFromJson(Map<String, dynamic> json) => _Conflict(
  id: json['id'] as String,
  type: $enumDecode(_$ConflictTypeEnumMap, json['type']),
  entryIds: (json['entryIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  message: json['message'] as String,
  suggestions: (json['suggestions'] as List<dynamic>)
      .map((e) => ConflictSuggestion.fromJson(e as Map<String, dynamic>))
      .toList(),
  detectedAt: json['detectedAt'] == null
      ? null
      : DateTime.parse(json['detectedAt'] as String),
);

Map<String, dynamic> _$ConflictToJson(_Conflict instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$ConflictTypeEnumMap[instance.type]!,
  'entryIds': instance.entryIds,
  'message': instance.message,
  'suggestions': instance.suggestions.map((e) => e.toJson()).toList(),
  'detectedAt': instance.detectedAt?.toIso8601String(),
};

const _$ConflictTypeEnumMap = {
  ConflictType.overlap: 'overlap',
  ConflictType.closed: 'closed',
  ConflictType.tightTransfer: 'tightTransfer',
  ConflictType.outsideItinerary: 'outsideItinerary',
  ConflictType.durationExceeded: 'durationExceeded',
};
