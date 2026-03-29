import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_result.freezed.dart';
part 'events_result.g.dart';

enum EventType { concert, festival, sports, conference }

@freezed
abstract class EventsResult with _$EventsResult {
  const factory EventsResult({
    required String id,
    required EventType type,
    required String name,
    required String location,
    required DateTime eventDate,
    required double price,
    required String currency,
    String? description,
    String? imageUrl,
    String? vendorUrl,
  }) = _EventsResult;

  factory EventsResult.fromJson(Map<String, dynamic> json) =>
      _$EventsResultFromJson(json);
}
