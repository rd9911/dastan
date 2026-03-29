import 'package:freezed_annotation/freezed_annotation.dart';
import 'transport_search_request.dart';

part 'transport_item.freezed.dart';
part 'transport_item.g.dart';

@freezed
abstract class TransportItem with _$TransportItem {
  const factory TransportItem({
    required String id,
    required List<TransportProvider> providers,
    required List<TransportSegment> segments,
    required Price price,
    required Duration totalDuration,
    required DateTime departure,
    required DateTime arrival,
    required TransportMode mode,
    String? bookingUrl,
  }) = _TransportItem;

  factory TransportItem.fromJson(Map<String, dynamic> json) =>
      _$TransportItemFromJson(json);
}

@freezed
abstract class TransportProvider with _$TransportProvider {
  const factory TransportProvider({
    required String name,
    required String? logoUrl,
    required String? code, // e.g., IATA code for airlines
  }) = _TransportProvider;

  factory TransportProvider.fromJson(Map<String, dynamic> json) =>
      _$TransportProviderFromJson(json);
}

@freezed
abstract class TransportSegment with _$TransportSegment {
  const factory TransportSegment({
    required String origin,
    required String destination,
    required DateTime departure,
    required DateTime arrival,
    required Duration duration,
    required String carrier, // Carrier name or code
    required String transportIdentifier, // Flight number, Train number
    required TransportMode mode,
  }) = _TransportSegment;

  factory TransportSegment.fromJson(Map<String, dynamic> json) =>
      _$TransportSegmentFromJson(json);
}

@freezed
abstract class Price with _$Price {
  const factory Price({required double amount, required String currency}) =
      _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}
