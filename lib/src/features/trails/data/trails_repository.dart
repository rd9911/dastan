import 'package:dastan/src/features/trails/domain/trails_models.dart';

/// Abstract repository interface for trails.
abstract class TrailsRepository {
  /// Searches for trails.
  Future<TrailsSearchResult> search(
    TrailsSearchRequest request, {
    String? cursor,
  });

  /// Gets full detailed info for a trail.
  Future<TrailDetail> getDetail(String providerId, String externalId);

  /// Cancels in-flight request.
  void cancelSearch();
}
