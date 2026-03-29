import 'package:dio/dio.dart';

import 'photon_dto.dart';

/// Type of locations to search for.
enum LocationSearchType {
  /// Cities, localities, and administrative regions.
  /// Use for: Accommodation, Entertainment, Gastronomy, Events, Trails
  citiesOnly,

  /// Major cities plus airports only (stricter matching).
  /// Use for: Transport (flights, trains, etc.)
  /// Does NOT include localities, villages, or similar-sounding places.
  citiesAndAirports,
}

/// Data source for Photon geocoding API.
///
/// Photon is a free geocoding API based on OpenStreetMap data.
/// See: https://photon.komoot.io/
///
/// API Endpoints:
/// - Search: GET /api/?q=<query>&limit=<n>&lang=<lang>&layer=<layers>
/// - Reverse: GET /reverse?lon=<lon>&lat=<lat>
///
/// Filtering:
/// - Use `layer` param for cities: city,locality,county,state,country
/// - Use `osm_tag` param for airports: aeroway:aerodrome
class PhotonDataSource {
  final Dio _dio;

  static const String _baseUrl = 'https://photon.komoot.io';
  static const Duration _timeout = Duration(seconds: 10);

  /// Layers for city search - only major cities (strict matching)
  static const List<String> _cityLayers = ['city'];

  PhotonDataSource({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: _baseUrl,
              connectTimeout: _timeout,
              receiveTimeout: _timeout,
              headers: {
                'User-Agent': 'Dastan/1.0 (travel-app)',
                'Accept': 'application/json',
              },
            ),
          );

  /// Search for places matching the query (autocomplete).
  ///
  /// [query] - Search string (min 3 characters recommended)
  /// [searchType] - Type of locations to search for
  /// [lang] - Language code for results (e.g., 'en', 'de', 'fr')
  /// [limit] - Maximum number of results (default 10)
  /// [lat], [lng] - Optional bias towards a location
  /// [cancelToken] - Optional token to cancel the request
  ///
  /// Returns a [PhotonResponse] with matching places.
  Future<PhotonResponse> search(
    String query, {
    LocationSearchType searchType = LocationSearchType.citiesOnly,
    String lang = 'en',
    int limit = 10,
    double? lat,
    double? lng,
    CancelToken? cancelToken,
  }) async {
    // For cities+airports, we need to make two requests and merge
    if (searchType == LocationSearchType.citiesAndAirports) {
      return _searchCitiesAndAirports(
        query,
        lang: lang,
        limit: limit,
        lat: lat,
        lng: lng,
        cancelToken: cancelToken,
      );
    }

    // Cities only - use layer filter
    final queryParams = <String, dynamic>{
      'q': query,
      'limit': limit * 2, // Request more to account for filtering
      'lang': lang,
      'layer': _cityLayers,
    };

    if (lat != null && lng != null) {
      queryParams['lat'] = lat;
      queryParams['lon'] = lng;
    }

    final response = await _dio.get<Map<String, dynamic>>(
      '/api/',
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );

    if (response.data == null) {
      return const PhotonResponse(type: 'FeatureCollection', features: []);
    }

    final parsed = PhotonResponse.fromJson(response.data!);

    // Post-filter: only keep real cities (osm_value=city), not villages/towns
    final filtered = parsed.features
        .where((f) {
          final osmValue = f.properties.osmValue;
          return osmValue == 'city';
        })
        .take(limit)
        .toList();

    return PhotonResponse(type: 'FeatureCollection', features: filtered);
  }

  /// Search for both cities and airports, merging results.
  Future<PhotonResponse> _searchCitiesAndAirports(
    String query, {
    required String lang,
    required int limit,
    double? lat,
    double? lng,
    CancelToken? cancelToken,
  }) async {
    // Search for cities (request more to account for filtering)
    final citiesParams = <String, dynamic>{
      'q': query,
      'limit': limit * 2,
      'lang': lang,
      'layer': _cityLayers,
    };

    // Search for airports using osm_tag
    final airportsParams = <String, dynamic>{
      'q': query,
      'limit': limit,
      'lang': lang,
      'osm_tag': 'aeroway:aerodrome',
    };

    if (lat != null && lng != null) {
      citiesParams['lat'] = lat;
      citiesParams['lon'] = lng;
      airportsParams['lat'] = lat;
      airportsParams['lon'] = lng;
    }

    // Execute both requests in parallel
    final results = await Future.wait([
      _dio.get<Map<String, dynamic>>(
        '/api/',
        queryParameters: citiesParams,
        cancelToken: cancelToken,
      ),
      _dio.get<Map<String, dynamic>>(
        '/api/',
        queryParameters: airportsParams,
        cancelToken: cancelToken,
      ),
    ]);

    final citiesData = results[0].data;
    final airportsData = results[1].data;

    // Parse responses
    final citiesRaw = citiesData != null
        ? PhotonResponse.fromJson(citiesData)
        : const PhotonResponse(type: 'FeatureCollection', features: []);

    final airports = airportsData != null
        ? PhotonResponse.fromJson(airportsData)
        : const PhotonResponse(type: 'FeatureCollection', features: []);

    // Post-filter cities: only keep real cities (osm_value=city), not villages/towns
    final filteredCities = citiesRaw.features.where((f) {
      final osmValue = f.properties.osmValue;
      return osmValue == 'city';
    }).toList();

    // Merge results: airports first (more specific), then filtered cities
    final mergedFeatures = <PhotonFeature>[
      ...airports.features,
      ...filteredCities,
    ];

    // Limit to requested amount
    final limited = mergedFeatures.take(limit).toList();

    return PhotonResponse(type: 'FeatureCollection', features: limited);
  }

  /// Reverse geocode coordinates to get a place.
  ///
  /// [lat] - Latitude
  /// [lng] - Longitude
  /// [cancelToken] - Optional token to cancel the request
  ///
  /// Returns a [PhotonResponse] with the nearest place(s).
  Future<PhotonResponse> reverse(
    double lat,
    double lng, {
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/reverse',
      queryParameters: {'lat': lat, 'lon': lng},
      cancelToken: cancelToken,
    );

    if (response.data == null) {
      return const PhotonResponse(type: 'FeatureCollection', features: []);
    }

    return PhotonResponse.fromJson(response.data!);
  }
}
