import 'package:freezed_annotation/freezed_annotation.dart';

part 'itinerary.freezed.dart';
part 'itinerary.g.dart';

@freezed
abstract class Itinerary with _$Itinerary {
  const factory Itinerary({
    required String id,
    required String title,
    String? destination,
    DateTime? startDate,
    DateTime? endDate,
    @Default(1) int travelers,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Itinerary;

  factory Itinerary.fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);
}
