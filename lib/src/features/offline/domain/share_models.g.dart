// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShareConfig _$ShareConfigFromJson(Map<String, dynamic> json) => _ShareConfig(
  reduceLocationPrecision: json['reduceLocationPrecision'] as bool? ?? false,
  excludeNotes: json['excludeNotes'] as bool? ?? true,
  excludePricing: json['excludePricing'] as bool? ?? false,
  expiryDays: (json['expiryDays'] as num?)?.toInt(),
);

Map<String, dynamic> _$ShareConfigToJson(_ShareConfig instance) =>
    <String, dynamic>{
      'reduceLocationPrecision': instance.reduceLocationPrecision,
      'excludeNotes': instance.excludeNotes,
      'excludePricing': instance.excludePricing,
      'expiryDays': instance.expiryDays,
    };

_ShareLink _$ShareLinkFromJson(Map<String, dynamic> json) => _ShareLink(
  id: json['id'] as String,
  itineraryId: json['itineraryId'] as String,
  url: json['url'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
  revocationToken: json['revocationToken'] as String,
  config: ShareConfig.fromJson(json['config'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShareLinkToJson(_ShareLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itineraryId': instance.itineraryId,
      'url': instance.url,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'revocationToken': instance.revocationToken,
      'config': instance.config.toJson(),
    };
