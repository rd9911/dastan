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

ALTER TABLE tour_categories ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read tour categories" ON tour_categories FOR SELECT USING (TRUE);

ALTER TABLE tour_category_mappings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read tour category mappings"
  ON tour_category_mappings FOR SELECT
  USING (EXISTS (SELECT 1 FROM tours WHERE tours.id = tour_id AND tours.is_published = TRUE));

ALTER TABLE tour_waypoints ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read tour waypoints"
  ON tour_waypoints FOR SELECT
  USING (EXISTS (SELECT 1 FROM tours WHERE tours.id = tour_id AND tours.is_published = TRUE));

ALTER TABLE multi_tour_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public read multi-tour items"
  ON multi_tour_items FOR SELECT
  USING (EXISTS (SELECT 1 FROM tours WHERE tours.id = multi_tour_id AND tours.is_published = TRUE));

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
