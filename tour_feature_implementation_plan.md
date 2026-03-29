# Dastan — Tour Feature Implementation Plan

> **Target app:** Dastan (Flutter 3.x, Riverpod, GoRouter, Supabase, Drift, Freezed)
> **Feature:** Guided Audio Tours — browsing, purchasing, playing, and creating tours
> **Document purpose:** Step-by-step task list for full feature implementation from scratch to production-ready state

---

## Table of Contents

1. [Architecture Overview & Integration Strategy](#1-architecture-overview--integration-strategy)
2. [Phase 0 — Package Dependencies](#2-phase-0--package-dependencies)
3. [Phase 1 — Database Schema (Supabase + Drift)](#3-phase-1--database-schema-supabase--drift)
4. [Phase 2 — Domain Models](#4-phase-2--domain-models)
5. [Phase 3 — Data Layer (DTOs, Repositories)](#5-phase-3--data-layer-dtos-repositories)
6. [Phase 4 — Application Layer (Services & Providers)](#6-phase-4--application-layer-services--providers)
7. [Phase 5 — Navigation Extension](#7-phase-5--navigation-extension)
8. [Phase 6 — Country Browse Screen](#8-phase-6--country-browse-screen)
9. [Phase 7 — City Tours Screen](#9-phase-7--city-tours-screen)
10. [Phase 8 — Tour Detail Screen](#10-phase-8--tour-detail-screen)
11. [Phase 9 — Saved Tours Feature](#11-phase-9--saved-tours-feature)
12. [Phase 10 — Guided Tour Experience (Take a Tour)](#12-phase-10--guided-tour-experience-take-a-tour)
13. [Phase 11 — Multi-Tour Support](#13-phase-11--multi-tour-support)
14. [Phase 12 — Audio System](#14-phase-12--audio-system)
15. [Phase 13 — Creator Editor (Web)](#15-phase-13--creator-editor-web)
16. [Phase 14 — Offline Support for Tours](#16-phase-14--offline-support-for-tours)
17. [Phase 15 — Enhanced UX Additions](#17-phase-15--enhanced-ux-additions)
18. [Phase 16 — Testing](#18-phase-16--testing)
19. [Folder Structure Reference](#19-folder-structure-reference)

---

## 1. Architecture Overview & Integration Strategy

### How tours fit into Dastan

The Tours feature is a **self-contained feature module** (`features/tours/`) that:
- Adds a **5th bottom nav tab** ("Tours") alongside the existing 4 tabs
- Adds a **6th bottom nav tab** ("Saved Tours") — alternatively, nest Saved Tours as a sub-route of Tours tab
- Shares `core/` infrastructure: Supabase, Drift, Riverpod, GoRouter, `Result<T>`, offline system
- Introduces its own Drift tables in the existing `AppDatabase`
- Uses the existing `map/` and `offline/` features for the guided tour playback screen

### Recommended bottom nav layout after integration

```
Tab 1 — 🗒️  Itinerary
Tab 2 — 🔍  Search
Tab 3 — 🗺️  Map
Tab 4 — 🎧  Tours          ← NEW
Tab 5 — ⚙️  Settings
```

Saved Tours lives at `/tours/saved` and is accessible from within the Tours tab (not a separate tab). This keeps the nav clean.

### New feature module tree (end goal)

```
features/tours/
├── README.md
├── domain/
│   ├── tour_models.dart              # Country, City, Tour, GuideContent, etc.
│   ├── tour_models.freezed.dart      # Generated
│   └── tour_models.g.dart            # Generated
├── data/
│   ├── tour_dto.dart                 # DTO ↔ domain mappers
│   ├── tour_remote_data_source.dart  # Supabase queries
│   ├── tour_local_data_source.dart   # Drift queries
│   ├── tour_repository.dart          # Main repo
│   └── mock_tour_repository.dart     # For tests
├── application/
│   ├── tour_providers.dart           # All Riverpod providers
│   ├── tour_providers.g.dart         # Generated
│   ├── tour_purchase_service.dart    # Buy/save tour logic
│   ├── tour_audio_service.dart       # Audio playback orchestration
│   └── tour_progress_service.dart    # Track user's playback position
└── presentation/
    ├── country_browse/
    │   ├── country_browse_screen.dart
    │   └── widgets/
    │       ├── country_header_widget.dart
    │       ├── country_description_widget.dart
    │       └── city_cards_row.dart
    ├── city_tours/
    │   ├── city_tours_screen.dart
    │   └── widgets/
    │       ├── city_header_widget.dart
    │       ├── tour_category_chips.dart
    │       └── tour_list_card.dart
    ├── tour_detail/
    │   ├── tour_detail_screen.dart
    │   └── widgets/
    │       ├── tour_hero_section.dart
    │       ├── tour_guide_content_view.dart
    │       ├── tour_route_section.dart
    │       ├── buy_fab.dart
    │       └── audio_preview_button.dart
    ├── saved_tours/
    │   ├── saved_tours_screen.dart
    │   ├── saved_city_tours_screen.dart
    │   └── widgets/
    │       └── city_tour_cluster.dart
    └── guided_tour/
        ├── guided_tour_screen.dart
        └── widgets/
            ├── tour_map_layer.dart
            ├── tour_bottom_sheet.dart
            ├── guide_text_view.dart
            ├── audio_player_bar.dart
            └── tour_chapter_view.dart
```

---

## 2. Phase 0 — Package Dependencies

### Task 0.1 — Add packages to `pubspec.yaml`

Add the following packages (verify latest compatible versions before adding):

```yaml
dependencies:
  # Audio playback
  just_audio: ^0.9.x           # Primary audio player
  just_audio_background: ^0.0.x # Background playback + lock screen controls
  audio_session: ^0.1.x         # Audio session management (focus, interrupts)
  
  # Map for guided tour
  flutter_map: ^6.x             # OR keep using whatever map package is already used
  # (if the existing map/ feature uses flutter_map, reuse it; if google_maps_flutter, reuse that)
  
  # Text-to-speech preview (placeholder until custom TTS connected)
  flutter_tts: ^3.x             # Free TTS for preview
  
  # File picking (creator editor — Word file upload)
  file_picker: ^6.x
  
  # Rich text editor (creator editor)
  flutter_quill: ^9.x           # Notion-like rich text editor
  
  # HTTP for TTS and Translation APIs
  # Already have Dio — reuse it
  
  # Location (for multi-tour location triggers)
  geolocator: ^11.x
  
  # Local notifications (heads-up for next tour stop)
  flutter_local_notifications: ^17.x
  
  # Lottie (for animated loading/success states in guided tour)
  lottie: ^3.x
  
  # Cached network image (already likely present, confirm)
  cached_network_image: ^3.x
  
  # Smooth page indicator (for swipeable country cards)
  smooth_page_indicator: ^1.x
  
  # Wakelock (keep screen on during guided tour)
  wakelock_plus: ^1.x
```

### Task 0.2 — iOS/Android permissions

**Android (`AndroidManifest.xml`):**
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
```
Add the `just_audio_background` service entry as per its README.

**iOS (`Info.plist`):**
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Used to guide you along the tour route</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Used to detect when you arrive at the next tour stop</string>
<key>UIBackgroundModes</key>
<array>
  <string>audio</string>
  <string>location</string>
  <string>fetch</string>
</array>
```

### Task 0.3 — Run code generation baseline

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

Confirm zero errors before proceeding.

---

## 3. Phase 1 — Database Schema (Supabase + Drift)

### Task 1.1 — Create Supabase migration file

Create `supabase/migrations/YYYYMMDD_tour_schema.sql`:

```sql
-- ─────────────────────────────────────────
-- ENUM TYPES
-- ─────────────────────────────────────────
CREATE TYPE tour_type AS ENUM ('single', 'multi');
CREATE TYPE audio_status AS ENUM ('pending', 'processing', 'ready', 'error');

-- ─────────────────────────────────────────
-- COUNTRIES
-- ─────────────────────────────────────────
CREATE TABLE countries (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name          TEXT NOT NULL,
  description   TEXT NOT NULL,
  hero_image_url TEXT NOT NULL,
  flag_emoji    TEXT,
  sort_order    INT NOT NULL DEFAULT 0,
  is_active     BOOLEAN NOT NULL DEFAULT TRUE,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ─────────────────────────────────────────
-- CITIES
-- ─────────────────────────────────────────
CREATE TABLE cities (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  country_id    UUID NOT NULL REFERENCES countries(id) ON DELETE CASCADE,
  name          TEXT NOT NULL,
  description   TEXT NOT NULL,
  hero_image_url TEXT NOT NULL,
  latitude      DOUBLE PRECISION,
  longitude     DOUBLE PRECISION,
  sort_order    INT NOT NULL DEFAULT 0,
  is_active     BOOLEAN NOT NULL DEFAULT TRUE,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_cities_country ON cities(country_id);

-- ─────────────────────────────────────────
-- TOUR CATEGORIES
-- ─────────────────────────────────────────
CREATE TABLE tour_categories (
  id    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name  TEXT NOT NULL UNIQUE,   -- e.g. 'historical', 'gastronomy', 'shopping', 'nature', 'art', 'nightlife'
  icon  TEXT                    -- icon name string
);

-- Seed default categories
INSERT INTO tour_categories (name, icon) VALUES
  ('historical',   'history'),
  ('gastronomy',   'restaurant'),
  ('shopping',     'shopping_bag'),
  ('nature',       'park'),
  ('art',          'palette'),
  ('architecture', 'domain'),
  ('nightlife',    'nightlife'),
  ('religious',    'church'),
  ('family',       'family_restroom'),
  ('adventure',    'hiking');

-- ─────────────────────────────────────────
-- TOURS
-- ─────────────────────────────────────────
CREATE TABLE tours (
  id                 UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id            UUID NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
  creator_id         UUID REFERENCES auth.users(id),
  type               tour_type NOT NULL DEFAULT 'single',
  name               TEXT NOT NULL,
  tagline            TEXT NOT NULL,           -- 3-4 word short description
  full_description   TEXT NOT NULL,
  main_image_url     TEXT NOT NULL,
  duration_minutes   INT NOT NULL,
  price_usd          NUMERIC(10,2) NOT NULL DEFAULT 0,
  is_free            BOOLEAN NOT NULL DEFAULT FALSE,
  is_published       BOOLEAN NOT NULL DEFAULT FALSE,
  is_active          BOOLEAN NOT NULL DEFAULT TRUE,
  average_rating     NUMERIC(3,2),
  review_count       INT NOT NULL DEFAULT 0,
  created_at         TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_tours_city ON tours(city_id);
CREATE INDEX idx_tours_creator ON tours(creator_id);

-- ─────────────────────────────────────────
-- TOUR ↔ CATEGORY MAPPING
-- ─────────────────────────────────────────
CREATE TABLE tour_category_mappings (
  tour_id     UUID NOT NULL REFERENCES tours(id) ON DELETE CASCADE,
  category_id UUID NOT NULL REFERENCES tour_categories(id) ON DELETE CASCADE,
  PRIMARY KEY (tour_id, category_id)
);

-- ─────────────────────────────────────────
-- TOUR GUIDE CONTENT
-- Stores the structured rich-text content of the guide as JSONB.
-- Schema of the JSONB is defined in domain models (GuideContent).
-- ─────────────────────────────────────────
CREATE TABLE tour_guide_content (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tour_id    UUID NOT NULL UNIQUE REFERENCES tours(id) ON DELETE CASCADE,
  content    JSONB NOT NULL,   -- Array of GuideSection objects
  version    INT NOT NULL DEFAULT 1,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ─────────────────────────────────────────
-- TOUR ROUTE WAYPOINTS (for single tours and multi-tour stops)
-- ─────────────────────────────────────────
CREATE TABLE tour_waypoints (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tour_id      UUID NOT NULL REFERENCES tours(id) ON DELETE CASCADE,
  order_index  INT NOT NULL,
  label        TEXT,
  latitude     DOUBLE PRECISION NOT NULL,
  longitude    DOUBLE PRECISION NOT NULL,
  radius_meters INT NOT NULL DEFAULT 50,   -- geofence radius for multi-tour triggers
  UNIQUE(tour_id, order_index)
);
CREATE INDEX idx_waypoints_tour ON tour_waypoints(tour_id);

-- ─────────────────────────────────────────
-- MULTI-TOUR ITEMS
-- Defines which single tours make up a multi-tour and their order.
-- ─────────────────────────────────────────
CREATE TABLE multi_tour_items (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  multi_tour_id   UUID NOT NULL REFERENCES tours(id) ON DELETE CASCADE,
  single_tour_id  UUID NOT NULL REFERENCES tours(id) ON DELETE CASCADE,
  order_index     INT NOT NULL,
  trigger_latitude  DOUBLE PRECISION,    -- location where this single tour auto-starts
  trigger_longitude DOUBLE PRECISION,
  trigger_radius_meters INT DEFAULT 50,
  UNIQUE(multi_tour_id, order_index),
  CHECK (multi_tour_id != single_tour_id)
);
CREATE INDEX idx_multi_tour_items ON multi_tour_items(multi_tour_id);

-- ─────────────────────────────────────────
-- AUDIO VERSIONS
-- One row per tour per language.
-- ─────────────────────────────────────────
CREATE TABLE tour_audio_versions (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tour_id         UUID NOT NULL REFERENCES tours(id) ON DELETE CASCADE,
  language_code   TEXT NOT NULL,           -- BCP 47, e.g. 'en', 'uz', 'ru', 'fr'
  audio_url       TEXT,                    -- Supabase Storage URL
  preview_url     TEXT,                    -- First 30 seconds clip URL
  duration_seconds INT,
  status          audio_status NOT NULL DEFAULT 'pending',
  translated_content JSONB,               -- Translated guide content in this language
  created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(tour_id, language_code)
);
CREATE INDEX idx_audio_tour ON tour_audio_versions(tour_id);

-- ─────────────────────────────────────────
-- SAVED TOURS (purchases)
-- ─────────────────────────────────────────
CREATE TABLE saved_tours (
  id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id         UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  tour_id         UUID NOT NULL REFERENCES tours(id) ON DELETE CASCADE,
  saved_at        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  last_opened_at  TIMESTAMPTZ,
  UNIQUE(user_id, tour_id)
);
CREATE INDEX idx_saved_tours_user ON saved_tours(user_id);

-- ─────────────────────────────────────────
-- TOUR PLAYBACK PROGRESS
-- Tracks per-user playback position for resume support.
-- ─────────────────────────────────────────
CREATE TABLE tour_playback_progress (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id           UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  tour_id           UUID NOT NULL REFERENCES tours(id) ON DELETE CASCADE,
  audio_position_ms INT NOT NULL DEFAULT 0,
  current_section   INT NOT NULL DEFAULT 0,  -- index into guide content sections
  completed         BOOLEAN NOT NULL DEFAULT FALSE,
  last_updated_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(user_id, tour_id)
);

-- ─────────────────────────────────────────
-- TOUR RATINGS
-- ─────────────────────────────────────────
CREATE TABLE tour_ratings (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  tour_id     UUID NOT NULL REFERENCES tours(id) ON DELETE CASCADE,
  rating      INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  review_text TEXT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(user_id, tour_id)
);

-- ─────────────────────────────────────────
-- ROW LEVEL SECURITY
-- ─────────────────────────────────────────
ALTER TABLE saved_tours ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own saved tours"
  ON saved_tours FOR ALL USING (auth.uid() = user_id);

ALTER TABLE tour_playback_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own progress"
  ON tour_playback_progress FOR ALL USING (auth.uid() = user_id);

ALTER TABLE tour_ratings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own ratings"
  ON tour_ratings FOR ALL USING (auth.uid() = user_id);

-- Public read for catalogue tables
ALTER TABLE countries ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read countries" ON countries FOR SELECT USING (is_active = TRUE);

ALTER TABLE cities ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read cities" ON cities FOR SELECT USING (is_active = TRUE);

ALTER TABLE tours ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read published tours" ON tours FOR SELECT USING (is_published = TRUE AND is_active = TRUE);
CREATE POLICY "Creators manage own tours" ON tours FOR ALL USING (auth.uid() = creator_id);

ALTER TABLE tour_guide_content ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read guide content"
  ON tour_guide_content FOR SELECT
  USING (EXISTS (SELECT 1 FROM tours WHERE tours.id = tour_id AND tours.is_published = TRUE));

ALTER TABLE tour_audio_versions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read ready audio"
  ON tour_audio_versions FOR SELECT USING (status = 'ready');

-- ─────────────────────────────────────────
-- FUNCTIONS / TRIGGERS
-- ─────────────────────────────────────────

-- Auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_countries_updated_at BEFORE UPDATE ON countries FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER trg_cities_updated_at    BEFORE UPDATE ON cities    FOR EACH ROW EXECUTE FUNCTION update_updated_at();
CREATE TRIGGER trg_tours_updated_at     BEFORE UPDATE ON tours     FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Recalculate average_rating after insert/update/delete on tour_ratings
CREATE OR REPLACE FUNCTION refresh_tour_rating()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE tours SET
    average_rating = (SELECT AVG(rating)   FROM tour_ratings WHERE tour_id = COALESCE(NEW.tour_id, OLD.tour_id)),
    review_count   = (SELECT COUNT(*)      FROM tour_ratings WHERE tour_id = COALESCE(NEW.tour_id, OLD.tour_id))
  WHERE id = COALESCE(NEW.tour_id, OLD.tour_id);
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_tour_rating AFTER INSERT OR UPDATE OR DELETE ON tour_ratings
  FOR EACH ROW EXECUTE FUNCTION refresh_tour_rating();
```

### Task 1.2 — Create Supabase Storage buckets

In Supabase Dashboard → Storage, create:
- `tour-images` (public) — hero images for tours/cities/countries
- `tour-audio` (private, signed URLs) — full audio files
- `tour-audio-previews` (public) — 30-second preview clips

### Task 1.3 — Add Drift tables to `AppDatabase`

In `core/data/drift_database.dart`, add the following Drift table classes alongside existing ones:

```dart
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
  @override Set<Column> get primaryKey => {id};
}

// ─── LOCAL SAVED TOURS ───
class LocalSavedTourEntries extends Table {
  TextColumn get id => text()();
  TextColumn get tourId => text()();
  TextColumn get userId => text()();
  DateTimeColumn get savedAt => dateTime()();
  DateTimeColumn get lastOpenedAt => dateTime().nullable()();
  @override Set<Column> get primaryKey => {id};
}

// ─── LOCAL TOUR PROGRESS ───
class LocalTourProgressEntries extends Table {
  TextColumn get tourId => text()();
  TextColumn get userId => text()();
  IntColumn get audioPositionMs => integer().withDefault(const Constant(0))();
  IntColumn get currentSection => integer().withDefault(const Constant(0))();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastUpdatedAt => dateTime()();
  @override Set<Column> get primaryKey => {tourId, userId};
}

// ─── LOCAL DOWNLOADED TOUR CONTENT ───
// Stores full tour guide content and audio path for offline use
class LocalTourDownloadEntries extends Table {
  TextColumn get tourId => text()();
  TextColumn get contentJson => text()(); // serialized GuideContent
  TextColumn get audioFilePath => text().nullable()(); // local file path
  TextColumn get languageCode => text()();
  DateTimeColumn get downloadedAt => dateTime()();
  @override Set<Column> get primaryKey => {tourId, languageCode};
}
```

Register these tables in `@DriftDatabase(tables: [...])` annotation and run `build_runner`.

---

## 4. Phase 2 — Domain Models

### Task 2.1 — Create `features/tours/domain/tour_models.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_models.freezed.dart';
part 'tour_models.g.dart';

// ─── TOUR TYPE ───
enum TourType { single, multi }

// ─── AUDIO STATUS ───
enum AudioStatus { pending, processing, ready, error }

// ─── COUNTRY ───
@freezed
class Country with _$Country {
  const factory Country({
    required String id,
    required String name,
    required String description,
    required String heroImageUrl,
    String? flagEmoji,
    required int sortOrder,
    required List<City> cities,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
}

// ─── CITY ───
@freezed
class City with _$City {
  const factory City({
    required String id,
    required String countryId,
    required String name,
    required String description,
    required String heroImageUrl,
    double? latitude,
    double? longitude,
    required int sortOrder,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

// ─── TOUR CATEGORY ───
@freezed
class TourCategory with _$TourCategory {
  const factory TourCategory({
    required String id,
    required String name,
    String? icon,
  }) = _TourCategory;

  factory TourCategory.fromJson(Map<String, dynamic> json) => _$TourCategoryFromJson(json);
}

// ─── TOUR (summary — used in list cards) ───
@freezed
class TourSummary with _$TourSummary {
  const factory TourSummary({
    required String id,
    required String cityId,
    required TourType type,
    required String name,
    required String tagline,
    required String mainImageUrl,
    required int durationMinutes,
    required double priceUsd,
    required bool isFree,
    double? averageRating,
    required int reviewCount,
    required List<TourCategory> categories,
  }) = _TourSummary;

  factory TourSummary.fromJson(Map<String, dynamic> json) => _$TourSummaryFromJson(json);
}

// ─── TOUR DETAIL ───
@freezed
class TourDetail with _$TourDetail {
  const factory TourDetail({
    required TourSummary summary,
    required String creatorId,
    String? creatorName,
    String? creatorAvatarUrl,
    required String fullDescription,
    required GuideContent guideContent,
    required List<TourWaypoint> waypoints,
    required List<AudioVersion> audioVersions,
    // For multi-tours only:
    List<TourSummary>? childTours,          // ordered single tours within this multi-tour
  }) = _TourDetail;

  factory TourDetail.fromJson(Map<String, dynamic> json) => _$TourDetailFromJson(json);
}

// ─── WAYPOINT ───
@freezed
class TourWaypoint with _$TourWaypoint {
  const factory TourWaypoint({
    required String id,
    required String tourId,
    required int orderIndex,
    String? label,
    required double latitude,
    required double longitude,
    required int radiusMeters,
  }) = _TourWaypoint;

  factory TourWaypoint.fromJson(Map<String, dynamic> json) => _$TourWaypointFromJson(json);
}

// ─── MULTI-TOUR ITEM ───
@freezed
class MultiTourItem with _$MultiTourItem {
  const factory MultiTourItem({
    required String id,
    required String multiTourId,
    required String singleTourId,
    required int orderIndex,
    double? triggerLatitude,
    double? triggerLongitude,
    required int triggerRadiusMeters,
    TourSummary? singleTourSummary,   // Populated when fetching
  }) = _MultiTourItem;

  factory MultiTourItem.fromJson(Map<String, dynamic> json) => _$MultiTourItemFromJson(json);
}

// ─── AUDIO VERSION ───
@freezed
class AudioVersion with _$AudioVersion {
  const factory AudioVersion({
    required String id,
    required String tourId,
    required String languageCode,
    String? audioUrl,
    String? previewUrl,
    int? durationSeconds,
    required AudioStatus status,
  }) = _AudioVersion;

  factory AudioVersion.fromJson(Map<String, dynamic> json) => _$AudioVersionFromJson(json);
}

// ─────────────────────────────────────────────────────────────
// GUIDE CONTENT (structured rich-text guide)
// Mirrors the final display structure described in the spec.
// Inspired by the Wonderous app structure.
// ─────────────────────────────────────────────────────────────

// Top-level container
@freezed
class GuideContent with _$GuideContent {
  const factory GuideContent({
    required String tourId,
    required List<GuideSection> sections,
    required int version,
  }) = _GuideContent;

  factory GuideContent.fromJson(Map<String, dynamic> json) => _$GuideContentFromJson(json);
}

// One "section" = a chapter-like block. A tour can have 1–N sections.
@freezed
class GuideSection with _$GuideSection {
  const factory GuideSection({
    required String id,
    required String chapterTitle,
    required List<GuideBlock> blocks,   // ordered content blocks
  }) = _GuideSection;

  factory GuideSection.fromJson(Map<String, dynamic> json) => _$GuideSectionFromJson(json);
}

// A single content block within a section
@freezed
class GuideBlock with _$GuideBlock {
  // Plain paragraph text
  const factory GuideBlock.text({
    required String content,
  }) = GuideBlockText;

  // Pull quote or highlighted fact
  const factory GuideBlock.highlight({
    required String content,
  }) = GuideBlockHighlight;

  // Image with optional caption
  const factory GuideBlock.image({
    required String imageUrl,
    String? caption,
    @Default(false) bool isLeading,   // true = hero/leading image
  }) = GuideBlockImage;

  // Key fact chip (e.g. "Built in 1847")
  const factory GuideBlock.fact({
    required String label,
    required String value,
  }) = GuideBlockFact;

  // Location tag
  const factory GuideBlock.location({
    required String address,
    double? latitude,
    double? longitude,
  }) = GuideBlockLocation;

  // Year / historical date badge
  const factory GuideBlock.yearBadge({
    required String label,           // e.g. "Built in 1492"
  }) = GuideBlockYearBadge;

  factory GuideBlock.fromJson(Map<String, dynamic> json) => _$GuideBlockFromJson(json);
}

// ─── SAVED TOUR (user's purchased/saved tour) ───
@freezed
class SavedTour with _$SavedTour {
  const factory SavedTour({
    required String id,
    required String tourId,
    required String userId,
    required DateTime savedAt,
    DateTime? lastOpenedAt,
    TourSummary? tourSummary,   // Populated on fetch
  }) = _SavedTour;

  factory SavedTour.fromJson(Map<String, dynamic> json) => _$SavedTourFromJson(json);
}

// ─── PLAYBACK PROGRESS ───
@freezed
class PlaybackProgress with _$PlaybackProgress {
  const factory PlaybackProgress({
    required String tourId,
    required String userId,
    required int audioPositionMs,
    required int currentSection,
    required bool completed,
    required DateTime lastUpdatedAt,
  }) = _PlaybackProgress;

  factory PlaybackProgress.fromJson(Map<String, dynamic> json) => _$PlaybackProgressFromJson(json);
}

// ─── TOUR RATING ───
@freezed
class TourRating with _$TourRating {
  const factory TourRating({
    required String id,
    required String tourId,
    required String userId,
    required int rating,
    String? reviewText,
    required DateTime createdAt,
  }) = _TourRating;

  factory TourRating.fromJson(Map<String, dynamic> json) => _$TourRatingFromJson(json);
}

// ─── SAVED TOURS CLUSTER (for saved tours screen) ───
// Groups saved tours by city, sorted by lastOpenedAt desc
@freezed
class SavedTourCluster with _$SavedTourCluster {
  const factory SavedTourCluster({
    required City city,
    required List<SavedTour> tours,
    required DateTime mostRecentOpenedAt,
  }) = _SavedTourCluster;
}
```

### Task 2.2 — Run `build_runner` after models are created

```bash
dart run build_runner build --delete-conflicting-outputs
```

Confirm `tour_models.freezed.dart` and `tour_models.g.dart` are generated without errors.

---

## 5. Phase 3 — Data Layer (DTOs, Repositories)

### Task 3.1 — Create `tour_dto.dart`

Map Supabase JSON response objects to domain models.

```dart
// features/tours/data/tour_dto.dart

class CountryDto {
  static Country fromSupabase(Map<String, dynamic> json) => Country(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    heroImageUrl: json['hero_image_url'] as String,
    flagEmoji: json['flag_emoji'] as String?,
    sortOrder: json['sort_order'] as int,
    cities: (json['cities'] as List? ?? [])
        .map((c) => CityDto.fromSupabase(c as Map<String, dynamic>))
        .toList(),
  );
}

class CityDto {
  static City fromSupabase(Map<String, dynamic> json) => City(
    id: json['id'] as String,
    countryId: json['country_id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    heroImageUrl: json['hero_image_url'] as String,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    sortOrder: json['sort_order'] as int,
  );
}

class TourSummaryDto {
  static TourSummary fromSupabase(Map<String, dynamic> json) {
    final categories = (json['tour_category_mappings'] as List? ?? [])
        .map((m) => TourCategoryDto.fromSupabase(m['tour_categories'] as Map<String, dynamic>))
        .toList();
    return TourSummary(
      id: json['id'] as String,
      cityId: json['city_id'] as String,
      type: TourType.values.byName(json['type'] as String),
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      mainImageUrl: json['main_image_url'] as String,
      durationMinutes: json['duration_minutes'] as int,
      priceUsd: (json['price_usd'] as num).toDouble(),
      isFree: json['is_free'] as bool,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      reviewCount: json['review_count'] as int,
      categories: categories,
    );
  }
}

class TourDetailDto {
  static TourDetail fromSupabase(Map<String, dynamic> json) {
    final summary = TourSummaryDto.fromSupabase(json);
    final guideJson = json['tour_guide_content'] as Map<String, dynamic>?;
    final waypointsList = json['tour_waypoints'] as List? ?? [];
    final audioList = json['tour_audio_versions'] as List? ?? [];
    final childToursList = json['child_tours'] as List?;

    return TourDetail(
      summary: summary,
      creatorId: json['creator_id'] as String,
      creatorName: json['creator_name'] as String?,
      creatorAvatarUrl: json['creator_avatar_url'] as String?,
      fullDescription: json['full_description'] as String,
      guideContent: guideJson != null
          ? GuideContentDto.fromSupabase(guideJson)
          : GuideContent(tourId: json['id'] as String, sections: [], version: 1),
      waypoints: waypointsList.map((w) => TourWaypointDto.fromSupabase(w as Map<String, dynamic>)).toList(),
      audioVersions: audioList.map((a) => AudioVersionDto.fromSupabase(a as Map<String, dynamic>)).toList(),
      childTours: childToursList?.map((c) => TourSummaryDto.fromSupabase(c as Map<String, dynamic>)).toList(),
    );
  }
}

class GuideContentDto {
  static GuideContent fromSupabase(Map<String, dynamic> json) {
    return GuideContent.fromJson(json['content'] as Map<String, dynamic>);
    // 'content' column is JSONB stored as GuideContent JSON
  }
}

class AudioVersionDto {
  static AudioVersion fromSupabase(Map<String, dynamic> json) => AudioVersion(
    id: json['id'] as String,
    tourId: json['tour_id'] as String,
    languageCode: json['language_code'] as String,
    audioUrl: json['audio_url'] as String?,
    previewUrl: json['preview_url'] as String?,
    durationSeconds: json['duration_seconds'] as int?,
    status: AudioStatus.values.byName(json['status'] as String),
  );
}

class TourWaypointDto {
  static TourWaypoint fromSupabase(Map<String, dynamic> json) => TourWaypoint(
    id: json['id'] as String,
    tourId: json['tour_id'] as String,
    orderIndex: json['order_index'] as int,
    label: json['label'] as String?,
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    radiusMeters: json['radius_meters'] as int,
  );
}

class TourCategoryDto {
  static TourCategory fromSupabase(Map<String, dynamic> json) => TourCategory(
    id: json['id'] as String,
    name: json['name'] as String,
    icon: json['icon'] as String?,
  );
}

class SavedTourDto {
  static SavedTour fromSupabase(Map<String, dynamic> json) => SavedTour(
    id: json['id'] as String,
    tourId: json['tour_id'] as String,
    userId: json['user_id'] as String,
    savedAt: DateTime.parse(json['saved_at'] as String),
    lastOpenedAt: json['last_opened_at'] != null
        ? DateTime.parse(json['last_opened_at'] as String)
        : null,
    tourSummary: json['tours'] != null
        ? TourSummaryDto.fromSupabase(json['tours'] as Map<String, dynamic>)
        : null,
  );
}

class PlaybackProgressDto {
  static PlaybackProgress fromSupabase(Map<String, dynamic> json) => PlaybackProgress(
    tourId: json['tour_id'] as String,
    userId: json['user_id'] as String,
    audioPositionMs: json['audio_position_ms'] as int,
    currentSection: json['current_section'] as int,
    completed: json['completed'] as bool,
    lastUpdatedAt: DateTime.parse(json['last_updated_at'] as String),
  );
}
```

### Task 3.2 — Create `tour_remote_data_source.dart`

```dart
// features/tours/data/tour_remote_data_source.dart

class TourRemoteDataSource {
  TourRemoteDataSource(this._supabase);
  final SupabaseClient _supabase;

  // Fetch all active countries with their cities
  Future<List<Country>> fetchCountries() async {
    final response = await _supabase
        .from('countries')
        .select('*, cities(*)')
        .eq('is_active', true)
        .order('sort_order');
    return (response as List)
        .map((c) => CountryDto.fromSupabase(c as Map<String, dynamic>))
        .toList();
  }

  // Fetch tours for a city with categories
  Future<List<TourSummary>> fetchToursForCity(String cityId) async {
    final response = await _supabase
        .from('tours')
        .select('*, tour_category_mappings(tour_categories(*))')
        .eq('city_id', cityId)
        .eq('is_published', true)
        .eq('is_active', true)
        .order('created_at', ascending: false);
    return (response as List)
        .map((t) => TourSummaryDto.fromSupabase(t as Map<String, dynamic>))
        .toList();
  }

  // Fetch full tour detail including guide content, waypoints, audio, child tours
  Future<TourDetail> fetchTourDetail(String tourId) async {
    final response = await _supabase
        .from('tours')
        .select('''
          *,
          tour_category_mappings(tour_categories(*)),
          tour_guide_content(*),
          tour_waypoints(*),
          tour_audio_versions(*),
          creator:auth.users(id, raw_user_meta_data)
        ''')
        .eq('id', tourId)
        .single();

    // Fetch child tours for multi-tours
    if (response['type'] == 'multi') {
      final children = await _supabase
          .from('multi_tour_items')
          .select('*, tours(*,tour_category_mappings(tour_categories(*)))')
          .eq('multi_tour_id', tourId)
          .order('order_index');
      response['child_tours'] = (children as List).map((c) => c['tours']).toList();
    }

    return TourDetailDto.fromSupabase(response as Map<String, dynamic>);
  }

  // Fetch all saved tours for the current user
  Future<List<SavedTour>> fetchSavedTours(String userId) async {
    final response = await _supabase
        .from('saved_tours')
        .select('*, tours(*, tour_category_mappings(tour_categories(*)))')
        .eq('user_id', userId)
        .order('last_opened_at', ascending: false, nullsFirst: false);
    return (response as List)
        .map((s) => SavedTourDto.fromSupabase(s as Map<String, dynamic>))
        .toList();
  }

  // Save / purchase a tour
  Future<SavedTour> saveTour({required String tourId, required String userId}) async {
    final response = await _supabase
        .from('saved_tours')
        .upsert({'user_id': userId, 'tour_id': tourId})
        .select()
        .single();
    return SavedTourDto.fromSupabase(response as Map<String, dynamic>);
  }

  // Update lastOpenedAt when user opens a saved tour
  Future<void> touchSavedTour({required String tourId, required String userId}) async {
    await _supabase
        .from('saved_tours')
        .update({'last_opened_at': DateTime.now().toIso8601String()})
        .eq('tour_id', tourId)
        .eq('user_id', userId);
  }

  // Check if a tour is saved by user
  Future<bool> isTourSaved({required String tourId, required String userId}) async {
    final response = await _supabase
        .from('saved_tours')
        .select('id')
        .eq('tour_id', tourId)
        .eq('user_id', userId)
        .maybeSingle();
    return response != null;
  }

  // Upsert playback progress
  Future<void> savePlaybackProgress(PlaybackProgress progress) async {
    await _supabase.from('tour_playback_progress').upsert({
      'tour_id': progress.tourId,
      'user_id': progress.userId,
      'audio_position_ms': progress.audioPositionMs,
      'current_section': progress.currentSection,
      'completed': progress.completed,
      'last_updated_at': DateTime.now().toIso8601String(),
    });
  }

  // Fetch playback progress for a tour
  Future<PlaybackProgress?> fetchPlaybackProgress({
    required String tourId,
    required String userId,
  }) async {
    final response = await _supabase
        .from('tour_playback_progress')
        .select()
        .eq('tour_id', tourId)
        .eq('user_id', userId)
        .maybeSingle();
    if (response == null) return null;
    return PlaybackProgressDto.fromSupabase(response as Map<String, dynamic>);
  }

  // Fetch all available categories
  Future<List<TourCategory>> fetchCategories() async {
    final response = await _supabase.from('tour_categories').select();
    return (response as List)
        .map((c) => TourCategoryDto.fromSupabase(c as Map<String, dynamic>))
        .toList();
  }

  // Submit a rating
  Future<void> rateTour({
    required String tourId,
    required String userId,
    required int rating,
    String? reviewText,
  }) async {
    await _supabase.from('tour_ratings').upsert({
      'tour_id': tourId,
      'user_id': userId,
      'rating': rating,
      'review_text': reviewText,
    });
  }
}
```

### Task 3.3 — Create `tour_local_data_source.dart`

```dart
// features/tours/data/tour_local_data_source.dart
// Handles Drift reads/writes for offline and cached data

class TourLocalDataSource {
  TourLocalDataSource(this._db);
  final AppDatabase _db;

  // Cache tour summaries from the last API response
  Future<void> cacheTourSummaries(List<TourSummary> tours) async { ... }
  Future<List<TourSummary>> getCachedTours(String cityId) async { ... }

  // Saved tours (local mirror — synced with remote)
  Future<void> upsertSavedTour(SavedTour tour) async { ... }
  Future<List<SavedTour>> getLocalSavedTours(String userId) async { ... }
  Future<bool> isLocalTourSaved(String tourId) async { ... }

  // Playback progress (persisted locally, synced when online)
  Future<void> saveLocalProgress(PlaybackProgress progress) async { ... }
  Future<PlaybackProgress?> getLocalProgress(String tourId, String userId) async { ... }

  // Downloaded tours (full offline content)
  Future<void> saveDownloadedTour({
    required String tourId,
    required String contentJson,
    String? audioFilePath,
    required String languageCode,
  }) async { ... }
  Future<bool> hasTourDownloaded(String tourId, String languageCode) async { ... }
  Future<String?> getDownloadedAudioPath(String tourId, String languageCode) async { ... }
  Future<String?> getDownloadedContent(String tourId) async { ... }
}
```

Implement all method bodies using Drift table query DSL.

### Task 3.4 — Create `tour_repository.dart`

```dart
// features/tours/data/tour_repository.dart
// Orchestrates remote + local, applies offline-first strategy

abstract interface class TourRepository {
  Future<Result<List<Country>>> fetchCountries();
  Future<Result<List<TourSummary>>> fetchToursForCity(String cityId);
  Future<Result<TourDetail>> fetchTourDetail(String tourId);
  Future<Result<List<SavedTour>>> fetchSavedTours(String userId);
  Future<Result<SavedTour>> saveTour({required String tourId, required String userId});
  Future<Result<void>> touchSavedTour({required String tourId, required String userId});
  Future<Result<bool>> isTourSaved({required String tourId, required String userId});
  Future<Result<void>> savePlaybackProgress(PlaybackProgress progress);
  Future<Result<PlaybackProgress?>> fetchPlaybackProgress({required String tourId, required String userId});
  Future<Result<List<TourCategory>>> fetchCategories();
  Future<Result<void>> rateTour({
    required String tourId,
    required String userId,
    required int rating,
    String? reviewText,
  });
}

class TourRepositoryImpl implements TourRepository {
  TourRepositoryImpl({
    required TourRemoteDataSource remote,
    required TourLocalDataSource local,
    required ConnectivityService connectivity,
  }) : _remote = remote, _local = local, _connectivity = connectivity;

  final TourRemoteDataSource _remote;
  final TourLocalDataSource _local;
  final ConnectivityService _connectivity;

  @override
  Future<Result<List<Country>>> fetchCountries() async {
    try {
      // Online: fetch from remote
      if (await _connectivity.isOnline) {
        final countries = await _remote.fetchCountries();
        return Success(countries);
      }
      // Offline: return error (countries not cached at this level)
      return Failure(NetworkError(message: 'No internet connection'));
    } catch (e) {
      return Failure(UnknownError(message: e.toString()));
    }
  }

  @override
  Future<Result<List<TourSummary>>> fetchToursForCity(String cityId) async {
    try {
      if (await _connectivity.isOnline) {
        final tours = await _remote.fetchToursForCity(cityId);
        await _local.cacheTourSummaries(tours);
        return Success(tours);
      }
      // Offline: serve from cache
      final cached = await _local.getCachedTours(cityId);
      return Success(cached);
    } catch (e) {
      return Failure(UnknownError(message: e.toString()));
    }
  }

  // Implement remaining methods similarly with try-catch → Result<T>
  // ...
}
```

### Task 3.5 — Create `mock_tour_repository.dart`

Create a mock implementation with hardcoded sample data for 2 countries, 3 cities each, and 3 tours per city. This is used in tests and for UI development before the backend is live.

---

## 6. Phase 4 — Application Layer (Services & Providers)

### Task 4.1 — Create `tour_providers.dart`

```dart
// features/tours/application/tour_providers.dart
// All Riverpod providers for the tours feature

part 'tour_providers.g.dart';

// ─── INFRASTRUCTURE PROVIDERS ───
@riverpod
TourRemoteDataSource tourRemoteDataSource(TourRemoteDataSourceRef ref) {
  return TourRemoteDataSource(ref.watch(supabaseClientProvider));
}

@riverpod
TourLocalDataSource tourLocalDataSource(TourLocalDataSourceRef ref) {
  return TourLocalDataSource(ref.watch(appDatabaseProvider));
}

@riverpod
TourRepository tourRepository(TourRepositoryRef ref) {
  return TourRepositoryImpl(
    remote: ref.watch(tourRemoteDataSourceProvider),
    local: ref.watch(tourLocalDataSourceProvider),
    connectivity: ref.watch(connectivityServiceProvider),
  );
}

// ─── DATA PROVIDERS ───

@riverpod
Future<List<Country>> countries(CountriesRef ref) async {
  final result = await ref.watch(tourRepositoryProvider).fetchCountries();
  return result.getOrElse(() => []);
}

@riverpod
class SelectedCountryIndex extends _$SelectedCountryIndex {
  @override int build() => 0;
  void select(int index) => state = index;
  void next(int total) { if (state < total - 1) state++; }
  void prev() { if (state > 0) state--; }
}

@riverpod
Future<List<TourSummary>> toursForCity(ToursForCityRef ref, String cityId) async {
  final result = await ref.watch(tourRepositoryProvider).fetchToursForCity(cityId);
  return result.getOrElse(() => []);
}

@riverpod
class SelectedCategoryFilter extends _$SelectedCategoryFilter {
  @override String? build() => null;   // null = show all
  void select(String? categoryId) => state = categoryId;
}

@riverpod
AsyncValue<List<TourSummary>> filteredToursForCity(
  FilteredToursForCityRef ref,
  String cityId,
) {
  final tours = ref.watch(toursForCityProvider(cityId));
  final selectedCategory = ref.watch(selectedCategoryFilterProvider);
  return tours.whenData((list) {
    if (selectedCategory == null) return list;
    return list.where((t) => t.categories.any((c) => c.id == selectedCategory)).toList();
  });
}

@riverpod
Future<TourDetail> tourDetail(TourDetailRef ref, String tourId) async {
  final result = await ref.watch(tourRepositoryProvider).fetchTourDetail(tourId);
  return result.getOrElse(() => throw Exception('Tour not found'));
}

// ─── SAVED TOURS PROVIDERS ───

@riverpod
Future<List<SavedTour>> savedTours(SavedToursRef ref) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return [];
  final result = await ref.watch(tourRepositoryProvider).fetchSavedTours(userId);
  return result.getOrElse(() => []);
}

@riverpod
Future<List<SavedTourCluster>> savedTourClusters(SavedTourClustersRef ref) async {
  final tours = await ref.watch(savedToursProvider.future);
  // Group by cityId, then by city entity (need cities loaded)
  // ... clustering logic
  return _clusterByCityAndSort(tours);
}

List<SavedTourCluster> _clusterByCityAndSort(List<SavedTour> tours) {
  final Map<String, List<SavedTour>> grouped = {};
  for (final t in tours) {
    final cityId = t.tourSummary?.cityId ?? '';
    grouped.putIfAbsent(cityId, () => []).add(t);
  }
  // Sort each group by lastOpenedAt desc
  final clusters = grouped.entries.map((e) {
    final sorted = e.value
      ..sort((a, b) => (b.lastOpenedAt ?? b.savedAt).compareTo(a.lastOpenedAt ?? a.savedAt));
    return SavedTourCluster(
      city: City(
        id: e.key,
        countryId: '',
        name: sorted.first.tourSummary?.cityId ?? '',
        description: '',
        heroImageUrl: '',
        sortOrder: 0,
      ),
      tours: sorted,
      mostRecentOpenedAt: sorted.first.lastOpenedAt ?? sorted.first.savedAt,
    );
  }).toList();
  clusters.sort((a, b) => b.mostRecentOpenedAt.compareTo(a.mostRecentOpenedAt));
  return clusters;
}

@riverpod
Future<bool> isTourSaved(IsTourSavedRef ref, String tourId) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return false;
  final result = await ref.watch(tourRepositoryProvider).isTourSaved(tourId: tourId, userId: userId);
  return result.getOrElse(() => false);
}

// ─── PLAYBACK PROGRESS PROVIDERS ───

@riverpod
Future<PlaybackProgress?> tourPlaybackProgress(TourPlaybackProgressRef ref, String tourId) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return null;
  final result = await ref.watch(tourRepositoryProvider).fetchPlaybackProgress(
    tourId: tourId, userId: userId);
  return result.getOrNull();
}

// ─── CATEGORIES PROVIDER ───
@riverpod
Future<List<TourCategory>> tourCategories(TourCategoriesRef ref) async {
  final result = await ref.watch(tourRepositoryProvider).fetchCategories();
  return result.getOrElse(() => []);
}
```

Run `build_runner` to generate `tour_providers.g.dart`.

### Task 4.2 — Create `tour_purchase_service.dart`

```dart
// features/tours/application/tour_purchase_service.dart

@riverpod
class TourPurchaseService extends _$TourPurchaseService {
  @override
  FutureOr<void> build() {}

  // "Buy" a tour: validates purchase (payment integration TBD), saves to user account
  Future<Result<SavedTour>> purchaseTour(String tourId) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return Failure(AuthError(message: 'Not logged in'));
    try {
      // Validate purchase (currently: immediate success, no payment)
      // TODO: integrate payment gateway here
      final result = await ref.read(tourRepositoryProvider).saveTour(
        tourId: tourId,
        userId: userId,
      );
      // Invalidate saved tours cache
      ref.invalidate(savedToursProvider);
      ref.invalidate(isTourSavedProvider(tourId));
      return result;
    } catch (e) {
      return Failure(UnknownError(message: e.toString()));
    }
  }
}
```

### Task 4.3 — Create `tour_progress_service.dart`

```dart
// features/tours/application/tour_progress_service.dart

@riverpod
class TourProgressService extends _$TourProgressService {
  @override FutureOr<void> build() {}

  // Called periodically during playback to persist position
  Future<void> persistProgress({
    required String tourId,
    required int audioPositionMs,
    required int currentSection,
    required bool completed,
  }) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    final progress = PlaybackProgress(
      tourId: tourId,
      userId: userId,
      audioPositionMs: audioPositionMs,
      currentSection: currentSection,
      completed: completed,
      lastUpdatedAt: DateTime.now(),
    );
    await ref.read(tourRepositoryProvider).savePlaybackProgress(progress);
    ref.invalidate(tourPlaybackProgressProvider(tourId));
  }

  Future<void> markTourOpened(String tourId) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    await ref.read(tourRepositoryProvider).touchSavedTour(
      tourId: tourId, userId: userId);
    ref.invalidate(savedToursProvider);
  }
}
```

---

## 7. Phase 5 — Navigation Extension

### Task 5.1 — Add "Tours" tab to `main_navigation.dart`

```dart
// app/main_navigation.dart
// Add 5th tab for Tours

NavigationDestination(
  icon: const Icon(Icons.headphones_outlined),
  selectedIcon: const Icon(Icons.headphones),
  label: 'Tours',
),
```

Update the tab body list to include `CountryBrowseScreen()` at index 4 (before Settings which shifts to 5).

> **Note:** Keep the existing 4 tabs intact. Only insert Tours before Settings.

### Task 5.2 — Add routes to `router.dart`

```dart
// app/router.dart
// Add these routes inside the Tours tab shell route

GoRoute(
  path: '/tours',
  name: 'countryBrowse',
  builder: (_, __) => const CountryBrowseScreen(),
  routes: [
    GoRoute(
      path: 'city/:cityId',
      name: 'cityTours',
      builder: (_, state) => CityToursScreen(cityId: state.pathParameters['cityId']!),
      routes: [
        GoRoute(
          path: 'tour/:tourId',
          name: 'tourDetail',
          builder: (_, state) => TourDetailScreen(tourId: state.pathParameters['tourId']!),
          routes: [
            GoRoute(
              path: 'play',
              name: 'guidedTour',
              builder: (_, state) => GuidedTourScreen(tourId: state.pathParameters['tourId']!),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: 'saved',
      name: 'savedTours',
      builder: (_, __) => const SavedToursScreen(),
      routes: [
        GoRoute(
          path: ':cityId',
          name: 'savedCityTours',
          builder: (_, state) => SavedCityToursScreen(cityId: state.pathParameters['cityId']!),
          routes: [
            GoRoute(
              path: 'tour/:tourId',
              name: 'savedTourDetail',
              builder: (_, state) => TourDetailScreen(
                tourId: state.pathParameters['tourId']!,
                isSaved: true,
              ),
              routes: [
                GoRoute(
                  path: 'play',
                  name: 'savedGuidedTour',
                  builder: (_, state) => GuidedTourScreen(tourId: state.pathParameters['tourId']!),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
),
```

---

## 8. Phase 6 — Country Browse Screen

### Task 6.1 — Create `country_browse_screen.dart`

**Screen structure:**
- Full-screen `PageView` (swiping changes the selected country)
- Each page has:
  1. Top section (60% of screen): Hero image with parallax scroll effect + country name overlay + smooth page indicator dots
  2. Middle section: Country description text (fade-in on page appear)
  3. Bottom section (horizontal `ListView`): City cards

```dart
// features/tours/presentation/country_browse/country_browse_screen.dart

class CountryBrowseScreen extends ConsumerStatefulWidget {
  const CountryBrowseScreen({super.key});
  @override ConsumerState<CountryBrowseScreen> createState() => _CountryBrowseScreenState();
}

class _CountryBrowseScreenState extends ConsumerState<CountryBrowseScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countriesAsync = ref.watch(countriesProvider);
    return Scaffold(
      body: countriesAsync.when(
        loading: () => const _CountriesSkeleton(),
        error: (e, _) => ErrorView(error: e),
        data: (countries) {
          if (countries.isEmpty) return const _EmptyCountriesView();
          return Stack(
            children: [
              // Full-screen hero page view
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => ref.read(selectedCountryIndexProvider.notifier).select(index),
                itemCount: countries.length,
                itemBuilder: (_, index) => _CountryPage(country: countries[index]),
              ),
              // Page indicator dots
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.35 + 12,
                left: 0, right: 0,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: countries.length,
                  effect: const WormEffect(dotHeight: 8, dotWidth: 8),
                ),
              ),
              // Left/Right swipe arrows (optional but improves discoverability)
              _SwipeArrows(pageController: _pageController, total: countries.length),
            ],
          );
        },
      ),
    );
  }
}
```

### Task 6.2 — Create `_CountryPage` widget

Each page has three sections rendered in a `CustomScrollView`:

```dart
class _CountryPage extends StatelessWidget {
  const _CountryPage({required this.country});
  final Country country;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // ── Hero Image with country name overlay ──
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.55,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: country.heroImageUrl,
                  fit: BoxFit.cover,
                ),
                // Gradient overlay at bottom for text legibility
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                ),
                // Country name + flag
                Positioned(
                  bottom: 24, left: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (country.flagEmoji != null)
                        Text(country.flagEmoji!, style: const TextStyle(fontSize: 32)),
                      Text(country.name,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // ── Description ──
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(country.description,
              style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
        // ── Cities header ──
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Text('Cities', style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
        // ── Horizontal city cards ──
        SliverToBoxAdapter(
          child: SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: country.cities.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, index) => CityCard(
                city: country.cities[index],
                onTap: () => context.pushNamed('cityTours',
                  pathParameters: {'cityId': country.cities[index].id}),
              ),
            ),
          ),
        ),
        // Bottom padding
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
```

### Task 6.3 — Create `CityCard` widget

```dart
// features/tours/presentation/country_browse/widgets/city_cards_row.dart

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.city, required this.onTap});
  final City city;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 130,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(imageUrl: city.heroImageUrl, fit: BoxFit.cover),
              // Dark gradient at bottom
              const Align(
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                  child: SizedBox(height: 60, width: double.infinity),
                ),
              ),
              // City name
              Positioned(
                bottom: 10, left: 10, right: 10,
                child: Text(city.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Task 6.4 — Create `_CountriesSkeleton` loading widget

Use `shimmer` package (add to pubspec) or a manual shimmer animation to show skeleton cards while countries load.

---

## 9. Phase 7 — City Tours Screen

### Task 7.1 — Create `city_tours_screen.dart`

**Screen structure:**
- `CityHeader` (swipeable PageView limited to cities within the same country)
- City description text
- `TourCategoryChips` (horizontal filter row)
- `TourList` (vertical ListView of `TourListCard` widgets)

```dart
// features/tours/presentation/city_tours/city_tours_screen.dart

class CityToursScreen extends ConsumerStatefulWidget {
  const CityToursScreen({super.key, required this.cityId});
  final String cityId;
  @override ConsumerState<CityToursScreen> createState() => _CityToursScreenState();
}

class _CityToursScreenState extends ConsumerState<CityToursScreen> {
  late PageController _cityPageController;

  @override
  void initState() {
    super.initState();
    _cityPageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // Derive sibling cities from country data
    final countriesAsync = ref.watch(countriesProvider);
    
    return countriesAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: ErrorView(error: e)),
      data: (countries) {
        final country = countries.firstWhere(
          (c) => c.cities.any((city) => city.id == widget.cityId),
          orElse: () => countries.first,
        );
        final cities = country.cities;
        final initialIndex = cities.indexWhere((c) => c.id == widget.cityId);
        if (_cityPageController.hasClients == false) {
          _cityPageController = PageController(initialPage: initialIndex);
        }

        return Scaffold(
          body: PageView.builder(
            controller: _cityPageController,
            itemCount: cities.length,
            itemBuilder: (_, index) => _CityPage(city: cities[index]),
          ),
        );
      },
    );
  }
}
```

### Task 7.2 — Create `_CityPage` widget

```dart
class _CityPage extends ConsumerWidget {
  const _CityPage({required this.city});
  final City city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryFilterProvider);
    final toursAsync = ref.watch(filteredToursForCityProvider(city.id));
    final categoriesAsync = ref.watch(tourCategoriesProvider);

    return CustomScrollView(
      slivers: [
        // ── City hero header ──
        SliverAppBar(
          expandedHeight: 260,
          pinned: true,
          leading: const BackButton(),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(city.name),
            background: CachedNetworkImage(imageUrl: city.heroImageUrl, fit: BoxFit.cover),
          ),
        ),
        // ── City description ──
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(city.description, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
        // ── Category filter chips ──
        SliverToBoxAdapter(
          child: categoriesAsync.when(
            loading: () => const SizedBox(height: 40),
            error: (_, __) => const SizedBox.shrink(),
            data: (categories) => TourCategoryChips(
              categories: categories,
              selectedCategoryId: selectedCategory,
              onSelected: (id) =>
                ref.read(selectedCategoryFilterProvider.notifier).select(id),
            ),
          ),
        ),
        // ── Tour list ──
        toursAsync.when(
          loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
          error: (e, _) => SliverFillRemaining(child: ErrorView(error: e)),
          data: (tours) {
            if (tours.isEmpty) {
              return const SliverFillRemaining(
                child: Center(child: Text('No tours found for this category')),
              );
            }
            return SliverList.separated(
              itemCount: tours.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, index) => TourListCard(
                tour: tours[index],
                onTap: () => context.pushNamed('tourDetail',
                  pathParameters: {'cityId': city.id, 'tourId': tours[index].id}),
              ),
            );
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
```

### Task 7.3 — Create `TourCategoryChips` widget

```dart
// features/tours/presentation/city_tours/widgets/tour_category_chips.dart

class TourCategoryChips extends StatelessWidget {
  const TourCategoryChips({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onSelected,
  });
  final List<TourCategory> categories;
  final String? selectedCategoryId;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          // "All" chip
          FilterChip(
            label: const Text('All'),
            selected: selectedCategoryId == null,
            onSelected: (_) => onSelected(null),
          ),
          const SizedBox(width: 8),
          ...categories.map((cat) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              avatar: cat.icon != null ? Icon(iconFromString(cat.icon!), size: 16) : null,
              label: Text(cat.name[0].toUpperCase() + cat.name.substring(1)),
              selected: selectedCategoryId == cat.id,
              onSelected: (_) => onSelected(selectedCategoryId == cat.id ? null : cat.id),
            ),
          )),
        ],
      ),
    );
  }
}
```

### Task 7.4 — Create `TourListCard` widget

```dart
// features/tours/presentation/city_tours/widgets/tour_list_card.dart

class TourListCard extends StatelessWidget {
  const TourListCard({super.key, required this.tour, required this.onTap});
  final TourSummary tour;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Tour image thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: tour.mainImageUrl,
                width: 90, height: 90, fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tour type badge
                  if (tour.type == TourType.multi)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('Multi-Stop', style: Theme.of(context).textTheme.labelSmall),
                    ),
                  const SizedBox(height: 4),
                  Text(tour.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(tour.tagline,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  // Duration + price row
                  Row(children: [
                    const Icon(Icons.schedule, size: 14),
                    const SizedBox(width: 4),
                    Text('${tour.durationMinutes} min',
                      style: Theme.of(context).textTheme.labelSmall),
                    const SizedBox(width: 12),
                    if (tour.isFree)
                      Text('Free',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold))
                    else
                      Text('\$${tour.priceUsd.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold)),
                    if (tour.averageRating != null) ...[
                      const SizedBox(width: 12),
                      const Icon(Icons.star_rounded, size: 14, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text(tour.averageRating!.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ]),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
```

---

## 10. Phase 8 — Tour Detail Screen

### Task 8.1 — Create `tour_detail_screen.dart`

```dart
// features/tours/presentation/tour_detail/tour_detail_screen.dart

class TourDetailScreen extends ConsumerWidget {
  const TourDetailScreen({super.key, required this.tourId, this.isSaved = false});
  final String tourId;
  final bool isSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(tourDetailProvider(tourId));
    return Scaffold(
      body: detailAsync.when(
        loading: () => const _TourDetailSkeleton(),
        error: (e, _) => ErrorView(error: e),
        data: (detail) => _TourDetailContent(detail: detail, isSaved: isSaved),
      ),
    );
  }
}
```

### Task 8.2 — Create `_TourDetailContent` widget

```dart
class _TourDetailContent extends ConsumerWidget {
  const _TourDetailContent({required this.detail, required this.isSaved});
  final TourDetail detail;
  final bool isSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            // ── Hero image + name ──
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(detail.summary.name),
                background: Hero(
                  tag: 'tour-hero-${detail.summary.id}',
                  child: CachedNetworkImage(
                    imageUrl: detail.summary.mainImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                _TourMetaRow(detail: detail),       // Creator, Duration, Price, Rating
                _AudioPreviewButton(detail: detail), // 30s preview
                _TourFullDescription(detail: detail),
                if (detail.summary.type == TourType.multi)
                  _TourRouteSection(detail: detail), // Multi-tour route stops
              ]),
            ),
            // Space for FAB
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
        // ── FAB (Buy / Take a Tour) ──
        Positioned(
          bottom: 24,
          left: 0, right: 0,
          child: Center(
            child: isSaved
              ? _TakeATourFab(tourId: detail.summary.id)
              : _BuyFab(detail: detail),
          ),
        ),
      ],
    );
  }
}
```

### Task 8.3 — Create `_TourMetaRow` widget

Displays: Creator avatar + name | Duration | Price | Star rating row.

```dart
class _TourMetaRow extends StatelessWidget {
  const _TourMetaRow({required this.detail});
  final TourDetail detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        // Creator
        Row(children: [
          if (detail.creatorAvatarUrl != null)
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(detail.creatorAvatarUrl!),
              radius: 16,
            ),
          const SizedBox(width: 10),
          Text(detail.creatorName ?? 'Unknown creator',
            style: Theme.of(context).textTheme.titleSmall),
        ]),
        const SizedBox(height: 16),
        // Stats chips
        Wrap(spacing: 12, children: [
          _StatChip(icon: Icons.schedule, label: '${detail.summary.durationMinutes} min'),
          _StatChip(
            icon: Icons.monetization_on_outlined,
            label: detail.summary.isFree ? 'Free' : '\$${detail.summary.priceUsd.toStringAsFixed(2)}',
          ),
          if (detail.summary.averageRating != null)
            _StatChip(icon: Icons.star_rounded,
              label: '${detail.summary.averageRating!.toStringAsFixed(1)} (${detail.summary.reviewCount})',
              iconColor: Colors.amber),
          _StatChip(
            icon: detail.summary.type == TourType.multi ? Icons.route : Icons.headphones,
            label: detail.summary.type == TourType.multi ? 'Multi-Stop' : 'Single Tour',
          ),
        ]),
      ]),
    );
  }
}
```

### Task 8.4 — Create `AudioPreviewButton` widget

Plays the 30-second preview clip using `just_audio`. Shows a play/stop toggle.

```dart
// features/tours/presentation/tour_detail/widgets/audio_preview_button.dart

class _AudioPreviewButton extends ConsumerStatefulWidget {
  const _AudioPreviewButton({required this.detail});
  final TourDetail detail;

  @override
  ConsumerState<_AudioPreviewButton> createState() => _AudioPreviewButtonState();
}

class _AudioPreviewButtonState extends ConsumerState<_AudioPreviewButton> {
  AudioPlayer? _player;
  bool _isPlaying = false;

  AudioVersion? _selectBestAudioVersion() {
    final versions = widget.detail.audioVersions
        .where((v) => v.status == AudioStatus.ready && v.previewUrl != null)
        .toList();
    if (versions.isEmpty) return null;
    // Prefer user's app language; fall back to first available
    final locale = Localizations.localeOf(context).languageCode;
    return versions.firstWhere(
      (v) => v.languageCode == locale,
      orElse: () => versions.first,
    );
  }

  Future<void> _togglePreview() async {
    final version = _selectBestAudioVersion();
    if (version == null) return;

    if (_isPlaying) {
      await _player?.stop();
      setState(() => _isPlaying = false);
    } else {
      _player ??= AudioPlayer();
      await _player!.setUrl(version.previewUrl!);
      _player!.playerStateStream.listen((s) {
        if (s.processingState == ProcessingState.completed) {
          if (mounted) setState(() => _isPlaying = false);
        }
      });
      await _player!.play();
      setState(() => _isPlaying = true);
    }
  }

  @override
  void dispose() {
    _player?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasPreview = _selectBestAudioVersion() != null;
    if (!hasPreview) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: OutlinedButton.icon(
        onPressed: _togglePreview,
        icon: Icon(_isPlaying ? Icons.stop : Icons.play_arrow),
        label: Text(_isPlaying ? 'Stop Preview' : 'Preview Guide (30s)'),
      ),
    );
  }
}
```

### Task 8.5 — Create `BuyFab` widget

```dart
// features/tours/presentation/tour_detail/widgets/buy_fab.dart

class _BuyFab extends ConsumerStatefulWidget {
  const _BuyFab({required this.detail});
  final TourDetail detail;
  @override ConsumerState<_BuyFab> createState() => _BuyFabState();
}

class _BuyFabState extends ConsumerState<_BuyFab> {
  bool _loading = false;

  Future<void> _onBuyPressed() async {
    setState(() => _loading = true);
    final result = await ref.read(tourPurchaseServiceProvider.notifier)
        .purchaseTour(widget.detail.summary.id);
    setState(() => _loading = false);
    if (!mounted) return;
    result.when(
      success: (_) {
        // Navigate to tour detail as "saved" mode
        context.pushReplacementNamed('savedTourDetail',
          pathParameters: {
            'cityId': widget.detail.summary.cityId,
            'tourId': widget.detail.summary.id,
          });
      },
      failure: (error) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSavedAsync = ref.watch(isTourSavedProvider(widget.detail.summary.id));
    return isSavedAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (isSaved) {
        if (isSaved) {
          return FloatingActionButton.extended(
            onPressed: () => context.pushNamed('savedGuidedTour',
              pathParameters: {
                'cityId': widget.detail.summary.cityId,
                'tourId': widget.detail.summary.id,
              }),
            icon: const Icon(Icons.headphones),
            label: const Text('Take a Tour'),
          );
        }
        return FloatingActionButton.extended(
          onPressed: _loading ? null : _onBuyPressed,
          icon: _loading
            ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
            : const Icon(Icons.shopping_bag_outlined),
          label: Text(widget.detail.summary.isFree ? 'Get for Free' : 'Buy'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        );
      },
    );
  }
}
```

### Task 8.6 — Create `TourRouteSection` widget (multi-tour only)

Shows an ordered list of single tours that make up the multi-tour, displayed as a numbered route list.

```dart
class _TourRouteSection extends StatelessWidget {
  const _TourRouteSection({required this.detail});
  final TourDetail detail;

  @override
  Widget build(BuildContext context) {
    final childTours = detail.childTours ?? [];
    if (childTours.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tour Route', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          ...childTours.asMap().entries.map((entry) {
            final i = entry.key;
            final tour = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text('${i + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(width: 12),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tour.name, style: Theme.of(context).textTheme.titleSmall),
                    Text('${tour.durationMinutes} min',
                      style: Theme.of(context).textTheme.bodySmall),
                  ],
                )),
              ]),
            );
          }),
        ],
      ),
    );
  }
}
```

---

## 11. Phase 9 — Saved Tours Feature

### Task 9.1 — Create `saved_tours_screen.dart`

```dart
// features/tours/presentation/saved_tours/saved_tours_screen.dart

class SavedToursScreen extends ConsumerWidget {
  const SavedToursScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clustersAsync = ref.watch(savedTourClustersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Tours')),
      body: clustersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorView(error: e),
        data: (clusters) {
          if (clusters.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.headphones_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No tours are saved',
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Browse tours to find your first adventure',
                    style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: clusters.length,
            itemBuilder: (_, index) => CityCluserTile(
              cluster: clusters[index],
              onTap: () => context.pushNamed('savedCityTours',
                pathParameters: {'cityId': clusters[index].city.id}),
            ),
          );
        },
      ),
    );
  }
}
```

### Task 9.2 — Create `CityClusterTile` widget

Shows city image, name, tour count, and last-opened date.

```dart
class CityCluserTile extends StatelessWidget {
  const CityCluserTile({super.key, required this.cluster, required this.onTap});
  final SavedTourCluster cluster;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 110,
          child: Row(children: [
            CachedNetworkImage(
              imageUrl: cluster.city.heroImageUrl,
              width: 110, height: 110, fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cluster.city.name,
                  style: Theme.of(context).textTheme.titleMedium),
                Text('${cluster.tours.length} saved tour${cluster.tours.length != 1 ? 's' : ''}',
                  style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 4),
                Text(
                  'Last opened ${_formatRelative(cluster.mostRecentOpenedAt)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
              ],
            )),
            const Icon(Icons.chevron_right),
            const SizedBox(width: 8),
          ]),
        ),
      ),
    );
  }

  String _formatRelative(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inDays == 0) return 'today';
    if (diff.inDays == 1) return 'yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}
```

### Task 9.3 — Create `saved_city_tours_screen.dart`

Reuses `TourListCard` from city tours. Shows saved tours for a specific city. Tapping navigates to `savedTourDetail`.

---

## 12. Phase 10 — Guided Tour Experience (Take a Tour)

This is the most complex screen. It combines:
- A full-screen map with the tour route and waypoint markers
- A Spotify-style bottom sheet that expands/collapses
  - **Expanded:** Scrollable guide text + audio controls
  - **Collapsed:** Just the mini audio player bar

### Task 10.1 — Create `guided_tour_screen.dart`

```dart
// features/tours/presentation/guided_tour/guided_tour_screen.dart

class GuidedTourScreen extends ConsumerStatefulWidget {
  const GuidedTourScreen({super.key, required this.tourId});
  final String tourId;
  @override ConsumerState<GuidedTourScreen> createState() => _GuidedTourScreenState();
}

class _GuidedTourScreenState extends ConsumerState<GuidedTourScreen>
    with WidgetsBindingObserver {
  late DraggableScrollableController _sheetController;
  static const double _minChildSize  = 0.12;  // Collapsed height (mini player)
  static const double _maxChildSize  = 0.75;  // Expanded height (full guide)
  static const double _initChildSize = 0.35;

  @override
  void initState() {
    super.initState();
    _sheetController = DraggableScrollableController();
    WakelockPlus.enable();                  // Keep screen on during tour
    WidgetsBinding.instance.addObserver(this);
    // Touch savedTour to update lastOpenedAt
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tourProgressServiceProvider.notifier).markTourOpened(widget.tourId);
    });
  }

  @override
  void dispose() {
    _sheetController.dispose();
    WakelockPlus.disable();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(tourDetailProvider(widget.tourId));
    return Scaffold(
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorView(error: e),
        data: (detail) => Stack(
          children: [
            // ── Full-screen map ──
            TourMapLayer(
              detail: detail,
              sheetController: _sheetController,
            ),
            // ── Close button top-left ──
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton.filled(
                  onPressed: () async {
                    // Persist progress before leaving
                    await ref.read(tourAudioServiceProvider.notifier).persistCurrentProgress();
                    if (context.mounted) context.pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            // ── Spotify-style bottom sheet ──
            DraggableScrollableSheet(
              controller: _sheetController,
              initialChildSize: _initChildSize,
              minChildSize: _minChildSize,
              maxChildSize: _maxChildSize,
              snap: true,
              snapSizes: const [_minChildSize, _initChildSize, _maxChildSize],
              builder: (context, scrollController) {
                return TourBottomSheet(
                  detail: detail,
                  scrollController: scrollController,
                  sheetController: _sheetController,
                  minChildSize: _minChildSize,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

### Task 10.2 — Create `TourMapLayer` widget

```dart
// features/tours/presentation/guided_tour/widgets/tour_map_layer.dart

class TourMapLayer extends ConsumerWidget {
  const TourMapLayer({super.key, required this.detail, required this.sheetController});
  final TourDetail detail;
  final DraggableScrollableController sheetController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use the existing map infrastructure from features/map/
    // Display:
    // 1. Polyline connecting all waypoints (dashed when not yet visited, solid when past)
    // 2. Numbered markers for each waypoint
    // 3. User's current location pin
    // 4. For multi-tours: different color markers per child tour

    final waypoints = detail.waypoints;
    final currentSection = ref.watch(tourAudioServiceProvider).valueOrNull?.currentSection ?? 0;

    return FlutterMap(   // or google_maps_flutter — match existing map feature
      options: MapOptions(
        initialCenter: LatLng(
          waypoints.first.latitude,
          waypoints.first.longitude,
        ),
        initialZoom: 15,
      ),
      children: [
        TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
        PolylineLayer(polylines: [
          Polyline(
            points: waypoints.map((w) => LatLng(w.latitude, w.longitude)).toList(),
            strokeWidth: 4,
            color: Theme.of(context).colorScheme.primary,
          ),
        ]),
        MarkerLayer(
          markers: waypoints.asMap().entries.map((entry) {
            final i = entry.key;
            final wp = entry.value;
            final isPast = i < currentSection;
            final isCurrent = i == currentSection;
            return Marker(
              point: LatLng(wp.latitude, wp.longitude),
              child: _WaypointMarker(
                index: i + 1,
                label: wp.label,
                isPast: isPast,
                isCurrent: isCurrent,
              ),
            );
          }).toList(),
        ),
        // User location
        CurrentLocationLayer(),
      ],
    );
  }
}
```

### Task 10.3 — Create `TourBottomSheet` widget

This is the core Spotify-style sheet. It checks the current sheet size and renders differently:

```dart
// features/tours/presentation/guided_tour/widgets/tour_bottom_sheet.dart

class TourBottomSheet extends ConsumerWidget {
  const TourBottomSheet({
    super.key,
    required this.detail,
    required this.scrollController,
    required this.sheetController,
    required this.minChildSize,
  });
  final TourDetail detail;
  final ScrollController scrollController;
  final DraggableScrollableController sheetController;
  final double minChildSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedBuilder(
      animation: sheetController,
      builder: (context, _) {
        final size = sheetController.isAttached ? sheetController.size : 0.35;
        final isCollapsed = size <= minChildSize + 0.01;
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black26)],
          ),
          child: Column(
            children: [
              // Drag handle
              const _DragHandle(),
              // Mini player (always visible)
              AudioPlayerBar(tourId: detail.summary.id),
              // Expanded content (guide text)
              if (!isCollapsed)
                Expanded(
                  child: GuideTextView(
                    guideContent: detail.guideContent,
                    scrollController: scrollController,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
```

### Task 10.4 — Create `AudioPlayerBar` widget

The mini audio player that is always visible even when sheet is collapsed:

```dart
// features/tours/presentation/guided_tour/widgets/audio_player_bar.dart

class AudioPlayerBar extends ConsumerWidget {
  const AudioPlayerBar({super.key, required this.tourId});
  final String tourId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioState = ref.watch(tourAudioServiceProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(children: [
        // Progress bar
        audioState.when(
          loading: () => const LinearProgressIndicator(),
          error: (_, __) => const SizedBox.shrink(),
          data: (state) => SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              trackHeight: 3,
            ),
            child: Slider(
              value: state.position.inMilliseconds.toDouble(),
              max: state.duration.inMilliseconds.toDouble().clamp(1, double.infinity),
              onChanged: (val) => ref.read(tourAudioServiceProvider.notifier)
                  .seekTo(Duration(milliseconds: val.toInt())),
            ),
          ),
        ),
        // Controls row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: const Icon(Icons.replay_10), onPressed: () =>
              ref.read(tourAudioServiceProvider.notifier).skipBack()),
            audioState.when(
              loading: () => const SizedBox(width: 48, height: 48, child: CircularProgressIndicator()),
              error: (_, __) => const Icon(Icons.error),
              data: (state) => IconButton.filled(
                icon: Icon(state.isPlaying ? Icons.pause : Icons.play_arrow, size: 28),
                onPressed: () => ref.read(tourAudioServiceProvider.notifier).togglePlayPause(),
                style: IconButton.styleFrom(
                  fixedSize: const Size(56, 56),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            IconButton(icon: const Icon(Icons.forward_30), onPressed: () =>
              ref.read(tourAudioServiceProvider.notifier).skipForward()),
          ],
        ),
      ]),
    );
  }
}
```

### Task 10.5 — Create `GuideTextView` widget

This is the beautifully structured guide text renderer. It reads `GuideContent` and renders each `GuideSection` with its `GuideBlock`s. The key feature is that text already read is at full opacity while unread text is at 50% opacity. Text scrolls upward as it's read.

```dart
// features/tours/presentation/guided_tour/widgets/guide_text_view.dart

class GuideTextView extends ConsumerWidget {
  const GuideTextView({
    super.key,
    required this.guideContent,
    required this.scrollController,
  });
  final GuideContent guideContent;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioState = ref.watch(tourAudioServiceProvider).valueOrNull;
    final currentSectionIndex = audioState?.currentSection ?? 0;

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
      itemCount: guideContent.sections.length,
      itemBuilder: (_, sectionIndex) {
        final section = guideContent.sections[sectionIndex];
        final isRead = sectionIndex < currentSectionIndex;
        final isCurrent = sectionIndex == currentSectionIndex;
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: isRead || isCurrent ? 1.0 : 0.5,
          child: _GuideSectionView(section: section, isRead: isRead, isCurrent: isCurrent),
        );
      },
    );
  }
}

class _GuideSectionView extends StatelessWidget {
  const _GuideSectionView({required this.section, required this.isRead, required this.isCurrent});
  final GuideSection section;
  final bool isRead;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        // Chapter title
        Text(section.chapterTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          )),
        const SizedBox(height: 16),
        // Content blocks
        ...section.blocks.map((block) => _GuideBlockView(block: block)),
      ],
    );
  }
}

class _GuideBlockView extends StatelessWidget {
  const _GuideBlockView({required this.block});
  final GuideBlock block;

  @override
  Widget build(BuildContext context) {
    return switch (block) {
      GuideBlockText(:final content) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(content, style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6)),
      ),
      GuideBlockHighlight(:final content) => Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(
            color: Theme.of(context).colorScheme.primary, width: 4)),
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        ),
        child: Text(content,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          )),
      ),
      GuideBlockImage(:final imageUrl, :final caption, :final isLeading) => Padding(
        padding: EdgeInsets.symmetric(vertical: isLeading ? 0 : 16),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(isLeading ? 0 : 12),
            child: CachedNetworkImage(imageUrl: imageUrl,
              width: double.infinity,
              height: isLeading ? 240 : 200,
              fit: BoxFit.cover),
          ),
          if (caption != null) Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(caption,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ),
        ]),
      ),
      GuideBlockFact(:final label, :final value) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(children: [
          Text('$label: ', style: Theme.of(context).textTheme.labelLarge),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ]),
      ),
      GuideBlockLocation(:final address, :final latitude, :final longitude) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(children: [
          Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary, size: 18),
          const SizedBox(width: 6),
          Expanded(child: Text(address, style: Theme.of(context).textTheme.bodySmall)),
        ]),
      ),
      GuideBlockYearBadge(:final label) => Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer)),
      ),
    };
  }
}
```

---

## 13. Phase 11 — Multi-Tour Support

### Task 11.1 — Create `TourAudioService` in application layer

This service manages the entire playback session — both single and multi-tours.

```dart
// features/tours/application/tour_audio_service.dart

@freezed
class AudioPlaybackState with _$AudioPlaybackState {
  const factory AudioPlaybackState({
    required bool isPlaying,
    required Duration position,
    required Duration duration,
    required int currentSection,         // Index into GuideContent.sections
    required int currentChildTourIndex,  // For multi-tours: which child tour is active
    required bool isLoadingNext,         // True when switching to next stop in multi-tour
  }) = _AudioPlaybackState;
}

@riverpod
class TourAudioService extends _$TourAudioService {
  late AudioPlayer _player;
  TourDetail? _detail;
  StreamSubscription? _positionSub;
  StreamSubscription? _playerStateSub;

  @override
  FutureOr<AudioPlaybackState> build() async {
    _player = AudioPlayer();
    ref.onDispose(() {
      _positionSub?.cancel();
      _playerStateSub?.cancel();
      _player.dispose();
    });
    return const AudioPlaybackState(
      isPlaying: false,
      position: Duration.zero,
      duration: Duration.zero,
      currentSection: 0,
      currentChildTourIndex: 0,
      isLoadingNext: false,
    );
  }

  // Initialize playback for a tour (restoring progress if available)
  Future<void> initTour(TourDetail detail, {PlaybackProgress? savedProgress}) async {
    _detail = detail;
    final audioVersion = _pickAudioVersion(detail);
    if (audioVersion == null) return;

    // Check for offline download first
    final localPath = await ref.read(tourLocalDataSourceProvider)
        .getDownloadedAudioPath(detail.summary.id, audioVersion.languageCode);

    final audioSource = localPath != null
        ? AudioSource.file(localPath)
        : AudioSource.uri(Uri.parse(audioVersion.audioUrl!));

    await _player.setAudioSource(audioSource);

    // Restore position if available
    if (savedProgress != null && savedProgress.audioPositionMs > 0) {
      await _player.seek(Duration(milliseconds: savedProgress.audioPositionMs));
    }

    _setupListeners(detail);
  }

  AudioVersion? _pickAudioVersion(TourDetail detail) {
    // Priority: user's device language → first available ready version
    final versions = detail.audioVersions
        .where((v) => v.status == AudioStatus.ready && v.audioUrl != null)
        .toList();
    if (versions.isEmpty) return null;
    // TODO: match device locale
    return versions.first;
  }

  void _setupListeners(TourDetail detail) {
    _positionSub = _player.positionStream.listen((position) {
      final duration = _player.duration ?? Duration.zero;
      // Map position to section index
      final sectionIndex = _mapPositionToSection(position, duration, detail.guideContent);
      if (state case AsyncData(:final value)) {
        state = AsyncData(value.copyWith(
          position: position,
          duration: duration,
          currentSection: sectionIndex,
        ));
        // Persist progress every 5 seconds
        if (position.inSeconds % 5 == 0) {
          ref.read(tourProgressServiceProvider.notifier).persistProgress(
            tourId: detail.summary.id,
            audioPositionMs: position.inMilliseconds,
            currentSection: sectionIndex,
            completed: false,
          );
        }
      }
    });

    _playerStateSub = _player.playerStateStream.listen((playerState) {
      if (state case AsyncData(:final value)) {
        state = AsyncData(value.copyWith(isPlaying: playerState.playing));
        if (playerState.processingState == ProcessingState.completed) {
          _onTrackCompleted(detail);
        }
      }
    });
  }

  // Maps audio position to guide content section index using equal time slices
  int _mapPositionToSection(Duration position, Duration duration, GuideContent content) {
    if (duration.inMilliseconds == 0 || content.sections.isEmpty) return 0;
    final sectionCount = content.sections.length;
    final sectionDuration = duration.inMilliseconds / sectionCount;
    final index = (position.inMilliseconds / sectionDuration).floor();
    return index.clamp(0, sectionCount - 1);
  }

  Future<void> _onTrackCompleted(TourDetail detail) async {
    // For single tours: mark completed
    if (detail.summary.type == TourType.single) {
      await ref.read(tourProgressServiceProvider.notifier).persistProgress(
        tourId: detail.summary.id,
        audioPositionMs: 0,
        currentSection: 0,
        completed: true,
      );
    }
    // For multi-tours: handled by location triggers (see Phase 11.2)
  }

  Future<void> togglePlayPause() async {
    _player.playing ? await _player.pause() : await _player.play();
  }

  Future<void> seekTo(Duration position) => _player.seek(position);

  Future<void> skipBack() =>
      _player.seek(_player.position - const Duration(seconds: 10));

  Future<void> skipForward() =>
      _player.seek(_player.position + const Duration(seconds: 30));

  Future<void> persistCurrentProgress() async {
    if (_detail == null) return;
    final pos = _player.position;
    final section = (state as AsyncData<AudioPlaybackState>).value.currentSection;
    await ref.read(tourProgressServiceProvider.notifier).persistProgress(
      tourId: _detail!.summary.id,
      audioPositionMs: pos.inMilliseconds,
      currentSection: section,
      completed: false,
    );
  }
}
```

### Task 11.2 — Create `MultiTourLocationService` (geofencing for multi-tour stop triggers)

```dart
// features/tours/application/multi_tour_location_service.dart

@riverpod
class MultiTourLocationService extends _$MultiTourLocationService {
  StreamSubscription<Position>? _locationSub;

  @override
  FutureOr<void> build() {}

  // Start watching location for a multi-tour
  void startTracking(TourDetail multiTour) {
    if (multiTour.summary.type != TourType.multi) return;
    final items = multiTour.childTours ?? [];
    final audioService = ref.read(tourAudioServiceProvider.notifier);

    _locationSub = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 5),
    ).listen((position) {
      final currentChildIndex = (ref.read(tourAudioServiceProvider).valueOrNull?.currentChildTourIndex ?? 0);
      if (currentChildIndex >= items.length - 1) return;

      // Check if user is within the geofence of the NEXT stop
      final nextItem = _getNextTrigger(multiTour, currentChildIndex + 1);
      if (nextItem == null) return;

      final distanceToNext = Geolocator.distanceBetween(
        position.latitude, position.longitude,
        nextItem.triggerLatitude!, nextItem.triggerLongitude!,
      );

      if (distanceToNext <= nextItem.triggerRadiusMeters) {
        _onArriveAtNextStop(multiTour, nextItem, currentChildIndex + 1);
      }
    });
  }

  MultiTourItem? _getNextTrigger(TourDetail tour, int index) {
    // Build from child tours + trigger locations
    // This requires matching tour_waypoints with multi_tour_items
    return null; // TODO: implement with real data
  }

  // Called when user physically arrives at next tour stop
  void _onArriveAtNextStop(TourDetail multiTour, MultiTourItem item, int childIndex) {
    // Show local notification: "You've arrived! Ready for the next stop."
    _showArrivalNotification(multiTour, item, childIndex);
  }

  Future<void> _showArrivalNotification(TourDetail tour, MultiTourItem item, int childIndex) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.show(
      childIndex,
      'Next stop ready!',
      'Finish the current audio, then tap to continue to stop ${childIndex + 1}.',
      const NotificationDetails(
        android: AndroidNotificationDetails('tour_stops', 'Tour Stop Alerts'),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  void stopTracking() {
    _locationSub?.cancel();
    _locationSub = null;
  }
}
```

### Task 11.3 — Integrate `MultiTourLocationService` into `GuidedTourScreen`

In `_GuidedTourScreenState.initState`, after the tour detail loads, start location tracking for multi-tours:

```dart
// After detail loads, in initState or via ref.listen:
ref.listen(tourDetailProvider(widget.tourId), (_, next) {
  next.whenData((detail) {
    if (detail.summary.type == TourType.multi) {
      ref.read(multiTourLocationServiceProvider.notifier).startTracking(detail);
    }
  });
});
```

Dispose the tracker in `dispose()`.

---

## 14. Phase 12 — Audio System

### Task 12.1 — Configure `just_audio_background`

In `main.dart`, before `runApp`:

```dart
await JustAudioBackground.init(
  androidNotificationChannelId: 'com.dastan.tours.channel.audio',
  androidNotificationChannelName: 'Tour Audio',
  androidNotificationOngoing: true,
  androidStopForegroundOnPause: true,
);
```

### Task 12.2 — Wrap `AudioPlayer` in `TourAudioService` with background support

Replace `AudioPlayer()` with:
```dart
_player = AudioPlayer(
  audioLoadConfiguration: const AudioLoadConfiguration(
    androidLoadControl: AndroidLoadControl(minBufferDuration: Duration(seconds: 30)),
  ),
);
```

Use `AudioSource.uri` wrapped in `LockCachingAudioSource` from `just_audio` for transparent local caching.

### Task 12.3 — Implement TTS Preview service (placeholder)

For the 30-second preview, if `preview_url` in `tour_audio_versions` is null, fall back to `flutter_tts` reading the first paragraph of the guide content:

```dart
// features/tours/application/tts_preview_service.dart

@riverpod
class TtsPreviewService extends _$TtsPreviewService {
  final FlutterTts _tts = FlutterTts();
  bool _isSpeaking = false;

  @override FutureOr<void> build() {
    ref.onDispose(() => _tts.stop());
  }

  Future<void> speakPreview(String text) async {
    if (_isSpeaking) { await _tts.stop(); _isSpeaking = false; return; }
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.9);
    // Take first 200 characters (~30 seconds of speech)
    final preview = text.length > 200 ? text.substring(0, 200) : text;
    await _tts.speak(preview);
    _isSpeaking = true;
  }

  Future<void> stop() async {
    await _tts.stop();
    _isSpeaking = false;
  }
}
```

---

## 15. Phase 13 — Creator Editor (Web)

The creator editor is a **Flutter Web** app. It can be a separate entry point (`main_web.dart`) or a web-only route in the existing app that is hidden on mobile.

### Task 13.1 — Create the web-only route

In `router.dart`, add:
```dart
GoRoute(
  path: '/creator',
  name: 'creatorDashboard',
  builder: (_, __) => const CreatorDashboardScreen(),
  routes: [
    GoRoute(
      path: 'new',
      name: 'creatorEditor',
      builder: (_, __) => const TourEditorScreen(),
    ),
    GoRoute(
      path: ':tourId/edit',
      name: 'creatorEditorEdit',
      builder: (_, state) => TourEditorScreen(tourId: state.pathParameters['tourId']),
    ),
  ],
),
```

Use a `kIsWeb` check in `main_navigation.dart` to show a "Creator" tab only on web.

### Task 13.2 — Create `tour_editor_screen.dart`

**Sections of the editor screen:**
1. **Top bar:** Tour title field, Save draft button, Publish button
2. **Left panel (metadata):** City selector, Category multi-select, Duration, Price, Is Free, Tour type (single/multi), Main image upload, Tagline
3. **Main panel (content editor):** `flutter_quill` editor with custom block types
4. **Right panel (preview):** Real-time preview of how the guide will look to users

```dart
// features/tours/presentation/creator_editor/tour_editor_screen.dart

class TourEditorScreen extends ConsumerStatefulWidget {
  const TourEditorScreen({super.key, this.tourId});
  final String? tourId;
  @override ConsumerState<TourEditorScreen> createState() => _TourEditorScreenState();
}

class _TourEditorScreenState extends ConsumerState<TourEditorScreen> {
  late QuillController _quillController;
  final _titleController = TextEditingController();
  final _taglineController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quillController = QuillController.basic();
    if (widget.tourId != null) {
      _loadExistingTour();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _EditorAppBar(
        onSaveDraft: _saveDraft,
        onPublish: _onPublish,
      ),
      body: Row(
        children: [
          // Left metadata panel
          SizedBox(
            width: 280,
            child: _MetadataPanel(
              titleController: _titleController,
              taglineController: _taglineController,
              onImageUploaded: (url) => setState(() {}),
            ),
          ),
          const VerticalDivider(width: 1),
          // Main editor panel
          Expanded(
            flex: 3,
            child: Column(children: [
              // Custom toolbar for guide-specific block types
              _GuideToolbar(controller: _quillController),
              const Divider(height: 1),
              Expanded(
                child: QuillEditor.basic(
                  controller: _quillController,
                  config: const QuillEditorConfig(
                    padding: EdgeInsets.all(24),
                    autoFocus: true,
                  ),
                ),
              ),
            ]),
          ),
          const VerticalDivider(width: 1),
          // Right preview panel
          SizedBox(
            width: 320,
            child: _LivePreviewPanel(controller: _quillController),
          ),
        ],
      ),
    );
  }
}
```

### Task 13.3 — Implement custom Quill toolbar with guide-specific blocks

The toolbar should provide buttons for:
- Normal text (paragraph)
- Chapter title (`h1` in Quill, maps to `GuideSection.chapterTitle`)
- Highlight / pull quote (custom block embed)
- Image insert (uploads to Supabase Storage)
- Fact chip (custom embed: label + value)
- Location tag (custom embed: address + lat/lng)
- Year badge (custom embed: year label)

```dart
// features/tours/presentation/creator_editor/widgets/guide_toolbar.dart

class _GuideToolbar extends StatelessWidget {
  const _GuideToolbar({required this.controller});
  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return QuillSimpleToolbar(
      controller: controller,
      config: QuillSimpleToolbarConfig(
        showFontFamily: false,
        showFontSize: false,
        showLink: false,
        showUndo: true,
        showRedo: true,
        showBoldButton: true,
        showItalicButton: true,
        showHeaderStyle: true,
        customButtons: [
          QuillToolbarCustomButtonOptions(
            icon: const Icon(Icons.format_quote),
            tooltip: 'Highlight / Pull Quote',
            onPressed: () => _insertHighlight(controller),
          ),
          QuillToolbarCustomButtonOptions(
            icon: const Icon(Icons.image),
            tooltip: 'Insert Image',
            onPressed: () => _insertImage(context, controller),
          ),
          QuillToolbarCustomButtonOptions(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Fact Chip',
            onPressed: () => _insertFact(context, controller),
          ),
          QuillToolbarCustomButtonOptions(
            icon: const Icon(Icons.location_on_outlined),
            tooltip: 'Location Tag',
            onPressed: () => _insertLocation(context, controller),
          ),
          QuillToolbarCustomButtonOptions(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Year Badge',
            onPressed: () => _insertYearBadge(context, controller),
          ),
        ],
      ),
    );
  }

  void _insertHighlight(QuillController c) {
    // Insert a block-level highlight embed into the Quill document
    // Use Quill's embed system with a custom 'highlight' type
  }

  Future<void> _insertImage(BuildContext context, QuillController c) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;
    // Upload to Supabase Storage 'tour-images' bucket
    // Insert image URL into Quill as image embed
  }

  void _insertFact(BuildContext context, QuillController c) {
    // Show dialog for label + value, then insert as embed
  }

  void _insertLocation(BuildContext context, QuillController c) {
    // Show dialog for address (with autocomplete using existing locations feature)
  }

  void _insertYearBadge(BuildContext context, QuillController c) {
    // Show text field dialog for year label, insert as embed
  }
}
```

### Task 13.4 — Implement Quill ↔ GuideContent conversion

```dart
// features/tours/application/quill_guide_converter.dart

class QuillGuideConverter {
  // Convert Quill Delta JSON to GuideContent domain model
  static GuideContent fromQuillDelta(Map<String, dynamic> deltaJson, String tourId) {
    // Parse the delta ops array
    // Split by H1 headers → each H1 becomes a GuideSection with that chapterTitle
    // Everything between two H1s → blocks for the preceding section
    // Map Quill block types to GuideBlock variants:
    //   - plain text → GuideBlockText
    //   - custom 'highlight' embed → GuideBlockHighlight
    //   - image embed → GuideBlockImage
    //   - custom 'fact' embed → GuideBlockFact
    //   - custom 'location' embed → GuideBlockLocation
    //   - custom 'yearBadge' embed → GuideBlockYearBadge
    // ...
    return GuideContent(tourId: tourId, sections: [], version: 1);
  }

  // Convert GuideContent back to Quill Delta JSON (for editing existing tours)
  static Map<String, dynamic> toQuillDelta(GuideContent content) {
    // Reverse mapping from GuideSection/GuideBlock → Quill Delta ops
    return {};
  }
}
```

### Task 13.5 — Implement Word file (.docx) import

```dart
// features/tours/application/word_importer.dart

class WordImporter {
  // Accept a .docx file picked by file_picker
  // Use the 'docx' package or parse the XML inside the .docx ZIP
  // Extract:
  //   - H1 → chapter titles
  //   - H2/H3 → sub-sections
  //   - Plain paragraphs → GuideBlockText
  //   - Quoted paragraphs (or blockquotes if any) → GuideBlockHighlight
  //   - Images → upload to Supabase Storage, return GuideBlockImage
  //   - Inline comments with [FACT:label:value] syntax → GuideBlockFact
  //   - Inline comments with [YEAR:1492] → GuideBlockYearBadge
  // Returns a GuideContent object
  
  static Future<GuideContent> importDocx(Uint8List bytes, String tourId) async {
    // Implementation using 'docx' or xml parsing
    throw UnimplementedError();
  }
}
```

### Task 13.6 — Implement publish flow with TTS/translation dialog

```dart
// When user presses "Publish":
void _onPublish() {
  showDialog(
    context: context,
    builder: (_) => PublishTourDialog(tourId: _draftTourId),
  );
}

// PublishTourDialog:
// Step 1: Confirm tour details
// Step 2: "Would you like to create an audio version?"
//   - Yes → Show language selection checkboxes (from available languages list)
//     - Original language: trigger TTS immediately
//     - Additional languages: translate (DeepL API) → TTS each
//   - No → Offer "Upload audio file" option
// Step 3: Show progress indicators for each language's audio generation
// Step 4: Publish → sets is_published = true in tours table
```

### Task 13.7 — Implement creator Supabase functions

Create Supabase Edge Functions (in `supabase/functions/`):

1. **`generate-audio`** — calls TTS API for a tour in a given language, uploads MP3 to Storage, updates `tour_audio_versions`
2. **`translate-tour`** — calls DeepL API to translate guide content JSON, stores in `tour_audio_versions.translated_content`
3. **`create-preview-clip`** — clips first 30 seconds from the full audio, saves to `tour-audio-previews` bucket, updates `tour_audio_versions.preview_url`

```typescript
// supabase/functions/generate-audio/index.ts
import { serve } from 'https://deno.land/std/http/server.ts'

serve(async (req) => {
  const { tourId, languageCode, guideContentJson } = await req.json()
  
  // 1. Call external TTS API (placeholder: ElevenLabs, Google TTS, etc.)
  // 2. Get audio bytes back
  // 3. Upload to Supabase Storage 'tour-audio' bucket
  // 4. Update tour_audio_versions: set status='ready', audio_url=<url>
  // 5. Trigger create-preview-clip function
  
  return new Response(JSON.stringify({ success: true }), {
    headers: { 'Content-Type': 'application/json' },
  })
})
```

```typescript
// supabase/functions/translate-tour/index.ts
serve(async (req) => {
  const { tourId, targetLanguage, guideContentJson } = await req.json()
  
  // 1. Call DeepL API with guide content JSON
  //    - Translate only text fields, preserve structure
  // 2. Store translated content in tour_audio_versions.translated_content
  // 3. Trigger generate-audio for the translated content
  
  return new Response(JSON.stringify({ success: true }), {
    headers: { 'Content-Type': 'application/json' },
  })
})
```

---

## 16. Phase 14 — Offline Support for Tours

### Task 14.1 — Add "Download Tour" option on `TourDetailScreen`

On the tour detail screen, add a download icon in the app bar or near the Buy/Take a Tour button:

```dart
IconButton(
  icon: isDownloaded ? const Icon(Icons.download_done) : const Icon(Icons.download_outlined),
  tooltip: 'Download for offline use',
  onPressed: isDownloaded ? null : () => _downloadTour(context, ref, detail),
)
```

### Task 14.2 — Create `TourDownloadService`

```dart
// features/tours/application/tour_download_service.dart

@riverpod
class TourDownloadService extends _$TourDownloadService {
  @override FutureOr<void> build() {}

  Future<void> downloadTour({
    required TourDetail detail,
    required String languageCode,
    required void Function(double progress) onProgress,
  }) async {
    // 1. Get audio version for language
    final audioVersion = detail.audioVersions
        .firstWhere((v) => v.languageCode == languageCode && v.status == AudioStatus.ready,
          orElse: () => detail.audioVersions.first);

    // 2. Download audio file using Dio
    final dir = await getApplicationDocumentsDirectory();
    final audioPath = '${dir.path}/tours/${detail.summary.id}/$languageCode.mp3';
    await Dio().download(
      audioVersion.audioUrl!,
      audioPath,
      onReceiveProgress: (received, total) =>
          onProgress(total > 0 ? received / total : 0),
    );

    // 3. Store guide content + audio path locally
    await ref.read(tourLocalDataSourceProvider).saveDownloadedTour(
      tourId: detail.summary.id,
      contentJson: jsonEncode(detail.guideContent.toJson()),
      audioFilePath: audioPath,
      languageCode: languageCode,
    );
  }
}
```

### Task 14.3 — Update `TourAudioService` to check for local download first

Already done in Phase 12 (Task 12.2) via `LockCachingAudioSource` and local path lookup.

---

## 17. Phase 15 — Enhanced UX Additions

These additions go beyond the spec to enrich the user experience.

### Task 15.1 — Hero animations between screens

Wrap tour card images in `Hero` widgets with a consistent tag (`'tour-hero-${tour.id}'`) in both `TourListCard` and `TourDetailScreen.SliverAppBar`. Flutter will automatically animate the image between screens.

```dart
// In TourListCard:
Hero(
  tag: 'tour-hero-${tour.id}',
  child: CachedNetworkImage(imageUrl: tour.mainImageUrl, ...),
)

// In TourDetailScreen SliverAppBar:
Hero(
  tag: 'tour-hero-${tourId}',
  child: CachedNetworkImage(imageUrl: detail.summary.mainImageUrl, ...),
)
```

### Task 15.2 — "Nearby Tours" section on the Country Browse screen

Below the city cards on the country browse screen, add a "Tours Near You" horizontal list using the user's current location and `Geolocator`. Sort cities by distance and show the 3 nearest tours.

```dart
// In _CountryPage, add:
SliverToBoxAdapter(
  child: _NearbyToursSection(cities: country.cities),
),
```

### Task 15.3 — Tour completion badge

After `_onTrackCompleted` fires, show a `showDialog` with a congratulations animation (use `Lottie`) and a rating prompt:

```dart
// In TourAudioService._onTrackCompleted:
// Dispatch an event that the UI listens to via ref.listen
```

### Task 15.4 — Tour rating sheet

After a tour completes, show a `ModalBottomSheet` with a 5-star rating widget and optional review text field.

### Task 15.5 — Search within tours

Add a search icon to the `CountryBrowseScreen` AppBar that opens a full-screen search (using the existing `UnifiedSearchScaffold` pattern) scoped to searching across all tour names and cities.

### Task 15.6 — Share a tour via deep link

On `TourDetailScreen`, add a share button that uses the `Share` package to share a deep link: `dastan://tours/city/{cityId}/tour/{tourId}`. Configure GoRouter to handle this URL scheme.

### Task 15.7 — Dark/light theme consistency

Ensure all new widgets use `Theme.of(context).colorScheme` color tokens instead of hardcoded colors, matching the existing app's Material 3 theme.

### Task 15.8 — "Continue where you left off" banner

On `TourDetailScreen` for a saved tour, if `PlaybackProgress.audioPositionMs > 0` and not completed, show a banner:

```dart
MaterialBanner(
  content: Text('Continue from ${_formatPosition(progress.audioPositionMs)}'),
  actions: [
    TextButton(onPressed: _resumeTour, child: const Text('Resume')),
    TextButton(onPressed: _startOver, child: const Text('Start over')),
  ],
)
```

---

## 18. Phase 16 — Testing

### Task 16.1 — Unit tests for domain models

File: `test/src/features/tours/domain/tour_models_test.dart`

- Test `GuideContent.fromJson` / `toJson` round-trip
- Test `Country` serialization
- Test `SavedTourCluster` sorting logic

### Task 16.2 — Unit tests for DTOs

File: `test/src/features/tours/data/tour_dto_test.dart`

- Test `TourSummaryDto.fromSupabase` with mock JSON
- Test `TourDetailDto.fromSupabase` with nested JSON (categories, waypoints, audio)
- Test `SavedTourDto.fromSupabase`

### Task 16.3 — Unit tests for repository

File: `test/src/features/tours/data/tour_repository_test.dart`

Using `mocktail`:
- Test online fetch calls remote and caches locally
- Test offline fetch returns cached data
- Test `saveTour` invalidates providers

### Task 16.4 — Unit tests for services

File: `test/src/features/tours/application/tour_purchase_service_test.dart`

- Test purchase with unauthenticated user returns `AuthError`
- Test successful purchase invalidates `savedToursProvider`

File: `test/src/features/tours/application/quill_guide_converter_test.dart`

- Test Quill Delta → GuideContent conversion with each block type
- Test GuideContent → Quill Delta round-trip

### Task 16.5 — Widget tests for key screens

File: `test/src/features/tours/presentation/city_tours_screen_test.dart`

- Test category filter changes filtered tour list
- Test empty state shown when no tours match category

File: `test/src/features/tours/presentation/tour_detail_screen_test.dart`

- Test `BuyFab` shows "Get for Free" for free tours
- Test `BuyFab` replaces with "Take a Tour" after purchase
- Test audio preview button hidden when no preview URL

### Task 16.6 — Integration test for full tour purchase flow

File: `test/integration_test/tour_purchase_flow_test.dart`

1. Launch app
2. Navigate to Tours tab
3. Select a country → city → tour
4. Press Buy
5. Verify tour appears in Saved Tours
6. Navigate to Saved Tours → verify cluster

### Task 16.7 — Integration test for guided tour flow

File: `test/integration_test/guided_tour_flow_test.dart`

1. Open a saved tour detail
2. Press "Take a Tour"
3. Verify map renders with markers
4. Verify bottom sheet audio controls are visible
5. Press play → verify audio plays (mock audio source)
6. Drag sheet up → verify guide text appears
7. Drag sheet down → verify only player bar visible
8. Press close → verify progress was saved

---

## 19. Folder Structure Reference

### Complete new folder structure after all phases

```
lib/src/features/tours/
├── README.md
├── domain/
│   ├── tour_models.dart
│   ├── tour_models.freezed.dart          # Generated
│   └── tour_models.g.dart                # Generated
├── data/
│   ├── tour_dto.dart
│   ├── tour_remote_data_source.dart
│   ├── tour_local_data_source.dart
│   ├── tour_repository.dart
│   └── mock_tour_repository.dart
├── application/
│   ├── tour_providers.dart
│   ├── tour_providers.g.dart              # Generated
│   ├── tour_purchase_service.dart
│   ├── tour_audio_service.dart
│   ├── tour_progress_service.dart
│   ├── tour_download_service.dart
│   ├── multi_tour_location_service.dart
│   ├── tts_preview_service.dart
│   ├── quill_guide_converter.dart         # Editor only
│   └── word_importer.dart                 # Editor only
└── presentation/
    ├── country_browse/
    │   ├── country_browse_screen.dart
    │   └── widgets/
    │       ├── country_header_widget.dart
    │       ├── city_cards_row.dart          # CityCard widget
    │       └── nearby_tours_section.dart    # Enhanced UX
    ├── city_tours/
    │   ├── city_tours_screen.dart
    │   └── widgets/
    │       ├── tour_category_chips.dart
    │       └── tour_list_card.dart
    ├── tour_detail/
    │   ├── tour_detail_screen.dart
    │   └── widgets/
    │       ├── tour_meta_row.dart
    │       ├── tour_full_description.dart
    │       ├── tour_route_section.dart
    │       ├── buy_fab.dart
    │       └── audio_preview_button.dart
    ├── saved_tours/
    │   ├── saved_tours_screen.dart
    │   ├── saved_city_tours_screen.dart
    │   └── widgets/
    │       └── city_cluster_tile.dart
    ├── guided_tour/
    │   ├── guided_tour_screen.dart
    │   └── widgets/
    │       ├── tour_map_layer.dart
    │       ├── tour_bottom_sheet.dart
    │       ├── guide_text_view.dart
    │       ├── audio_player_bar.dart
    │       └── waypoint_marker.dart
    └── creator_editor/               # Web only
        ├── creator_dashboard_screen.dart
        ├── tour_editor_screen.dart
        └── widgets/
            ├── metadata_panel.dart
            ├── guide_toolbar.dart
            ├── live_preview_panel.dart
            └── publish_tour_dialog.dart

supabase/
├── migrations/
│   └── YYYYMMDD_tour_schema.sql
└── functions/
    ├── generate-audio/index.ts
    ├── translate-tour/index.ts
    └── create-preview-clip/index.ts

test/src/features/tours/
├── domain/
│   └── tour_models_test.dart
├── data/
│   ├── tour_dto_test.dart
│   └── tour_repository_test.dart
└── application/
    ├── tour_purchase_service_test.dart
    └── quill_guide_converter_test.dart

test/integration_test/
├── tour_purchase_flow_test.dart
└── guided_tour_flow_test.dart
```

---

## Execution Order Summary

| Phase | Description | Est. Complexity |
|-------|-------------|-----------------|
| **0** | Dependencies, permissions, build baseline | Low |
| **1** | DB schema (Supabase migration + Drift tables) | Medium |
| **2** | Domain models (Freezed) + codegen | Medium |
| **3** | Data layer (DTOs, data sources, repository) | High |
| **4** | Application layer (providers, services) | High |
| **5** | Navigation extension (tab + routes) | Low |
| **6** | Country browse screen | Medium |
| **7** | City tours screen | Medium |
| **8** | Tour detail screen | High |
| **9** | Saved tours screens | Medium |
| **10** | Guided tour screen (map + bottom sheet) | Very High |
| **11** | Multi-tour location service | High |
| **12** | Audio system (background, progress, TTS) | High |
| **13** | Creator editor (web, Quill, publish flow) | Very High |
| **14** | Offline download support | Medium |
| **15** | Enhanced UX (heroes, nearby, share, etc.) | Medium |
| **16** | Tests (unit, widget, integration) | High |

> **Recommended execution order for an LLM agent:** Execute phases strictly in order 0 → 16. Phases 1-4 are blocking dependencies — do not proceed to Phase 5 until Phase 4 compiles. Run `build_runner` after every Freezed/Riverpod model addition.

---

*Plan authored for Dastan v1.x — March 2026*
