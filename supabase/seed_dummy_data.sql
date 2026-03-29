-- ─────────────────────────────────────────
-- SEED DATA FOR TOURS FEATURE (FOOLPROOF VERSION)
-- ─────────────────────────────────────────

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 1. CLEANUP (Careful: this resets everything tour-related)
DELETE FROM tour_playback_progress;
DELETE FROM saved_tours;
DELETE FROM multi_tour_items;
DELETE FROM tour_audio_versions;
DELETE FROM tour_waypoints;
DELETE FROM tour_category_mappings;
DELETE FROM tour_guide_content;
DELETE FROM tours;
DELETE FROM cities;
DELETE FROM countries;

-- Clear previous dummy users by email to avoid ID/foreign key conflicts
DELETE FROM public.profiles WHERE email LIKE 'guide%@example.com';
DELETE FROM auth.users WHERE email LIKE 'guide%@example.com';

-- 2. FOOLPROOF SEEDING USING VARIABLES AND GENERATED UUIDS
DO $$
DECLARE
    -- Country IDs
    v_uz_id UUID := gen_random_uuid();
    v_fr_id UUID := gen_random_uuid();
    -- City IDs
    v_sam_id UUID := gen_random_uuid();
    v_bukh_id UUID := gen_random_uuid();
    v_par_id UUID := gen_random_uuid();
    -- User IDs
    v_u1_id UUID := gen_random_uuid();
    v_u2_id UUID := gen_random_uuid();
    -- Tour IDs
    v_t1_id UUID := gen_random_uuid();
    v_t2_id UUID := gen_random_uuid();
    v_t3_id UUID := gen_random_uuid();
    -- Category IDs
    v_cat_hist UUID;
    v_cat_arch UUID;
BEGIN
    -- [Users]
    INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at, role, instance_id)
    VALUES
      (v_u1_id, 'guide1@example.com', crypt('password123', gen_salt('bf')), now(), '{"provider":"email","providers":["email"]}', '{"full_name":"Ahmad Samarkandi"}', now(), now(), 'authenticated', '00000000-0000-0000-0000-000000000000'),
      (v_u2_id, 'guide2@example.com', crypt('password123', gen_salt('bf')), now(), '{"provider":"email","providers":["email"]}', '{"full_name":"Elena Petrovna"}', now(), now(), 'authenticated', '00000000-0000-0000-0000-000000000000');

    -- [Countries]
    INSERT INTO countries (id, name, description, hero_image_url, flag_emoji, sort_order) VALUES
      (v_uz_id, 'Uzbekistan', 'Silk Road heart.', 'https://images.unsplash.com/photo-1528154291023-a6521f4a5c27', '🇺🇿', 1),
      (v_fr_id, 'France', 'Art and Light.', 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34', '🇫🇷', 2);

    -- [Cities]
    INSERT INTO cities (id, country_id, name, description, hero_image_url, latitude, longitude, sort_order) VALUES
      (v_sam_id, v_uz_id,  'Samarkand', 'Ancient Timurid capital.', 'https://images.unsplash.com/photo-1619890831032-9df72646d900', 39.6542, 66.9597, 1),
      (v_bukh_id, v_uz_id, 'Bukhara',   'Holy city.', 'https://images.unsplash.com/photo-1589104764070-128229babbdc', 39.7747, 64.4286, 2),
      (v_par_id, v_fr_id,  'Paris',     'Cultural icon.', 'https://images.unsplash.com/photo-1499856871958-5b9627545d1a', 48.8566, 2.3522, 1);

    -- [Tours]
    INSERT INTO tours (id, city_id, name, tagline, full_description, main_image_url, duration_minutes, price_usd, type, is_published, creator_id, is_free, review_count) VALUES
      (v_t1_id, v_sam_id, 'Registan Square Wonders', 'Silk Road Jewel.', 'Magnificent madrasahs.', 'https://images.unsplash.com/photo-1619890831032-9df72646d900', 45, 15.00, 'single', true, v_u1_id, false, 0),
      (v_t2_id, v_bukh_id, 'Ancient Bukhara', 'Time Travel.', 'Historical center.', 'https://images.unsplash.com/photo-1589104764070-128229babbdc', 60, 12.00, 'single', true, v_u2_id, false, 0),
      (v_t3_id, v_par_id,  'Montmartre Walk', 'Art City.', 'Picasso studios.', 'https://images.unsplash.com/photo-1503917988258-f87a78e3c995', 90, 20.00, 'single', true, v_u1_id, false, 0);

    -- [Guide Content]
    INSERT INTO tour_guide_content (tour_id, content, version) VALUES
      (v_t1_id, '[{"id":"1","chapterTitle":"Start","blocks":[{"type":"text","content":"Welcome!"}]}]'::jsonb, 1),
      (v_t2_id, '[{"id":"1","chapterTitle":"Start","blocks":[{"type":"text","content":"Old city..."}]}]'::jsonb, 1),
      (v_t3_id, '[{"id":"1","chapterTitle":"Start","blocks":[{"type":"text","content":"Paris vibes..."}]}]'::jsonb, 1);

    -- [Waypoints]
    INSERT INTO tour_waypoints (id, tour_id, order_index, label, latitude, longitude, radius_meters) VALUES
      (gen_random_uuid(), v_t1_id, 0, 'Entry', 39.6548, 66.9754, 50),
      (gen_random_uuid(), v_t2_id, 0, 'Sqr', 39.7747, 64.4286, 50),
      (gen_random_uuid(), v_t3_id, 0, 'Artist', 48.8867, 2.3431, 50);

    -- [Audio Versions]
    INSERT INTO tour_audio_versions (id, tour_id, language_code, audio_url, status, duration_seconds) VALUES
      (gen_random_uuid(), v_t1_id, 'en', 'https://...', 'ready', 300),
      (gen_random_uuid(), v_t2_id, 'en', 'https://...', 'ready', 210),
      (gen_random_uuid(), v_t3_id, 'en', 'https://...', 'ready', 180);

    -- [Category Mappings]
    SELECT id INTO v_cat_hist FROM tour_categories WHERE name = 'historical';
    SELECT id INTO v_cat_arch FROM tour_categories WHERE name = 'architecture';

    IF v_cat_hist IS NOT NULL THEN
        INSERT INTO tour_category_mappings (tour_id, category_id) VALUES (v_t1_id, v_cat_hist), (v_t2_id, v_cat_hist);
    END IF;
    IF v_cat_arch IS NOT NULL THEN
        INSERT INTO tour_category_mappings (tour_id, category_id) VALUES (v_t1_id, v_cat_arch);
    END IF;

END $$;
