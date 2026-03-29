# **TDD Task Plan — Story 4 (Entertainment)**

## **Phase A — Models, Validation, and Dedupe (tests first)**

**A1. Define canonical models**

* **Write tests**: JSON round-trip and validation for  
   `EntertainmentSearchRequest`, `EntertainmentResultCard`, `EntertainmentPlaceDetail`.  
   Required fields: request `{ context.itineraryId, place{granularity,value} }`; card `{ id, name, thumbnail, tag, location }`.

* **Implement**: Dart `freezed` models \+ `json_serializable`; strict validators.

* **Exit**: All model tests pass.

**A2. Dedupe key helper**

* **Write tests**: deterministic `dedupeKey = hash(itineraryId | location.name | tag | website)`; identical inputs ⇒ identical key; different itinerary ⇒ different key.

* **Implement**: pure function with doc comments.

* **Exit**: Snapshot tests stable.

**A3. Local DB schema additions**

* **Write tests**: Drift migration adds `ent_cache` (TTL, key, payload) and ensures `saved_items(section='entertainment')` indexes include `(itinerary_id, dedupe_key)`.

* **Implement**: schema \+ DAO; migration test verifies forward/backward.

* **Exit**: Migration & CRUD tests green.

---

## **Phase B — Repositories, Caching, and Prefill**

**B1. Repository contracts**

* **Write tests (mocked HTTP)** for:

  * `search(request, cursor?) → { items, page }`

  * `detail(id) → EntertainmentPlaceDetail`

  * Cancellation on filter/sort/map-change. Retries with jitter.

* **Implement**: `EntertainmentRepo` (Dio/Supabase edge functions if applicable); typed failures.

* **Exit**: Contract tests pass.

**B2. Query normalization & cache**

* **Write tests**: normalized key includes `(place, dates?, filters, sort)`; honors vendor TTL; evicts on itinerary switch.

* **Implement**: cache decorator \+ `ent_cache` DAO.

* **Exit**: Cache hit/miss/expiry tests pass.

**B3. Prefill orchestration**

* **Write tests**: with Active Itinerary (and optional transport/hotel), prefill destination & date window; if no destination, form shows destination picker.

* **Implement**: `EntertainmentPrefillService` reusing Story-1 Active itinerary store.

* **Exit**: Prefill tests pass.

---

## **Phase C — Routes, Guards, and Search Form**

**C1. Route \+ guard**

* **Write tests** (router): `/search/entertainment` requires Active Itinerary; after selection, resume route.

* **Implement**: GoRouter with Story-1 guard.

* **Exit**: Router tests pass.

**C2. Search form UI (widget \+ golden)**

* **Write tests**: prefilled fields; chips for tags/open-now/free/kid-friendly; validation; sticky **Search** action.

* **Implement**: form with Riverpod providers; error states.

* **Exit**: Widget & golden tests green.

---

## **Phase D — Map-First UX with List Parity**

**D1. Unified source of truth**

* **Write tests**: map viewport filter toggle updates list; list filters update map pins; pagination consistent.

* **Implement**: single results store; map subscribes to filtered slice; bounds filter toggle.

* **Exit**: Sync tests pass.

**D2. Map layer**

* **Write tests**: clustered pins; pin → mini-card with Save/Details; “show only within map bounds” respected.

* **Implement**: map widget, clusters, mini-card actions.

* **Exit**: Map tests pass.

**D3. List view**

* **Write tests**: image-led cards with swipeable photos, tag chips, distance-from-center, “more” button.

* **Implement**: results list \+ skeletons.

* **Exit**: List tests pass.

---

## **Phase E — Details, Website Handoff, and Save/Unsave**

**E1. Detail page**

* **Write tests**: photo carousel; short→full description; opening hours; distance from center; website button.

* **Implement**: details screen with lazy sections.

* **Exit**: Detail tests pass.

**E2. External website handoff**

* **Write tests**: sanitize URL; open in external browser context; error path.

* **Implement**: safe launcher util.

* **Exit**: Handoff tests green.

**E3. Save/Unsave integration**

* **Write tests**:

  * **Save** on card/detail → creates `SavedItem { itineraryId:<Active>, section:'entertainment' }` and appears immediately in Itinerary Overview.

  * If dedupe hit for same itinerary, button shows **Saved**; pressing **Saved** unsaves with snackbar.

* **Implement**: reuse Story-1 `SaveUseCase` \+ this story’s dedupe helper.

* **Exit**: Integration tests pass.

---

## **Phase F — Offline Queue, Errors, and Resilience**

**F1. Offline save queue**

* **Write tests**: offline save shows **“Syncing…”** badge; reconnect drains queue; failed sync shows retry.

* **Implement**: reuse `SyncOrchestrator`; badge bound to `sync.status`.

* **Exit**: Offline tests pass.

**F2. Search cancellation & retries**

* **Write tests**: filter/sort/map-change cancels in-flight; retries with jitter; graceful error UI with retry button.

* **Implement**: cancellable repo calls; error banner component.

* **Exit**: Reliability tests green.

---

## **Phase G — Telemetry, Accessibility, and i18n**

**G1. Telemetry events**

* **Write tests (spy)**: `ent_search`, `ent_result_view`, `ent_filter_applied`, `ent_map_viewed`, `ent_place_opened`, `ent_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Implement**: analytics adapter integration.

* **Exit**: Events verified.

**G2. A11y & i18n**

* **Write tests**: alt text for images; readable tap targets; SR announces Save/Syncing; localized copy & formats.

* **Implement**: semantics & `intl` strings.

* **Exit**: A11y/i18n tests pass.

---

## **Phase H — Gherkin E2E (map to ACs)**

Automate these end-to-end scenarios:

1. **AC1 — Guard**: no Active Itinerary ⇒ blocking select/create ⇒ resume Entertainment.

2. **AC2 — Prefill**: itinerary Paris \+ dates ⇒ prefilled; if missing destination ⇒ prompt & search works.

3. **AC3 — Map/List parity**: pan or filter updates both; pins ↔ list consistent.

4. **AC4 — Card→Details**: carousel, tag, Save/Share, description expander, opening hours, distance, website.

5. **AC5 — Save auto-binds**: Save creates item under Entertainment immediately (optimistic).

6. **AC6 — Offline \+ caching**: Save offline shows “Syncing…”; later sync; cached responses used where feasible.

7. **AC7 — Dedupe**: previously saved item shows **Saved**; pressing unsaves; snackbar.

8. **AC8 — Filter**: tag chips (museum/garden/landmark/architecture) filter results.

---

## **Deliverables**

* **Models & DAOs:** entertainment models; `ent_cache` (TTL).

* **Repo:** `EntertainmentRepo` (search, detail) with cancel/retry \+ cache decorator.

* **State:** unified results store; prefill service; filter & bounds toggles.

* **UI:** `/search/entertainment` (Map first), list view, details page, mini-card.

* **Save integration:** bound to Active Itinerary with dedupe rule.

* **Tests:** unit, widget, integration, and E2E as above.

* **Docs:** `README_Story4.md` with run commands and AC traceability.

---

