import 'package:dastan/src/core/data/drift_database.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.connect(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  group('TransportCache', () {
    test('insert and retrieve cache entry', () async {
      final now = DateTime.now().copyWith(millisecond: 0, microsecond: 0);
      final expiresAt = now.add(const Duration(hours: 1));
      final entry = TransportCacheCompanion.insert(
        key: 'key-123',
        data: '{"results": []}',
        createdAt: now,
        expiresAt: expiresAt,
      );

      await db.into(db.transportCache).insert(entry);

      final result = await (db.select(
        db.transportCache,
      )..where((t) => t.key.equals('key-123'))).getSingle();

      expect(result.key, 'key-123');
      expect(result.data, '{"results": []}');
      expect(result.expiresAt, expiresAt);
    });

    test('replaces existing entry on conflict', () async {
      final now = DateTime.now();
      // TransportCache uses 'key' as primary key

      await db
          .into(db.transportCache)
          .insert(
            TransportCacheCompanion.insert(
              key: 'key-con',
              data: '1',
              createdAt: now,
              expiresAt: now,
            ),
          );

      // Depending on drift default (ABORT usually), but insertOnConflictUpdate works if we use it.
      // Let's verify we can use insertOnConflictUpdate

      await db
          .into(db.transportCache)
          .insertOnConflictUpdate(
            TransportCacheCompanion.insert(
              key: 'key-con',
              data: '2',
              createdAt: now,
              expiresAt: now,
            ),
          );

      final result = await (db.select(
        db.transportCache,
      )..where((t) => t.key.equals('key-con'))).getSingle();

      expect(result.data, '2');
    });
  });

  group('CalendarCache', () {
    test('insert and retrieve calendar entry', () async {
      final expiresAt = DateTime.now().add(const Duration(days: 14));
      final entry = CalendarCacheCompanion.insert(
        key: 'cal-123',
        data: '{"months": []}',
        expiresAt: expiresAt,
      );

      await db.into(db.calendarCache).insert(entry);

      final result = await (db.select(
        db.calendarCache,
      )..where((t) => t.key.equals('cal-123'))).getSingle();

      expect(result.key, 'cal-123');
      expect(result.data, '{"months": []}');
    });
  });
}
