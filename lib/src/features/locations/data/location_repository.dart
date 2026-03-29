import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/location.dart';
import 'location_cache.dart';
import 'location_mapper.dart';
import 'photon_data_source.dart';
import 'popular_locations.dart';

part 'location_repository.g.dart';

/// Repository for location search and geocoding.
///
/// Implements a multi-layer caching strategy:
/// 1. Popular locations (embedded, instant)
/// 2. In-memory LRU cache (fast, 5 min TTL)
/// 3. Photon API (network call)
///
/// Also handles:
/// - Request cancellation for debouncing
/// - Minimum query length enforcement
/// - Error handling with fallback
class LocationRepository {
  final PhotonDataSource _dataSource;
  final LocationCache _cache;
  final LocationMapper _mapper;

  /// Current pending search request's cancel token
  CancelToken? _currentSearchToken;

  /// Minimum query length before searching API
  static const int minQueryLength = 3;

  LocationRepository({
    PhotonDataSource? dataSource,
    LocationCache? cache,
    LocationMapper? mapper,
  }) : _dataSource = dataSource ?? PhotonDataSource(),
       _cache = cache ?? LocationCache(),
       _mapper = mapper ?? const LocationMapper();

  /// Search for locations matching the query.
  ///
  /// [searchType] - Filter by location type:
  ///   - [LocationSearchType.citiesOnly] - Cities/countries only (default)
  ///   - [LocationSearchType.citiesAndAirports] - Include airports
  ///
  /// Returns results from:
  /// 1. Popular locations (immediate)
  /// 2. Cache hit (immediate)
  /// 3. Photon API (with caching)
  ///
  /// Cancels any pending search request before starting a new one.
  Future<List<Location>> searchLocations(
    String query, {
    LocationSearchType searchType = LocationSearchType.citiesOnly,
    String language = 'en',
    int limit = 10,
  }) async {
    // Short queries: only search popular locations
    if (query.length < minQueryLength) {
      return searchPopularLocations(query);
    }

    // Cancel any pending request
    _currentSearchToken?.cancel('New search started');
    _currentSearchToken = CancelToken();

    // Cache key includes search type for proper separation
    final cacheKey = '${searchType.name}:$query';

    // Check cache first
    final cached = _cache.get(cacheKey);
    if (cached != null) {
      return cached;
    }

    // Get popular locations for immediate display
    final popular = searchPopularLocations(query);

    try {
      // Fetch from API with type filter
      final response = await _dataSource.search(
        query,
        searchType: searchType,
        lang: language,
        limit: limit,
        cancelToken: _currentSearchToken,
      );

      final results = _mapper.fromPhotonResponse(response);

      // Merge with popular (deduplicate by ID)
      final merged = _mergeResults(popular, results);

      // Cache the result with type-specific key
      _cache.put(cacheKey, merged);

      return merged;
    } on DioException catch (e) {
      // If cancelled, return popular locations only
      if (e.type == DioExceptionType.cancel) {
        return popular;
      }

      // On network error, return popular locations as fallback
      if (popular.isNotEmpty) {
        return popular;
      }

      rethrow;
    }
  }

  /// Reverse geocode coordinates to get a location.
  ///
  /// Returns the nearest location for the given coordinates.
  Future<Location?> reverseGeocode(double lat, double lng) async {
    try {
      final response = await _dataSource.reverse(lat, lng);

      if (response.features.isEmpty) {
        return null;
      }

      return _mapper.fromPhotonFeature(response.features.first);
    } on DioException {
      return null;
    }
  }

  /// Clear the search cache.
  void clearCache() {
    _cache.clear();
  }

  /// Merge popular and API results, removing duplicates.
  List<Location> _mergeResults(List<Location> popular, List<Location> api) {
    final seen = <String>{};
    final merged = <Location>[];

    // Add popular first (higher priority)
    for (final loc in popular) {
      if (seen.add(loc.id)) {
        merged.add(loc);
      }
    }

    // Add API results
    for (final loc in api) {
      if (seen.add(loc.id)) {
        merged.add(loc);
      }
    }

    return merged;
  }
}

/// Provider for the Photon data source.
@riverpod
PhotonDataSource photonDataSource(Ref ref) {
  return PhotonDataSource();
}

/// Provider for the location cache.
@riverpod
LocationCache locationCache(Ref ref) {
  return LocationCache();
}

/// Provider for the location repository.
@riverpod
LocationRepository locationRepository(Ref ref) {
  return LocationRepository(
    dataSource: ref.watch(photonDataSourceProvider),
    cache: ref.watch(locationCacheProvider),
  );
}
