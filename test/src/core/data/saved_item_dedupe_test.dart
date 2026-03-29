import 'package:dastan/src/core/data/drift_database.dart' as drift_db;
import 'package:dastan/src/core/data/saved_item_repository.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late drift_db.AppDatabase db;
  late SavedItemRepository repository;

  setUp(() {
    db = drift_db.AppDatabase.connect(NativeDatabase.memory());
    repository = SavedItemRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('Deduplication Tests', () {
    test('saving item with same dedupe key replaces existing item', () async {
      // First save
      final item1 = SavedItem(
        id: '1',
        itineraryId: 'test-itinerary',
        section: ItinerarySection.transport,
        dedupeKey: 'flight-123',
        title: 'Flight A',
        details: {'name': 'Flight A', 'price': 299.99},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repository.saveItem(item1);

      // Save again with same dedupe key but different content
      final item2 = SavedItem(
        id: '2',
        itineraryId: 'test-itinerary',
        section: ItinerarySection.transport,
        dedupeKey: 'flight-123',
        title: 'Flight B',
        details: {'name': 'Flight B', 'price': 399.99},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repository.saveItem(item2);

      // Should only have one item
      final items = await repository.getSavedItems('test-itinerary');
      expect(items.length, 1);
      expect(items[0].details['name'], 'Flight B');
      expect(items[0].details['price'], 399.99);
    });

    test('items with different dedupe keys are both saved', () async {
      final item1 = SavedItem(
        id: '1',
        itineraryId: 'test-itinerary',
        section: ItinerarySection.transport,
        dedupeKey: 'flight-123',
        title: 'Flight A',
        details: {'name': 'Flight A'},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final item2 = SavedItem(
        id: '2',
        itineraryId: 'test-itinerary',
        section: ItinerarySection.transport,
        dedupeKey: 'flight-456',
        title: 'Flight B',
        details: {'name': 'Flight B'},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repository.saveItem(item1);
      await repository.saveItem(item2);

      final items = await repository.getSavedItems('test-itinerary');
      expect(items.length, 2);
    });

    test(
      'items with same dedupe key in different itineraries are both saved',
      () async {
        final item1 = SavedItem(
          id: '1',
          itineraryId: 'itinerary-1',
          section: ItinerarySection.transport,
          dedupeKey: 'flight-123',
          title: 'Flight A',
          details: {'name': 'Flight A'},
          externalData: null,
          time: null,
          location: null,
          sync: const SavedItemSync(status: SyncStatus.queued),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final item2 = SavedItem(
          id: '2',
          itineraryId: 'itinerary-2',
          section: ItinerarySection.transport,
          dedupeKey: 'flight-123',
          title: 'Flight B',
          details: {'name': 'Flight B'},
          externalData: null,
          time: null,
          location: null,
          sync: const SavedItemSync(status: SyncStatus.queued),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        await repository.saveItem(item1);
        await repository.saveItem(item2);

        final items1 = await repository.getSavedItems('itinerary-1');
        final items2 = await repository.getSavedItems('itinerary-2');

        expect(items1.length, 1);
        expect(items2.length, 1);
      },
    );
  });

  group('Offline Sync Tests', () {
    test('saved items have isSynced set to false by default', () async {
      final item = SavedItem(
        id: '1',
        itineraryId: 'test-itinerary',
        section: ItinerarySection.transport,
        dedupeKey: 'flight-123',
        title: 'Flight A',
        details: {'name': 'Flight A'},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repository.saveItem(item);

      final items = await repository.getSavedItems('test-itinerary');
      expect(items[0].sync.status == SyncStatus.synced, false);
    });

    test('can filter unsynced items', () async {
      final item1 = SavedItem(
        id: '1',
        itineraryId: 'test-itinerary',
        section: ItinerarySection.transport,
        dedupeKey: 'flight-123',
        title: 'Flight A',
        details: {'name': 'Flight A'},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final item2 = SavedItem(
        id: '2',
        itineraryId: 'test-itinerary',
        section: ItinerarySection.accommodation,
        dedupeKey: 'hotel-456',
        title: 'Hotel B',
        details: {'name': 'Hotel B'},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.synced),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await repository.saveItem(item1);
      await repository.saveItem(item2);

      final allItems = await repository.getSavedItems('test-itinerary');
      final unsyncedItems = allItems
          .where((item) => item.sync.status != SyncStatus.synced)
          .toList();

      expect(unsyncedItems.length, 1);
      expect(unsyncedItems[0].dedupeKey, 'flight-123');
    });
  });
}
