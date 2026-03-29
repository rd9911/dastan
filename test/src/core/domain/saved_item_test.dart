import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

void main() {
  group('SavedItem', () {
    test('serialization round-trip', () {
      final savedItem = SavedItem(
        id: 'sid1',
        itineraryId: 'iid1',
        section: ItinerarySection.transport,
        dedupeKey: 'hash123',
        title: 'Title',
        details: {'some': 'data'},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.synced),
        createdAt: DateTime(2023, 1, 1),
        updatedAt: DateTime(2023, 1, 1),
      );

      final json = savedItem.toJson();
      // Encode and decode to ensure nested objects are converted to Maps
      // (json_serializable default behavior puts objects in Map, not their JSON representation unless explicitToJson is set)
      final encoded = jsonEncode(json);
      final decoded = jsonDecode(encoded);

      final fromJson = SavedItem.fromJson(decoded);

      expect(fromJson, equals(savedItem));
    });

    // We will add more specific tests once we refactor SavedItem to match the spec
    // e.g. checking required fields, nested objects structure etc.
  });
}
