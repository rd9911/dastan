import 'package:dastan/src/core/domain/dedupe_strategy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DedupeStrategy', () {
    test('transport key is deterministic', () {
      final key1 = DedupeStrategy.transport(
        mode: 'flight',
        origin: 'LHR',
        destination: 'JFK',
        departAt: DateTime(2023, 1, 1, 10, 0),
        vendor: 'BA',
      );

      final key2 = DedupeStrategy.transport(
        mode: 'flight',
        origin: 'LHR',
        destination: 'JFK',
        departAt: DateTime(2023, 1, 1, 10, 0),
        vendor: 'BA',
      );

      expect(key1, key2);
      expect(key1, contains('flight'));
      expect(key1, contains('LHR'));
      expect(key1, contains('JFK'));
      expect(key1, contains('BA'));
    });

    test('transport key handles null vendor', () {
      final key = DedupeStrategy.transport(
        mode: 'flight',
        origin: 'LHR',
        destination: 'JFK',
        departAt: DateTime(2023, 1, 1, 10, 0),
      );

      expect(key, isNotNull);
      expect(key, contains('transport'));
    });

    test('accommodation key is deterministic', () {
      final key1 = DedupeStrategy.accommodation(
        type: 'hotel',
        name: 'Grand Hotel',
        checkIn: DateTime(2023, 1, 1),
      );

      final key2 = DedupeStrategy.accommodation(
        type: 'hotel',
        name: 'Grand Hotel',
        checkIn: DateTime(2023, 1, 1),
      );

      expect(key1, key2);
      expect(key1, contains('hotel'));
      expect(key1, contains('Grand Hotel'));
    });
  });
}
