import 'dart:convert';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/entertainment/application/entertainment_normalization_helper.dart';
import 'package:dastan/src/features/entertainment/data/entertainment_repository.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';
import 'package:drift/drift.dart';

/// Caching decorator for [EntertainmentRepository].
///
/// Wraps another repository and adds caching layer with TTL-based expiry.
/// Following Riverpod architecture - this is a data layer component.
class CachingEntertainmentRepository implements EntertainmentRepository {
  final EntertainmentRepository _delegate;
  final AppDatabase _db;
  final Duration _cacheTtl;

  CachingEntertainmentRepository({
    required EntertainmentRepository delegate,
    required AppDatabase db,
    Duration cacheTtl = const Duration(hours: 1),
  }) : _delegate = delegate,
       _db = db,
       _cacheTtl = cacheTtl;

  @override
  Future<EntertainmentSearchResult> search(
    EntertainmentSearchRequest request, {
    String? cursor,
  }) async {
    // Generate cache key
    final cacheKey = EntertainmentNormalizationHelper.generateSearchCacheKey(
      request,
    );
    final fullKey = cursor != null ? '$cacheKey-$cursor' : cacheKey;

    // Check cache
    final cached = await _getCachedSearch(fullKey);
    if (cached != null) {
      return cached.copyWith(fromCache: true);
    }

    // Fetch from delegate
    final result = await _delegate.search(request, cursor: cursor);

    // Cache result
    await _cacheSearch(fullKey, request.itineraryId, result);

    return result;
  }

  @override
  Future<EntertainmentPlaceDetail> getDetail(
    String providerId,
    String externalId,
  ) async {
    // For now, delegate directly (could add detail caching later)
    return _delegate.getDetail(providerId, externalId);
  }

  @override
  void cancelSearch() {
    _delegate.cancelSearch();
  }

  /// Clears all cached results for a specific itinerary.
  ///
  /// Called when itinerary is switched or deleted.
  Future<void> clearCacheForItinerary(String itineraryId) async {
    await (_db.delete(
      _db.entertainmentCache,
    )..where((t) => t.itineraryId.equals(itineraryId))).go();
  }

  /// Clears expired cache entries.
  Future<void> clearExpiredCache() async {
    final now = DateTime.now();
    await (_db.delete(
      _db.entertainmentCache,
    )..where((t) => t.expiresAt.isSmallerThanValue(now))).go();
  }

  Future<EntertainmentSearchResult?> _getCachedSearch(String key) async {
    final now = DateTime.now();

    final row =
        await (_db.select(_db.entertainmentCache)
              ..where((t) => t.key.equals(key))
              ..where((t) => t.expiresAt.isBiggerThanValue(now)))
            .getSingleOrNull();

    if (row == null) return null;

    try {
      final json = jsonDecode(row.data) as Map<String, dynamic>;
      return EntertainmentSearchResult.fromJson(json);
    } catch (e) {
      // Invalid cached data, ignore
      return null;
    }
  }

  Future<void> _cacheSearch(
    String key,
    String itineraryId,
    EntertainmentSearchResult result,
  ) async {
    final now = DateTime.now();
    final expiresAt = now.add(_cacheTtl);

    await _db
        .into(_db.entertainmentCache)
        .insertOnConflictUpdate(
          EntertainmentCacheCompanion.insert(
            key: key,
            itineraryId: itineraryId,
            data: jsonEncode(result.toJson()),
            createdAt: now,
            expiresAt: expiresAt,
          ),
        );
  }
}
