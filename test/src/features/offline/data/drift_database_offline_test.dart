import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/core/data/drift_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.connect(NativeDatabase.memory());
  });

  tearDown(() {
    db.close();
  });

  test('should have offline bundle tables', () async {
    // Verify getters exist and return correct table info
    expect(db.offlineBundles, isNotNull);
    expect(db.bundleAssets, isNotNull);
    expect(db.localSearchIndex, isNotNull);

    // Verify primary keys logic via simple insertion attempt (in memory)
    await db
        .into(db.offlineBundles)
        .insert(
          OfflineBundleRow(
            itineraryId: 'i1',
            version: 1,
            id: 'b1',
            createdAt: DateTime.now(),
            sizeBytes: 100,
            path: '/tmp/b1',
          ),
        );

    final result = await db.select(db.offlineBundles).get();
    expect(result.length, 1);
    expect(result.first.itineraryId, 'i1');
  });
}
