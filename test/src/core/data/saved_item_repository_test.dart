import 'dart:convert';
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

  test('saveItem inserts item into database', () async {
    final item = SavedItem(
      id: '1',
      itineraryId: 'it1',
      section: ItinerarySection.transport,
      dedupeKey: 'key1',
      title: 'Test Title',
      details: {'data': 'test'},
      externalData: null,
      time: null,
      location: null,
      sync: const SavedItemSync(status: SyncStatus.queued),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Need an itinerary first due to foreign key constraint
    await db
        .into(db.itineraries)
        .insert(
          drift_db.ItinerariesCompanion.insert(
            id: 'it1',
            title: 'Test Itinerary',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );

    await repository.saveItem(item);

    final result = await repository.getSavedItem('1');
    expect(result, isNotNull);
    expect(result!.dedupeKey, 'key1');
    expect(result.details['data'], 'test');
  });

  test('getSavedItems returns items for specific itinerary', () async {
    // Setup itineraries
    await db
        .into(db.itineraries)
        .insert(
          drift_db.ItinerariesCompanion.insert(
            id: 'it1',
            title: 'Itinerary 1',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
    await db
        .into(db.itineraries)
        .insert(
          drift_db.ItinerariesCompanion.insert(
            id: 'it2',
            title: 'Itinerary 2',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );

    final item1 = SavedItem(
      id: '1',
      itineraryId: 'it1',
      section: ItinerarySection.transport,
      dedupeKey: 'key1',
      title: 'Item 1',
      details: {},
      externalData: null,
      time: null,
      location: null,
      sync: const SavedItemSync(status: SyncStatus.queued),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final item2 = SavedItem(
      id: '2',
      itineraryId: 'it2',
      section: ItinerarySection.transport,
      dedupeKey: 'key2',
      title: 'Item 2',
      details: {},
      externalData: null,
      time: null,
      location: null,
      sync: const SavedItemSync(status: SyncStatus.queued),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await repository.saveItem(item1);
    await repository.saveItem(item2);

    final results = await repository.getSavedItems('it1');
    expect(results.length, 1);
    expect(results.first.id, '1');
  });

  test(
    'getSavedItem handles legacy or malformed JSON content gracefully',
    () async {
      // Setup itinerary
      await db
          .into(db.itineraries)
          .insert(
            drift_db.ItinerariesCompanion.insert(
              id: 'legacy_it',
              title: 'Legacy Itinerary',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          );

      // Insert row with malformed content directly simulating legacy data
      await db
          .into(db.savedItems)
          .insert(
            drift_db.SavedItemsCompanion.insert(
              id: 'legacy_item',
              itineraryId: 'legacy_it',
              section: 'transport',
              dedupeKey: 'legacy_key',
              content: jsonEncode({
                'title': 'Legacy Item',
                'details':
                    'some string details', // Malformed details (should be Map)
                'location': 'Paris', // Malformed location (should be Map)
                'time': '10:00 AM', // Malformed time
                'externalData': 'vendor-data', // Malformed
                'media': 'not-a-list', // Malformed
                'sync': 'synced', // Malformed
              }),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          );

      final item = await repository.getSavedItem('legacy_item');

      expect(item, isNotNull);
      expect(item!.id, 'legacy_item');
      expect(item.title, 'Legacy Item');
      expect(item.details, isEmpty); // Should fallback to empty map
      expect(item.location, isNull); // Should fallback to null
      expect(item.time, isNull);
      expect(item.externalData, isNull);
      expect(item.media, isEmpty);
      // sync falls back to status based on isSynced column (default false -> queued)
      expect(item.sync.status, SyncStatus.queued);
    },
  );
}
