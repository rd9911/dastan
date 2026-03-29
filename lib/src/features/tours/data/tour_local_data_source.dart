import 'package:drift/drift.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'dart:convert';

class TourLocalDataSource {
  final AppDatabase _db;

  TourLocalDataSource(this._db);

  Future<void> cacheTours(List<TourSummary> tours) async {
    await _db.batch((batch) {
      for (final tour in tours) {
        batch.insert(
          _db.localTourCacheEntries,
          LocalTourCacheEntriesCompanion.insert(
            id: tour.id,
            cityId: tour.cityId,
            name: tour.name,
            tagline: tour.tagline,
            mainImageUrl: tour.mainImageUrl,
            durationMinutes: tour.durationMinutes,
            priceUsd: tour.priceUsd,
            type: tour.type.name,
            categoryIds: jsonEncode(tour.categories.map((c) => c.id).toList()),
            cachedAt: DateTime.now(),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  Future<List<TourSummary>> getCachedTours(String cityId) async {
    final query = _db.select(_db.localTourCacheEntries)
      ..where((t) => t.cityId.equals(cityId));
    
    final rows = await query.get();
    
    // Note: This mapping is incomplete because categories are just IDs here.
    // In a real app, we'd also cache categories separately or join.
    // For now, we return empty categories or mock them if needed.
    return rows.map((row) => TourSummary(
      id: row.id,
      cityId: row.cityId,
      type: TourType.values.byName(row.type),
      name: row.name,
      tagline: row.tagline,
      mainImageUrl: row.mainImageUrl,
      durationMinutes: row.durationMinutes,
      priceUsd: row.priceUsd,
      isFree: row.priceUsd == 0,
      averageRating: 0.0,
      reviewCount: 0,
      categories: [], // Would need refinement
    )).toList();
  }

  Future<void> saveTourLocal(SavedTour tour) async {
    await _db.into(_db.localSavedTourEntries).insert(
      LocalSavedTourEntriesCompanion.insert(
        id: tour.id,
        tourId: tour.tourId,
        userId: tour.userId,
        savedAt: tour.savedAt,
        lastOpenedAt: Value(tour.lastOpenedAt),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> updateProgressLocal(PlaybackProgress progress) async {
    await _db.into(_db.localTourProgressEntries).insert(
      LocalTourProgressEntriesCompanion.insert(
        tourId: progress.tourId,
        userId: progress.userId,
        audioPositionMs: Value(progress.audioPositionMs),
        currentSection: Value(progress.currentSection),
        completed: Value(progress.completed),
        lastUpdatedAt: progress.lastUpdatedAt,
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<PlaybackProgress?> getProgressLocal(String userId, String tourId) async {
    final query = _db.select(_db.localTourProgressEntries)
      ..where((t) => t.userId.equals(userId) & t.tourId.equals(tourId));
    
    final row = await query.getSingleOrNull();
    if (row == null) return null;
    
    return PlaybackProgress(
      tourId: row.tourId,
      userId: row.userId,
      audioPositionMs: row.audioPositionMs,
      currentSection: row.currentSection,
      completed: row.completed,
      lastUpdatedAt: row.lastUpdatedAt,
    );
  }

  Future<void> saveDownloadedTour({
    required String tourId,
    required String contentJson,
    required String? audioFilePath,
    required String languageCode,
  }) async {
    await _db.into(_db.localTourDownloadEntries).insert(
      LocalTourDownloadEntriesCompanion.insert(
        tourId: tourId,
        contentJson: contentJson,
        audioFilePath: Value(audioFilePath),
        languageCode: languageCode,
        downloadedAt: DateTime.now(),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<bool> isTourDownloaded(String tourId, String languageCode) async {
    final query = _db.select(_db.localTourDownloadEntries)
      ..where((t) => t.tourId.equals(tourId) & t.languageCode.equals(languageCode));
    final row = await query.getSingleOrNull();
    return row != null;
  }
}
