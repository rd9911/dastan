# **Story 8 — Itinerary Map (Unified Layers & Shareable Snapshot) — TDD Task Plan**

**Scope recap:** One interactive map for the **Active Itinerary** with togglable layers (Transport, Accommodation, Entertainment, Gastronomy, Events, Trails) and a **Photos** layer; map/list parity; **Add Photo** to a pin; **Create Shareable Snapshot** wizard (bounds, theme, up to N highlights) producing a high-res image; offline-readiness; strong privacy (no PII/hidden metadata in snapshots); smooth performance.

---

## **Phase A — Contracts & State (tests first)**

**A1. Map state & item contracts**

* **Write tests:** JSON round-trip & validation for `MapState{itineraryId,bounds,zoom,visibleLayers,filters{timeWindow,openNow,inViewOnly}}`; `MapItem{id,section,lat,lng,title,external?,media?,dedupeKey}`.

* **Implement:** `freezed` models \+ `json_serializable`; enums for sections; validators for required fields.

* **Exit:** Model tests pass.

**A2. Snapshot API shapes & idempotency**

* **Write tests:** `MapSnapshotRequest{itineraryId,bounds,zoom,theme,title,dates,highlights<=10}` and `MapSnapshotResponse{snapshotId,imageUrl,createdAt}`; verify `snapshotId = hash(itineraryId|bounds|zoom|theme|highlights[])`.

* **Implement:** pure hasher \+ DTOs; unit tests for deterministic IDs.

* **Exit:** All green.

**A3. Unified results store (Riverpod)**

* **Write tests:** single source of truth emits: (a) all items for Active Itinerary, (b) filtered slice by viewport & layer toggles, (c) list↔map parity events.

* **Implement:** `ItineraryMapStore` with selectors for layers, bounds, time filters; emits diff events for performance.

* **Exit:** Store tests pass.

---

## **Phase B — Local DB & Caching**

**B1. Tile & geojson cache schema (Drift)**

* **Write tests:** migration creates `tile_cache` & `map_items_cache` keyed by `{itineraryId,boundsZoomHash}` with TTL; purge on itinerary switch.

* **Implement:** DAOs \+ eviction; unit tests for hit/miss/expiry.

* **Exit:** DB tests pass.

**B2. Item assemblers per section**

* **Write tests:** adapters transform Saved Items from sections into `MapItem` with correct icon/meta; Trails include optional lightweight polyline.

* **Implement:** composable mappers; ensure no PII fields.

* **Exit:** Adapter tests pass.

---

## **Phase C — Routes, Guards, Map/List Parity**

**C1. Route & guard**

* **Write tests (router):** `/map` requires Active Itinerary; after select/create, resume to Map.

* **Implement:** GoRouter guard (reuse Story-1); deep-link safe resume.

* **Exit:** Router tests pass.

**C2. Map UI (clustered pins, layer chips, quick filters)**

* **Write tests (widget):**

  * Layer chips toggle visibility; badges show counts.

  * “Only items in view” filters list accordingly; panning changes the adjacent list.

* **Implement:** Map widget with clustering \+ sticky chips; viewport listener → store.

* **Exit:** Widget & golden tests pass.

**C3. List pane parity**

* **Write tests:** list reflects items in current bounds & filters; selecting a list row pulses the matching pin.

* **Implement:** list binds to filtered selector; cross-highlight communication.

* **Exit:** Parity tests pass.

---

## **Phase D — Pin Interactions & Photo Layer**

**D1. Mini-card actions**

* **Write tests:** tapping a pin opens mini-card with **Details**, **Save/Unsave**, **Navigate** (external maps).

* **Implement:** mini-card component & URL sanitizer for navigation.

* **Exit:** Tests pass.

**D2. Attach user photos (Photos layer)**

* **Write tests:** Add Photo associates `photo{itemId,lat,lng,url}` to pin; ACLs: owner \+ collaborators; non-collaborators cannot view unless exported snapshot.

* **Implement:** photo store, upload to Supabase Storage with itinerary-scoped ACL; render as a toggleable Photos layer.

* **Exit:** ACL & rendering tests pass.

---

## **Phase E — Snapshot Wizard & Renderer**

**E1. Wizard flow**

* **Write tests (widget):** bounds picker, theme (light/dark), select up to N highlights, drag-to-reorder, watermark toggle; validation prevents \>N.

* **Implement:** 3-step wizard; preview pane using canvas.

* **Exit:** Wizard tests pass.

**E2. Rendering strategy & idempotency**

* **Write tests (integration):** repeated requests with identical inputs return same `snapshotId` and image; EXIF/PII stripped; only chosen highlights & visible pins appear.

* **Implement:** client canvas → image (or call Edge Function headless renderer); enforce idempotency hash; strip EXIF; mask hidden layers.

* **Exit:** Privacy & idempotency tests pass.

**E3. Upload & share**

* **Write tests:** successful generation uploads artifact, returns `imageUrl`; share sheet opens; revocable link optional (future story).

* **Implement:** upload via Supabase Storage; return `MapSnapshotResponse`.

* **Exit:** Contract tests pass.

---

## **Phase F — Offline Readiness, Performance & Resilience**

**F1. Offline rendering**

* **Write tests (E2E):** when offline with cached tiles/items, map renders, “Using cached tiles and items” notice shows; snapshot works if assets cached.

* **Implement:** offline path with caches; guardrails when tiles missing.

* **Exit:** E2E passes.

**F2. Perf & smoothness**

* **Write tests (perf):** rapid toggle & pan keeps jank under threshold; progressive pin rendering.

* **Implement:** virtualized list, pin throttling, worker isolates for clustering.

* **Exit:** Perf tests green.

**F3. Networking resilience**

* **Write tests:** retries with jitter for tile/item fetch; graceful cancel on viewport/filter changes; error UI with retry.

* **Implement:** cancellable requests \+ backoff.

* **Exit:** Reliability tests pass.

---

## **Phase G — Security, Privacy, A11y, i18n, Telemetry**

**G1. Privacy & security checks**

* **Write tests:** snapshot strips EXIF & itinerary PII (emails, booking IDs, notes); external links sanitized.

* **Implement:** sanitizer pipeline; PII filter.

* **Exit:** Privacy tests pass.

**G2. Accessibility & i18n**

* **Write tests:** large tap targets, SR announcements for selected pins, localized labels & units.

* **Implement:** semantics \+ `intl`.

* **Exit:** A11y/i18n tests pass.

**G3. Telemetry**

* **Write tests (spy):** `map_opened`, `layer_toggled`, `viewport_changed`, `snapshot_requested`, `snapshot_generated`, `tile_cache_hit`.

* **Implement:** analytics hooks.

* **Exit:** Events verified.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate:

1. **AC1 — Active-itinerary only & layer toggles.** Pins/polylines reflect only the Active Itinerary; toggles show/hide sections.

2. **AC2 — Photos layer visibility.** Owner & collaborators see attached photos; others don’t unless via exported snapshot.

3. **AC3 — Map/list parity.** Pan/zoom or filter updates list and vice versa.

4. **AC4 — Snapshot generation.** Select bounds/theme/highlights → receive high-res image of map \+ pins \+ highlights.

5. **AC5 — Offline-readiness.** Cached tiles/items render offline; snapshot works if assets cached.

6. **AC6 — Privacy & safety.** No PII/booking IDs/internal notes in image; only selected thumbnails and visible pins rendered.

7. **AC7 — Performance.** Rapid layer toggles/pans remain smooth (no jank).

---

## **Deliverables**

* **Models & State:** `MapState`, `MapItem`, `MapSnapshot*` DTOs; `ItineraryMapStore`.

* **DB & Cache:** `tile_cache`, `map_items_cache` with TTL \+ eviction.

* **UI:** `/map` screen (clustered map \+ sticky layer chips \+ list pane), pin mini-card, photo attachment flow, snapshot wizard.

* **Renderer & Upload:** canvas/edge snapshot renderer with EXIF/PII stripping; upload to Storage; idempotent `snapshotId`.

* **Tests:** unit (contracts, filters, idempotency), widget (map/list parity, wizard), integration (offline & caching), perf (jank), E2E (all ACs).

* **Docs:** `README_Story8.md` with run commands, caching strategy, and AC traceability.

---

