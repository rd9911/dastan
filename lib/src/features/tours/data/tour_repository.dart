import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/data/tour_remote_data_source.dart';
import 'package:dastan/src/features/tours/data/tour_local_data_source.dart';

class TourRepository {
  final TourRemoteDataSource _remoteDataSource;
  final TourLocalDataSource _localDataSource;

  TourRepository(this._remoteDataSource, this._localDataSource);

  Future<List<Country>> getCountries() async {
    return _remoteDataSource.getCountries();
  }

  Future<List<TourSummary>> getToursByCity(String cityId) async {
    try {
      final tours = await _remoteDataSource.getToursByCity(cityId);
      await _localDataSource.cacheTours(tours);
      return tours;
    } catch (e) {
      return _localDataSource.getCachedTours(cityId);
    }
  }

  Future<TourDetail> getTourDetail(String tourId) async {
    return _remoteDataSource.getTourDetail(tourId);
  }

  Future<List<SavedTour>> getSavedTours(String userId) async {
    return _remoteDataSource.getSavedTours(userId);
  }

  Future<void> saveTour(String userId, String tourId) async {
    await _remoteDataSource.saveTour(userId, tourId);
    // In a full implementation, we'd also mark as saved in local DB
  }

  Future<void> unsaveTour(String userId, String tourId) async {
    await _remoteDataSource.unsaveTour(userId, tourId);
  }

  Future<void> markTourOpened(String userId, String tourId) async {
    await _remoteDataSource.markTourOpened(userId, tourId);
  }

  Future<PlaybackProgress?> getPlaybackProgress(String userId, String tourId) async {
    try {
      final progress = await _remoteDataSource.getPlaybackProgress(userId, tourId);
      if (progress != null) {
        await _localDataSource.updateProgressLocal(progress);
      }
      return progress;
    } catch (e) {
      return _localDataSource.getProgressLocal(userId, tourId);
    }
  }

  Future<void> updatePlaybackProgress(PlaybackProgress progress) async {
    await _localDataSource.updateProgressLocal(progress);
    await _remoteDataSource.updatePlaybackProgress(progress);
  }
}
