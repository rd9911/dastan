# **Story 7 — Trails (routes with duration/difficulty, map-first, external map handoff) — TDD Task Plan**

**Scope recap:** In-itinerary only; prefill destination (and dates if relevant); **Map-first** with list parity; cards show **photo, name, duration, difficulty**; detail adds gallery and **Show on map** (in-app or **external maps** handoff); saves auto-bind `{ itineraryId:<Active>, section:"trails" }`; cache where practical; dedupe: `hash(itineraryId | location.name | durationMinutes | difficulty | website)`.

Stack continuity: reuse Story-1 guard, SaveUseCase, SyncOrchestrator, DAOs; reuse Entertainment/Events **map/list sync** patterns.

---

## **Phase A — Models, Validation & Dedupe (tests first)**

**A1. Contracts: search, card, detail, saved item**

* **Write tests:** JSON round-trip & validation for:

  * `TrailsSearchRequest { context.itineraryId, place{granularity,value}, filters?, sort?, pagination? }`

  * `TrailResultCard { id,name,thumbnail,durationMinutes,difficulty,location{lat,lng,distanceFromCenterKm?},website? }`

  * `TrailDetail { ... + elevationGainM?, distanceKm?, media[] }`

  * `SavedItem.trails` shape requires `{ itineraryId, section:'trails', details{durationMinutes,difficulty,...}, location, dedupeKey }`.

* **Implement:** Dart `freezed` \+ `json_serializable` per spec fields.

* **Exit:** All contract tests pass.

**A2. Dedupe helper**

* **Write tests:** deterministic `dedupeKey = hash(itineraryId | location.name | durationMinutes | difficulty | website)`; different itinerary → different key.

* **Implement:** pure `makeTrailDedupeKey(item, itineraryId)` with docs.

* **Exit:** Snapshot tests green.

**A3. Difficulty normalization**

* **Write tests:** vendor difficulty/elevation inputs → normalized enum `easy|moderate|hard`.

* **Implement:** `normalizeDifficulty({elevationGainM, grade?, vendorLabel?})`.

* **Exit:** Unit tests pass.

---

## **Phase B — Local DB, Caching & Repos**

**B1. Drift schema & DAOs**

* **Write tests:** migration adds `trails_cache(key TEXT, payload BLOB, ttl INTEGER, createdAt)`; indices for `saved_items` `(itinerary_id, dedupe_key)` scoped to section `'trails'`.

* **Implement:** schema \+ DAO; fwd/back migration tests.

* **Exit:** DB tests pass.

**B2. Repository contracts & decorator**

* **Write tests (mocked HTTP):**

  * `TrailsRepo.search(request,cursor?) → { items, page }`

  * `TrailsRepo.detail(id) → TrailDetail`

  * abort on filter/sort/map-change; retries with jitter; typed failures.

* **Implement:** Dio client (+ optional Supabase Edge); caching decorator using `trails_cache` with TTL; evict on itinerary switch.

* **Exit:** Contract \+ cache hit/stale/miss tests pass.

---

## **Phase C — Route, Guard & Prefill**

**C1. Route guard**

* **Write tests (router):** `/search/trails` requires Active Itinerary; after select/create, resume route.

* **Implement:** GoRouter with Story-1 guard.

* **Exit:** Router tests pass.

**C2. Prefill service**

* **Write tests:** with Active Itinerary, emit destination (and optional date window); nulls if missing.

* **Implement:** `TrailsPrefillService` reading Active Itinerary.

* **Exit:** Prefill tests pass.

---

## **Phase D — Map-First UX with List Parity**

**D1. Single source of truth store**

* **Write tests:** bounds toggle filters the same set for map & list; pagination consistent; switching views preserves selection.

* **Implement:** results store used by both views; viewport filter behind toggle “Only items in view”.

* **Exit:** Sync tests pass.

**D2. Map view**

* **Write tests:** clustered pins; tap → mini-card (thumbnail, name, duration, difficulty, **Save**, **Details**).

* **Implement:** map widget \+ clustering; mini-card actions.

* **Exit:** Map widget tests pass.

**D3. List view**

* **Write tests:** cards show photo, name, duration, difficulty; skeletons; “Show on map” quick action.

* **Implement:** results list composing from normalized cards.

* **Exit:** Widget/golden tests pass.

---

## **Phase E — Detail Page & Map Handoff**

**E1. Detail screen**

* **Write tests:** gallery, duration, difficulty (normalized), elevation gain/distance (if present), **Show on map** button.

* **Implement:** lazy sections \+ chips; distance from center badge if available.

* **Exit:** Detail tests pass.

**E2. External maps handoff**

* **Write tests:** build sanitized deep links for Google Maps / OSM; open in external browser; error path.

* **Implement:** `openExternalMap({lat,lng,name})` utility.

* **Exit:** Handoff tests green.

---

## **Phase F — Save/Unsave, Offline Queue & Map Layer**

**F1. Save integration**

* **Write tests:** pressing **Save** creates `SavedItem { itineraryId:<Active>, section:'trails' }` and shows immediately in Overview; dedupe → **Saved** state; pressing **Saved** unsaves with snackbar.

* **Implement:** reuse `SaveUseCase` \+ `makeTrailDedupeKey`; optimistic UI.

* **Exit:** Integration tests pass.

**F2. Offline queue**

* **Write tests:** offline save shows **“Syncing…”** badge; reconnect drains queue; failure exposes **Retry**.

* **Implement:** existing `SyncOrchestrator` \+ badge bound to `sync.status`.

* **Exit:** Offline tests pass.

**F3. Itinerary map presence**

* **Write tests:** saved Trails appear on unified itinerary map layer with correct icon; parity with section list.

* **Implement:** register Trails layer/pin renderer.

* **Exit:** Map-layer tests pass.

---

## **Phase G — Filters, Sort, A11y, i18n, Telemetry**

**G1. Filters & sort**

* **Write tests:** filters `{durationMaxMinutes, difficulty, elevationGainMin/Max, loopOnly, kidFriendly, dogFriendly}`; sort `recommended|duration|difficulty|distance`.

* **Implement:** filter state \+ query builder; server/client sort comparators.

* **Exit:** Unit & widget tests pass.

**G2. Accessibility & i18n**

* **Write tests:** alt text for images; chip labels; localized units (km/mi, m/ft).

* **Implement:** semantics \+ `intl`.

* **Exit:** A11y/i18n tests pass.

**G3. Telemetry**

* **Write tests (spy):** `trails_search`, `trails_result_view`, `filter_applied`, `trails_map_viewed`, `trail_opened`, `trail_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Implement:** analytics hooks.

* **Exit:** Events verified.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate:

1. **AC1 — Guard:** no Active Itinerary ⇒ blocking select/create ⇒ resume Trails.

2. **AC2 — Card content:** photo, name, **duration**, **difficulty**, Save/Share.

3. **AC3 — Detail & handoff:** gallery, duration/difficulty; **Show on map** opens in-app or external map.

4. **AC4 — Save auto-binds:** immediate appearance under Trails; optimistic UI.

5. **AC5 — Map presence:** saved Trails visible on itinerary map.

6. **AC6 — Offline & caching:** “Syncing…” then later sync; cached trail responses used where reasonable.

7. **AC7 — Dedupe:** already-saved shows **Saved**; pressing unsaves; snackbar confirms.

---

## **Deliverables**

* **Models & DAOs:** trail models; `trails_cache` TTL table.

* **Repo:** `TrailsRepo` (search, detail) with cancel/retry \+ cache decorator.

* **State:** prefill service; filters/sort \+ bounds toggle; unified results store.

* **UI:** `/search/trails` (map-first), list view, details page, external map handoff.

* **Save integration:** deduped, offline-first saves bound to Active Itinerary.

* **Tests:** full unit, widget, integration, and E2E per phases.

* **Docs:** `README_Story7.md` with run commands & AC traceability.

---

