I’ll keep a single, consistent stack for all tasks in this project unless you tell me to change it:

* **Client:** Flutter 3.x, **Riverpod** for state, **GoRouter** for nav, **Dio** for HTTP, **Freezed/JsonSerializable** for models, **Drift (SQLite)** for offline cache & queue.

* **Backend:** **Supabase** (Postgres \+ Auth \+ Storage \+ RLS), **Edge Functions** (Deno) for any server logic we need now.

* **Testing:** Dart `test`, `flutter_test` (unit, widget), `integration_test`; **mocktail** for mocks; golden tests for key screens.

* **Tooling:** Melos mono-repo (optional), very strict **lint** (flutter\_lints \+ custom).

---

# **Tasks for Story 1 — Create/Select Itinerary, Enforce In-Itinerary Search, Auto-Bind Saves**

Goal recap: Users must create/select an **Active Itinerary** *before* any search (transport, accommodation, entertainment, gastronomy, trails, events). All **Save** actions silently attach `{itineraryId, section}` and appear instantly in the itinerary. Prefill search forms from the active itinerary. Must work offline; saves queue/sync.

## **Phase A — Contracts, Local DB & Dedupe (TDD)**

**A1. Define canonical data models (shared)**

* **Write tests first**

  * `Itinerary` serialization round-trip.

  * `SavedItem` requires `itineraryId` and `section`; invalid without them.

  * `dedupeKey` generators are deterministic per rules.

* **Implement**

  * Dart `freezed` models:

    * `Itinerary { id(uuid), title, destination{value, granularity}, dateRange{start,end}, travelers, createdAt, updatedAt }`

    * `SavedItem { id, itineraryId, section(enum), summary, details(Map), external{vendor, vendorUrl, externalId}, time{start,end}, location{name,lat,lng}, media[], dedupeKey, sync{status, lastAttemptAt}, createdAt, updatedAt }`

  * `DedupeKey` helpers (pure functions) with unit tests (hash inputs per story-specific rules later).

* **Exit criteria**

  * All model tests pass; `dedupeKey` stable across runs.

**A2. Local persistence schema with Drift**

* **Write tests first**

  * Migrations create tables `itineraries`, `saved_items`, `sync_queue`.

  * R/W tests: insert itinerary → read; insert saved item missing `itineraryId` → fails.

* **Implement**

  * Drift tables \+ DAOs, FKs: `saved_items.itinerary_id → itineraries.id`.

  * Indices: `(itinerary_id, section)`, `(dedupe_key UNIQUE)`.

  * `sync_queue` stores CRUD ops for server (upserts & deletes).

* **Exit criteria**

  * Migration tests & CRUD tests pass. Offline insert works.

**A3. Active Itinerary store (global, persisted)**

* **Write tests first**

  * `ActiveItineraryStore` loads last active on app start.

  * Emits change notifications; persists choice.

* **Implement**

  * Riverpod `StateNotifier<ActiveItinerary?>` \+ hydrated persistence (e.g., `shared_preferences` or Drift `kv`).

* **Exit criteria**

  * Store unit tests pass; default is `null`.

## **Phase B — Supabase Backend (minimal) & RLS**

**B1. Postgres schema \+ RLS (server)**

* **Write tests first (edge function e2e & sqlx checks)**

  * Authenticated user can CRUD own itineraries/saved\_items.

  * RLS denies cross-user access.

* **Implement**

  * Tables:

    * `itineraries(id uuid pk, user_id uuid, title text, destination jsonb, date_range daterange, travelers int, created_at, updated_at)`

    * `saved_items(id uuid pk, user_id uuid, itinerary_id uuid fk, section text check in ('transport','accommodation','entertainment','gastronomy','trails','events'), summary text, details jsonb, external jsonb, time tstzrange, location jsonb, media jsonb, dedupe_key text unique, created_at, updated_at, sync_rev int)`

  * **RLS**: enable \+ policies `user_id = auth.uid()`.

  * Minimal RPCs (optional now): `unsave_by_dedupe_key(dk text)`.

* **Exit criteria**

  * SQL tests pass; RLS confirmed.

**B2. REST client (Dio) \+ DTOs**

* **Write tests first**

  * Mapper tests: model ↔ DTO ↔ JSON stable.

  * Network errors map to typed failures.

* **Implement**

  * Supabase Dart client (auth) \+ Dio for edge functions (if any).

  * Repositories: `ItineraryRepo`, `SavedItemRepo` with methods: `listMine`, `create`, `update`, `delete`, `saveItem`, `unsaveByDedupeKey`.

* **Exit criteria**

  * Contract/unit tests pass with mocked HTTP.

## **Phase C — UI Flow: Itinerary Hub → Overview/Search, Guard Rails**

**C1. Itinerary Hub (first-run empty state \+ list)**

* **Write tests first (widget/golden)**

  * Empty state shows “Create itinerary”.

  * List renders itineraries; tapping sets Active and navigates.

* **Implement**

  * Screen `ItineraryHubPage`: FAB/Create button → form (title required; optional destination/date/travelers).

  * On create: persist local, push remote (enqueue if offline), set **Active**, navigate to **Itinerary Overview**.

* **Exit criteria**

  * Widget/golden tests pass. Validation: title required.

**C2. Itinerary Overview with two windows (“Overview” & “Search”)**

* **Write tests first (widget)**

  * Default shows **Overview** tab; toggle to **Search** tab.

  * Overview groups saved items by section.

* **Implement**

  * Tabs (or pill switch). **Overview**: section lists reading from local DB streams. **Search**: six section cards.

* **Exit criteria**

  * Snapshot tests green. Spec wording reflected.

**C3. Global top app-bar Active Itinerary chip (switcher)**

* **Write tests first**

  * Chip displays title; tap → bottom sheet with itineraries \+ “Quick create”.

  * Switching emits toast: “Active itinerary switched to X.”

* **Implement**

  * Re-uses `ActiveItineraryStore`; emits events; persists.

* **Exit criteria**

  * Behavior verified; toast content exact.

**C4. Navigation guards (no Active Itinerary ⇒ block)**

* **Write tests first (router tests)**

  * Deep-link to any search route without active itinerary → blocking modal → select/create → resume route.

* **Implement**

  * GoRouter redirect or `RouteGuard`. Blocking modal with quick-pick \+ create.

* **Exit criteria**

  * Guard tests pass. AC1 satisfied.

## **Phase D — Save/Unsave Behavior & Dedupe**

**D1. “Save” contract & immediate appearance**

* **Write tests first**

  * Press **Save** on a stub result → `SavedItem` is inserted with `{itineraryId: Active, section}`.

  * Appears instantly under the correct section in **Overview**.

* **Implement**

  * `SaveUseCase(section, cardData) → SavedItem`:

    * Build `dedupeKey` per section rule (temporary generic rule for Story 1: vendorId|externalId|startDate|itineraryId).

    * Insert local; enqueue sync op; optimistic UI.

* **Exit criteria**

  * Widget test observes list update instantly. AC4 satisfied.

**D2. Dedupe \+ Saved state toggle (“Save” ↔ “Saved”)**

* **Write tests first**

  * When card with same `dedupeKey` is rendered, button shows **Saved**.

  * Pressing **Saved** → unsaves (local delete \+ queue remote).

  * Snackbars: on unsave it shows confirmation text.

* **Implement**

  * DAO query by `dedupe_key`; toggle action; snackbar messaging.

* **Exit criteria**

  * Tests assert icon/state/snackbar. AC5 satisfied.

**D3. Itinerary switch while on search**

* **Write tests first**

  * While on any search screen, switch Active itinerary → toast, subsequent saves bind to new itinerary; current form values remain.

* **Implement**

  * Listen to `ActiveItineraryStore` in page scope; keep form state; route remains.

* **Exit criteria**

  * Tests pass. AC6 satisfied.

## **Phase E — Context Propagation (Prefill)**

**E1. Prefill provider**

* **Write tests first**

  * Given Active itinerary with destination/dates/travelers → prefill objects emitted.

  * Missing fields ⇒ nulls (caller shows form inputs).

* **Implement**

  * `ContextPrefillProvider` composes defaults from Active itinerary and most recent relevant saves (transport → accommodation in later stories; for Story 1, just itinerary fields).

* **Exit criteria**

  * Unit tests pass. AC3 base (prefill readiness).

## **Phase F — Offline-First & Sync**

**F1. Offline queue mechanics**

* **Write tests first (integration with fake network)**

  * When offline: save inserts local \+ `sync_queue` op; item shows “Syncing…” badge.

  * When back online: queue drains, remote upserts, badge clears; failures surface retry affordance.

* **Implement**

  * Connectivity listener → `SyncOrchestrator` background task processes queue with exponential backoff, idempotent on `dedupe_key`.

  * UI binds `SavedItem.sync.status` to badges.

* **Exit criteria**

  * Tests pass. AC7 satisfied.

**F2. Error handling & retries**

* **Write tests first**

  * Network 5xx → queued with error state; **Retry** button requeues.

  * Validation errors on itinerary create (empty title) keep button disabled, show inline message.

* **Implement**

  * Consistent `Failure` types; snackbars/dialogs; form validators.

* **Exit criteria**

  * AC8 satisfied.

## **Phase G — Telemetry, Accessibility, i18n**

**G1. Telemetry events**

* **Write tests first**

  * Events fired: `itinerary_created`, `itinerary_activated`, `search_opened`, `item_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Implement**

  * Analytics adapter (segment-like interface); unit test via spy.

* **Exit criteria**

  * Events verified. (Matches DoD.)

**G2. A11y & i18n scaffolding**

* **Write tests first**

  * Semantics labels on Save/Saved; screen-reader order on Overview lists.

* **Implement**

  * `Semantics` widgets; `intl` with ARB files for all user-visible strings used so far.

* **Exit criteria**

  * A11y tests green; strings externalized.

## **Phase H — AC Mapping & E2E**

**H1. Gherkin-driven E2E (happy paths)**

* **Scenarios to automate now**

  * **AC1**: Open search route with no active itinerary ⇒ blocking modal ⇒ choose itinerary ⇒ resumes route.

  * **AC2**: Create itinerary; becomes Active; Overview shows two windows.

  * **AC3**: Open a (stub) accommodation search form and assert prefill (destination/dates) from itinerary (actual search will be implemented in later stories).

  * **AC4/5**: Save a stub “ticket” card; appears under Transport; Saved toggle/unsave works with snackbars.

  * **AC6**: Switch Active while on search; toast; subsequent save binds to new itinerary.

  * **AC7**: Offline save → “Syncing…” badge → online sync clears.

  * **AC8**: Create itinerary without title keeps button disabled and shows inline validation.

* **Exit criteria**

  * All E2E pass on CI.

---

## **Deliverables (produced by the tasks above)**

* Flutter packages:

  * `lib/models/` Freezed models (`Itinerary`, `SavedItem`, section enums).

  * `lib/data/local/` Drift schema, DAOs, migrations \+ tests.

  * `lib/data/remote/` Supabase/Dio repos \+ tests.

  * `lib/state/` Riverpod stores: `ActiveItineraryStore`, `ContextPrefillProvider`, `SaveUseCase`, `SyncOrchestrator`.

  * `lib/ui/` pages: `ItineraryHubPage`, `ItineraryOverviewPage` (Overview/Search windows), shared **Active Itinerary chip** component, blocking modal.

* Supabase:

  * SQL migration files, RLS policies, optional RPC.

* Tests:

  * Unit (models, stores, repos, use cases), widget (pages/chip/modals), golden, integration (offline queue), E2E (AC scenarios).

* Docs:

  * `README_Story1.md` with run commands, env vars, and AC traceability.

---

## **Safeguards & Notes**

* **Idempotency:** All sync ops use `dedupe_key`; server RLS \+ `ON CONFLICT (dedupe_key) DO UPDATE`.

* **Privacy & security:** Never store secrets client-side; sanitize all external links; open external websites in system browser sandbox.

* **Performance:** DB streams for section lists; paging later; keep Overview cheap (summaries only).

* **Assumptions:** One **global** Active Itinerary per user (switch is global). Prefill falls back to itinerary fields only in this story (transport→accommodation reuse lands in later stories).

---

