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

  testWidgets('Accommodation search flow: Create itinerary, search, and save', (
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

    await tester.enterText(find.byType(TextFormField).first, 'Paris Trip');
    await tester.enterText(find.byType(TextFormField).last, 'Paris');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // Should be on Overview screen
    expect(find.text('Paris Trip'), findsOneWidget);

    // 2. Navigate to Accommodation search
    await tester.tap(find.widgetWithText(Tab, 'Search'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Accommodation'));
    await tester.pumpAndSettle();

    // Should be on Accommodation search screen
    expect(find.text('Accommodation Search'), findsOneWidget);

    // 3. Fill in search form
    final locationField = find.widgetWithText(TextFormField, 'Location *');
    await tester.enterText(locationField, 'Paris');
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.text('Paris, France').last);
    await tester.pumpAndSettle();

    // 4. Tap search
    await tester.tap(find.widgetWithText(ElevatedButton, 'Search'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Should see loading indicator briefly, then results
    // Results should have accommodation cards
    expect(find.byType(Card), findsWidgets);

    // Should see accommodation details
    expect(find.text('Paris'), findsWidgets);

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

    // Should see saved accommodation item
    // AccommodationResultCard shows type name in uppercase (e.g. HOTEL)
    // SavedItemsTab shows section name in uppercase (ACCOMMODATION)
    expect(find.text('ACCOMMODATION'), findsOneWidget);

    // 8. Delete the saved item
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Should be empty again
    expect(find.text('No saved items yet.'), findsOneWidget);
  });
}
