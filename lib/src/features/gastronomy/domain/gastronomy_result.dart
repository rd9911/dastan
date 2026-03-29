import 'package:freezed_annotation/freezed_annotation.dart';

part 'gastronomy_result.freezed.dart';
part 'gastronomy_result.g.dart';

enum GastronomyType { restaurant, cafe, bar, foodTour }

@freezed
abstract class GastronomyResult with _$GastronomyResult {
  const factory GastronomyResult({
    required String id,
    required GastronomyType type,
    required String name,
    required String location,
    required String cuisine,
    String? priceRange,
    int? rating,
    String? imageUrl,
    String? vendorUrl,
  }) = _GastronomyResult;

  factory GastronomyResult.fromJson(Map<String, dynamic> json) =>
      _$GastronomyResultFromJson(json);
}
