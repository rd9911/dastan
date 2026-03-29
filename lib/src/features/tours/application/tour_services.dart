import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

class TourPurchaseService {
  final TourRepository _repository;

  TourPurchaseService(this._repository);

  Future<void> purchaseTour(String userId, String tourId) async {
    // In a real app, this would involve payment gateway integration.
    // For now, we just save it to the user's account.
    await _repository.saveTour(userId, tourId);
  }
}

class TourProgressService {
  final TourRepository _repository;

  TourProgressService(this._repository);

  Future<PlaybackProgress?> getProgress(String userId, String tourId) async {
    return _repository.getPlaybackProgress(userId, tourId);
  }

  Future<void> updateProgress(PlaybackProgress progress) async {
    await _repository.updatePlaybackProgress(progress);
  }

  Future<void> markTourOpened(String tourId, String userId) async {
    await _repository.markTourOpened(userId, tourId);
  }
}
