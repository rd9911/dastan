# **Story 6 — Events (date-bound happenings) — TDD Task Plan**

**Scope recap:** In-itinerary only; prefill destination \+ visit dates; list & **Map** parity; details with start/end time, venue, description, photos, **Website/Tickets**; **Save** auto-binds `{ itineraryId:<Active>, section:"events" }`; cache where practical; **calendar-conflict** helper (e.g., overlaps flights); offline queue; dedupe: `hash(itineraryId | title | start | venue.name | website)`.

Stack continuity: reuse Story-1 guard, SaveUseCase, SyncOrchestrator, DAOs; reuse list/map patterns from Entertainment; extend with event-specific contracts & calendar awareness.

---

## **Phase A — Models, Validation, Dedupe (tests first)**

**A1. Canonical models**

* **Write tests:** JSON round-trip & validation for  
   `EventsSearchRequest { context.itineraryId, place{granularity,value}, dateWindow{start,end}, filters? }`,  
   `EventCard { id,title,category,start,end?,venue{ name,lat,lng },leadImage }`,  
   `EventDetail { ... + photos[], descriptionShort/full, external{ website,ticketUrl } }`.

* **Implement:** Dart `freezed` \+ `json_serializable` per provided schema.

**A2. Dedupe helper**

* **Write tests:** deterministic `dedupeKey = hash(itineraryId|title|start|venue.name|website)`; different itinerary ⇒ different key.

* **Implement:** pure function with docs.

**A3. Drift schema**

* **Write tests:** migration adds `events_cache` (key, payload, ttl, createdAt); indices for `saved_items` on `(itinerary_id, dedupe_key)` scoped to section `'events'`.

* **Implement:** schema \+ DAO \+ migration tests (fwd/back).

---

## **Phase B — Prefill, Repository, Caching**

**B1. Prefill orchestration**

* **Write tests:** with Active Itinerary (and optional hotel/transport), emit destination \+ dateWindow; nulls if missing.

* **Implement:** `EventsPrefillService` reading active itinerary & recent accommodation/transport context.

**B2. Repository contracts**

* **Write tests (mocked HTTP):**  
   `search(request,cursor?) → {items,page}`, `detail(id) → EventDetail`; abort on filter/sort change; retries with jitter; typed failures.

* **Implement:** `EventsRepo` (Dio/Edge functions), sanitize URLs.

**B3. Cache strategy**

* **Write tests:** key by `(place, dateWindow, filters, sort)`; respect vendor TTLs; **evict on itinerary switch**.

* **Implement:** repo decorator \+ `events_cache` DAO.

---

## **Phase C — Route, Guard, Search Form**

**C1. Route & guard**

* **Write tests (router):** `/search/events` requires Active Itinerary; after select/create, resume to Events.

* **Implement:** GoRouter with Story-1 guard.

**C2. Search form (widget \+ golden)**

* **Write tests:** prefilled destination \+ dates; chips: **category (concert/theatre/sports/festival/exhibition), during-my-dates, free, family-friendly, now/this weekend**; sticky **Search** CTA; validation.

* **Implement:** Riverpod form state \+ helpers.

---

## **Phase D — Results, Map parity, Details, Handoff**

**D1. Results list**

* **Write tests:** date-sorted cards show lead image, title, category chip, date/time pill, venue, distance from center; pagination \+ skeletons.

* **Implement:** `EventsResultsList`.

**D2. Map parity**

* **Write tests:** single source of truth; toggling “show only within map bounds” filters list; pin → mini-card (Save/Details).

* **Implement:** clustered map with bounds toggle; stays in sync with list.

**D3. Details page**

* **Write tests:** swipeable photos; Save/Share; short→full description; venue map snippet; start/end time; **Website/Tickets** buttons.

* **Implement:** detail screen with lazy sections & URL sanitizer.

**D4. External handoff**

* **Write tests:** open website/ticket URL in external browser; invalid URL → graceful error.

* **Implement:** safe launcher util.

---

## **Phase E — Save/Unsave, Offline, Calendar Awareness**

**E1. Save integration**

* **Write tests:** pressing **Save** on card/detail creates `SavedItem { itineraryId:<Active>, section:'events' }` and shows immediately under **Events**; dedupe toggles **Saved** and supports unsave with snackbar.

* **Implement:** reuse `SaveUseCase`; wire dedupe helper.

**E2. Offline queue**

* **Write tests:** offline save shows **“Syncing…”** badge; reconnect drains queue; failure exposes **Retry**.

* **Implement:** `SyncOrchestrator` badges bound to `sync.status`.

**E3. Calendar-conflict helper**

* **Write tests:** conflict service flags (a) event outside itinerary date window, (b) overlaps flight departure/arrival; shows banner with quick actions (view/resolve).

* **Implement:** `CalendarConflictService` subscribing to saved Transport/Accommodation times.

---

## **Phase F — Errors, A11y, i18n, Telemetry**

**F1. Errors & resilience**

* **Write tests:** cancel inflight on filter/sort change; retries with jitter; friendly error UI with **Retry**.

* **Implement:** cancellable calls \+ shared error banner.

**F2. Accessibility & i18n**

* **Write tests:** announce start times; focus order; localized date/time & copy.

* **Implement:** semantics \+ `intl`.

**F3. Telemetry**

* **Write tests (spy):** `events_search`, `events_result_view`, `filter_applied`, `events_map_viewed`, `event_opened`, `event_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Implement:** analytics adapter hooks.

---

## **Phase G — Acceptance Criteria → Gherkin E2E**

Automate:

1. **AC1 — Guard:** no Active Itinerary ⇒ blocking select/create ⇒ resume Events.

2. **AC2 — Prefill:** destination \+ date window prefilled from itinerary/contexts.

3. **AC3 — List→Details:** card to detail shows required content & actions.

4. **AC4 — Save auto-binds:** immediate appearance under **Events**; optimistic UI.

5. **AC5 — During-my-dates filter:** results limited to window or overlaps.

6. **AC6 — Conflict helper:** overlapping event triggers banner with shortcut.

7. **AC7 — Map parity:** pins/list stay in sync; pin mini-card mirrors list.

8. **AC8 — Offline queue & caching:** “Syncing…” badge; later sync; cached responses honored.

9. **AC9 — Dedupe:** previously saved shows **Saved**; pressing unsaves; snackbar confirms.

---

## **Deliverables**

* **Models & DAOs:** event models; `events_cache` TTL table.

* **Repo:** `EventsRepo` (search, detail) with cancel/retry \+ cache decorator.

* **State:** prefill service; filters/sort & bounds state; conflict service; unified results store.

* **UI:** `/search/events` page (form), results list, map view, details page.

* **Save integration:** deduped, offline-first saves bound to Active Itinerary.

* **Tests:** full unit, widget, integration, E2E per phases.

* **Docs:** `README_Story6.md` with run commands & AC traceability.

---

