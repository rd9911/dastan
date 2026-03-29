import 'package:dastan/src/core/application/save_item_service.dart';
import 'package:dastan/src/core/data/saved_item_repository.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSavedItemRepository extends Mock implements SavedItemRepository {}

class FakeSavedItem extends Fake implements SavedItem {}

void main() {
  late SaveItemService service;
  late MockSavedItemRepository repository;
  late String activeItineraryId;

  setUpAll(() {
    registerFallbackValue(FakeSavedItem());
  });

  setUp(() {
    repository = MockSavedItemRepository();
    activeItineraryId = 'test-itinerary-id';
    service = SaveItemService(repository, () => activeItineraryId);
  });

  test('saveItem creates a saved item with active itinerary id', () async {
    final savedItem = SavedItem(
      id: '1',
      itineraryId: activeItineraryId,
      section: ItinerarySection.transport,
      dedupeKey: 'flight-123',
      title: 'Flight to Paris',
      details: {'name': 'Flight to Paris'},
      externalData: null,
      time: null,
      location: null,
      sync: const SavedItemSync(status: SyncStatus.queued),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    when(() => repository.saveItem(any())).thenAnswer((_) async => savedItem);

    final result = await service.saveItem(
      section: ItinerarySection.transport,
      dedupeKey: 'flight-123',
      title: 'Flight to Paris',
      details: {'name': 'Flight to Paris'},
    );

    expect(result.itineraryId, activeItineraryId);
    expect(result.dedupeKey, 'flight-123');
    verify(() => repository.saveItem(any(that: isA<SavedItem>()))).called(1);
  });

  test('unsaveItem calls repository deleteItem', () async {
    when(() => repository.deleteItem('1')).thenAnswer((_) async {});

    await service.unsaveItem('1');

    verify(() => repository.deleteItem('1')).called(1);
  });

  test('getSavedItems returns items for active itinerary', () async {
    final items = [
      SavedItem(
        id: '1',
        itineraryId: activeItineraryId,
        section: ItinerarySection.transport,
        dedupeKey: 'flight-123',
        title: 'Title',
        details: {},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    when(
      () => repository.getSavedItems(activeItineraryId),
    ).thenAnswer((_) async => items);

    final result = await service.getSavedItems();

    expect(result, items);
    verify(() => repository.getSavedItems(activeItineraryId)).called(1);
  });

  test('getSavedItemsBySection returns items for section', () async {
    final items = [
      SavedItem(
        id: '1',
        itineraryId: activeItineraryId,
        section: ItinerarySection.transport,
        dedupeKey: 'flight-123',
        title: 'Title',
        details: {},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    when(
      () => repository.getSavedItemsBySection(
        activeItineraryId,
        ItinerarySection.transport,
      ),
    ).thenAnswer((_) async => items);

    final result = await service.getSavedItemsBySection(
      ItinerarySection.transport,
    );

    expect(result, items);
    verify(
      () => repository.getSavedItemsBySection(
        activeItineraryId,
        ItinerarySection.transport,
      ),
    ).called(1);
  });

  test('isItemSaved returns true if item exists', () async {
    final items = [
      SavedItem(
        id: '1',
        itineraryId: activeItineraryId,
        section: ItinerarySection.transport,
        dedupeKey: 'flight-123',
        title: 'Title',
        details: {},
        externalData: null,
        time: null,
        location: null,
        sync: const SavedItemSync(status: SyncStatus.queued),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    when(
      () => repository.getSavedItems(activeItineraryId),
    ).thenAnswer((_) async => items);

    final result = await service.isItemSaved('flight-123');

    expect(result, true);
  });

  test('isItemSaved returns false if item does not exist', () async {
    when(
      () => repository.getSavedItems(activeItineraryId),
    ).thenAnswer((_) async => []);

    final result = await service.isItemSaved('flight-123');

    expect(result, false);
  });
}
