import 'package:dastan/src/features/transport/application/transport_normalization_helper.dart';
import 'package:dastan/src/features/transport/domain/transport_item.dart';
import 'package:dastan/src/features/transport/domain/transport_search_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('generateTransportDedupeKey creates deterministic key', () {
    final item = TransportItem(
      id: 'any',
      providers: [
        const TransportProvider(name: 'AirlineX', code: 'AX', logoUrl: null),
      ],
      segments: [
        TransportSegment(
          origin: 'A',
          destination: 'B',
          departure: DateTime.fromMillisecondsSinceEpoch(100000),
          arrival: DateTime.now(),
          duration: Duration.zero,
          carrier: 'C',
          transportIdentifier: 'T',
          mode: TransportMode.flight,
        ),
      ],
      price: const Price(amount: 10, currency: 'USD'),
      totalDuration: Duration.zero,
      departure: DateTime.now(),
      arrival: DateTime.now(),
      mode: TransportMode.flight,
    );

    final key = TransportNormalizationHelper.generateTransportDedupeKey(item);
    expect(key, 'transport-flight-a-b-100000-airlinex');
  });

  test('partitionByMode buckets items correctly', () {
    final flight = _mockItem(TransportMode.flight);
    final train = _mockItem(TransportMode.train);
    final bus = _mockItem(TransportMode.bus);

    final buckets = TransportNormalizationHelper.partitionByMode([
      flight,
      train,
      bus,
    ]);

    expect(buckets[TransportMode.flight], [flight]);
    expect(buckets[TransportMode.train], [train]);
    expect(buckets[TransportMode.bus], [bus]);
  });
}

TransportItem _mockItem(TransportMode mode) {
  return TransportItem(
    id: 'id',
    providers: [],
    segments: [],
    price: const Price(amount: 0, currency: ''),
    totalDuration: Duration.zero,
    departure: DateTime.now(),
    arrival: DateTime.now(),
    mode: mode,
  );
}
