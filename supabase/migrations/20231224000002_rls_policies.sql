-- Enable RLS on all tables
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.itineraries ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.itinerary_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.saved_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.day_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.search_cache ENABLE ROW LEVEL SECURITY;

-- 1. Profiles
CREATE POLICY "Public profiles are viewable by everyone" 
ON public.profiles FOR SELECT USING (true);

CREATE POLICY "Users can update own profile" 
ON public.profiles FOR UPDATE USING (auth.uid() = id);

-- 2. Itineraries
CREATE POLICY "Itineraries viewable by owner, members, or if public"
ON public.itineraries FOR SELECT USING (
  owner_id = auth.uid() 
  OR id IN (SELECT itinerary_id FROM public.itinerary_members WHERE user_id = auth.uid())
  OR is_public = true
);

CREATE POLICY "Users can create itineraries"
ON public.itineraries FOR INSERT WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Owners can update itineraries"
ON public.itineraries FOR UPDATE USING (auth.uid() = owner_id);

CREATE POLICY "Owners can delete itineraries"
ON public.itineraries FOR DELETE USING (auth.uid() = owner_id);

-- 3. Itinerary Members
CREATE POLICY "Members viewable by itinerary participants"
ON public.itinerary_members FOR SELECT USING (
  itinerary_id IN (
    SELECT id FROM public.itineraries WHERE owner_id = auth.uid()
    UNION
    SELECT itinerary_id FROM public.itinerary_members WHERE user_id = auth.uid()
  )
);

-- 4. Saved Items & Day Plans
-- These follow the same "member access" logic
CREATE POLICY "Items viewable by members"
ON public.saved_items FOR SELECT USING (
  itinerary_id IN (
    SELECT id FROM public.itineraries WHERE owner_id = auth.uid()
    UNION
    SELECT itinerary_id FROM public.itinerary_members WHERE user_id = auth.uid()
  )
);

CREATE POLICY "Editors can modify items"
ON public.saved_items FOR ALL USING (
  itinerary_id IN (
    SELECT id FROM public.itineraries WHERE owner_id = auth.uid()
    UNION
    SELECT itinerary_id FROM public.itinerary_members 
    WHERE user_id = auth.uid() AND role IN ('owner', 'editor')
  )
);

CREATE POLICY "Plans viewable by members"
ON public.day_plans FOR SELECT USING (
  itinerary_id IN (
    SELECT id FROM public.itineraries WHERE owner_id = auth.uid()
    UNION
    SELECT itinerary_id FROM public.itinerary_members WHERE user_id = auth.uid()
  )
);

CREATE POLICY "Editors can modify plans"
ON public.day_plans FOR ALL USING (
  itinerary_id IN (
    SELECT id FROM public.itineraries WHERE owner_id = auth.uid()
    UNION
    SELECT itinerary_id FROM public.itinerary_members 
    WHERE user_id = auth.uid() AND role IN ('owner', 'editor')
  )
);

-- 5. Search Cache (Admin/Service Role only usually, but for Edge Functions)
CREATE POLICY "Service can manage cache"
ON public.search_cache FOR ALL USING (false) WITH CHECK (false); 
-- Note: Service role bypasses RLS, so this table is effectively hidden from public/users.
