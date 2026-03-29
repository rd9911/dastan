import 'package:dastan/src/core/application/save_item_service.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/core/presentation/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSaveItemService extends Mock implements SaveItemService {}

class FakeSavedItem extends Fake implements SavedItem {}

void main() {
  late MockSaveItemService service;

  setUpAll(() {
    registerFallbackValue(FakeSavedItem());
    registerFallbackValue(ItinerarySection.transport);
    registerFallbackValue(<String, dynamic>{});
  });

  setUp(() {
    service = MockSaveItemService();
  });

  testWidgets('shows unsaved icon when item is not saved', (tester) async {
    when(() => service.isItemSaved('test-key')).thenAnswer((_) async => false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [saveItemServiceProvider.overrideWithValue(service)],
        child: MaterialApp(
          home: Scaffold(
            body: SaveButton(
              section: ItinerarySection.transport,
              dedupeKey: 'test-key',
              title: 'Test',
              details: {'name': 'Test'},
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.bookmark_border), findsOneWidget);
  });

  testWidgets('shows saved icon when item is saved', (tester) async {
    when(() => service.isItemSaved('test-key')).thenAnswer((_) async => true);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [saveItemServiceProvider.overrideWithValue(service)],
        child: MaterialApp(
          home: Scaffold(
            body: SaveButton(
              section: ItinerarySection.transport,
              dedupeKey: 'test-key',
              title: 'Test',
              details: {'name': 'Test'},
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.bookmark), findsOneWidget);
  });

  testWidgets('saves item when tapped and not saved', (tester) async {
    when(() => service.isItemSaved('test-key')).thenAnswer((_) async => false);
    when(
      () => service.saveItem(
        section: any(named: 'section'),
        dedupeKey: any(named: 'dedupeKey'),
        title: any(named: 'title'),
        details: any(named: 'details'),
        externalData: any(named: 'externalData'),
        time: any(named: 'time'),
        location: any(named: 'location'),
        media: any(named: 'media'),
      ),
    ).thenAnswer((_) async => FakeSavedItem());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [saveItemServiceProvider.overrideWithValue(service)],
        child: MaterialApp(
          home: Scaffold(
            body: SaveButton(
              section: ItinerarySection.transport,
              dedupeKey: 'test-key',
              title: 'Test',
              details: {'name': 'Test'},
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verify(
      () => service.saveItem(
        section: ItinerarySection.transport,
        dedupeKey: 'test-key',
        title: 'Test',
        details: {'name': 'Test'},
      ),
    ).called(1);

    expect(find.text('Item saved to itinerary'), findsOneWidget);
  });

  testWidgets('unsaves item when tapped and already saved', (tester) async {
    final savedItem = SavedItem(
      id: '1',
      itineraryId: 'test',
      section: ItinerarySection.transport,
      dedupeKey: 'test-key',
      title: 'Test',
      details: {'name': 'Test'},
      externalData: null,
      time: null,
      location: null,
      sync: const SavedItemSync(status: SyncStatus.queued),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    when(() => service.isItemSaved('test-key')).thenAnswer((_) async => true);
    when(() => service.getSavedItems()).thenAnswer((_) async => [savedItem]);
    when(() => service.unsaveItem('1')).thenAnswer((_) async {});

    await tester.pumpWidget(
      ProviderScope(
        overrides: [saveItemServiceProvider.overrideWithValue(service)],
        child: MaterialApp(
          home: Scaffold(
            body: SaveButton(
              section: ItinerarySection.transport,
              dedupeKey: 'test-key',
              title: 'Test',
              details: {'name': 'Test'},
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verify(() => service.unsaveItem('1')).called(1);
    expect(find.text('Item removed from itinerary'), findsOneWidget);
  });
}
