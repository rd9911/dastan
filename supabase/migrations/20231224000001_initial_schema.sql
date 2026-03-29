-- 1. Profiles (extends auth.users)
CREATE TABLE public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT,
  display_name TEXT,
  avatar_url TEXT,
  is_guest BOOLEAN DEFAULT false,
  search_count INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Itineraries
CREATE TABLE public.itineraries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  owner_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  destination TEXT,
  destination_lat DOUBLE PRECISION,
  destination_lng DOUBLE PRECISION,
  start_date DATE,
  end_date DATE,
  cover_image_url TEXT,
  is_public BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- 3. Collaboration
CREATE TABLE public.itinerary_members (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  itinerary_id UUID NOT NULL REFERENCES public.itineraries(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  role TEXT NOT NULL CHECK (role IN ('owner', 'editor', 'viewer')),
  invited_at TIMESTAMPTZ DEFAULT now(),
  accepted_at TIMESTAMPTZ,
  UNIQUE(itinerary_id, user_id)
);

-- 4. Saved Items
CREATE TABLE public.saved_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  itinerary_id UUID NOT NULL REFERENCES public.itineraries(id) ON DELETE CASCADE,
  section TEXT NOT NULL CHECK (section IN ('transport', 'accommodation', 'entertainment', 'gastronomy', 'events', 'trails')),
  title TEXT NOT NULL,
  details JSONB NOT NULL DEFAULT '{}',
  external_data JSONB,
  time_start TIMESTAMPTZ,
  time_end TIMESTAMPTZ,
  location_name TEXT,
  location_lat DOUBLE PRECISION,
  location_lng DOUBLE PRECISION,
  dedupe_key TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(itinerary_id, dedupe_key)
);

-- 5. Day Plans
CREATE TABLE public.day_plans (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  itinerary_id UUID NOT NULL REFERENCES public.itineraries(id) ON DELETE CASCADE,
  date DATE NOT NULL,
  entries JSONB NOT NULL DEFAULT '[]',
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(itinerary_id, date)
);

-- 6. Search Cache
CREATE TABLE public.search_cache (
  key TEXT PRIMARY KEY,
  vertical TEXT NOT NULL,
  response JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  expires_at TIMESTAMPTZ NOT NULL
);

-- Indexes
CREATE INDEX idx_itineraries_owner ON public.itineraries(owner_id);
CREATE INDEX idx_saved_items_itinerary ON public.saved_items(itinerary_id);
CREATE INDEX idx_day_plans_itinerary ON public.day_plans(itinerary_id);
CREATE INDEX idx_search_cache_expires ON public.search_cache(expires_at);
