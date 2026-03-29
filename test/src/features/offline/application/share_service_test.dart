import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/offline/application/share_service.dart';
import 'package:dastan/src/features/offline/domain/share_models.dart';

void main() {
  late ShareService service;

  setUp(() {
    service = ShareService();
  });

  group('createShareLink', () {
    test('generates valid share link', () async {
      const config = ShareConfig();

      final link = await service.createShareLink(
        itineraryId: 'i1',
        version: 1,
        config: config,
      );

      expect(link.id.isNotEmpty, true);
      expect(link.url.contains('share'), true);
      expect(link.itineraryId, 'i1');
      expect(link.revocationToken.isNotEmpty, true);
    });

    test('applies expiry when configured', () async {
      const config = ShareConfig(expiryDays: 7);

      final link = await service.createShareLink(
        itineraryId: 'i1',
        version: 1,
        config: config,
      );

      expect(link.expiresAt, isNotNull);
      expect(link.expiresAt!.difference(link.createdAt).inDays, 7);
    });
  });

  group('applyPrivacyRedactions', () {
    test('excludes notes when configured', () {
      const config = ShareConfig(excludeNotes: true);
      final data = {'title': 'Trip', 'notes': 'Secret notes'};

      final result = service.applyPrivacyRedactions(data, config);

      expect(result.containsKey('notes'), false);
      expect(result['title'], 'Trip');
    });

    test('excludes pricing when configured', () {
      const config = ShareConfig(excludePricing: true);
      final data = {'title': 'Trip', 'price': 100.0};

      final result = service.applyPrivacyRedactions(data, config);

      expect(result.containsKey('price'), false);
    });

    test('reduces location precision when configured', () {
      const config = ShareConfig(reduceLocationPrecision: true);
      final data = {'title': 'Trip', 'latitude': 48.8566, 'longitude': 2.3522};

      final result = service.applyPrivacyRedactions(data, config);

      expect(result['latitude'], 49.0);
      expect(result['longitude'], 2.0);
    });

    test('preserves data when no redactions configured', () {
      const config = ShareConfig(
        excludeNotes: false,
        excludePricing: false,
        reduceLocationPrecision: false,
      );
      final data = {'title': 'Trip', 'notes': 'Notes', 'price': 100.0};

      final result = service.applyPrivacyRedactions(data, config);

      expect(result, data);
    });
  });
}
