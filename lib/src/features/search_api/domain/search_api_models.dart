import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';

part 'search_api_models.freezed.dart';
part 'search_api_models.g.dart';

/// Shared query parameters for all search endpoints.
@freezed
abstract class SearchApiQuery with _$SearchApiQuery {
  const SearchApiQuery._();

  const factory SearchApiQuery({
    required SearchVertical vertical,
    String? q,
    @Default('en') String locale,
    @Default('USD') String currency,
    @Default('UTC') String timezone,
    SearchBounds? bounds,
    @Default(false) bool boundsOnly,
    @Default(SearchApiSort.relevance) SearchApiSort sort,
    @Default(20) int pageSize,
    String? cursor,
    @Default(SearchApiFlags()) SearchApiFlags flags,
    Map<String, dynamic>? verticalParams,
  }) = _SearchApiQuery;

  factory SearchApiQuery.fromJson(Map<String, dynamic> json) =>
      _$SearchApiQueryFromJson(json);

  /// Validate query parameters.
  List<String> validate() {
    final errors = <String>[];
    if (pageSize < 1 || pageSize > 100) {
      errors.add('pageSize must be between 1 and 100');
    }
    if (q != null && q!.length > 500) {
      errors.add('q must be <= 500 characters');
    }
    if (bounds != null) {
      final boundsErrors = bounds!.validate();
      errors.addAll(boundsErrors);
    }
    return errors;
  }

  /// Clamp values to valid ranges.
  SearchApiQuery clamp() {
    return copyWith(
      pageSize: pageSize.clamp(1, 100),
      q: q != null && q!.length > 500 ? q!.substring(0, 500) : q,
    );
  }
}

/// Geographic bounds for viewport filtering.
@freezed
abstract class SearchBounds with _$SearchBounds {
  const SearchBounds._();

  const factory SearchBounds({
    required double north,
    required double south,
    required double east,
    required double west,
  }) = _SearchBounds;

  factory SearchBounds.fromJson(Map<String, dynamic> json) =>
      _$SearchBoundsFromJson(json);

  /// Validate bounds.
  List<String> validate() {
    final errors = <String>[];
    if (north < -90 || north > 90) {
      errors.add('north must be between -90 and 90');
    }
    if (south < -90 || south > 90) {
      errors.add('south must be between -90 and 90');
    }
    if (east < -180 || east > 180) {
      errors.add('east must be between -180 and 180');
    }
    if (west < -180 || west > 180) {
      errors.add('west must be between -180 and 180');
    }
    if (north <= south) errors.add('north must be greater than south');
    return errors;
  }

  /// Check if a point is within bounds.
  bool contains(double lat, double lng) {
    return lat >= south && lat <= north && lng >= west && lng <= east;
  }
}

/// Sort options for search.
enum SearchApiSort { relevance, price, rating, distance, date, popularity }

/// Debug/feature flags.
@freezed
abstract class SearchApiFlags with _$SearchApiFlags {
  const factory SearchApiFlags({
    @Default(false) bool debug,
    @Default(false) bool strict,
    @Default(false) bool skipCache,
    @Default(false) bool includeExplain,
  }) = _SearchApiFlags;

  factory SearchApiFlags.fromJson(Map<String, dynamic> json) =>
      _$SearchApiFlagsFromJson(json);
}

/// Standard API response envelope.
@freezed
abstract class SearchApiResponse with _$SearchApiResponse {
  const factory SearchApiResponse({
    required List<SearchApiItem> items,
    required SearchApiPage page,
    required SearchApiMeta meta,
  }) = _SearchApiResponse;

  factory SearchApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchApiResponseFromJson(json);
}

/// Canonical search result item for API.
@freezed
abstract class SearchApiItem with _$SearchApiItem {
  const factory SearchApiItem({
    required String id,
    required SearchVertical vertical,
    required String title,
    String? subtitle,
    String? imageUrl,
    double? price,
    String? currency,
    double? rating,
    int? reviewCount,
    double? lat,
    double? lng,
    String? address,
    @Default([]) List<String> provenance,
    Map<String, dynamic>? details,
    SearchApiSavePayload? savePayload,
    Map<String, dynamic>? explain,
  }) = _SearchApiItem;

  factory SearchApiItem.fromJson(Map<String, dynamic> json) =>
      _$SearchApiItemFromJson(json);
}

/// Payload for saving an item to itinerary.
@freezed
abstract class SearchApiSavePayload with _$SearchApiSavePayload {
  const factory SearchApiSavePayload({
    required String id,
    required String vertical,
    required String title,
    required String dedupeKey,
    Map<String, dynamic>? details,
  }) = _SearchApiSavePayload;

  factory SearchApiSavePayload.fromJson(Map<String, dynamic> json) =>
      _$SearchApiSavePayloadFromJson(json);
}

/// Pagination info.
@freezed
abstract class SearchApiPage with _$SearchApiPage {
  const factory SearchApiPage({
    String? cursor,
    required bool hasMore,
    required int pageSize,
    int? totalCount,
  }) = _SearchApiPage;

  factory SearchApiPage.fromJson(Map<String, dynamic> json) =>
      _$SearchApiPageFromJson(json);
}

/// Response metadata.
@freezed
abstract class SearchApiMeta with _$SearchApiMeta {
  const factory SearchApiMeta({
    required String requestId,
    required int tookMs,
    required List<SearchApiProviderMeta> providers,
    SearchApiRankingMeta? ranking,
  }) = _SearchApiMeta;

  factory SearchApiMeta.fromJson(Map<String, dynamic> json) =>
      _$SearchApiMetaFromJson(json);
}

/// Per-provider metadata.
@freezed
abstract class SearchApiProviderMeta with _$SearchApiProviderMeta {
  const factory SearchApiProviderMeta({
    required String name,
    required String status,
    required int tookMs,
    required int itemCount,
    String? cache,
    String? error,
  }) = _SearchApiProviderMeta;

  factory SearchApiProviderMeta.fromJson(Map<String, dynamic> json) =>
      _$SearchApiProviderMetaFromJson(json);
}

/// Ranking metadata.
@freezed
abstract class SearchApiRankingMeta with _$SearchApiRankingMeta {
  const factory SearchApiRankingMeta({
    required String strategy,
    @Default({}) Map<String, double> weights,
  }) = _SearchApiRankingMeta;

  factory SearchApiRankingMeta.fromJson(Map<String, dynamic> json) =>
      _$SearchApiRankingMetaFromJson(json);
}

/// Standard API error response.
@freezed
abstract class SearchApiError with _$SearchApiError {
  const factory SearchApiError({
    required String code,
    required String message,
    @Default([]) List<SearchApiErrorDetail> details,
  }) = _SearchApiError;

  factory SearchApiError.fromJson(Map<String, dynamic> json) =>
      _$SearchApiErrorFromJson(json);

  /// Create missing active itinerary error.
  static SearchApiError missingActiveItinerary() => const SearchApiError(
    code: 'MISSING_ACTIVE_ITINERARY',
    message:
        'No active itinerary found. Please select or create an itinerary first.',
  );

  /// Create forbidden error.
  static SearchApiError forbidden(String resource) => SearchApiError(
    code: 'FORBIDDEN',
    message: 'You do not have permission to access $resource.',
  );

  /// Create quota exceeded error.
  static SearchApiError quotaExceeded({int? retryAfterSeconds}) =>
      SearchApiError(
        code: 'QUOTA_EXCEEDED',
        message: 'Rate limit exceeded. Please try again later.',
        details: retryAfterSeconds != null
            ? [
                SearchApiErrorDetail(
                  field: 'retryAfter',
                  message: '${retryAfterSeconds}s',
                ),
              ]
            : [],
      );

  /// Create unprocessable entity error.
  static SearchApiError unprocessable(List<String> errors) => SearchApiError(
    code: 'UNPROCESSABLE_ENTITY',
    message: 'Request validation failed.',
    details: errors
        .map((e) => SearchApiErrorDetail(field: 'validation', message: e))
        .toList(),
  );
}

/// Error detail.
@freezed
abstract class SearchApiErrorDetail with _$SearchApiErrorDetail {
  const factory SearchApiErrorDetail({
    required String field,
    required String message,
  }) = _SearchApiErrorDetail;

  factory SearchApiErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$SearchApiErrorDetailFromJson(json);
}
