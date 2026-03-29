import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/planner/application/planner_item_mapper.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PlannerItemMapper mapper;

  setUp(() {
    mapper = PlannerItemMapper();
  });

  final baseItem = SavedItem(
    id: 'item_1',
    itineraryId: 'itinerary_1',
    section: ItinerarySection.gastronomy,
    title: 'Dinner at Place',
    details: {},
    externalData: null,
    time: null,
    location: null,
    dedupeKey: 'dedupe_1',
    sync: const SavedItemSync(status: SyncStatus.synced),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  test('should map item without time to flex entry with default duration', () {
    final entry = mapper.fromSavedItem(baseItem, DateTime(2023, 10, 27));

    expect(entry.savedItemId, 'item_1');
    expect(entry.title, 'Dinner at Place');
    expect(entry.type, PlanEntryType.flex);
    expect(entry.startTime, isNull);
    expect(entry.durationMinutes, 90); // Gastronomy default
  });

  test('should map item with time to fixed entry', () {
    final start = DateTime(2023, 10, 27, 19, 0);
    final end = DateTime(2023, 10, 27, 21, 0);
    final itemWithTime = baseItem.copyWith(
      time: SavedItemTime(start: start, end: end),
    );

    final entry = mapper.fromSavedItem(itemWithTime, DateTime(2023, 10, 27));

    expect(entry.type, PlanEntryType.fixed);
    expect(entry.startTime, start);
    expect(entry.endTime, end);
    expect(entry.durationMinutes, 120);
  });

  test('should map transport item to fixed entry even without time', () {
    final transportItem = baseItem.copyWith(
      section: ItinerarySection.transport,
      title: 'Flight',
    );

    final entry = mapper.fromSavedItem(transportItem, DateTime(2023, 10, 27));

    expect(entry.type, PlanEntryType.fixed);
    expect(entry.durationMinutes, 120); // Transport default
  });
}
