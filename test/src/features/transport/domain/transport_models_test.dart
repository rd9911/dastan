import 'package:dastan/src/features/transport/domain/transport_item.dart';
import 'package:dastan/src/features/transport/domain/transport_search_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransportSearchRequest', () {
    test('serialization round trip', () {
      final request = TransportSearchRequest(
        itineraryId: 'itin_123',
        tripType: TripType.roundTrip,
        legs: [
          TransportSearchLeg(
            origin: 'NYC',
            destination: 'LON',
            departDate: DateTime.utc(2025, 12, 25),
            mode: TransportMode.flight,
          ),
        ],
        passengers: {'adults': 2, 'children': 1},
        filters: const TransportFilters(maxStops: 1),
      );

      final json = request.toJson();
      final decoded = TransportSearchRequest.fromJson(json);

      expect(decoded, request);
      expect(decoded.itineraryId, 'itin_123');
      expect(decoded.passengers['adults'], 2);
    });
  });

  group('TransportItem', () {
    test('serialization round trip', () {
      final item = TransportItem(
        id: 'item_1',
        providers: [
          const TransportProvider(name: 'BA', code: 'BA', logoUrl: 'url'),
        ],
        segments: [
          TransportSegment(
            origin: 'JFK',
            destination: 'LHR',
            departure: DateTime.utc(2025, 12, 25, 10, 0),
            arrival: DateTime.utc(2025, 12, 25, 22, 0),
            duration: const Duration(hours: 7),
            carrier: 'British Airways',
            transportIdentifier: 'BA123',
            mode: TransportMode.flight,
          ),
        ],
        price: const Price(amount: 500.0, currency: 'USD'),
        totalDuration: const Duration(hours: 7),
        departure: DateTime.utc(2025, 12, 25, 10, 0),
        arrival: DateTime.utc(2025, 12, 25, 22, 0),
        mode: TransportMode.flight,
      );

      final json = item.toJson();
      final decoded = TransportItem.fromJson(json);

      expect(decoded, item);
      expect(decoded.price.amount, 500.0);
    });
  });
}
