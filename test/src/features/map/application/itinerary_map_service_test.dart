import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/map/application/itinerary_map_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dastan/src/core/application/save_item_service.dart';

class MockSavedItemService extends Mock implements SaveItemService {}

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer(
      overrides: [
        savedItemsProvider.overrideWith(
          (ref) => Stream.fromFuture(
            Future.value([
              SavedItem(
                id: '1',
                itineraryId: 'it1',
                section: ItinerarySection.transport,
                dedupeKey: 'key1',
                title: 'New York to Paris',
                details: {'origin': 'New York', 'destination': 'Paris'},
                externalData: null,
                time: null,
                location: null,
                sync: const SavedItemSync(status: SyncStatus.synced),
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
              SavedItem(
                id: '2',
                itineraryId: 'it1',
                section: ItinerarySection.accommodation,
                dedupeKey: 'key2',
                title: 'Grand Hotel',
                details: {'name': 'Grand Hotel', 'location': 'Paris'},
                externalData: null,
                time: null,
                location: null,
                sync: const SavedItemSync(status: SyncStatus.synced),
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            ]),
          ),
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('build returns mapped items with coordinates', () async {
    // Keep the provider alive
    final sub = container.listen(itineraryMapServiceProvider, (_, __) {});

    final service = container.read(itineraryMapServiceProvider.future);
    final items = await service;

    expect(items.length, 2);

    // Check Transport Item (Paris destination)
    final transportItem = items.firstWhere((i) => i.id == '1');
    expect(transportItem.title, 'New York to Paris');
    expect(transportItem.latitude, 48.8566); // Paris lat
    expect(transportItem.longitude, 2.3522); // Paris lng

    // Check Accommodation Item (Paris location)
    final accommodationItem = items.firstWhere((i) => i.id == '2');
    expect(accommodationItem.title, 'Grand Hotel');
    expect(accommodationItem.latitude, 48.8566);
    expect(accommodationItem.longitude, 2.3522);

    sub.close();
  });
}
