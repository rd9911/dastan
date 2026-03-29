import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import 'drift_database.dart';
import 'database_provider.dart';
import '../domain/saved_item.dart';

part 'saved_item_repository.g.dart';

class SavedItemRepository {
  final AppDatabase _db;

  SavedItemRepository(this._db);

  Future<List<SavedItem>> getSavedItems(String itineraryId) async {
    final query = _db.select(_db.savedItems)
      ..where((t) => t.itineraryId.equals(itineraryId))
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
      ]);

    final rows = await query.get();
    return rows.map((row) => _mapRowToSavedItem(row)).toList();
  }

  Future<List<SavedItem>> getSavedItemsBySection(
    String itineraryId,
    ItinerarySection section,
  ) async {
    final query = _db.select(_db.savedItems)
      ..where(
        (t) =>
            t.itineraryId.equals(itineraryId) & t.section.equals(section.name),
      )
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
      ]);

    final rows = await query.get();
    return rows.map((row) => _mapRowToSavedItem(row)).toList();
  }

  Future<SavedItem?> getSavedItem(String id) async {
    final row = await (_db.select(
      _db.savedItems,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return _mapRowToSavedItem(row);
  }

  Future<SavedItem> saveItem(SavedItem item) async {
    final id = item.id.isEmpty ? _generateId() : item.id;

    // Pack fields into content JSON for storage
    final contentMap = {
      'title': item.title,
      'details': item.details,
      'externalData': item.externalData?.toJson(),
      'time': item.time?.toJson(),
      'location': item.location?.toJson(),
      'media': item.media,
      'sync': item.sync.toJson(), // Store sync status in content too?
      // Actually isSynced is a separate column, but we have strict sync object now.
      // We will map SavedItemSync to isSynced bool for the column.
    };

    final itemWithId = item.copyWith(id: id);

    await _db
        .into(_db.savedItems)
        .insert(
          SavedItemsCompanion(
            id: Value(itemWithId.id),
            itineraryId: Value(itemWithId.itineraryId),
            section: Value(itemWithId.section.name),
            dedupeKey: Value(itemWithId.dedupeKey),
            content: Value(jsonEncode(contentMap)),
            createdAt: Value(itemWithId.createdAt),
            updatedAt: Value(itemWithId.updatedAt),
            isSynced: Value(itemWithId.sync.status == SyncStatus.synced),
          ),
          mode: InsertMode.insertOrReplace,
        );

    return itemWithId;
  }

  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<void> deleteItem(String id) async {
    await (_db.delete(_db.savedItems)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<SavedItem>> watchSavedItems(String itineraryId) {
    final query = _db.select(_db.savedItems)
      ..where((t) => t.itineraryId.equals(itineraryId))
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
      ]);

    return query.watch().map(
      (rows) => rows.map((row) => _mapRowToSavedItem(row)).toList(),
    );
  }

  SavedItem _mapRowToSavedItem(SavedItemRow row) {
    final contentMap = jsonDecode(row.content) as Map<String, dynamic>;

    return SavedItem(
      id: row.id,
      itineraryId: row.itineraryId,
      section: ItinerarySection.values.firstWhere((e) => e.name == row.section),
      dedupeKey: row.dedupeKey,
      title: contentMap['title'] as String? ?? 'Untitled',
      details: contentMap['details'] is Map
          ? Map<String, dynamic>.from(contentMap['details'] as Map)
          : {},
      externalData: contentMap['externalData'] is Map
          ? SavedItemExternal.fromJson(
              contentMap['externalData'] as Map<String, dynamic>,
            )
          : null,
      time: contentMap['time'] is Map
          ? SavedItemTime.fromJson(contentMap['time'] as Map<String, dynamic>)
          : null,
      location: contentMap['location'] is Map
          ? SavedItemLocation.fromJson(
              contentMap['location'] as Map<String, dynamic>,
            )
          : null,
      media: (contentMap['media'] is List)
          ? (contentMap['media'] as List)
                .whereType<Map>()
                .map((e) => e as Map<String, dynamic>)
                .toList()
          : [],
      sync: contentMap['sync'] is Map
          ? SavedItemSync.fromJson(contentMap['sync'] as Map<String, dynamic>)
          : SavedItemSync(
              status: row.isSynced ? SyncStatus.synced : SyncStatus.queued,
            ),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}

@Riverpod(keepAlive: true)
SavedItemRepository savedItemRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return SavedItemRepository(db);
}
