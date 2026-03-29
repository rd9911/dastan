import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_item.freezed.dart';

@freezed
abstract class MapItem with _$MapItem {
  const factory MapItem({
    required String id,
    required double latitude,
    required double longitude,
    required String title,
    required ItinerarySection type,
    String? description,
  }) = _MapItem;
}
