// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Country _$CountryFromJson(Map<String, dynamic> json) => _Country(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  heroImageUrl: json['heroImageUrl'] as String,
  flagEmoji: json['flagEmoji'] as String?,
  sortOrder: (json['sortOrder'] as num).toInt(),
  cities:
      (json['cities'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CountryToJson(_Country instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'heroImageUrl': instance.heroImageUrl,
  'flagEmoji': instance.flagEmoji,
  'sortOrder': instance.sortOrder,
  'cities': instance.cities.map((e) => e.toJson()).toList(),
};

_City _$CityFromJson(Map<String, dynamic> json) => _City(
  id: json['id'] as String,
  countryId: json['countryId'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  heroImageUrl: json['heroImageUrl'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  sortOrder: (json['sortOrder'] as num).toInt(),
);

Map<String, dynamic> _$CityToJson(_City instance) => <String, dynamic>{
  'id': instance.id,
  'countryId': instance.countryId,
  'name': instance.name,
  'description': instance.description,
  'heroImageUrl': instance.heroImageUrl,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'sortOrder': instance.sortOrder,
};

_TourCategory _$TourCategoryFromJson(Map<String, dynamic> json) =>
    _TourCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$TourCategoryToJson(_TourCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

_TourSummary _$TourSummaryFromJson(Map<String, dynamic> json) => _TourSummary(
  id: json['id'] as String,
  cityId: json['cityId'] as String,
  type: $enumDecode(_$TourTypeEnumMap, json['type']),
  name: json['name'] as String,
  tagline: json['tagline'] as String,
  mainImageUrl: json['mainImageUrl'] as String,
  durationMinutes: (json['durationMinutes'] as num).toInt(),
  priceUsd: (json['priceUsd'] as num).toDouble(),
  isFree: json['isFree'] as bool,
  averageRating: (json['averageRating'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num).toInt(),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => TourCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TourSummaryToJson(_TourSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityId': instance.cityId,
      'type': _$TourTypeEnumMap[instance.type]!,
      'name': instance.name,
      'tagline': instance.tagline,
      'mainImageUrl': instance.mainImageUrl,
      'durationMinutes': instance.durationMinutes,
      'priceUsd': instance.priceUsd,
      'isFree': instance.isFree,
      'averageRating': instance.averageRating,
      'reviewCount': instance.reviewCount,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };

const _$TourTypeEnumMap = {TourType.single: 'single', TourType.multi: 'multi'};

_TourDetail _$TourDetailFromJson(Map<String, dynamic> json) => _TourDetail(
  summary: TourSummary.fromJson(json['summary'] as Map<String, dynamic>),
  creatorId: json['creatorId'] as String,
  creatorName: json['creatorName'] as String?,
  creatorAvatarUrl: json['creatorAvatarUrl'] as String?,
  fullDescription: json['fullDescription'] as String,
  guideContent: GuideContent.fromJson(
    json['guideContent'] as Map<String, dynamic>,
  ),
  waypoints: (json['waypoints'] as List<dynamic>)
      .map((e) => TourWaypoint.fromJson(e as Map<String, dynamic>))
      .toList(),
  audioVersions: (json['audioVersions'] as List<dynamic>)
      .map((e) => AudioVersion.fromJson(e as Map<String, dynamic>))
      .toList(),
  childTours: (json['childTours'] as List<dynamic>?)
      ?.map((e) => TourSummary.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TourDetailToJson(_TourDetail instance) =>
    <String, dynamic>{
      'summary': instance.summary.toJson(),
      'creatorId': instance.creatorId,
      'creatorName': instance.creatorName,
      'creatorAvatarUrl': instance.creatorAvatarUrl,
      'fullDescription': instance.fullDescription,
      'guideContent': instance.guideContent.toJson(),
      'waypoints': instance.waypoints.map((e) => e.toJson()).toList(),
      'audioVersions': instance.audioVersions.map((e) => e.toJson()).toList(),
      'childTours': instance.childTours?.map((e) => e.toJson()).toList(),
    };

_TourWaypoint _$TourWaypointFromJson(Map<String, dynamic> json) =>
    _TourWaypoint(
      id: json['id'] as String,
      tourId: json['tourId'] as String,
      orderIndex: (json['orderIndex'] as num).toInt(),
      label: json['label'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radiusMeters: (json['radiusMeters'] as num).toInt(),
    );

Map<String, dynamic> _$TourWaypointToJson(_TourWaypoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'orderIndex': instance.orderIndex,
      'label': instance.label,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radiusMeters': instance.radiusMeters,
    };

_MultiTourItem _$MultiTourItemFromJson(Map<String, dynamic> json) =>
    _MultiTourItem(
      id: json['id'] as String,
      multiTourId: json['multiTourId'] as String,
      singleTourId: json['singleTourId'] as String,
      orderIndex: (json['orderIndex'] as num).toInt(),
      triggerLatitude: (json['triggerLatitude'] as num?)?.toDouble(),
      triggerLongitude: (json['triggerLongitude'] as num?)?.toDouble(),
      triggerRadiusMeters: (json['triggerRadiusMeters'] as num).toInt(),
      singleTourSummary: json['singleTourSummary'] == null
          ? null
          : TourSummary.fromJson(
              json['singleTourSummary'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MultiTourItemToJson(_MultiTourItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'multiTourId': instance.multiTourId,
      'singleTourId': instance.singleTourId,
      'orderIndex': instance.orderIndex,
      'triggerLatitude': instance.triggerLatitude,
      'triggerLongitude': instance.triggerLongitude,
      'triggerRadiusMeters': instance.triggerRadiusMeters,
      'singleTourSummary': instance.singleTourSummary?.toJson(),
    };

_AudioVersion _$AudioVersionFromJson(Map<String, dynamic> json) =>
    _AudioVersion(
      id: json['id'] as String,
      tourId: json['tourId'] as String,
      languageCode: json['languageCode'] as String,
      audioUrl: json['audioUrl'] as String?,
      previewUrl: json['previewUrl'] as String?,
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      status: $enumDecode(_$AudioStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$AudioVersionToJson(_AudioVersion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'languageCode': instance.languageCode,
      'audioUrl': instance.audioUrl,
      'previewUrl': instance.previewUrl,
      'durationSeconds': instance.durationSeconds,
      'status': _$AudioStatusEnumMap[instance.status]!,
    };

const _$AudioStatusEnumMap = {
  AudioStatus.pending: 'pending',
  AudioStatus.processing: 'processing',
  AudioStatus.ready: 'ready',
  AudioStatus.error: 'error',
};

_GuideContent _$GuideContentFromJson(Map<String, dynamic> json) =>
    _GuideContent(
      tourId: json['tourId'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => GuideSection.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$GuideContentToJson(_GuideContent instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'sections': instance.sections.map((e) => e.toJson()).toList(),
      'version': instance.version,
    };

_GuideSection _$GuideSectionFromJson(Map<String, dynamic> json) =>
    _GuideSection(
      id: json['id'] as String,
      chapterTitle: json['chapterTitle'] as String,
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => GuideBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GuideSectionToJson(_GuideSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapterTitle': instance.chapterTitle,
      'blocks': instance.blocks.map((e) => e.toJson()).toList(),
    };

GuideBlockText _$GuideBlockTextFromJson(Map<String, dynamic> json) =>
    GuideBlockText(
      content: json['content'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GuideBlockTextToJson(GuideBlockText instance) =>
    <String, dynamic>{
      'content': instance.content,
      'runtimeType': instance.$type,
    };

GuideBlockHighlight _$GuideBlockHighlightFromJson(Map<String, dynamic> json) =>
    GuideBlockHighlight(
      content: json['content'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GuideBlockHighlightToJson(
  GuideBlockHighlight instance,
) => <String, dynamic>{
  'content': instance.content,
  'runtimeType': instance.$type,
};

GuideBlockImage _$GuideBlockImageFromJson(Map<String, dynamic> json) =>
    GuideBlockImage(
      imageUrl: json['imageUrl'] as String,
      caption: json['caption'] as String?,
      isLeading: json['isLeading'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GuideBlockImageToJson(GuideBlockImage instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'caption': instance.caption,
      'isLeading': instance.isLeading,
      'runtimeType': instance.$type,
    };

GuideBlockFact _$GuideBlockFactFromJson(Map<String, dynamic> json) =>
    GuideBlockFact(
      label: json['label'] as String,
      value: json['value'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GuideBlockFactToJson(GuideBlockFact instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'runtimeType': instance.$type,
    };

GuideBlockLocation _$GuideBlockLocationFromJson(Map<String, dynamic> json) =>
    GuideBlockLocation(
      address: json['address'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GuideBlockLocationToJson(GuideBlockLocation instance) =>
    <String, dynamic>{
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'runtimeType': instance.$type,
    };

GuideBlockYearBadge _$GuideBlockYearBadgeFromJson(Map<String, dynamic> json) =>
    GuideBlockYearBadge(
      label: json['label'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GuideBlockYearBadgeToJson(
  GuideBlockYearBadge instance,
) => <String, dynamic>{'label': instance.label, 'runtimeType': instance.$type};

_SavedTour _$SavedTourFromJson(Map<String, dynamic> json) => _SavedTour(
  id: json['id'] as String,
  tourId: json['tourId'] as String,
  userId: json['userId'] as String,
  savedAt: DateTime.parse(json['savedAt'] as String),
  lastOpenedAt: json['lastOpenedAt'] == null
      ? null
      : DateTime.parse(json['lastOpenedAt'] as String),
  tourSummary: json['tourSummary'] == null
      ? null
      : TourSummary.fromJson(json['tourSummary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SavedTourToJson(_SavedTour instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'userId': instance.userId,
      'savedAt': instance.savedAt.toIso8601String(),
      'lastOpenedAt': instance.lastOpenedAt?.toIso8601String(),
      'tourSummary': instance.tourSummary?.toJson(),
    };

_PlaybackProgress _$PlaybackProgressFromJson(Map<String, dynamic> json) =>
    _PlaybackProgress(
      tourId: json['tourId'] as String,
      userId: json['userId'] as String,
      audioPositionMs: (json['audioPositionMs'] as num).toInt(),
      currentSection: (json['currentSection'] as num).toInt(),
      completed: json['completed'] as bool,
      lastUpdatedAt: DateTime.parse(json['lastUpdatedAt'] as String),
    );

Map<String, dynamic> _$PlaybackProgressToJson(_PlaybackProgress instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'userId': instance.userId,
      'audioPositionMs': instance.audioPositionMs,
      'currentSection': instance.currentSection,
      'completed': instance.completed,
      'lastUpdatedAt': instance.lastUpdatedAt.toIso8601String(),
    };

_TourRating _$TourRatingFromJson(Map<String, dynamic> json) => _TourRating(
  id: json['id'] as String,
  tourId: json['tourId'] as String,
  userId: json['userId'] as String,
  rating: (json['rating'] as num).toInt(),
  reviewText: json['reviewText'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$TourRatingToJson(_TourRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourId': instance.tourId,
      'userId': instance.userId,
      'rating': instance.rating,
      'reviewText': instance.reviewText,
      'createdAt': instance.createdAt.toIso8601String(),
    };
