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

  testWidgets('Story 1: Save and unsave items', (tester) async {
    // Use in-memory database for testing
    final db = AppDatabase.connect(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(db)],
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    // 1. Create an itinerary
    await tester.tap(find.text('Create Itinerary'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Test Trip');
    await tester.enterText(find.byType(TextFormField).last, 'Paris');
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // 2. Navigate to Saved tab
    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();

    // Should be empty
    expect(find.text('No saved items yet.'), findsOneWidget);

    // 3. Go back to Overview and save a demo item
    await tester.tap(find.text('Overview'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Save Demo Item'));
    await tester.pumpAndSettle();

    // 4. Check Saved tab again
    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();

    // Should have one item
    expect(find.text('TRANSPORT'), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);

    // 5. Delete the item
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Should be empty again
    expect(find.text('No saved items yet.'), findsOneWidget);
  });
}
