import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/search_api/domain/search_api_models.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';

/// Search API controller that delegates to SearchOrchestrator.
/// Implements the REST-like API layer for search endpoints.
class SearchApiController {
  final SearchOrchestrator _orchestrator;
  final RateLimiter _rateLimiter;
  final SearchApiCache _cache;

  SearchApiController({
    required SearchOrchestrator orchestrator,
    RateLimiter? rateLimiter,
    SearchApiCache? cache,
  }) : _orchestrator = orchestrator,
       _rateLimiter = rateLimiter ?? RateLimiter(),
       _cache = cache ?? SearchApiCache();

  /// Execute a search query.
  /// GET /api/search/{vertical}
  Future<SearchApiResult> search(SearchApiQuery query, {String? userId}) async {
    final stopwatch = Stopwatch()..start();
    final requestId = 'api_${DateTime.now().millisecondsSinceEpoch}';

    // Validate query
    final validationErrors = query.validate();
    if (validationErrors.isNotEmpty) {
      return SearchApiResult.error(
        SearchApiError.unprocessable(validationErrors),
      );
    }

    // Check rate limit
    if (userId != null && !_rateLimiter.checkLimit(userId, query.vertical)) {
      return SearchApiResult.error(
        SearchApiError.quotaExceeded(
          retryAfterSeconds: _rateLimiter.getRetryAfter(userId),
        ),
      );
    }

    // Check cache (unless skipCache flag is set)
    if (!query.flags.skipCache) {
      final cached = _cache.get(query);
      if (cached != null) {
        return SearchApiResult.success(
          cached.copyWith(
            meta: cached.meta.copyWith(
              requestId: requestId,
              tookMs: stopwatch.elapsedMilliseconds,
            ),
          ),
        );
      }
    }

    // Delegate to orchestrator
    final clampedQuery = query.clamp();
    final response = await _orchestrator.search(
      SearchQuery(
        vertical: clampedQuery.vertical,
        context: SearchContext(
          locale: clampedQuery.locale,
          currency: clampedQuery.currency,
          timezone: clampedQuery.timezone,
        ),
        params: {
          if (clampedQuery.q != null) 'q': clampedQuery.q,
          ...?clampedQuery.verticalParams,
        },
        pageSize: clampedQuery.pageSize,
        cursor: clampedQuery.cursor,
        flags: SearchFlags(
          debugRanking:
              clampedQuery.flags.debug || clampedQuery.flags.includeExplain,
          skipCache: clampedQuery.flags.skipCache,
        ),
      ),
    );

    // Apply bounds filtering if boundsOnly is true
    var items = response.items;
    if (clampedQuery.boundsOnly && clampedQuery.bounds != null) {
      items = items.where((item) {
        if (item.latitude == null || item.longitude == null) return false;
        return clampedQuery.bounds!.contains(item.latitude!, item.longitude!);
      }).toList();
    }

    // Convert to API response
    final apiResponse = _toApiResponse(
      items: items,
      response: response,
      requestId: requestId,
      tookMs: stopwatch.elapsedMilliseconds,
      includeExplain: clampedQuery.flags.includeExplain,
    );

    // Cache the response
    _cache.set(clampedQuery, apiResponse);

    return SearchApiResult.success(apiResponse);
  }

  /// Suggest endpoint for autocomplete.
  /// GET /api/search/suggest
  Future<SuggestApiResponse> suggest({
    required SearchVertical vertical,
    required String q,
    String? place,
    int limit = 10,
  }) async {
    // Generate suggestions based on query
    final suggestions = _generateSuggestions(vertical, q, place, limit);

    return SuggestApiResponse(
      suggestions: suggestions,
      query: q,
      vertical: vertical,
    );
  }

  /// Transport min-price calendar.
  /// GET /api/search/transport/min-price-calendar
  Future<PriceCalendarResponse> getTransportPriceCalendar({
    required String origin,
    required String destination,
    required DateTime start,
    required DateTime end,
    String currency = 'USD',
  }) async {
    // Generate mock calendar data
    final days = <PriceCalendarDay>[];
    var current = start;
    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      final hash = origin.hashCode + destination.hashCode + current.day;
      days.add(
        PriceCalendarDay(
          date: current,
          minPrice: 100 + (hash % 500).toDouble(),
          currency: currency,
          available: hash % 10 != 0,
        ),
      );
      current = current.add(const Duration(days: 1));
    }

    return PriceCalendarResponse(
      days: days,
      origin: origin,
      destination: destination,
      currency: currency,
    );
  }

  /// Convert orchestrator response to API response.
  SearchApiResponse _toApiResponse({
    required List<SearchResultItem> items,
    required SearchResponse response,
    required String requestId,
    required int tookMs,
    required bool includeExplain,
  }) {
    return SearchApiResponse(
      items: items
          .map(
            (item) => SearchApiItem(
              id: item.id,
              vertical: item.vertical,
              title: item.title,
              subtitle: item.subtitle,
              imageUrl: item.imageUrl,
              price: item.price,
              currency: item.priceCurrency,
              rating: item.rating,
              reviewCount: item.reviewCount,
              lat: item.latitude,
              lng: item.longitude,
              provenance: item.provenance,
              details: item.details,
              savePayload: SearchApiSavePayload(
                id: item.id,
                vertical: item.vertical.name,
                title: item.title,
                dedupeKey: item.dedupeKey,
                details: item.details,
              ),
              explain: includeExplain ? item.rankingExplain : null,
            ),
          )
          .toList(),
      page: SearchApiPage(
        cursor: response.nextCursor,
        hasMore: response.nextCursor != null,
        pageSize: response.pageSize,
        totalCount: response.totalItems,
      ),
      meta: SearchApiMeta(
        requestId: requestId,
        tookMs: tookMs,
        providers: response.meta.providers
            .map(
              (p) => SearchApiProviderMeta(
                name: p.name,
                status: p.status.name,
                tookMs: p.tookMs,
                itemCount: p.itemCount,
                cache: p.cache?.name,
                error: p.error,
              ),
            )
            .toList(),
        ranking: response.meta.ranking != null
            ? SearchApiRankingMeta(
                strategy: response.meta.ranking!.strategy.name,
                weights: includeExplain ? response.meta.ranking!.weights : {},
              )
            : null,
      ),
    );
  }

  /// Generate suggestions based on query.
  List<SuggestItem> _generateSuggestions(
    SearchVertical vertical,
    String q,
    String? place,
    int limit,
  ) {
    final suggestions = <SuggestItem>[];
    final lowerQ = q.toLowerCase();

    // Gastronomy dietary suggestions
    if (vertical == SearchVertical.gastronomy) {
      final dietary = ['vegan', 'vegetarian', 'halal', 'kosher', 'gluten-free'];
      for (final d in dietary) {
        if (d.contains(lowerQ)) {
          suggestions.add(
            SuggestItem(
              text: d,
              type: 'dietary',
              score: 1.0 - (d.indexOf(lowerQ) * 0.1),
            ),
          );
        }
      }
    }

    // Sort by score and limit
    suggestions.sort((a, b) => b.score.compareTo(a.score));
    return suggestions.take(limit).toList();
  }
}

/// Result wrapper for API responses.
sealed class SearchApiResult {
  const SearchApiResult();

  factory SearchApiResult.success(SearchApiResponse response) =
      SearchApiSuccess;
  factory SearchApiResult.error(SearchApiError error) = SearchApiFailure;
}

class SearchApiSuccess extends SearchApiResult {
  final SearchApiResponse response;
  const SearchApiSuccess(this.response);
}

class SearchApiFailure extends SearchApiResult {
  final SearchApiError error;
  const SearchApiFailure(this.error);
}

/// Suggest API response.
class SuggestApiResponse {
  final List<SuggestItem> suggestions;
  final String query;
  final SearchVertical vertical;

  const SuggestApiResponse({
    required this.suggestions,
    required this.query,
    required this.vertical,
  });
}

/// Suggest item.
class SuggestItem {
  final String text;
  final String type;
  final double score;

  const SuggestItem({
    required this.text,
    required this.type,
    required this.score,
  });
}

/// Price calendar response.
class PriceCalendarResponse {
  final List<PriceCalendarDay> days;
  final String origin;
  final String destination;
  final String currency;

  const PriceCalendarResponse({
    required this.days,
    required this.origin,
    required this.destination,
    required this.currency,
  });
}

/// Price calendar day.
class PriceCalendarDay {
  final DateTime date;
  final double minPrice;
  final String currency;
  final bool available;

  const PriceCalendarDay({
    required this.date,
    required this.minPrice,
    required this.currency,
    required this.available,
  });
}

/// Simple in-memory rate limiter.
class RateLimiter {
  final Map<String, List<DateTime>> _requests = {};
  final int maxRequests;
  final Duration window;

  RateLimiter({
    this.maxRequests = 100,
    this.window = const Duration(minutes: 1),
  });

  /// Check if a request is allowed.
  bool checkLimit(String userId, SearchVertical vertical) {
    final key = '$userId:${vertical.name}';
    final now = DateTime.now();

    // Clean old requests
    _requests[key]?.removeWhere((t) => now.difference(t) > window);

    // Check limit
    final requests = _requests[key] ?? [];
    if (requests.length >= maxRequests) {
      return false;
    }

    // Record request
    _requests[key] = [...requests, now];
    return true;
  }

  /// Get retry-after seconds.
  int getRetryAfter(String userId) {
    return window.inSeconds;
  }
}

/// Simple in-memory cache for API responses.
class SearchApiCache {
  final Map<String, _CacheEntry> _cache = {};
  final Duration ttl;

  SearchApiCache({this.ttl = const Duration(minutes: 2)});

  /// Get cached response.
  SearchApiResponse? get(SearchApiQuery query) {
    final key = _makeKey(query);
    final entry = _cache[key];
    if (entry == null) return null;
    if (DateTime.now().isAfter(entry.expiresAt)) {
      _cache.remove(key);
      return null;
    }
    return entry.response;
  }

  /// Cache a response.
  void set(SearchApiQuery query, SearchApiResponse response) {
    final key = _makeKey(query);
    _cache[key] = _CacheEntry(
      response: response,
      expiresAt: DateTime.now().add(ttl),
    );
  }

  /// Generate cache key.
  String _makeKey(SearchApiQuery query) {
    return '${query.vertical.name}|${query.locale}|${query.currency}|${query.q ?? ''}|${query.pageSize}';
  }
}

class _CacheEntry {
  final SearchApiResponse response;
  final DateTime expiresAt;

  _CacheEntry({required this.response, required this.expiresAt});
}

/// Provider for the search API controller.
final searchApiControllerProvider = Provider<SearchApiController>((ref) {
  return SearchApiController(
    orchestrator: ref.watch(searchOrchestratorProvider),
  );
});
