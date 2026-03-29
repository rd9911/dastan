import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'drift_database.g.dart';

@DataClassName('ItineraryRow')
class Itineraries extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get destination => text().nullable()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get travelers => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SavedItemRow')
class SavedItems extends Table {
  TextColumn get id => text()();
  TextColumn get itineraryId => text().references(Itineraries, #id)();
  TextColumn get section => text()(); // Store enum as string
  TextColumn get dedupeKey => text()();
  TextColumn get content => text()(); // JSON string
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => ['UNIQUE(itinerary_id, dedupe_key)'];
}

class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get operation => text()(); // 'create', 'delete'
  TextColumn get payload => text()(); // JSON payload
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
}

@DataClassName('TransportCacheRow')
class TransportCache extends Table {
  TextColumn get key => text()(); // Normalized search key
  TextColumn get data => text()(); // JSON list of items
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('CalendarCacheRow')
class CalendarCache extends Table {
  TextColumn get key => text()(); // Normalized custom key
  TextColumn get data => text()(); // JSON grid
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('AccommodationCacheRow')
class AccommodationCache extends Table {
  TextColumn get key => text()(); // Normalized search key
  TextColumn get itineraryId => text()(); // Bound to itinerary for eviction
  TextColumn get data => text()(); // JSON list of PropertyItem
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('PropertyDetailCacheRow')
class PropertyDetailCache extends Table {
  TextColumn get propertyId => text()(); // Provider + external ID
  TextColumn get data => text()(); // JSON PropertyItem with full details
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {propertyId};
}

@DataClassName('EntertainmentCacheRow')
class EntertainmentCache extends Table {
  TextColumn get key => text()(); // Normalized search key
  TextColumn get itineraryId => text()(); // Bound to itinerary for eviction
  TextColumn get data => text()(); // JSON list of EntertainmentResultCard
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('GastronomyCacheRow')
class GastronomyCache extends Table {
  TextColumn get key => text()(); // Normalized search key
  TextColumn get itineraryId => text()(); // Bound to itinerary for eviction
  TextColumn get data => text()(); // JSON list of GastronomyResultCard
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('EventsCacheRow')
class EventsCache extends Table {
  TextColumn get key => text()(); // Normalized search key
  TextColumn get itineraryId => text()(); // Bound to itinerary for eviction
  TextColumn get data => text()(); // JSON list of EventCard
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('TrailsCacheRow')
class TrailsCache extends Table {
  TextColumn get key => text()(); // Normalized search key
  TextColumn get itineraryId => text()(); // Bound to itinerary for eviction
  TextColumn get data => text()(); // JSON list of TrailCard
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('MapTilesCacheRow')
class MapTilesCache extends Table {
  TextColumn get key => text()(); // {itineraryId}-{zoom}-{x}-{y} or similar
  BlobColumn get data => blob()();
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('MapItemsCacheRow')
class MapItemsCache extends Table {
  TextColumn get key => text()(); // {itineraryId}-{boundsHash}
  TextColumn get data => text()(); // JSON list of MapItem
  DateTimeColumn get expiresAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('DayPlanRow')
class DayPlans extends Table {
  TextColumn get itineraryId => text().references(Itineraries, #id)();
  DateTimeColumn get date => dateTime()();
  IntColumn get version => integer().withDefault(const Constant(1))();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {itineraryId, date};
}

@DataClassName('DayPlanEntryRow')
class DayPlanEntries extends Table {
  TextColumn get id => text()();
  TextColumn get itineraryId => text()();
  DateTimeColumn get date => dateTime()();

  // Fields
  TextColumn get savedItemId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get type => text()(); // Enum string

  DateTimeColumn get startTime => dateTime().nullable()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get durationMinutes => integer().withDefault(const Constant(60))();

  TextColumn get commuteMode => text().withDefault(const Constant('none'))();
  IntColumn get commuteDurationMinutes => integer().nullable()();
  IntColumn get bufferBeforeMinutes => integer().nullable()();
  TextColumn get notes => text().nullable()();

  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'FOREIGN KEY (itinerary_id, date) REFERENCES day_plans (itinerary_id, date) ON DELETE CASCADE',
  ];
}

@DataClassName('OfflineBundleRow')
class OfflineBundles extends Table {
  TextColumn get itineraryId => text()();
  IntColumn get version => integer()();
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get sizeBytes => integer()();
  TextColumn get path => text()();

  @override
  Set<Column> get primaryKey => {itineraryId, version};
}

@DataClassName('BundleAssetRow')
class BundleAssets extends Table {
  TextColumn get bundleId =>
      text().references(OfflineBundles, #id, onDelete: KeyAction.cascade)();
  TextColumn get path => text()();
  TextColumn get originalUrl => text()();
  TextColumn get kind => text()(); // Enum string
  TextColumn get sha256 => text()();

  @override
  Set<Column> get primaryKey => {bundleId, path};
}

@DataClassName('LocalSearchIndexRow')
class LocalSearchIndex extends Table {
  TextColumn get bundleId =>
      text().references(OfflineBundles, #id, onDelete: KeyAction.cascade)();
  TextColumn get token => text()();
  TextColumn get itemIds => text()(); // JSON List<String>

  @override
  Set<Column> get primaryKey => {bundleId, token};
}

/// Generic key-value store for settings and other JSON data.
@DataClassName('KeyValueStoreRow')
class KeyValueStore extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()(); // JSON serialized

  @override
  Set<Column> get primaryKey => {key};
}

// ─── LOCAL TOUR CACHE ───
class LocalTourCacheEntries extends Table {
  TextColumn get id => text()();
  TextColumn get cityId => text()();
  TextColumn get name => text()();
  TextColumn get tagline => text()();
  TextColumn get mainImageUrl => text()();
  IntColumn get durationMinutes => integer()();
  RealColumn get priceUsd => real()();
  TextColumn get type => text()(); // 'single' | 'multi'
  TextColumn get categoryIds => text()(); // JSON array of strings
  DateTimeColumn get cachedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

// ─── LOCAL SAVED TOURS ───
class LocalSavedTourEntries extends Table {
  TextColumn get id => text()();
  TextColumn get tourId => text()();
  TextColumn get userId => text()();
  DateTimeColumn get savedAt => dateTime()();
  DateTimeColumn get lastOpenedAt => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

// ─── LOCAL TOUR PROGRESS ───
class LocalTourProgressEntries extends Table {
  TextColumn get tourId => text()();
  TextColumn get userId => text()();
  IntColumn get audioPositionMs => integer().withDefault(const Constant(0))();
  IntColumn get currentSection => integer().withDefault(const Constant(0))();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastUpdatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {tourId, userId};
}

// ─── LOCAL DOWNLOADED TOUR CONTENT ───
class LocalTourDownloadEntries extends Table {
  TextColumn get tourId => text()();
  TextColumn get contentJson => text()(); // serialized GuideContent
  TextColumn get audioFilePath => text().nullable()(); // local file path
  TextColumn get languageCode => text()();
  DateTimeColumn get downloadedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {tourId, languageCode};
}

@DriftDatabase(
  tables: [
    Itineraries,
    SavedItems,
    SyncQueue,
    TransportCache,
    CalendarCache,
    AccommodationCache,
    PropertyDetailCache,
    EntertainmentCache,
    GastronomyCache,
    EventsCache,
    TrailsCache,
    MapTilesCache,
    MapItemsCache,
    DayPlans,
    DayPlanEntries,
    OfflineBundles,
    BundleAssets,
    LocalSearchIndex,
    KeyValueStore,
    LocalTourCacheEntries,
    LocalSavedTourEntries,
    LocalTourProgressEntries,
    LocalTourDownloadEntries,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.connect(super.connection);

  @override
  int get schemaVersion => 11;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.createTable(transportCache);
          await m.createTable(calendarCache);
        }
        if (from < 3) {
          await m.createTable(accommodationCache);
          await m.createTable(propertyDetailCache);
        }
        if (from < 4) {
          await m.createTable(entertainmentCache);
        }
        if (from < 5) {
          await m.createTable(gastronomyCache);
        }
        if (from < 6) {
          await m.createTable(eventsCache);
        }
        if (from < 7) {
          await m.createTable(trailsCache);
        }
        if (from < 8) {
          await m.createTable(mapTilesCache);
          await m.createTable(mapItemsCache);
        }
        if (from < 9) {
          await m.createTable(dayPlans);
          await m.createTable(dayPlanEntries);
        }
        if (from < 10) {
          await m.createTable(offlineBundles);
          await m.createTable(bundleAssets);
          await m.createTable(localSearchIndex);
        }
        if (from < 11) {
          await m.createTable(localTourCacheEntries);
          await m.createTable(localSavedTourEntries);
          await m.createTable(localTourProgressEntries);
          await m.createTable(localTourDownloadEntries);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
