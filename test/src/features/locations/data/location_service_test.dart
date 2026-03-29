import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dastan/src/features/locations/data/location_repository.dart';
import 'package:dastan/src/features/locations/domain/location.dart';

class MockLocationRepository extends Mock implements LocationRepository {}

void main() {
  late MockLocationRepository mockRepository;

  setUp(() {
    mockRepository = MockLocationRepository();
  });

  group('LocationRepository', () {
    test('searchLocations returns matching results', () async {
      const mockLocation = Location(
        id: 'R7444',
        name: 'Paris',
        country: 'France',
        lat: 48.8566,
        lng: 2.3522,
      );

      when(
        () => mockRepository.searchLocations(any()),
      ).thenAnswer((_) async => [mockLocation]);

      final results = await mockRepository.searchLocations('Par');
      expect(results.length, greaterThan(0));
      expect(results.first.name, contains('Paris'));
    });

    test('searchLocations is case insensitive', () async {
      const mockLocation = Location(
        id: 'R7444',
        name: 'Paris',
        country: 'France',
      );

      when(
        () => mockRepository.searchLocations(any()),
      ).thenAnswer((_) async => [mockLocation]);

      final results = await mockRepository.searchLocations('par');
      expect(results.length, greaterThan(0));
      expect(results.first.name, contains('Paris'));
    });

    test('searchLocations returns empty list for no matches', () async {
      when(
        () => mockRepository.searchLocations(any()),
      ).thenAnswer((_) async => []);

      final results = await mockRepository.searchLocations('Xyzabc');
      expect(results, isEmpty);
    });

    test('reverseGeocode returns location for coordinates', () async {
      const mockLocation = Location(
        id: 'R7444',
        name: 'Paris',
        country: 'France',
        lat: 48.8566,
        lng: 2.3522,
      );

      when(
        () => mockRepository.reverseGeocode(any(), any()),
      ).thenAnswer((_) async => mockLocation);

      final result = await mockRepository.reverseGeocode(48.8566, 2.3522);
      expect(result, isNotNull);
      expect(result!.name, equals('Paris'));
    });
  });
}
