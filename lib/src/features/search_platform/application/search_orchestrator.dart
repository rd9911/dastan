import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/data/provider_adapter.dart';

/// Search orchestrator that fans out to providers, merges, ranks, and paginates results.
class SearchOrchestrator {
  final ProviderRegistry _registry;
  final SearchCache _cache;
  final SearchRanker _ranker;

  SearchOrchestrator({
    required ProviderRegistry registry,
    required SearchCache cache,
    required SearchRanker ranker,
  }) : _registry = registry,
       _cache = cache,
       _ranker = ranker;

  /// Execute a search query.
  Future<SearchResponse> search(SearchQuery query) async {
    final stopwatch = Stopwatch()..start();
    final searchRequestId = 'search_${DateTime.now().millisecondsSinceEpoch}';

    // Validate and clamp query
    final validQuery = query.clamp();

    // Check cache first (unless skipCache flag is set)
    if (!query.flags.skipCache) {
      final cached = _cache.get(_cacheKey(validQuery));
      if (cached != null) {
        return cached.copyWith(
          meta: cached.meta.copyWith(
            searchRequestId: searchRequestId,
            tookMs: stopwatch.elapsedMilliseconds,
          ),
        );
      }
    }

    // Get adapters for the vertical
    final adapters = _getAdapters(validQuery);
    if (adapters.isEmpty) {
      return _emptyResponse(searchRequestId, stopwatch.elapsedMilliseconds);
    }

    // Fan out to providers with timeout
    final providerResults = await _fanOut(adapters, validQuery);

    // Merge and dedupe results
    final mergedItems = _mergeAndDedupe(providerResults);

    // Rank results
    final rankedItems = _ranker.rank(mergedItems, validQuery);

    // Paginate
    final paginatedItems = rankedItems
        .skip(validQuery.page * validQuery.pageSize)
        .take(validQuery.pageSize)
        .toList();

    // Build response
    final response = SearchResponse(
      items: paginatedItems,
      page: validQuery.page,
      pageSize: validQuery.pageSize,
      totalItems: rankedItems.length,
      nextCursor: _buildCursor(
        validQuery.page + 1,
        rankedItems.length,
        validQuery.pageSize,
      ),
      prevCursor: validQuery.page > 0
          ? _buildCursor(
              validQuery.page - 1,
              rankedItems.length,
              validQuery.pageSize,
            )
          : null,
      meta: SearchMeta(
        searchRequestId: searchRequestId,
        tookMs: stopwatch.elapsedMilliseconds,
        providers: providerResults
            .map(
              (r) => ProviderMeta(
                name: r.providerName,
                status: r.status,
                tookMs: r.tookMs,
                itemCount: r.items.length,
                cache: r.cache,
                error: r.error,
              ),
            )
            .toList(),
        ranking: RankingMeta(
          strategy: _ranker.currentStrategy,
          weights: validQuery.flags.debugRanking ? _ranker.weights : {},
        ),
      ),
    );

    // Cache the response
    _cache.set(_cacheKey(validQuery), response);

    return response;
  }

  /// Get adapters for the query, respecting flags.
  List<ProviderAdapter> _getAdapters(SearchQuery query) {
    var adapters = _registry.forVertical(query.vertical);

    // Filter by enabled/disabled providers in flags
    if (query.flags.enabledProviders.isNotEmpty) {
      adapters = adapters
          .where((a) => query.flags.enabledProviders.contains(a.config.name))
          .toList();
    }
    if (query.flags.disabledProviders.isNotEmpty) {
      adapters = adapters
          .where((a) => !query.flags.disabledProviders.contains(a.config.name))
          .toList();
    }

    return adapters;
  }

  /// Fan out to all providers with timeout handling.
  Future<List<ProviderResult>> _fanOut(
    List<ProviderAdapter> adapters,
    SearchQuery query,
  ) async {
    final futures = adapters.map((adapter) async {
      try {
        return await adapter
            .search(query)
            .timeout(
              Duration(milliseconds: adapter.config.timeoutMs),
              onTimeout: () => ProviderResult(
                providerName: adapter.config.name,
                items: [],
                status: ProviderStatus.timeout,
                tookMs: adapter.config.timeoutMs,
                error: 'Request timed out',
              ),
            );
      } catch (e) {
        return ProviderResult(
          providerName: adapter.config.name,
          items: [],
          status: ProviderStatus.error,
          tookMs: 0,
          error: e.toString(),
        );
      }
    });

    return Future.wait(futures);
  }

  /// Merge results from multiple providers and dedupe.
  List<SearchResultItem> _mergeAndDedupe(List<ProviderResult> results) {
    final itemsByKey = <String, SearchResultItem>{};

    for (final result in results) {
      if (result.status != ProviderStatus.ok) continue;

      for (final item in result.items) {
        final key = item.dedupeKey;
        if (itemsByKey.containsKey(key)) {
          // Merge provenance
          final existing = itemsByKey[key]!;
          itemsByKey[key] = existing.copyWith(
            provenance: [...existing.provenance, ...item.provenance],
          );
        } else {
          itemsByKey[key] = item;
        }
      }
    }

    return itemsByKey.values.toList();
  }

  /// Build pagination cursor.
  String? _buildCursor(int page, int totalItems, int pageSize) {
    if (page * pageSize >= totalItems) return null;
    return 'page:$page';
  }

  /// Generate cache key.
  String _cacheKey(SearchQuery query) {
    return '${query.vertical.name}|${query.context.locale}|${query.context.currency}|${query.pageSize}';
  }

  /// Empty response for no results.
  SearchResponse _emptyResponse(String requestId, int tookMs) {
    return SearchResponse(
      items: [],
      page: 0,
      pageSize: 20,
      totalItems: 0,
      meta: SearchMeta(
        searchRequestId: requestId,
        tookMs: tookMs,
        providers: [],
      ),
    );
  }
}

/// In-memory search cache.
class SearchCache {
  final Map<String, _CacheEntry> _cache = {};
  final Duration _defaultTtl;
  final Duration _negativeCacheTtl;

  SearchCache({Duration? defaultTtl, Duration? negativeCacheTtl})
    : _defaultTtl = defaultTtl ?? const Duration(minutes: 5),
      _negativeCacheTtl = negativeCacheTtl ?? const Duration(seconds: 30);

  /// Get cached response.
  SearchResponse? get(String key) {
    final entry = _cache[key];
    if (entry == null) return null;
    if (DateTime.now().isAfter(entry.expiresAt)) {
      _cache.remove(key);
      return null;
    }
    return entry.response;
  }

  /// Cache a response.
  void set(String key, SearchResponse response) {
    final ttl = response.items.isEmpty ? _negativeCacheTtl : _defaultTtl;
    _cache[key] = _CacheEntry(
      response: response,
      expiresAt: DateTime.now().add(ttl),
    );
  }

  /// Clear the cache.
  void clear() => _cache.clear();

  /// Get cache size.
  int get size => _cache.length;
}

class _CacheEntry {
  final SearchResponse response;
  final DateTime expiresAt;

  _CacheEntry({required this.response, required this.expiresAt});
}

/// Search ranker for ordering results.
class SearchRanker {
  RankingStrategy currentStrategy = RankingStrategy.relevance;
  Map<String, double> weights = {
    'price': 0.3,
    'rating': 0.3,
    'distance': 0.2,
    'reviews': 0.2,
  };

  /// Rank items based on strategy and preferences.
  List<SearchResultItem> rank(List<SearchResultItem> items, SearchQuery query) {
    // Determine strategy from preferences
    if (query.context.userPrefs?.preferCheapest == true) {
      currentStrategy = RankingStrategy.priceLowToHigh;
    } else if (query.context.userPrefs?.preferHighRated == true) {
      currentStrategy = RankingStrategy.rating;
    } else if (query.context.userPrefs?.preferNearby == true) {
      currentStrategy = RankingStrategy.distance;
    }

    final sorted = List<SearchResultItem>.from(items);

    switch (currentStrategy) {
      case RankingStrategy.priceLowToHigh:
        sorted.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
      case RankingStrategy.priceHighToLow:
        sorted.sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
      case RankingStrategy.rating:
        sorted.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
      case RankingStrategy.distance:
        // Would need user location for proper distance sorting
        sorted.sort((a, b) => (a.latitude ?? 0).compareTo(b.latitude ?? 0));
      case RankingStrategy.popularity:
        sorted.sort(
          (a, b) => (b.reviewCount ?? 0).compareTo(a.reviewCount ?? 0),
        );
      case RankingStrategy.duration:
      case RankingStrategy.relevance:
        // Default: composite score
        sorted.sort((a, b) => _compositeScore(b).compareTo(_compositeScore(a)));
    }

    return sorted;
  }

  /// Calculate composite relevance score.
  double _compositeScore(SearchResultItem item) {
    double score = 0;

    // Price component (lower is better, inverted)
    if (item.price != null && item.price! > 0) {
      score += weights['price']! * (1000 / item.price!);
    }

    // Rating component
    if (item.rating != null) {
      score += weights['rating']! * (item.rating! * 20);
    }

    // Review count component
    if (item.reviewCount != null) {
      score += weights['reviews']! * (item.reviewCount! / 10);
    }

    return score;
  }
}

/// Provider for the search orchestrator.
final searchOrchestratorProvider = Provider<SearchOrchestrator>((ref) {
  return SearchOrchestrator(
    registry: ref.watch(providerRegistryProvider),
    cache: SearchCache(),
    ranker: SearchRanker(),
  );
});
