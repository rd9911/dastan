// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autobuild_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AutoBuildPreferences _$AutoBuildPreferencesFromJson(
  Map<String, dynamic> json,
) => _AutoBuildPreferences(
  startTime: json['startTime'] == null
      ? const TimeOfDay(hour: 9, minute: 0)
      : const TimeOfDayConverter().fromJson(json['startTime'] as String),
  pace:
      $enumDecodeNullable(_$AutoBuildPaceEnumMap, json['pace']) ??
      AutoBuildPace.normal,
  prioritizeSections:
      (json['prioritizeSections'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$FeatureVerticalEnumMap, e))
          .toList() ??
      const [],
  respectOpeningHours: json['respectOpeningHours'] as bool? ?? true,
  minimizeTravelTime: json['minimizeTravelTime'] as bool? ?? true,
);

Map<String, dynamic> _$AutoBuildPreferencesToJson(
  _AutoBuildPreferences instance,
) => <String, dynamic>{
  'startTime': const TimeOfDayConverter().toJson(instance.startTime),
  'pace': _$AutoBuildPaceEnumMap[instance.pace]!,
  'prioritizeSections': instance.prioritizeSections
      .map((e) => _$FeatureVerticalEnumMap[e]!)
      .toList(),
  'respectOpeningHours': instance.respectOpeningHours,
  'minimizeTravelTime': instance.minimizeTravelTime,
};

const _$AutoBuildPaceEnumMap = {
  AutoBuildPace.relaxed: 'relaxed',
  AutoBuildPace.normal: 'normal',
  AutoBuildPace.packed: 'packed',
};

const _$FeatureVerticalEnumMap = {
  FeatureVertical.transport: 'transport',
  FeatureVertical.accommodation: 'accommodation',
  FeatureVertical.entertainment: 'entertainment',
  FeatureVertical.gastronomy: 'gastronomy',
  FeatureVertical.events: 'events',
  FeatureVertical.trails: 'trails',
};

_AutoBuildRequest _$AutoBuildRequestFromJson(Map<String, dynamic> json) =>
    _AutoBuildRequest(
      itineraryId: json['itineraryId'] as String,
      date: DateTime.parse(json['date'] as String),
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => SavedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferences: json['preferences'] == null
          ? const AutoBuildPreferences()
          : AutoBuildPreferences.fromJson(
              json['preferences'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AutoBuildRequestToJson(_AutoBuildRequest instance) =>
    <String, dynamic>{
      'itineraryId': instance.itineraryId,
      'date': instance.date.toIso8601String(),
      'candidates': instance.candidates.map((e) => e.toJson()).toList(),
      'preferences': instance.preferences.toJson(),
    };
