import 'package:dastan/main.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Map flow: Save items and view on map', (tester) async {
    final db = AppDatabase.connect(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(db)],
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    // 1. Create itinerary
    await tester.tap(find.text('Create Itinerary'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).first, 'Map Trip');
    await tester.enterText(find.byType(TextFormField).last, 'Paris');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // 2. Save a Transport item (Paris)
    await tester.tap(find.widgetWithText(Tab, 'Search'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Transport'));
    await tester.pumpAndSettle();

    // Search for Paris
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Origin *'),
      'New York',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Destination *'),
      'Paris',
    );
    await tester.tap(find.widgetWithText(ElevatedButton, 'Search'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Save first result
    await tester.tap(find.byIcon(Icons.bookmark_border).first);
    await tester.pumpAndSettle();

    // 3. Navigate to Map tab
    await tester.pageBack(); // Back to overview
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(Tab, 'Map'));
    await tester.pumpAndSettle();

    // 4. Verify Map is displayed
    expect(find.byType(FlutterMap), findsOneWidget);

    // 5. Verify Marker is present
    // Note: FlutterMap markers are widgets in the tree
    expect(find.byIcon(Icons.location_on), findsOneWidget);
  });
}
