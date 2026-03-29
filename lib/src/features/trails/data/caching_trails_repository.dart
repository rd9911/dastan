import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/trails/application/trails_normalization_helper.dart';
import 'package:dastan/src/features/trails/data/trails_repository.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';

/// Caching decorator for [TrailsRepository].
class CachingTrailsRepository implements TrailsRepository {
  final TrailsRepository _delegate;
  final AppDatabase _db;
  final Duration _ttl;

  CachingTrailsRepository({
    required TrailsRepository delegate,
    required AppDatabase db,
    Duration ttl = const Duration(hours: 1),
  }) : _delegate = delegate,
       _db = db,
       _ttl = ttl;

  @override
  Future<TrailsSearchResult> search(
    TrailsSearchRequest request, {
    String? cursor,
  }) async {
    final key = TrailsNormalizationHelper.generateSearchCacheKey(request);
    final fullKey = cursor == null ? key : '$key-$cursor';
    final now = DateTime.now();

    // Try cache
    final cached =
        await (_db.select(_db.trailsCache)
              ..where((t) => t.key.equals(fullKey))
              ..where((t) => t.expiresAt.isBiggerThanValue(now)))
            .getSingleOrNull();

    if (cached != null) {
      try {
        final json = jsonDecode(cached.data) as Map<String, dynamic>;
        return TrailsSearchResult.fromJson(json).copyWith(fromCache: true);
      } catch (_) {
        // ignore invalid cache
      }
    }

    // Fetch fresh
    final result = await _delegate.search(request, cursor: cursor);

    // Save cache
    await _db
        .into(_db.trailsCache)
        .insertOnConflictUpdate(
          TrailsCacheCompanion.insert(
            key: fullKey,
            itineraryId: request.itineraryId,
            data: jsonEncode(result.toJson()),
            createdAt: now,
            expiresAt: now.add(_ttl),
          ),
        );

    return result;
  }

  @override
  Future<TrailDetail> getDetail(String providerId, String externalId) {
    // Pass-through for details (not cached yet)
    return _delegate.getDetail(providerId, externalId);
  }

  @override
  void cancelSearch() {
    _delegate.cancelSearch();
  }
}
