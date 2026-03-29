// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayPlan _$DayPlanFromJson(Map<String, dynamic> json) => _DayPlan(
  itineraryId: json['itineraryId'] as String,
  date: DateTime.parse(json['date'] as String),
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map((e) => DayPlanEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  version: (json['version'] as num?)?.toInt() ?? 1,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DayPlanToJson(_DayPlan instance) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'date': instance.date.toIso8601String(),
  'entries': instance.entries.map((e) => e.toJson()).toList(),
  'version': instance.version,
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_DayPlanEntry _$DayPlanEntryFromJson(Map<String, dynamic> json) =>
    _DayPlanEntry(
      id: json['id'] as String,
      savedItemId: json['savedItemId'] as String?,
      title: json['title'] as String,
      type:
          $enumDecodeNullable(_$PlanEntryTypeEnumMap, json['type']) ??
          PlanEntryType.fixed,
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 60,
      commuteMode:
          $enumDecodeNullable(_$TravelModeEnumMap, json['commuteMode']) ??
          TravelMode.none,
      commuteDurationMinutes: (json['commuteDurationMinutes'] as num?)?.toInt(),
      bufferBeforeMinutes: (json['bufferBeforeMinutes'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$DayPlanEntryToJson(_DayPlanEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'savedItemId': instance.savedItemId,
      'title': instance.title,
      'type': _$PlanEntryTypeEnumMap[instance.type]!,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'commuteMode': _$TravelModeEnumMap[instance.commuteMode]!,
      'commuteDurationMinutes': instance.commuteDurationMinutes,
      'bufferBeforeMinutes': instance.bufferBeforeMinutes,
      'notes': instance.notes,
    };

const _$PlanEntryTypeEnumMap = {
  PlanEntryType.fixed: 'fixed',
  PlanEntryType.flex: 'flex',
  PlanEntryType.custom: 'custom',
};

const _$TravelModeEnumMap = {
  TravelMode.walk: 'walk',
  TravelMode.transit: 'transit',
  TravelMode.drive: 'drive',
  TravelMode.none: 'none',
};
