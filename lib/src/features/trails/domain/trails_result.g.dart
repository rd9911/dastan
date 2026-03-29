// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trails_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrailsResult _$TrailsResultFromJson(Map<String, dynamic> json) =>
    _TrailsResult(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      distanceKm: (json['distanceKm'] as num).toDouble(),
      difficulty: $enumDecode(_$TrailDifficultyEnumMap, json['difficulty']),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      description: json['description'] as String?,
      elevationGainMeters: (json['elevationGainMeters'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$TrailsResultToJson(_TrailsResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'distanceKm': instance.distanceKm,
      'difficulty': _$TrailDifficultyEnumMap[instance.difficulty]!,
      'durationMinutes': instance.durationMinutes,
      'description': instance.description,
      'elevationGainMeters': instance.elevationGainMeters,
      'imageUrl': instance.imageUrl,
    };

const _$TrailDifficultyEnumMap = {
  TrailDifficulty.easy: 'easy',
  TrailDifficulty.moderate: 'moderate',
  TrailDifficulty.hard: 'hard',
  TrailDifficulty.expert: 'expert',
};
