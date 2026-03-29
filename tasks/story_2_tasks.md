---

# **2 — Transport Search & Save (inside Active Itinerary) — TDD Task Plan**

**Scope recap (from spec):** Transport is accessible **only** with an **Active Itinerary**. Inputs support exact dates **or** **flexible months**; region/country drill-downs; results are tabbed by **Flights / Trains / Buses**; details show segments, vendors, and **Go to Vendor**; **Advanced** multi-leg; **Group** mutual-destination search; API results **cached** so min-price calendars can be reused. Saves auto-bind `{itineraryId, section:"transport"}` and dedupe; offline-first.

Stack continuity: identical to Story 1 (models/DAOs/state/sync already exist). We add transport-specific models, UI, caching, and flows; all tests must pass before moving forward.

---

## **Phase A — Data contracts, normalizers, and cache keys**

**A1. Define request/response schemas (unit tests first)**

* Write tests:

  * `TransportSearchRequest` validates context `{itineraryId}`, `tripType`, `modes[]`; optional legs; prefill snapshot matches itinerary when provided.

  * JSON round-trip for calendar min-price and region drill-down payloads.

* Implement:

  * Dart `freezed` models mirroring spec: `TransportSearchRequest`, `TransportItem`, `TransportLeg`, `CalendarMinPriceMonth`, `RegionNode`.

* Exit: All model tests green; unknown fields ignored safely.

**A2. Normalization helpers (unit)**

* Tests for:

  * Mode/tab partitioning (flight/train/bus).

  * Stable summary text (for cards) and detail timeline from legs.

  * `dedupeKey` seed fields per spec (mode \+ first/last legs \+ departAt \+ provider id).

* Implement pure functions with doc comments.

* Exit: Deterministic outputs; snapshot tests stable.

**A3. Cache keying & TTL policy (unit)**

* Tests for:

  * Key includes normalized query (origin/destination granularity, dates/flex months, modes, filters).

  * Separate keyspace for **min-price calendars** with 2–3 week TTL; eviction on itinerary switch.

* Implement:

  * `TransportCacheKey`, `CalendarCacheKey`, Drift tables `transport_cache`, `calendar_cache` with TTL columns.

* Exit: Expiry & hit/miss logic validated.

---

## **Phase B — Networking layer & providers**

**B1. Repositories & adapters (unit \+ contract tests)**

* Tests with mocked HTTP:

  * Search (simple/advanced/group) returns paginated, per-mode result sets.

  * Calendar endpoint returns month grid of **minimum prices**.

  * Region drill-down returns country→city lists in price order.

* Implement:

  * `TransportRepo` with methods:

    * `search(request, cursor?) → TransportResults`

    * `calendarMinPrices(origin, dest, month)`

    * `regionCheapest(destRegion)` and `departureCitiesCheapest(originCountry)`

  * Respect retries with jitter & cancellation on tab switch.

* Exit: Contract tests pass; errors map to typed failures.

**B2. Caching wrapper (integration)**

* Tests:

  * Calendar cache served when fresh; falls back to live when stale; writes through on success.

  * Search cache hit for identical normalized query across users (policy allows showing cached min-price calendar to others).

* Implement repository decorator \+ Drift DAO.

* Exit: Cache tests pass.

---

## **Phase C — UI: Search surface, tabs, filters, flexible-date flow**

**C1. Route & guard (router tests)**

* Tests:

  * Navigating to `/search/transport` with no Active Itinerary blocks and resumes after selection. (Reuse Story 1 guard.)

* Implement GoRouter route with guard.

**C2. Search form (widget \+ golden)**

* Tests:

  * Prefill origin/destination/dates/travelers from itinerary if present; modes default from settings (future story) but overridable.

  * Toggle **one-way/roundtrip/multileg/group**; validation messaging.

* Implement form with Riverpod providers; sticky actions (Search, Reset).

**C3. Flexible-months calendar (widget)**

* Tests:

  * Month grid shows **min price per month** before exact dates. Select month → proposed exact dates dialog.

* Implement calendar grid powered by `calendarMinPrices(...)`; loading skeletons.

**C4. Region/country drill-down (widget)**

* Tests:

  * If destination is **region**, show **countries → cities** by cheapest; if origin is **country**, suggest cheapest departure cities.

* Implement drill-down UI with async lists.

**C5. Tabs & results (widget \+ pagination)**

* Tests:

  * Mode tabs (Flights/Trains/Buses), counts & from-price badge; cursor pagination; sort by price/duration.

* Implement list with skeletons; memoized sorting; abort in-flight on tab switch.

---

## **Phase D — Cards, details, vendor handoff, Save/Unsave**

**D1. Result cards (widget)**

* Tests:

  * Card shows dep/arr city, date/time; flights show airport codes & baggage icons; a11y labels present.

* Implement `TransportCard` \+ semantics.

**D2. Detail page (widget)**

* Tests:

  * Timeline of segments/transfers; vendors with prices; **Go to Vendor** opens external browser.

* Implement with lazy vendor list.

**D3. Save/Unsave integration (widget \+ integration)**

* Tests:

  * Press **Save** → creates `SavedItem` with `{itineraryId:<Active>, section:"transport"}`; appears immediately under Transport in Overview.

  * If dedupe hit, button shows **Saved**; pressing **Saved** unsaves (local delete \+ queued sync).

* Implement:

  * Reuse Story-1 `SaveUseCase` with transport `dedupeKey` seed; optimistic UI; snackbars on unsave.

---

## **Phase E — Advanced & Group subflows**

**E1. Advanced multileg builder (unit \+ widget)**

* Tests:

  * Add/remove legs; per-leg mode; validation prevents holes; combined search composes itinerary result.

* Implement collapsible builder rows; request serialization to `tripType: "multileg"`.

**E2. Group search (unit \+ widget)**

* Tests:

  * Enter 2–3 origins → ranked mutual destinations by cheapest and shortest; ties deterministic.

* Implement simple origin chips, result ranking view.

---

## **Phase F — Offline, retries, and error UX**

**F1. Offline save queue (integration)**

* Tests:

  * Offline Save → “Syncing…” badge; sync later clears; failures surface **Retry**.

* Implement using existing `SyncOrchestrator`.

**F2. Search error handling (unit \+ widget)**

* Tests:

  * Retries with exponential backoff; abort on tab change; user sees helpful error with retry.

* Implement centralized error banner and retry policy.

---

## **Phase G — Telemetry, Accessibility, i18n**

**G1. Telemetry (unit—spy)**

* Fire: `transport_search`, `transport_results_view`, `transport_filter_applied`, `ticket_opened`, `ticket_saved`, `save_deduped`, `save_failed`, `save_synced`.

**G2. A11y & i18n (widget)**

* Tests:

  * Labels for baggage/transfers; logical focus order; currencies localized; all strings externalized.

---

## **Phase H — Acceptance criteria mapping (Gherkin E2E)**

Automate these E2E scenarios:

1. **Flexible calendar** shows min prices, then proposes exact dates.

2. **Region drill-down**: region → countries → cities by cheapest; origin-country → suggested departure cities.

3. **Tabs & sorting** across modes; price/duration sort.

4. **Detail page** shows segments/vendors; **Go to vendor** works.

5. **Save auto-binds** to Active itinerary; immediate appearance; **Saved** toggle dedupes/unsaves.

6. **Advanced multi-leg** returns composed results.

7. **Group search** ranks mutual destinations by cheapest/shortest.

8. **Offline save & errors**: badge \+ later sync; failed search shows retry with backoff.

---

## **Deliverables**

* **Models & DAOs:** transport models, cache tables (`transport_cache`, `calendar_cache`).

* **Repositories:** `TransportRepo` \+ caching decorator.

* **State:** providers for query state, tabs, pagination, and calendar.

* **UI:** `/search/transport` screen, calendar grid, region drill-down, results tabs, cards, detail page, advanced & group subflows.

* **Save integration:** wired to Story-1 `SaveUseCase`, with transport `dedupeKey`.

* **Tests:** unit, widget, integration, and E2E suites as above.

* **Docs:** `README_Story2.md` with run commands and AC traceability.

---

