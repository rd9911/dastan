import 'package:drift/drift.dart';

import 'drift_database.dart';

/// Abstract base class for caching repositories.
///
/// Provides a common caching layer with TTL-based expiry.
/// Subclasses must provide:
/// - Cache key generation logic
/// - Table-specific cache operations
/// - Delegate repository for fetching fresh data
///
/// Example usage:
/// ```dart
/// class CachingEntertainmentRepository
///     extends CachingRepository<EntertainmentSearchRequest, EntertainmentSearchResult>
///     implements EntertainmentRepository {
///
///   @override
///   String generateCacheKey(EntertainmentSearchRequest request) =>
///       EntertainmentNormalizationHelper.generateSearchCacheKey(request);
///
///   @override
///   String getItineraryId(EntertainmentSearchRequest request) =>
///       request.itineraryId;
/// }
/// ```
abstract class CachingRepository<TRequest, TResult> {
  /// The database instance for cache operations.
  AppDatabase get db;

  /// The cache TTL duration.
  Duration get cacheTtl;

  /// Generates a cache key from the request.
  String generateCacheKey(TRequest request);

  /// Extracts the itinerary ID from the request for cache organization.
  String getItineraryId(TRequest request);

  /// Fetches the result from cache.
  /// Returns null if not found or expired.
  Future<TResult?> getCached(String key);

  /// Stores the result in cache.
  Future<void> cache(String key, String itineraryId, TResult result);

  /// Fetches fresh result from the delegate repository.
  Future<TResult> fetchFromDelegate(TRequest request, {String? cursor});

  /// Marks a cached result as from cache (if supported by TResult).
  /// Default implementation returns the result unchanged.
  TResult markAsFromCache(TResult result) => result;

  /// Main search method with caching logic.
  ///
  /// 1. Generates cache key from request
  /// 2. Checks cache for valid entry
  /// 3. If hit, returns cached result marked as fromCache
  /// 4. If miss, fetches from delegate and caches
  Future<TResult> search(TRequest request, {String? cursor}) async {
    final baseKey = generateCacheKey(request);
    final fullKey = cursor != null ? '$baseKey-$cursor' : baseKey;

    // Try cache first
    final cached = await getCached(fullKey);
    if (cached != null) {
      return markAsFromCache(cached);
    }

    // Fetch from delegate
    final result = await fetchFromDelegate(request, cursor: cursor);

    // Store in cache
    await cache(fullKey, getItineraryId(request), result);

    return result;
  }
}

/// Mixin for JSON-based cache operations.
///
/// Provides standard get/cache implementations for repositories
/// that store JSON-serializable results in a Drift table.
mixin JsonCacheMixin<TRequest, TResult>
    on CachingRepository<TRequest, TResult> {
  /// Converts result from JSON.
  TResult fromJson(Map<String, dynamic> json);

  /// Converts result to JSON.
  Map<String, dynamic> toJson(TResult result);

  /// Gets the cache table for this repository.
  /// The table must have: key, itineraryId, data, createdAt, expiresAt columns.
  TableInfo<Table, dynamic> get cacheTable;

  /// Template for JSON-based cache get operation.
  /// Subclasses should override [getCached] with their specific table logic.
  Future<TResult?> getCachedJson(String key);

  /// Template for JSON-based cache set operation.
  /// Subclasses should override [cache] with their specific table logic.
  Future<void> cacheJson(String key, String itineraryId, TResult result);
}

/// Interface for repositories that support cancellation.
abstract interface class CancellableRepository {
  /// Cancels any in-progress operations.
  void cancelSearch();
}

/// Interface for repositories that support cache management.
abstract interface class CacheManagementRepository {
  /// Clears all cached results for a specific itinerary.
  Future<void> clearCacheForItinerary(String itineraryId);

  /// Clears all expired cache entries.
  Future<void> clearExpiredCache();
}
