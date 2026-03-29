import 'package:flutter_test/flutter_test.dart';

import 'package:dastan/src/core/domain/vertical.dart';

void main() {
  group('FeatureVertical', () {
    test('has all 6 values', () {
      expect(FeatureVertical.values.length, equals(6));
      expect(FeatureVertical.values, contains(FeatureVertical.transport));
      expect(FeatureVertical.values, contains(FeatureVertical.accommodation));
      expect(FeatureVertical.values, contains(FeatureVertical.entertainment));
      expect(FeatureVertical.values, contains(FeatureVertical.gastronomy));
      expect(FeatureVertical.values, contains(FeatureVertical.events));
      expect(FeatureVertical.values, contains(FeatureVertical.trails));
    });

    test('displayName returns correct labels', () {
      expect(FeatureVertical.transport.displayName, equals('Transport'));
      expect(
        FeatureVertical.accommodation.displayName,
        equals('Accommodation'),
      );
      expect(
        FeatureVertical.entertainment.displayName,
        equals('Entertainment'),
      );
      expect(FeatureVertical.gastronomy.displayName, equals('Gastronomy'));
      expect(FeatureVertical.events.displayName, equals('Events'));
      expect(FeatureVertical.trails.displayName, equals('Trails'));
    });

    test('iconName returns valid icon names', () {
      expect(FeatureVertical.transport.iconName, equals('flight'));
      expect(FeatureVertical.accommodation.iconName, equals('hotel'));
      expect(FeatureVertical.entertainment.iconName, equals('attractions'));
      expect(FeatureVertical.gastronomy.iconName, equals('restaurant'));
      expect(FeatureVertical.events.iconName, equals('event'));
      expect(FeatureVertical.trails.iconName, equals('hiking'));
    });
  });

  group('Type aliases', () {
    test('ItinerarySection is aliased to FeatureVertical', () {
      // This test verifies the typedef works at compile time
      final ItinerarySection section = FeatureVertical.transport;
      expect(section, equals(FeatureVertical.transport));
    });

    test('SearchVertical is aliased to FeatureVertical', () {
      // This test verifies the typedef works at compile time
      final SearchVertical vertical = FeatureVertical.entertainment;
      expect(vertical, equals(FeatureVertical.entertainment));
    });

    test('aliases are interchangeable', () {
      const ItinerarySection section = FeatureVertical.gastronomy;
      const SearchVertical vertical = FeatureVertical.gastronomy;
      expect(section, equals(vertical));
    });
  });
}
