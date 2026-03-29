import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/transport_result.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';

part 'transport_search_service.g.dart';

/// Transport search service that integrates with the Search Platform.
class TransportSearchService {
  final SearchOrchestrator _orchestrator;

  TransportSearchService(this._orchestrator);

  /// Search for transport using the unified Search Platform.
  Future<List<TransportResult>> search({
    required String origin,
    required String destination,
    required DateTime departDate,
    required TransportMode mode,
    List<int> travelerAges = const [18],
    bool isRoundTrip = false,
    DateTime? returnDate,
  }) async {
    final response = await _orchestrator.search(
      SearchQuery(
        vertical: SearchVertical.transport,
        context: const SearchContext(locale: 'en', currency: 'USD'),
        params: {
          'origin': origin,
          'destination': destination,
          'departureDate': departDate.toIso8601String(),
          'mode': mode.name,
          'travelerAges': travelerAges,
          'isRoundTrip': isRoundTrip,
          if (returnDate != null) 'returnDate': returnDate.toIso8601String(),
        },
      ),
    );

    // Convert SearchResultItems to TransportResults
    return response.items
        .map((item) => _toTransportResult(item, mode))
        .toList();
  }

  /// Search for multi-city transport using the unified Search Platform.
  Future<List<TransportResult>> searchMultiCity({
    required List<Map<String, dynamic>> legs,
    required TransportMode mode,
    List<int> travelerAges = const [18],
  }) async {
    final results = <TransportResult>[];

    for (final leg in legs) {
      if (leg['origin'] != null &&
          leg['destination'] != null &&
          leg['date'] != null) {
        final response = await _orchestrator.search(
          SearchQuery(
            vertical: SearchVertical.transport,
            context: const SearchContext(locale: 'en', currency: 'USD'),
            params: {
              'origin': leg['origin'],
              'destination': leg['destination'],
              'departureDate': (leg['date'] as DateTime).toIso8601String(),
              'mode': mode.name,
              'travelerAges': travelerAges,
              'legIndex': legs.indexOf(leg),
            },
          ),
        );

        results.addAll(
          response.items.map((item) => _toTransportResult(item, mode)),
        );
      }
    }

    return results;
  }

  /// Search for meet-up transport using the unified Search Platform.
  Future<List<TransportResult>> searchMeetUp({
    required List<Map<String, dynamic>> friends,
    required String destination,
    required DateTime meetDate,
    required TransportMode mode,
  }) async {
    final results = <TransportResult>[];

    for (final friend in friends) {
      if (friend['origin'] != null) {
        final response = await _orchestrator.search(
          SearchQuery(
            vertical: SearchVertical.transport,
            context: const SearchContext(locale: 'en', currency: 'USD'),
            params: {
              'origin': friend['origin'],
              'destination': destination,
              'departureDate': meetDate.toIso8601String(),
              'mode': mode.name,
              'friendName': friend['name'] ?? 'Friend',
            },
          ),
        );

        results.addAll(
          response.items.map((item) => _toTransportResult(item, mode)),
        );
      }
    }

    return results;
  }

  /// Convert a SearchResultItem to a TransportResult.
  TransportResult _toTransportResult(
    SearchResultItem item,
    TransportMode mode,
  ) {
    final details = item.details ?? {};
    final now = DateTime.now();

    return TransportResult(
      id: item.id,
      mode: mode,
      origin:
          details['origin'] ?? item.subtitle?.split(' → ').first ?? 'Unknown',
      destination:
          details['destination'] ??
          item.subtitle?.split(' → ').last ??
          'Unknown',
      departAt:
          _parseDateTime(details['departAt']) ??
          now.add(const Duration(hours: 2)),
      arriveAt:
          _parseDateTime(details['arriveAt']) ??
          now.add(const Duration(hours: 5)),
      priceAmount: item.price ?? 0,
      currency: item.priceCurrency ?? 'USD',
      durationMinutes: details['durationMinutes'] ?? 180,
      vendor:
          details['vendor'] ?? item.provenance.firstOrNull ?? 'Unknown Vendor',
      vendorUrl: details['vendorUrl'] ?? 'https://example.com/book',
      originAirportCode: mode == TransportMode.flight
          ? details['originCode']
          : null,
      destinationAirportCode: mode == TransportMode.flight
          ? details['destCode']
          : null,
      baggage: details['baggage'],
    );
  }

  DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    try {
      return DateTime.parse(value.toString());
    } catch (_) {
      return null;
    }
  }
}

@riverpod
TransportSearchService transportSearchService(Ref ref) {
  return TransportSearchService(ref.watch(searchOrchestratorProvider));
}
