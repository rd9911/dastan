import 'package:freezed_annotation/freezed_annotation.dart';

// Re-export FeatureVertical as SearchVertical for backward compatibility
export 'package:dastan/src/core/domain/vertical.dart'
    show FeatureVertical, SearchVertical;
import 'package:dastan/src/core/domain/vertical.dart';

part 'search_models.freezed.dart';
part 'search_models.g.dart';

/// Search context containing user preferences and locale.
@freezed
abstract class SearchContext with _$SearchContext {
  const factory SearchContext({
    String? itineraryId,
    @Default('en') String locale,
    @Default('USD') String currency,
    @Default('UTC') String timezone,
    SearchPrefs? userPrefs,
  }) = _SearchContext;

  factory SearchContext.fromJson(Map<String, dynamic> json) =>
      _$SearchContextFromJson(json);
}

/// User search preferences for ranking.
@freezed
abstract class SearchPrefs with _$SearchPrefs {
  const factory SearchPrefs({
    @Default(false) bool preferCheapest,
    @Default(false) bool preferFastest,
    @Default(false) bool preferNearby,
    @Default(false) bool preferHighRated,
    @Default([]) List<String> dietaryFilters,
    @Default([]) List<String> accessibilityNeeds,
  }) = _SearchPrefs;

  factory SearchPrefs.fromJson(Map<String, dynamic> json) =>
      _$SearchPrefsFromJson(json);
}

/// Search query with vertical, context, params, and pagination.
@freezed
abstract class SearchQuery with _$SearchQuery {
  const SearchQuery._();

  const factory SearchQuery({
    required SearchVertical vertical,
    required SearchContext context,
    required Map<String, dynamic> params,
    @Default(0) int page,
    @Default(20) int pageSize,
    String? cursor,
    @Default(SearchFlags()) SearchFlags flags,
  }) = _SearchQuery;

  factory SearchQuery.fromJson(Map<String, dynamic> json) =>
      _$SearchQueryFromJson(json);

  /// Validate query parameters.
  List<String> validate() {
    final errors = <String>[];
    if (pageSize < 1 || pageSize > 100) {
      errors.add('pageSize must be between 1 and 100');
    }
    if (page < 0) {
      errors.add('page must be >= 0');
    }
    return errors;
  }

  /// Clamp values to valid ranges.
  SearchQuery clamp() {
    return copyWith(
      page: page.clamp(0, 1000),
      pageSize: pageSize.clamp(1, 100),
    );
  }
}

/// Search flags for debugging and feature toggles.
@freezed
abstract class SearchFlags with _$SearchFlags {
  const factory SearchFlags({
    @Default(false) bool debugRanking,
    @Default(false) bool skipCache,
    @Default(false) bool includeProvenance,
    @Default([]) List<String> enabledProviders,
    @Default([]) List<String> disabledProviders,
  }) = _SearchFlags;

  factory SearchFlags.fromJson(Map<String, dynamic> json) =>
      _$SearchFlagsFromJson(json);
}

/// Search response with items, pagination, and metadata.
@freezed
abstract class SearchResponse with _$SearchResponse {
  const factory SearchResponse({
    required List<SearchResultItem> items,
    required int page,
    required int pageSize,
    required int totalItems,
    String? nextCursor,
    String? prevCursor,
    required SearchMeta meta,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

/// Individual search result item (canonical format).
@freezed
abstract class SearchResultItem with _$SearchResultItem {
  const factory SearchResultItem({
    required String id,
    required String dedupeKey,
    required SearchVertical vertical,
    required String title,
    String? subtitle,
    String? imageUrl,
    double? price,
    String? priceCurrency,
    double? rating,
    int? reviewCount,
    double? latitude,
    double? longitude,
    Map<String, dynamic>? details,
    @Default([]) List<String> provenance,
    Map<String, dynamic>? rankingExplain,
  }) = _SearchResultItem;

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
}

/// Search response metadata.
@freezed
abstract class SearchMeta with _$SearchMeta {
  const factory SearchMeta({
    required String searchRequestId,
    required int tookMs,
    required List<ProviderMeta> providers,
    RankingMeta? ranking,
  }) = _SearchMeta;

  factory SearchMeta.fromJson(Map<String, dynamic> json) =>
      _$SearchMetaFromJson(json);
}

/// Per-provider metadata.
@freezed
abstract class ProviderMeta with _$ProviderMeta {
  const factory ProviderMeta({
    required String name,
    required ProviderStatus status,
    required int tookMs,
    required int itemCount,
    CacheStatus? cache,
    String? error,
  }) = _ProviderMeta;

  factory ProviderMeta.fromJson(Map<String, dynamic> json) =>
      _$ProviderMetaFromJson(json);
}

/// Provider status.
enum ProviderStatus {
  ok,
  timeout,
  error,
  budgetExhausted,
  disabled,
  rateLimited,
}

/// Cache status.
enum CacheStatus { edge, service, miss }

/// Ranking metadata.
@freezed
abstract class RankingMeta with _$RankingMeta {
  const factory RankingMeta({
    required RankingStrategy strategy,
    @Default({}) Map<String, double> weights,
  }) = _RankingMeta;

  factory RankingMeta.fromJson(Map<String, dynamic> json) =>
      _$RankingMetaFromJson(json);
}

/// Ranking strategies.
enum RankingStrategy {
  relevance,
  priceLowToHigh,
  priceHighToLow,
  rating,
  distance,
  duration,
  popularity,
}
