# **Story 9 — Daily Planner — TDD Task Plan**

**Scope recap:** Planner is **in-itinerary only**; supports **Manual drag-drop** from Saved Items and **Smart Auto-Build**; understands **fixed vs flexible** items, **commute/buffer** blocks, ETA & opening-hours constraints; has **conflict engine** with one-tap fixes; **views:** Day timeline \+ 7-day strip \+ Calendar \+ Map (daily route); **offline-first**, **export & reminders**.

Stack continuity: reuse Active-Itinerary guard, SavedItem models, map/ETA patterns, sync engine, and caching from prior stories.

---

## **Phase A — Contracts & Persistence (tests first)**

**A1. Define planner models (Freezed)**

* Tests: JSON round-trip & validation for `DayPlan`, `DayPlanEntry`, `CommuteBlock`, `Conflict`. Required: `{itineraryId, date, entries[], version}`. Enums: `entryType{fixed,flex,custom}`, `travelMode{walk,transit,drive,none}`.

* Implement: models with `updatedAt`, `notes`, `bufferMinutes`, `etaMinutes`.

* Exit: schema tests green.

**A2. Drift schema & DAOs**

* Tests: migration creates `day_plans` (pk: itineraryId+date), `day_plan_entries` (fk day, stable ordering), indices on `(itineraryId,date,updatedAt)`. Upsert and ordering round-trip.

* Implement: DAOs with atomic upsert \+ order fields; optimistic concurrency via `version`.

* Exit: migration & CRUD tests pass.

**A3. SavedItem → DayPlanEntry mapper**

* Tests: each section (entertainment/gastronomy/events/trails/transport/accommodation) maps to entry with default **duration** & **flex/fixed** flag.

* Implement: pure mapper \+ unit tests.

* Exit: contract tests pass.

---

## **Phase B — Guards, Routes, Stores**

**B1. Route guard**

* Tests (router): `/planner` requires Active Itinerary; after select/create, resume Planner.

* Implement with existing guard.

* Exit: router tests pass.

**B2. Planner stores**

* Tests: `DayPlanStore` emits plan by date; supports **undo/redo**, optimistic updates, and debounced conflict recompute.

* Implement Riverpod `StateNotifier`; persist to Drift; enqueue sync.

* Exit: store tests pass.

---

## **Phase C — Manual Build (Drag & Drop) & Commute/Buffer**

**C1. Timeline UI**

* Tests (widget/golden): hour rails; drag from **Saved Items drawer** to time slot; fixed entries rendered with lock badge/colors.

* Implement vertical timeline with virtualization.

* Exit: widgets pass.

**C2. Commute & buffer insertion**

* Tests (unit): dropping an item auto-inserts `CommuteBlock` before/after using ETA service; buffer from pace.

* Implement `EtaService` (memoized by origin,dest,mode,timeWindow) \+ buffer policy.

* Exit: ETA memoization & insert logic green.

**C3. Fixed vs flexible rules**

* Tests: fixed events keep provider start/end; moving across window triggers conflict; flexible proposes default duration within opening hours.

* Implement opening-hours validator (with last-entry).

* Exit: validator tests pass.

---

## **Phase D — Smart Auto-Build Engine**

**D1. Contracts**

* Tests: `AutoBuildRequest{itineraryId,days[],prefs{dayStart,dayEnd,pace,travelModePriority,mealCadence,avoidCrowds}, mustDos[]}`; deterministic output for same inputs (hash).

* Implement DTOs \+ idempotent hash helper.

* Exit: contract tests pass.

**D2. Placement & scoring**

* Tests: engine respects fixed anchors, opening hours, ETAs, buffers; minimizes backtracking; inserts lunch/dinner per cadence; places must-dos.

* Implement pure planner with scoring (distance, category variety, user prefs).

* Exit: scenario tests pass.

**D3. Apply/preview**

* Tests (widget): preview diff vs existing day; “Apply all / per day” updates plan with version bump.

* Implement preview pane \+ apply handlers.

* Exit: widget tests pass.

---

## **Phase E — Conflict Engine & One-Tap Fixes**

**E1. Conflict detection**

* Tests: produce `Conflict{type: overlap|closed|tightTransfer|outsideItinerary, entryIds[], message, suggestions[]}` on every mutation.

* Implement debounced conflict runner with actionable suggestions.

* Exit: unit tests verify all conflict types.

**E2. Fix actions**

* Tests (integration): tapping “shift earlier 30m / push 45m / swap order / extend lunch / replace nearby” mutates entries and re-validates.

* Implement bottom-sheet UI & mutation pipeline.

* Exit: E2E fix flows pass.

---

## **Phase F — Views: Date Strip, Calendar, Map Parity**

**F1. Date strip & multi-day nav**

* Tests: 7-day strip scrolls; keyboard `,`/`.` flips days.

* Implement sticky date strip.

* Exit: interaction tests pass.

**F2. Calendar grid**

* Tests: calendar reflects same times; edits sync back to timeline.

* Implement lightweight calendar view.

* Exit: parity tests green.

**F3. Map tab**

* Tests: shows **daily route** polyline in plan order; reordering timeline updates map immediately; mode toggle recomputes ETAs.

* Implement map binding \+ recompute hook.

* Exit: map parity tests pass.

---

## **Phase G — Offline Editing, Sync, Export, Reminders**

**G1. Offline editing & sync**

* Tests (integration): reorder/add while offline → local persist; on reconnect, batch push with version checks; server `409` merges.

* Implement sync plumbing with `version`/`updatedAt`.

* Exit: offline→online tests pass.

**G2. Export**

* Tests: export **PDF**/**image snapshot** (timeline \+ optional map); artifact contains no PII/booking IDs; deterministic rendering for same inputs.

* Implement client canvas → image/PDF; EXIF/PII stripping pipeline.

* Exit: export tests pass.

**G3. Reminders**

* Tests: optional local notifications for fixed items \+ “leave now” prompt based on live ETA \+ buffer.

* Implement notification scheduler reading `EtaService`.

* Exit: reminder tests pass.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate these end-to-end flows:

1. **AC1 Gate behind Active Itinerary** — Planner blocked until itinerary chosen; entries bind to that itinerary.

2. **AC2 Drag & drop** — Drop saved item → entry placed with commute/buffer.

3. **AC3 Fixed vs flexible** — Fixed locks to times; flexible respects opening hours with adjustable duration.

4. **AC4 Auto-Build** — With given prefs \+ must-dos, draft includes meals, buffers, anchors.

5. **AC5 Conflicts & fixes** — Overlap flagged; choosing suggestion updates and re-validates.

6. **AC6 Map/Calendar parity** — Reorder timeline → map route & calendar update immediately.

7. **AC7 Custom blocks & notes** — Custom “Work session” behaves like other entries & exports.

8. **AC8 Offline editing & sync** — Offline changes persist and sync safely later.

9. **AC9 Export & reminders** — Export PDF/image; “leave now” notifications based on ETA+buffer.

---

## **Deliverables**

* **Models & DAOs:** `DayPlan`, `DayPlanEntry`, `Conflict`, `CommuteBlock`; Drift tables \+ migrations.

* **Services:** `EtaService` (memoized), `OpeningHoursValidator`, `AutoBuildEngine`, `ConflictEngine`.

* **State:** `DayPlanStore` with undo/redo, optimistic updates, debounced conflicts.

* **UI:** `/planner` timeline \+ Saved Items drawer; Calendar tab; Map tab with daily polyline; conflict chips & fix sheet.

* **Sync:** Upsert with `version/updatedAt`; conflict merge on `409`.

* **Export & reminders:** Canvas/PDF renderer; local notifications.

* **Tests:** unit (ETA/opening hours/scoring/conflicts), widget (DnD, chips), integration (offline→sync), E2E (all ACs).

---

