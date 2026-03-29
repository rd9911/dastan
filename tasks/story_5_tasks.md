# **Story 5 — Gastronomy (restaurants, cafés, dietary filters) — TDD Task Plan**

**Scope recap:** In-itinerary only. Prefill destination; list cards show swipeable photos, **name, rating, price tag**; details include **menu, photos, facilities (dogs/kids/noise), opening hours per weekday, location, phone, website**; cache where reasonable; pins on the itinerary map; all saves auto-bind `{ itineraryId:<Active>, section:"gastronomy" }`.

Stack continuity: reuse Story-1 Active Itinerary guard, SaveUseCase, SyncOrchestrator, and DAOs; reuse map/list parity patterns from Entertainment.

---

## **Phase A — Data contracts, validation & dedupe (tests first)**

**A1. Models**

* **Write tests**: JSON round-trip & validation for  
   `GastronomySearchRequest`, `GastronomyResultCard`, `GastronomyPlaceDetail`, and `SavedItem.gastronomy`.  
   Required: request `{context.itineraryId, place{granularity,value}}`; card `{id,name,thumbnail,rating,priceTag,location}`.

* **Implement**: Dart `freezed` models \+ `json_serializable` per contract snippets.

**A2. Dedupe key**

* **Write tests**: deterministic  
   `dedupeKey = hash(itineraryId | location.name | address | website)`; different itinerary ⇒ different key; identical fields ⇒ identical key.

* **Implement**: pure helper with doc comments.

**A3. Drift schema**

* **Write tests**: migration adds `gast_cache` (TTL, key, payload); index `(itinerary_id, dedupe_key)` for `saved_items` where `section='gastronomy'`.

* **Implement**: schema \+ DAO; migration forward/backward tests.

---

## **Phase B — Prefill, repositories, caching**

**B1. Prefill orchestration**

* **Write tests**: with Active Itinerary, prefill **destination**; if none, search form requires it.

* **Implement**: `GastronomyPrefillService` reading Active itinerary store.

**B2. Repository contracts**

* **Write tests (mocked HTTP)** for:

  * `search(request, cursor?) → {items,page}` (supports filters/sort).

  * `detail(id) → GastronomyPlaceDetail` (menu, facilities, opening hours, contact).

  * **Abort** on filter/sort change; **retries with jitter**; typed failures.

* **Implement**: `GastronomyRepo` (Dio or Supabase Edge); sanitize & validate.

**B3. Cache strategy**

* **Write tests**: normalized key includes `(place, filters, sort)`; respects vendor TTLs; **evict on itinerary switch**.

* **Implement**: repository decorator \+ `gast_cache` DAO with TTL.

---

## **Phase C — Route, guard, and search form**

**C1. Route \+ guard**

* **Write tests (router)**: `/search/gastronomy` requires Active Itinerary; selecting/creating one resumes route.

* **Implement**: GoRouter route using Story-1 guard.

**C2. Search form (widget \+ golden)**

* **Write tests**:

  * Prefill destination; validate when missing.

  * Filters: **dietary (vegan/vegetarian/halal/kosher/gluten-free)**, **cuisine**, **price band**, **rating**, **open-now**, **kid-friendly**, **dog-friendly**, **noise level**; sort: `recommended | rating | price | distance | openNow`.

* **Implement**: chip/drawer filters with Riverpod state; sticky **Search** CTA.

---

## **Phase D — Results list, Map parity, details & handoff**

**D1. Results list**

* **Write tests**: cards show **swipeable photos, name, rating, price tag**, quick badges (vegan/kid-friendly/dog-friendly/quiet); pagination; skeletons.

* **Implement**: `GastronomyResultsList` \+ image pager.

**D2. Map parity**

* **Write tests**: single source of truth list; **map pins** in sync; “show only within map bounds” toggle; pin mini-card with **Save/Details**.

* **Implement**: map widget & clustering like Entertainment; bounds filter toggle.

**D3. Details page**

* **Write tests**: **Menu**, gallery, facilities (dogs/kids/noise), **opening hours (Mon–Sun)**, address map snippet, **phone**, **website** buttons.

* **Implement**: detail screen with lazy sections; opening-hours table parser & normalizer.

**D4. Website/Call handoff**

* **Write tests**: sanitize external URL; open in external browser; phone via dialer; error paths.

* **Implement**: safe launcher utilities.

---

## **Phase E — Save/Unsave, offline queue, map presence**

**E1. Save integration**

* **Write tests**:

  * Press **Save** on card/detail ⇒ create `SavedItem { itineraryId:<Active>, section:'gastronomy' }`; appears immediately in **Gastronomy** under Overview.

  * Dedupe: previously saved item in same itinerary shows **Saved**; pressing **Saved** unsaves with snackbar.

* **Implement**: reuse `SaveUseCase` with gastronomy `dedupeKey`.

**E2. Offline queue**

* **Write tests**: offline save shows **“Syncing…”** badge; reconnect drains queue; failure exposes **Retry**.

* **Implement**: reuse `SyncOrchestrator` \+ badge bound to `sync.status`.

**E3. Map layer for saved items**

* **Write tests**: saved Gastronomy items appear on itinerary map layer with the correct icon; visible when opening the trip map.

* **Implement**: layer registration & icon mapping.

---

## **Phase F — Errors, resilience, A11y, i18n, telemetry**

**F1. Errors & resilience**

* **Write tests**: abort in-flight on filter/sort changes; retries with jitter; graceful error UI with **Retry**.

* **Implement**: cancellable repo calls; shared error banner.

**F2. Accessibility & i18n**

* **Write tests**: alt text for images; readable tap targets; focus order; localized copy/units.

* **Implement**: semantics \+ `intl` strings.

**F3. Telemetry**

* **Write tests (spy)**: `gast_search`, `gast_result_view`, `filter_applied`, `map_viewed`, `gast_place_opened`, `gast_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Implement**: analytics adapter hooks.

---

## **Phase G — Acceptance Criteria → Gherkin E2E**

Automate these end-to-end flows:

1. **AC1 — Guard**: opening Gastronomy without Active Itinerary blocks; after selection, continue; subsequent saves bind to that itinerary.

2. **AC2 — Prefill & filters**: itinerary destination (e.g., Rome) prefilled; all dietary/cuisine/price/rating/open-now/kid/dog/noise filters work; list shows photo, name, rating, price tag.

3. **AC3 — Details completeness**: detail shows menu, photos, facilities, opening hours per weekday, location, phone, website.

4. **AC4 — Save auto-binds**: Save creates item under **Gastronomy** immediately (optimistic).

5. **AC5 — Offline queue & caching**: offline save shows **Syncing…**; later sync clears; search responses come from cache when fresh.

6. **AC6 — Map presence**: saved Gastronomy items visible in itinerary map layer.

7. **AC7 — Dedupe**: already-saved item shows **Saved**; pressing unsaves; snackbar confirms.

---

## **Deliverables**

* **Models & DAOs:** gastronomy models; `gast_cache` TTL table.

* **Repo:** `GastronomyRepo` (search, detail) with cancel/retry \+ cache decorator.

* **State:** prefill service; filters/sort state; unified results store; map-bounds toggle.

* **UI:** `/search/gastronomy` (form), results list with swipeable photos, map parity, details page with menu \+ opening hours.

* **Save integration:** deduped, offline-first saves bound to Active Itinerary.

* **Tests:** unit, widget, integration, and E2E as above.

* **Docs:** `README_Story5.md` with run commands and AC traceability.

---

