# **Story 13 — Settings & Profile — TDD Task Plan**

**Scope recap (from spec):** Profile basics (name, avatar, home city/timezone, language, currency, units), Travelers presets, Search defaults (used to **prefill** all verticals), Notifications (channels, categories, quiet hours, trip-only), Privacy & Data controls (export, delete account, revoke integrations, snapshot redaction defaults), Security (2FA, sessions), Storage (offline bundles & cache), Compliance copy.

Stack continuity: one **reactive settings store** that other modules subscribe to (prefill pipeline), server-side checks on writes, encryption for sensitive fields, and telemetry.

---

## **Phase A — Data contracts & migrations (tests first)**

**A1. Define client models (Freezed \+ json\_serializable)**

* **Write tests:** JSON round-trip & validation for:

  * `UserProfile { userId, name, avatarUrl?, homeCity?, timezone, locale, currency, units{kms, tempC, clock24} }`

  * `TravelerPreset { id, name, adults, childAges[], default }`

  * `SearchDefaults { transport, accommodation, food, trails }`

  * `NotificationPrefs { channels{push,email}, categories{bookingUpdates,saveSyncStatus,plannerReminders,leaveNow}, quietHours{start,end}, tripOnlyMode }`

  * `PrivacySettings { analyticsOptIn, diagnosticsOptIn, snapshotDefaults{redactPII, redactPrices, redactNotes, photoVisibility}, integrations{email} }`

* **Implement** models exactly per schema in story. All validators green.

**A2. Drift schema & migrations**

* **Write tests:** create tables `user_profile`, `traveler_presets`, `search_defaults`, `notification_prefs`, `privacy_settings`, `security_meta`, `storage_inventory`. Verify forward/back migrations with sane defaults.

* **Implement:** DAOs with upsert; a single `settings_version` row for migration gating.

* **Exit:** CRUD \+ migration tests pass.

**A3. Settings store (reactive source of truth)**

* **Write tests:** `SettingsStore` emits combined snapshot; partial updates re-emit; selectors feed verticals.

* **Implement:** Riverpod store \+ persistence adapter; eager load on app start; memoized selectors for prefill.

* **Exit:** Store tests pass.

---

## **Phase B — Routes, tabs, and live preview UX**

**B1. Route & tabs**

* **Write tests (router):** `/settings` renders tabs: **Profile ▸ Travelers ▸ Preferences ▸ Notifications ▸ Privacy & Data ▸ Security ▸ Storage**.

* **Implement:** GoRouter \+ tab scaffold with sticky save bar & Reset.

**B2. Profile form \+ live preview**

* **Write tests:** change language/units/currency updates UI immediately (number/date/units) across the app.

* **Implement:** apply `Intl`/formatters on change; trigger global re-render; preview chip.

* **Exit:** Localization/units tests pass.

**B3. Travelers — Party presets**

* **Write tests:** create/edit preset (adults, child ages); mark default; deletion safeguards; maps to itinerary creation defaults.

* **Implement:** `TravelerPreset` CRUD; default preset badge.

* **Exit:** Preset tests pass.

**B4. Preferences — searchable defaults**

* **Write tests:** transport modes, accommodation minReviewScore/amenities, dietary, trails difficulty/duration serialize and drive chips on search surfaces (overridable).

* **Implement:** normalized enums & sets; chip mirror for familiarity.

* **Exit:** Prefill mapping tests pass.

**B5. Notifications**

* **Write tests:** toggling channels & categories persists; quiet hours respected; “trip-only mode” gates outside itinerary dates.

* **Implement:** token registration per channel; guard before enqueue.

* **Exit:** Notification tests pass.

**B6. Privacy & Data**

* **Write tests:** Export → produces archive with profile, itineraries, saved items, settings; Delete → two-step confirm, schedules deletion, signs out all devices; revoke integrations immediately stops scanning.

* **Implement:** export job \+ file save; delete flow with grace period; integration revoke hook.

* **Exit:** Data controls tests pass.

**B7. Security**

* **Write tests:** add 2FA (TOTP/SMS), recovery codes, device/session revoke.

* **Implement:** screens \+ repo calls; secure storage for secrets.

* **Exit:** Security tests pass.

**B8. Storage**

* **Write tests:** list offline bundles with sizes; Refresh/Remove works; clear cache per itinerary or global; size breakdown.

* **Implement:** read inventory from Story 10 packager; delete bundle frees space and removes offline badge.

* **Exit:** Storage tests pass.

---

## **Phase C — Prefill pipeline integration**

**C1. New itinerary creation defaults**

* **Write tests:** when creating a new itinerary, travelers/date defaults seed from `TravelerPreset`; units/currency/locale applied.

* **Implement:** creation form hook to `SettingsStore`.

* **Exit:** Tests pass.

**C2. Search surfaces prefill**

* **Write tests:** Transport/Accommodation/Gastronomy/Trails read `SearchDefaults` to set initial filters and chips; users can override per-search.

* **Implement:** subscription in each search module; show “from Settings” badge.

* **Exit:** Prefill E2E passes.

**C3. Quiet-hours & trip-only enforcement**

* **Write tests:** enqueue of planner reminders/leave-now suppressed during quiet hours or outside trip dates (when enabled).

* **Implement:** notifier middleware.

* **Exit:** Enforcement tests pass.

---

## **Phase D — Security, privacy, compliance**

**D1. Server-side checks & encryption**

* **Write tests:** API denies non-authorized writes; encrypt sensitive fields (emails, 2FA secrets).

* **Implement:** server RLS/policies; crypto wrappers on client.

* **Exit:** Security tests pass.

**D2. Compliance flows**

* **Write tests:** export integrity and deletion grace-period with audit entry.

* **Implement:** async jobs \+ notifications on completion.

* **Exit:** Compliance tests pass.

---

## **Phase E — Telemetry, A11y, i18n**

**E1. Telemetry**

* **Write tests (spy):** `settings_opened`, `profile_updated`, `preset_saved`, `prefs_applied`, `notifs_changed`, `privacy_changed`, `bundle_deleted`.

* **Implement:** analytics hooks.

* **Exit:** Events verified.

**E2. Accessibility & i18n**

* **Write tests:** labeled controls, large touch targets, tab focus order, SR summaries; RTL mirrored layouts.

* **Implement:** semantics \+ full localization coverage.

* **Exit:** A11y/i18n tests pass.

---

## **Phase F — Acceptance Criteria → Gherkin E2E**

Automate:

1. **AC1 — Immediate localization & units**: change currency → prices render in new currency; distance → km/mi across the app without restart.

2. **AC2 — Traveler presets feed itinerary**: default preset prepopulates new itinerary travelers.

3. **AC3 — Preferences prefill searches**: trains preselected, hotel min score applied, vegan chip active (overridable).

4. **AC4 — Notification categories & quiet hours**: receive enabled notifications outside quiet hours only; “trip-only” gates to trip dates.

5. **AC5 — Privacy & integrations control**: pausing/disconnecting Email stops scans; snapshot redaction defaults applied.

6. **AC6 — Security hygiene**: enable 2FA & revoke a device; subsequent sign-ins require 2FA; revoked session loses access.

7. **AC7 — Storage management**: removing a bundle frees space and removes itinerary’s offline badge.

8. **AC8 — Data export & deletion**: export delivers archive; deletion signs out and schedules purge.

---

## **Deliverables**

* **Models & DAOs:** profile, travelers, search defaults, notification prefs, privacy, security, storage inventory.

* **State:** `SettingsStore` (reactive, single source of truth) \+ selectors for prefill.

* **UI:** `/settings` with 7 tabs, sticky Save/Reset, live preview for language/units.

* **Integration:** itinerary creation & all search surfaces subscribe to settings for defaults.

* **Security & Compliance:** encrypted sensitive fields; RLS-backed writes; export/delete jobs.

* **Notifications middleware:** enforce quiet hours \+ trip-only.

* **Telemetry:** events listed above.

* **Tests:** unit (schemas, prefill mapping), widget (forms, live preview), integration (quiet hours, storage ops), E2E (AC1–AC8).

---

