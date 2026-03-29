import 'dart:collection';

import '../domain/location.dart';

/// In-memory LRU cache for location search results.
///
/// Provides fast access to recently searched queries with configurable
/// max size and TTL (time-to-live).
class LocationCache {
  final int maxSize;
  final Duration ttl;

  final LinkedHashMap<String, _CacheEntry> _cache = LinkedHashMap();

  LocationCache({this.maxSize = 100, this.ttl = const Duration(minutes: 5)});

  /// Get cached results for a query.
  /// Returns null if not cached or expired.
  List<Location>? get(String query) {
    final normalizedQuery = _normalizeQuery(query);
    final entry = _cache[normalizedQuery];

    if (entry == null) return null;

    // Check if expired
    if (DateTime.now().difference(entry.cachedAt) > ttl) {
      _cache.remove(normalizedQuery);
      return null;
    }

    // Move to end (most recently used)
    _cache.remove(normalizedQuery);
    _cache[normalizedQuery] = entry;

    return entry.results;
  }

  /// Cache results for a query.
  void put(String query, List<Location> results) {
    final normalizedQuery = _normalizeQuery(query);

    // Remove oldest entries if at capacity
    while (_cache.length >= maxSize) {
      _cache.remove(_cache.keys.first);
    }

    _cache[normalizedQuery] = _CacheEntry(
      results: results,
      cachedAt: DateTime.now(),
    );
  }

  /// Check if a query is cached (and not expired).
  bool contains(String query) {
    return get(query) != null;
  }

  /// Clear all cached entries.
  void clear() {
    _cache.clear();
  }

  /// Normalize query for cache key consistency.
  String _normalizeQuery(String query) {
    return query.toLowerCase().trim();
  }
}

class _CacheEntry {
  final List<Location> results;
  final DateTime cachedAt;

  _CacheEntry({required this.results, required this.cachedAt});
}
