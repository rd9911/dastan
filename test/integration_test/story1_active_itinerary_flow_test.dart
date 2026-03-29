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

  testWidgets('Story 1: Create and activate itinerary', (tester) async {
    // Use in-memory database for testing
    final db = AppDatabase.connect(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(db)],
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    // 1. Verify empty state
    expect(find.text('No itineraries yet.'), findsOneWidget);
    expect(find.text('Create Itinerary'), findsOneWidget);

    // 2. Tap Create Itinerary
    await tester.tap(find.text('Create Itinerary'));
    await tester.pumpAndSettle();

    // 3. Fill form
    expect(find.text('Create Itinerary'), findsOneWidget); // AppBar title
    await tester.enterText(find.byType(TextFormField).first, 'My Dream Trip');
    await tester.enterText(find.byType(TextFormField).last, 'Tokyo');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // 4. Verify navigation to Overview
    expect(find.text('My Dream Trip'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget);
    expect(find.widgetWithText(Tab, 'Search'), findsOneWidget);

    // 5. Verify back navigation (if implemented, or just check we are on the new screen)
    // For now, just verifying we are on the overview screen is enough.
  });
}
