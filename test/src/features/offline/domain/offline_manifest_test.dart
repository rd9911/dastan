import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/offline/domain/offline_manifest.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
// import 'package:dastan/src/features/planner/domain/planner_models.dart';

void main() {
  group('OfflineBundleManifest', () {
    test('supports JSON round-trip', () {
      final manifest = OfflineBundleManifest(
        itineraryId: 'itinerary-123',
        version: 1,
        createdAt: DateTime.utc(2025, 1, 1),
        sections: {
          ItinerarySection.transport: [
            SavedItem(
              id: 't-1',
              itineraryId: 'itinerary-123',
              section: ItinerarySection.transport,
              dedupeKey: 'flight-1',
              title: 'Flight to Paris',
              createdAt: DateTime.utc(2025, 1, 1),
              updatedAt: DateTime.utc(2025, 1, 1),
              details: const {},
              externalData: null,
              time: null,
              location: null,
              sync: const SavedItemSync(status: SyncStatus.synced),
            ),
          ],
        },
        dayPlans: [],
        assets: [
          const BundleAsset(
            path: 'images/img1.jpg',
            originalUrl: 'https://example.com/img1.jpg',
            sha256: 'hash123',
            kind: BundleAssetKind.image,
          ),
        ],
        searchIndex: [
          const SearchIndexEntry(tokenId: 'paris', itemIds: ['t-1']),
        ],
        metadata: {'size': 1024},
      );

      final json = manifest.toJson();
      expect(json['itineraryId'], 'itinerary-123');
      expect(json['version'], 1);
      // Verify sections are serialized as map
      expect((json['sections'] as Map).containsKey('transport'), true);

      final decoded = OfflineBundleManifest.fromJson(json);
      expect(decoded, manifest);
    });

    // Add more tests for validation if needed
  });
}
