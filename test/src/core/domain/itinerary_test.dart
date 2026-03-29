import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/core/domain/itinerary.dart';

void main() {
  group('Itinerary', () {
    test('serialization round-trip', () {
      final itinerary = Itinerary(
        id: 'id1',
        title: 'Trip to Paris',
        destination: 'Paris',
        startDate: DateTime(2023, 1, 1),
        endDate: DateTime(2023, 1, 10),
        travelers: 2,
        createdAt: DateTime(2023, 1, 1),
        updatedAt: DateTime(2023, 1, 1),
      );

      final json = itinerary.toJson();
      final fromJson = Itinerary.fromJson(json);

      expect(fromJson, equals(itinerary));
    });

    test('supports having no dates', () {
      final itinerary = Itinerary(
        id: 'id2',
        title: 'Someday Trip',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(itinerary.startDate, isNull);
      expect(itinerary.endDate, isNull);
    });
  });
}
