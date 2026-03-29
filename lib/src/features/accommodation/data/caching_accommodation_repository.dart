import 'dart:convert';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/accommodation/application/accommodation_normalization_helper.dart';
import 'package:dastan/src/features/accommodation/data/accommodation_repository.dart';
import 'package:dastan/src/features/accommodation/domain/accommodation_search_request.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';
import 'package:drift/drift.dart';

/// Caching decorator for AccommodationRepository.
///
/// Checks cache before delegating to inner repository;
/// stores results with TTL; evicts on itinerary switch.
class CachingAccommodationRepository implements AccommodationRepository {
  final AccommodationRepository _inner;
  final AppDatabase _db;

  /// Cache TTL in minutes (default: 30 minutes)
  final int cacheTtlMinutes;

  CachingAccommodationRepository(
    this._inner,
    this._db, {
    this.cacheTtlMinutes = 30,
  });

  @override
  Future<AccommodationSearchResult> search(
    AccommodationSearchRequest request, {
    String? cursor,
  }) async {
    // Only cache first page
    if (cursor != null) {
      return _inner.search(request, cursor: cursor);
    }

    final cacheKey = AccommodationNormalizationHelper.generateSearchCacheKey(
      request,
    );
    final now = DateTime.now();

    // Check cache
    final cached = await (_db.select(
      _db.accommodationCache,
    )..where((t) => t.key.equals(cacheKey))).getSingleOrNull();

    if (cached != null && cached.expiresAt.isAfter(now)) {
      // Cache hit and not expired
      final items = _decodeItems(cached.data);
      return AccommodationSearchResult(
        items: items,
        nextCursor: items.length >= 10 ? '10' : null,
        totalCount: items.length,
      );
    }

    // Cache miss or expired - fetch from network
    final result = await _inner.search(request, cursor: cursor);

    // Store in cache
    final expiresAt = now.add(Duration(minutes: cacheTtlMinutes));
    await _db
        .into(_db.accommodationCache)
        .insertOnConflictUpdate(
          AccommodationCacheCompanion(
            key: Value(cacheKey),
            itineraryId: Value(request.itineraryId),
            data: Value(_encodeItems(result.items)),
            createdAt: Value(now),
            expiresAt: Value(expiresAt),
          ),
        );

    return result;
  }

  @override
  Future<PropertyItem> getPropertyDetail(
    String providerId,
    String externalId,
  ) async {
    final propertyKey = '$providerId|$externalId';
    final now = DateTime.now();

    // Check cache
    final cached = await (_db.select(
      _db.propertyDetailCache,
    )..where((t) => t.propertyId.equals(propertyKey))).getSingleOrNull();

    if (cached != null && cached.expiresAt.isAfter(now)) {
      // Cache hit
      return _decodeItem(cached.data);
    }

    // Cache miss - fetch from network
    final detail = await _inner.getPropertyDetail(providerId, externalId);

    // Store in cache (longer TTL for details: 1 hour)
    final expiresAt = now.add(const Duration(hours: 1));
    await _db
        .into(_db.propertyDetailCache)
        .insertOnConflictUpdate(
          PropertyDetailCacheCompanion(
            propertyId: Value(propertyKey),
            data: Value(_encodeItem(detail)),
            expiresAt: Value(expiresAt),
          ),
        );

    return detail;
  }

  @override
  void cancelSearch() {
    _inner.cancelSearch();
  }

  /// Evicts all cache entries for a specific itinerary.
  ///
  /// Call this when switching active itineraries.
  Future<void> evictForItinerary(String itineraryId) async {
    await (_db.delete(
      _db.accommodationCache,
    )..where((t) => t.itineraryId.equals(itineraryId))).go();
  }

  /// Clears all expired cache entries.
  Future<void> clearExpired() async {
    final now = DateTime.now();
    await (_db.delete(
      _db.accommodationCache,
    )..where((t) => t.expiresAt.isSmallerThanValue(now))).go();
    await (_db.delete(
      _db.propertyDetailCache,
    )..where((t) => t.expiresAt.isSmallerThanValue(now))).go();
  }

  String _encodeItems(List<PropertyItem> items) {
    return jsonEncode(items.map((i) => i.toJson()).toList());
  }

  List<PropertyItem> _decodeItems(String data) {
    final list = jsonDecode(data) as List<dynamic>;
    return list
        .map((j) => PropertyItem.fromJson(j as Map<String, dynamic>))
        .toList();
  }

  String _encodeItem(PropertyItem item) {
    return jsonEncode(item.toJson());
  }

  PropertyItem _decodeItem(String data) {
    return PropertyItem.fromJson(jsonDecode(data) as Map<String, dynamic>);
  }
}
