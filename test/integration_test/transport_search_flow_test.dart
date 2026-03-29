import 'package:dastan/main.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Transport search flow: Create itinerary, search, and save', (
    tester,
  ) async {
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

    // 1. Create an itinerary
    await tester.tap(find.text('Create Itinerary'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'NYC Trip');
    await tester.enterText(find.byType(TextFormField).last, 'New York');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // Should be on Overview screen
    expect(find.text('NYC Trip'), findsOneWidget);

    // 2. Navigate to Transport search
    await tester.tap(find.widgetWithText(Tab, 'Search'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Transport'));
    await tester.pumpAndSettle();

    // Should be on Transport search screen
    expect(find.text('Transport Search'), findsOneWidget);

    // 3. Fill in search form
    final originField = find.widgetWithText(TextFormField, 'Origin *');
    final destinationField = find.widgetWithText(
      TextFormField,
      'Destination *',
    );

    await tester.enterText(originField, 'New York');
    await tester.pumpAndSettle(
      const Duration(milliseconds: 500),
    ); // Wait for debounce/network
    await tester.tap(find.text('New York, United States').last);
    await tester.pumpAndSettle();

    await tester.enterText(destinationField, 'Los Angeles');
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.text('Los Angeles, United States').last);
    await tester.pumpAndSettle();

    // Select flight mode (should be default)
    expect(find.text('FLIGHT'), findsOneWidget);

    // 4. Tap search
    await tester.tap(find.widgetWithText(ElevatedButton, 'Search'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Should see loading indicator briefly, then results
    // Results should have transport cards
    expect(find.byType(Card), findsWidgets);

    // Should see flight details
    expect(find.text('New York'), findsWidgets);
    expect(find.text('Los Angeles'), findsWidgets);

    // Should see save buttons
    expect(find.byIcon(Icons.bookmark_border), findsWidgets);

    // 5. Save first result
    final firstSaveButton = find.byIcon(Icons.bookmark_border).first;
    await tester.tap(firstSaveButton);
    await tester.pumpAndSettle();

    // Should see snackbar confirmation
    expect(find.text('Item saved to itinerary'), findsOneWidget);

    // Save button should change to saved state
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byIcon(Icons.bookmark), findsWidgets);

    // 6. Navigate back to overview
    await tester.pageBack();
    await tester.pumpAndSettle();

    // 7. Check Saved tab
    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();

    // Should see saved transport item
    expect(find.text('TRANSPORT'), findsOneWidget);

    // 8. Delete the saved item
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Should be empty again
    expect(find.text('No saved items yet.'), findsOneWidget);
  });

  testWidgets('Transport search: Different modes (train, bus)', (tester) async {
    final db = AppDatabase.connect(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(db)],
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    // Create itinerary
    await tester.tap(find.text('Create Itinerary'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).first, 'Europe Trip');
    await tester.enterText(find.byType(TextFormField).last, 'Paris');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // Navigate to Transport search
    await tester.tap(find.widgetWithText(Tab, 'Search'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Transport'));
    await tester.pumpAndSettle();

    // Test TRAIN mode
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Origin *'),
      'Paris',
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.text('Paris, France').last);
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Destination *'),
      'London',
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.text('London, United Kingdom').last);
    await tester.pumpAndSettle();

    // Change mode to train
    await tester.tap(find.text('FLIGHT'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('TRAIN').last);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Search'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Should see train results
    expect(find.text('TRAIN'), findsWidgets);
    expect(find.text('Paris'), findsWidgets);
    expect(find.text('London'), findsWidgets);
  });
}
