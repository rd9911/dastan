import 'package:freezed_annotation/freezed_annotation.dart';

part 'trails_result.freezed.dart';
part 'trails_result.g.dart';

enum TrailDifficulty { easy, moderate, hard, expert }

@freezed
abstract class TrailsResult with _$TrailsResult {
  const factory TrailsResult({
    required String id,
    required String name,
    required String location,
    required double distanceKm,
    required TrailDifficulty difficulty,
    required int durationMinutes,
    String? description,
    int? elevationGainMeters,
    String? imageUrl,
  }) = _TrailsResult;

  factory TrailsResult.fromJson(Map<String, dynamic> json) =>
      _$TrailsResultFromJson(json);
}
