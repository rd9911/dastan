import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_models.freezed.dart';
part 'map_models.g.dart';

/// Type of item on the map.
enum MapItemType {
  transport,
  accommodation,
  entertainment,
  gastronomy,
  events,
  trails,
  custom,
}

/// Logical layers on the map.
enum MapLayer {
  transport,
  accommodation,
  entertainment,
  gastronomy,
  events,
  trails,
  photos,
}

/// Visual theme for the map.
enum MapTheme { standard, dark, retro, satellite }

/// Represents a single pin/item on the map.
@freezed
abstract class MapItem with _$MapItem {
  const factory MapItem({
    required String id,
    required MapItemType type,
    required double latitude,
    required double longitude,
    required String title,
    String? subtitle,
    String? iconUrl,
    required String dedupeKey,
    // For polylines or additional geometry (e.g. flight path)
    @Default([]) List<MapPoint> geometry,
  }) = _MapItem;

  factory MapItem.fromJson(Map<String, dynamic> json) =>
      _$MapItemFromJson(json);
}

@freezed
abstract class MapPoint with _$MapPoint {
  const factory MapPoint({required double lat, required double lng}) =
      _MapPoint;

  factory MapPoint.fromJson(Map<String, dynamic> json) =>
      _$MapPointFromJson(json);
}

/// State of the interactive map.
@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default([]) List<MapItem> items,
    @Default(true) bool isLoading,
    @Default({
      MapLayer.transport,
      MapLayer.accommodation,
      MapLayer.entertainment,
      MapLayer.gastronomy,
      MapLayer.events,
      MapLayer.trails,
      MapLayer.photos,
    })
    Set<MapLayer> visibleLayers,
    // Current viewport
    double? centerLat,
    double? centerLng,
    double? zoom,
  }) = _MapState;
}

/// Request to generate a static snapshot.
@freezed
abstract class MapSnapshotRequest with _$MapSnapshotRequest {
  const factory MapSnapshotRequest({
    required String itineraryId,
    required double centerLat,
    required double centerLng,
    required double zoom,
    required MapTheme theme,
    @Default([]) List<String> highlightItemIds,
  }) = _MapSnapshotRequest;

  factory MapSnapshotRequest.fromJson(Map<String, dynamic> json) =>
      _$MapSnapshotRequestFromJson(json);
}

/// Response after generating a snapshot.
@freezed
abstract class MapSnapshotResponse with _$MapSnapshotResponse {
  const factory MapSnapshotResponse({
    required String snapshotId,
    required String imageUrl,
    required DateTime createdAt,
  }) = _MapSnapshotResponse;

  factory MapSnapshotResponse.fromJson(Map<String, dynamic> json) =>
      _$MapSnapshotResponseFromJson(json);
}
