# **Story 3 — Accommodation Search & Save (inside Active Itinerary) — TDD Task Plan**

**Scope recap:** Must be accessible **only** with an **Active Itinerary**; prefill **dates/location/guests** from itinerary and (when present) **Transport** saves; list \+ **Map** views with price pins; rich filters & sorts; details show room matrix, total price incl. taxes/fees, cancellation/payments; **Save** auto-binds `{ itineraryId:<Active>, section:"accommodation" }`; offline queue \+ dedupe; conflict helper if stay clashes with transport.

Stack continuity: use Story-1 Active Itinerary guard, SaveUseCase, SyncOrchestrator, and DAOs; we add accommodation-specific contracts, cache, UI, and policies.

---

## **Phase A — Data contracts & normalization**

**A1. Models (tests first)**

* Write unit tests:

  * `AccommodationSearchRequest` requires `{ context.itineraryId, place, dates, guests }`.

  * JSON round-trip for `PropertySummary`, `RoomOption`, `PriceBreakdown`, `Policies`.

  * Price normalizer yields **total incl. taxes/fees**.

* Implement `freezed` models for: `AccommodationSearchRequest`, `PropertyItem`, `RoomMatrix`, `Policies{cancellation{deadlineLocal},payment}`, `Price{total, currency, breakdown}`.

* Exit: serialization & validators green.

**A2. Dedupe seeds & key (tests)**

* Tests: `dedupeKey` seeds include `{providerId|externalId|checkIn|checkOut}` and are deterministic per itinerary.

* Implement helper: `accommodationDedupeSeed(item)` → server wins if disagreement.

* Exit: deterministic snapshot tests pass.

**A3. Prefill orchestrator (tests)**

* Tests:

  * From itinerary: city/region, dates, guests→rooms default (2 adults ⇒ 1 room).

  * If Transport exists: **Smart Dates** proposal: `checkIn = arrivalDate`, `checkOut = departureDate`.

  * Missing pieces → nulls (form shows inputs).

* Implement `AccommodationPrefillService` consuming Active itinerary \+ latest Transport save.

* Exit: unit tests pass.

**A4. Cache schema & keys (tests)**

* Tests: cache key includes normalized `{place, dates, guests, filters, sort}`; TTL honors vendor guidance; evict on itinerary switch.

* Implement Drift tables `acc_cache` with TTL; DAO with hit/stale logic.

* Exit: cache tests green.

---

## **Phase B — Networking & repositories**

**B1. Repo contracts (contract \+ unit tests)**

* Mocked HTTP tests for:

  * `search(request, cursor?)` (paged).

  * `propertyDetail(propertyId)` returns room matrix \+ policies.

* Implement `AccommodationRepo` with retries \+ jitter; cancel inflight on filter/sort change.

* Exit: contracts pass; errors map to typed failures.

**B2. Price normalization (unit)**

* Tests: compute **total incl. taxes/fees** across vendors; show refundability/cancellation deadline in **local time** with relative countdown.

* Implement pure normalizer utilities.

* Exit: unit tests pass.

---

## **Phase C — Routes, guards, and prefill**

**C1. Route \+ guard (router tests)**

* Test: open `/search/accommodation` without Active Itinerary ⇒ blocking select/create, then resume.

* Implement route using Story-1 guard.

* Exit: router tests pass.

**C2. Search form (widget \+ golden)**

* Tests:

  * Prefill from orchestrator; show **Smart Dates** chip when transport context exists; chips ±1 day quick toggles.

  * Guests/rooms calculator defaults (e.g., 2 adults → 1 room).

* Implement form with sticky **Search** button.

* Exit: widgets & goldens pass.

---

## **Phase D — Results list, Map parity, filters & sorts**

**D1. Results list (widget)**

* Tests:

  * Cards: thumbnail, name, neighborhood, rating, **Total price incl. taxes**, refundability badge, ETA to POI (if set).

  * Pagination appends; skeleton loaders.

* Implement `AccommodationResultsList`.

* Exit: widget tests pass.

**D2. Map view parity (widget \+ integration)**

* Tests: switching to **Map** keeps pins and list in **sync** with filters/sort; selecting a pin shows same mini-card actions.

* Implement map with price pins, clusters, neighborhood overlays.

* Exit: parity tests pass.

**D3. Filters & sort (unit \+ widget)**

* Tests: price range, property type, rating/review score, distance-to-POI, free cancellation, pay at property, breakfast, amenities, accessibility; sorts (recommended, price, reviewed, closest, best value, cancellation-friendly).

* Implement filter state \+ derived query; sort comparators & server hints.

* Exit: tests pass.

**D4. POI distance & ETA (unit)**

* Tests: With a POI set and max “20 min by transit” ⇒ only items with ETA ≤ 20 return, and badge shows ETA.

* Implement lightweight ETA module (matrix prefetch for top-N, lazy for the rest).

* Exit: AC satisfied.

---

## **Phase E — Details page & vendor handoff**

**E1. Property detail (widget)**

* Tests:

  * Room matrix with board plans; price breakdown; cancellation window; payment policy; amenities; house rules; photos; distances to POI/transport hub.

* Implement details with lazy sections.

* Exit: widget tests pass.

**E2. Go to Vendor (unit \+ widget)**

* Tests: external link sanitized; opens in external browser.

* Implement handoff via safe launcher.

* Exit: tests pass.

---

## **Phase F — Save/Unsave, offline queue, conflicts**

**F1. Save integration (widget \+ integration)**

* Tests:

  * Press **Save** on card/detail ⇒ create `SavedItem` with `{ itineraryId:<Active>, section:"accommodation" }`, appears immediately under Accommodation in Overview.

  * If duplicate for same itinerary, button shows **Saved**; pressing **Saved** unsaves.

* Implement using Story-1 `SaveUseCase` with accommodation `dedupeKey`.

* Exit: tests pass.

**F2. Offline queue (integration)**

* Tests: offline save shows **“Syncing…”** badge; reconnect clears badge after sync or exposes **Retry** on failure.

* Implement via `SyncOrchestrator`.

* Exit: queue tests green.

**F3. Conflict helper (integration)**

* Tests: when saved stay dates **overlap** with a departure flight before check-out ⇒ Overview shows banner with “Adjust dates” quick-fix.

* Implement conflict detector subscribed to saved Transport items.

* Exit: scenario passes.

---

## **Phase G — Telemetry, A11y, i18n**

**G1. Telemetry (unit—spy)**

* Fire: `accommodation_search`, `accommodation_result_view`, `filter_applied`, `map_shown`, `property_opened`, `property_saved`, `save_deduped`, `save_failed`, `save_synced`.

* Exit: events verified.

**G2. Accessibility & i18n (widget)**

* Tests: alt text for images; high-contrast badges; keyboard order; localized copy & currency.

* Implement ARIA/semantics \+ `intl`.

* Exit: a11y & i18n tests pass.

---

## **Phase H — Acceptance Criteria (Gherkin E2E)**

Automate the following end-to-end flows:

1. **AC1/2 — Guard & Prefill:** Without Active Itinerary → block; with one → prefill city/dates/guests; **Smart Dates** proposal if Transport exists.

2. **AC3 — POI distance filter:** With POI \+ “≤20 min transit”, results are filtered and show ETA badges.

3. **AC4 — Results completeness:** Detail page shows room options, total incl. taxes/fees, cancellation deadline, payment policy; vendor site opens.

4. **AC5 — Save auto-binds & dedupe:** Save appears immediately under Accommodation; toggle to **Saved**; pressing **Saved** unsaves.

5. **AC7 — Offline queue:** Offline save shows **Syncing…** → auto-sync later.

6. **AC8 — Price transparency:** Displayed price equals total stay incl. mandatory taxes/fees; free-cancellation window shows local timestamp \+ relative countdown.

7. **AC9 — Conflict helper:** Overlap with departure flight triggers banner \+ quick-fix.

8. **AC10 — Map view parity:** Pins/list stay in sync; pin mini-card mirrors list actions.

---

## **Deliverables**

* **Models & DAOs:** accommodation models; `acc_cache` TTL store.

* **Repo:** `AccommodationRepo` (search, detail) with retry/cancel and cache decorator.

* **State:** prefill service; filters/sort/map state; POI & ETA helpers.

* **UI:** `/search/accommodation` page (form \+ Smart Dates), results list, **Map** view, property details.

* **Save integration:** deduped, offline-first saves bound to Active Itinerary.

* **Tests:** full unit, widget, integration, and E2E per phases.

* **Docs:** `README_Story3.md` with run commands and AC traceability.

---

Awesome — moving to **Story 4 — Entertainment Search & Save** only. Below is a **TDD-first**, implementation-ready task plan that a coding LLM can execute step-by-step, preserving the same stack and cross-story primitives from Stories 1–3 (Flutter \+ Riverpod \+ GoRouter \+ Dio \+ Drift \+ Supabase; offline-first; optimistic save \+ dedupe).

---

## **Scope recap (from the story)**

* **In-itinerary only**; all saves auto-bind `{ itineraryId:<Active>, section:"entertainment" }`.

* **Map-first UX** with **List** parity, filters (tags/open-now/free/kid-friendly), details (photos, description, opening hours, website).

* **Prefill** destination/dates from itinerary and, when present, transport/accommodation context.

* **Caching** of API data.

* **Dedupe rule:** `hash(itineraryId | location.name | tag | website)`.

* Acceptance criteria AC1–AC8 include guard, prefill, map/list sync, card→details content, save with offline queue, dedupe, and tag filter.

Stack continuity: reuse Story-1 guard & Save/Sync infrastructure, and Story-2/3 caching patterns; add entertainment-specific contracts, cache, map/list UI, filters, and details.

---

