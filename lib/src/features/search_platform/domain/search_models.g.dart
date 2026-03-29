// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchContext _$SearchContextFromJson(Map<String, dynamic> json) =>
    _SearchContext(
      itineraryId: json['itineraryId'] as String?,
      locale: json['locale'] as String? ?? 'en',
      currency: json['currency'] as String? ?? 'USD',
      timezone: json['timezone'] as String? ?? 'UTC',
      userPrefs: json['userPrefs'] == null
          ? null
          : SearchPrefs.fromJson(json['userPrefs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchContextToJson(_SearchContext instance) =>
    <String, dynamic>{
      'itineraryId': instance.itineraryId,
      'locale': instance.locale,
      'currency': instance.currency,
      'timezone': instance.timezone,
      'userPrefs': instance.userPrefs?.toJson(),
    };

_SearchPrefs _$SearchPrefsFromJson(Map<String, dynamic> json) => _SearchPrefs(
  preferCheapest: json['preferCheapest'] as bool? ?? false,
  preferFastest: json['preferFastest'] as bool? ?? false,
  preferNearby: json['preferNearby'] as bool? ?? false,
  preferHighRated: json['preferHighRated'] as bool? ?? false,
  dietaryFilters:
      (json['dietaryFilters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  accessibilityNeeds:
      (json['accessibilityNeeds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$SearchPrefsToJson(_SearchPrefs instance) =>
    <String, dynamic>{
      'preferCheapest': instance.preferCheapest,
      'preferFastest': instance.preferFastest,
      'preferNearby': instance.preferNearby,
      'preferHighRated': instance.preferHighRated,
      'dietaryFilters': instance.dietaryFilters,
      'accessibilityNeeds': instance.accessibilityNeeds,
    };

_SearchQuery _$SearchQueryFromJson(Map<String, dynamic> json) => _SearchQuery(
  vertical: $enumDecode(_$FeatureVerticalEnumMap, json['vertical']),
  context: SearchContext.fromJson(json['context'] as Map<String, dynamic>),
  params: json['params'] as Map<String, dynamic>,
  page: (json['page'] as num?)?.toInt() ?? 0,
  pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
  cursor: json['cursor'] as String?,
  flags: json['flags'] == null
      ? const SearchFlags()
      : SearchFlags.fromJson(json['flags'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SearchQueryToJson(_SearchQuery instance) =>
    <String, dynamic>{
      'vertical': _$FeatureVerticalEnumMap[instance.vertical]!,
      'context': instance.context.toJson(),
      'params': instance.params,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'cursor': instance.cursor,
      'flags': instance.flags.toJson(),
    };

const _$FeatureVerticalEnumMap = {
  FeatureVertical.transport: 'transport',
  FeatureVertical.accommodation: 'accommodation',
  FeatureVertical.entertainment: 'entertainment',
  FeatureVertical.gastronomy: 'gastronomy',
  FeatureVertical.events: 'events',
  FeatureVertical.trails: 'trails',
};

_SearchFlags _$SearchFlagsFromJson(Map<String, dynamic> json) => _SearchFlags(
  debugRanking: json['debugRanking'] as bool? ?? false,
  skipCache: json['skipCache'] as bool? ?? false,
  includeProvenance: json['includeProvenance'] as bool? ?? false,
  enabledProviders:
      (json['enabledProviders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  disabledProviders:
      (json['disabledProviders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$SearchFlagsToJson(_SearchFlags instance) =>
    <String, dynamic>{
      'debugRanking': instance.debugRanking,
      'skipCache': instance.skipCache,
      'includeProvenance': instance.includeProvenance,
      'enabledProviders': instance.enabledProviders,
      'disabledProviders': instance.disabledProviders,
    };

_SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    _SearchResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      nextCursor: json['nextCursor'] as String?,
      prevCursor: json['prevCursor'] as String?,
      meta: SearchMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResponseToJson(_SearchResponse instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalItems': instance.totalItems,
      'nextCursor': instance.nextCursor,
      'prevCursor': instance.prevCursor,
      'meta': instance.meta.toJson(),
    };

_SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) =>
    _SearchResultItem(
      id: json['id'] as String,
      dedupeKey: json['dedupeKey'] as String,
      vertical: $enumDecode(_$FeatureVerticalEnumMap, json['vertical']),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      priceCurrency: json['priceCurrency'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      details: json['details'] as Map<String, dynamic>?,
      provenance:
          (json['provenance'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rankingExplain: json['rankingExplain'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SearchResultItemToJson(_SearchResultItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dedupeKey': instance.dedupeKey,
      'vertical': _$FeatureVerticalEnumMap[instance.vertical]!,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'priceCurrency': instance.priceCurrency,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'details': instance.details,
      'provenance': instance.provenance,
      'rankingExplain': instance.rankingExplain,
    };

_SearchMeta _$SearchMetaFromJson(Map<String, dynamic> json) => _SearchMeta(
  searchRequestId: json['searchRequestId'] as String,
  tookMs: (json['tookMs'] as num).toInt(),
  providers: (json['providers'] as List<dynamic>)
      .map((e) => ProviderMeta.fromJson(e as Map<String, dynamic>))
      .toList(),
  ranking: json['ranking'] == null
      ? null
      : RankingMeta.fromJson(json['ranking'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SearchMetaToJson(_SearchMeta instance) =>
    <String, dynamic>{
      'searchRequestId': instance.searchRequestId,
      'tookMs': instance.tookMs,
      'providers': instance.providers.map((e) => e.toJson()).toList(),
      'ranking': instance.ranking?.toJson(),
    };

_ProviderMeta _$ProviderMetaFromJson(Map<String, dynamic> json) =>
    _ProviderMeta(
      name: json['name'] as String,
      status: $enumDecode(_$ProviderStatusEnumMap, json['status']),
      tookMs: (json['tookMs'] as num).toInt(),
      itemCount: (json['itemCount'] as num).toInt(),
      cache: $enumDecodeNullable(_$CacheStatusEnumMap, json['cache']),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ProviderMetaToJson(_ProviderMeta instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': _$ProviderStatusEnumMap[instance.status]!,
      'tookMs': instance.tookMs,
      'itemCount': instance.itemCount,
      'cache': _$CacheStatusEnumMap[instance.cache],
      'error': instance.error,
    };

const _$ProviderStatusEnumMap = {
  ProviderStatus.ok: 'ok',
  ProviderStatus.timeout: 'timeout',
  ProviderStatus.error: 'error',
  ProviderStatus.budgetExhausted: 'budgetExhausted',
  ProviderStatus.disabled: 'disabled',
  ProviderStatus.rateLimited: 'rateLimited',
};

const _$CacheStatusEnumMap = {
  CacheStatus.edge: 'edge',
  CacheStatus.service: 'service',
  CacheStatus.miss: 'miss',
};

_RankingMeta _$RankingMetaFromJson(Map<String, dynamic> json) => _RankingMeta(
  strategy: $enumDecode(_$RankingStrategyEnumMap, json['strategy']),
  weights:
      (json['weights'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ) ??
      const {},
);

Map<String, dynamic> _$RankingMetaToJson(_RankingMeta instance) =>
    <String, dynamic>{
      'strategy': _$RankingStrategyEnumMap[instance.strategy]!,
      'weights': instance.weights,
    };

const _$RankingStrategyEnumMap = {
  RankingStrategy.relevance: 'relevance',
  RankingStrategy.priceLowToHigh: 'priceLowToHigh',
  RankingStrategy.priceHighToLow: 'priceHighToLow',
  RankingStrategy.rating: 'rating',
  RankingStrategy.distance: 'distance',
  RankingStrategy.duration: 'duration',
  RankingStrategy.popularity: 'popularity',
};
