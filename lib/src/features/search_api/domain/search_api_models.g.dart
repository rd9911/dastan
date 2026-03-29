// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_api_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchApiQuery _$SearchApiQueryFromJson(Map<String, dynamic> json) =>
    _SearchApiQuery(
      vertical: $enumDecode(_$FeatureVerticalEnumMap, json['vertical']),
      q: json['q'] as String?,
      locale: json['locale'] as String? ?? 'en',
      currency: json['currency'] as String? ?? 'USD',
      timezone: json['timezone'] as String? ?? 'UTC',
      bounds: json['bounds'] == null
          ? null
          : SearchBounds.fromJson(json['bounds'] as Map<String, dynamic>),
      boundsOnly: json['boundsOnly'] as bool? ?? false,
      sort:
          $enumDecodeNullable(_$SearchApiSortEnumMap, json['sort']) ??
          SearchApiSort.relevance,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
      cursor: json['cursor'] as String?,
      flags: json['flags'] == null
          ? const SearchApiFlags()
          : SearchApiFlags.fromJson(json['flags'] as Map<String, dynamic>),
      verticalParams: json['verticalParams'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SearchApiQueryToJson(_SearchApiQuery instance) =>
    <String, dynamic>{
      'vertical': _$FeatureVerticalEnumMap[instance.vertical]!,
      'q': instance.q,
      'locale': instance.locale,
      'currency': instance.currency,
      'timezone': instance.timezone,
      'bounds': instance.bounds?.toJson(),
      'boundsOnly': instance.boundsOnly,
      'sort': _$SearchApiSortEnumMap[instance.sort]!,
      'pageSize': instance.pageSize,
      'cursor': instance.cursor,
      'flags': instance.flags.toJson(),
      'verticalParams': instance.verticalParams,
    };

const _$FeatureVerticalEnumMap = {
  FeatureVertical.transport: 'transport',
  FeatureVertical.accommodation: 'accommodation',
  FeatureVertical.entertainment: 'entertainment',
  FeatureVertical.gastronomy: 'gastronomy',
  FeatureVertical.events: 'events',
  FeatureVertical.trails: 'trails',
};

const _$SearchApiSortEnumMap = {
  SearchApiSort.relevance: 'relevance',
  SearchApiSort.price: 'price',
  SearchApiSort.rating: 'rating',
  SearchApiSort.distance: 'distance',
  SearchApiSort.date: 'date',
  SearchApiSort.popularity: 'popularity',
};

_SearchBounds _$SearchBoundsFromJson(Map<String, dynamic> json) =>
    _SearchBounds(
      north: (json['north'] as num).toDouble(),
      south: (json['south'] as num).toDouble(),
      east: (json['east'] as num).toDouble(),
      west: (json['west'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchBoundsToJson(_SearchBounds instance) =>
    <String, dynamic>{
      'north': instance.north,
      'south': instance.south,
      'east': instance.east,
      'west': instance.west,
    };

_SearchApiFlags _$SearchApiFlagsFromJson(Map<String, dynamic> json) =>
    _SearchApiFlags(
      debug: json['debug'] as bool? ?? false,
      strict: json['strict'] as bool? ?? false,
      skipCache: json['skipCache'] as bool? ?? false,
      includeExplain: json['includeExplain'] as bool? ?? false,
    );

Map<String, dynamic> _$SearchApiFlagsToJson(_SearchApiFlags instance) =>
    <String, dynamic>{
      'debug': instance.debug,
      'strict': instance.strict,
      'skipCache': instance.skipCache,
      'includeExplain': instance.includeExplain,
    };

_SearchApiResponse _$SearchApiResponseFromJson(Map<String, dynamic> json) =>
    _SearchApiResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => SearchApiItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: SearchApiPage.fromJson(json['page'] as Map<String, dynamic>),
      meta: SearchApiMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchApiResponseToJson(_SearchApiResponse instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'page': instance.page.toJson(),
      'meta': instance.meta.toJson(),
    };

_SearchApiItem _$SearchApiItemFromJson(Map<String, dynamic> json) =>
    _SearchApiItem(
      id: json['id'] as String,
      vertical: $enumDecode(_$FeatureVerticalEnumMap, json['vertical']),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      address: json['address'] as String?,
      provenance:
          (json['provenance'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      details: json['details'] as Map<String, dynamic>?,
      savePayload: json['savePayload'] == null
          ? null
          : SearchApiSavePayload.fromJson(
              json['savePayload'] as Map<String, dynamic>,
            ),
      explain: json['explain'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SearchApiItemToJson(_SearchApiItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vertical': _$FeatureVerticalEnumMap[instance.vertical]!,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'currency': instance.currency,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'provenance': instance.provenance,
      'details': instance.details,
      'savePayload': instance.savePayload?.toJson(),
      'explain': instance.explain,
    };

_SearchApiSavePayload _$SearchApiSavePayloadFromJson(
  Map<String, dynamic> json,
) => _SearchApiSavePayload(
  id: json['id'] as String,
  vertical: json['vertical'] as String,
  title: json['title'] as String,
  dedupeKey: json['dedupeKey'] as String,
  details: json['details'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$SearchApiSavePayloadToJson(
  _SearchApiSavePayload instance,
) => <String, dynamic>{
  'id': instance.id,
  'vertical': instance.vertical,
  'title': instance.title,
  'dedupeKey': instance.dedupeKey,
  'details': instance.details,
};

_SearchApiPage _$SearchApiPageFromJson(Map<String, dynamic> json) =>
    _SearchApiPage(
      cursor: json['cursor'] as String?,
      hasMore: json['hasMore'] as bool,
      pageSize: (json['pageSize'] as num).toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchApiPageToJson(_SearchApiPage instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'hasMore': instance.hasMore,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
    };

_SearchApiMeta _$SearchApiMetaFromJson(Map<String, dynamic> json) =>
    _SearchApiMeta(
      requestId: json['requestId'] as String,
      tookMs: (json['tookMs'] as num).toInt(),
      providers: (json['providers'] as List<dynamic>)
          .map((e) => SearchApiProviderMeta.fromJson(e as Map<String, dynamic>))
          .toList(),
      ranking: json['ranking'] == null
          ? null
          : SearchApiRankingMeta.fromJson(
              json['ranking'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SearchApiMetaToJson(_SearchApiMeta instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'tookMs': instance.tookMs,
      'providers': instance.providers.map((e) => e.toJson()).toList(),
      'ranking': instance.ranking?.toJson(),
    };

_SearchApiProviderMeta _$SearchApiProviderMetaFromJson(
  Map<String, dynamic> json,
) => _SearchApiProviderMeta(
  name: json['name'] as String,
  status: json['status'] as String,
  tookMs: (json['tookMs'] as num).toInt(),
  itemCount: (json['itemCount'] as num).toInt(),
  cache: json['cache'] as String?,
  error: json['error'] as String?,
);

Map<String, dynamic> _$SearchApiProviderMetaToJson(
  _SearchApiProviderMeta instance,
) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'tookMs': instance.tookMs,
  'itemCount': instance.itemCount,
  'cache': instance.cache,
  'error': instance.error,
};

_SearchApiRankingMeta _$SearchApiRankingMetaFromJson(
  Map<String, dynamic> json,
) => _SearchApiRankingMeta(
  strategy: json['strategy'] as String,
  weights:
      (json['weights'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ) ??
      const {},
);

Map<String, dynamic> _$SearchApiRankingMetaToJson(
  _SearchApiRankingMeta instance,
) => <String, dynamic>{
  'strategy': instance.strategy,
  'weights': instance.weights,
};

_SearchApiError _$SearchApiErrorFromJson(Map<String, dynamic> json) =>
    _SearchApiError(
      code: json['code'] as String,
      message: json['message'] as String,
      details:
          (json['details'] as List<dynamic>?)
              ?.map(
                (e) => SearchApiErrorDetail.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchApiErrorToJson(_SearchApiError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details.map((e) => e.toJson()).toList(),
    };

_SearchApiErrorDetail _$SearchApiErrorDetailFromJson(
  Map<String, dynamic> json,
) => _SearchApiErrorDetail(
  field: json['field'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$SearchApiErrorDetailToJson(
  _SearchApiErrorDetail instance,
) => <String, dynamic>{'field': instance.field, 'message': instance.message};
