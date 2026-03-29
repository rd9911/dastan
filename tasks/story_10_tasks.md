# **Story 10 — Final Offline Snapshot & Share Flow — TDD Task Plan**

**Scope recap:** One-tap **Make Available Offline** for the **Active Itinerary** that packages itinerary data, saved items (all sections), day plans, lightweight map tiles, thumbnails, and a **local search index** into a **read-only bundle**. Support **delta updates**, and a **privacy-aware share** as link/file/PDF. The snapshot must **fully function offline** (lists, details, map, planner read-only). Include **revocation & expiry**, failure/size handling, and **read-only integrity**.

Same stack & primitives: Active Itinerary guard; Drift for storage; SyncOrchestrator; Map/cache from Story 8; Planner data from Story 9\.

---

## **Phase A — Contracts & Idempotency (tests first)**

**A1. Manifest & bundle contracts**

* **Write tests:** JSON round-trip & schema validation for `OfflineBundleManifest` (sections, dayPlans, assets, searchIndex). Verify required fields and types.

* **Implement:** Freezed models \+ `json_serializable`; strict validators.

* **Exit:** Contract tests green.

**A2. Idempotency & versioning**

* **Write tests:**

  * `bundle.id = hash(itineraryId | version | manifestHash)` deterministic.

  * Applying same `BundleDelta` twice → no changes.

  * `shareId = hash(itineraryId | version | privacy | expireAt)` deterministic.

* **Implement:** pure hashing helpers.

* **Exit:** All idempotency tests pass.

---

## **Phase B — Local Storage Layout & DAOs**

**B1. Storage schema**

* **Write tests:** migrations create `/bundles/<itineraryId>/<version>/` with Drift tables:

  * `bundles { itineraryId, version, id, createdAt, sizeBytes, status }`

  * `bundle_assets { bundleId, path, sha256, kind(items|plans|tiles|images|index) }`

  * `bundle_index { bundleId, token, itemId }`

* **Implement:** DAOs \+ indices; SHA-256 verification utilities.

* **Exit:** Migration & CRUD tests pass.

**B2. Tile & image cache integration**

* **Write tests:** compute minimal tile coverage from saved pins & planner routes; store tiles/thumbnails with TTL.

* **Implement:** reuse Story-8 tile cache; thumbnail generator (≤1024px) to WebP/AVIF.

* **Exit:** Cache tests pass.

---

## **Phase C — “Make Available Offline” Flow**

**C1. Preflight sheet (widget)**

* **Write tests:** shows estimated size, toggles (include photos, hi-res tiles), region preview; disabled **Download** until estimation done.

* **Implement:** estimator that sums items/plans/tiles/images/index; respects storage thresholds.

* **Exit:** Widget/golden tests pass.

**C2. Packager Orchestrator (integration)**

* **Write tests:**

  * Builds manifest, downloads missing assets, verifies SHA-256, writes manifest **last**, marks bundle vN active.

  * Progress steps: Items ▸ Photos ▸ Maps ▸ Index; resumable after interruption.

* **Implement:** `OfflinePackager` with stepwise jobs \+ resumable checkpoints.

* **Exit:** End-to-end pack test passes.

**C3. Size & failure handling**

* **Write tests:** threshold overflow → prompts (exclude large media / reduce map area / cancel); tile/image download failures → retries with backoff then placeholders.

* **Implement:** policy \+ backoff; graceful fallbacks.

* **Exit:** UX & resilience tests pass.

---

## **Phase D — Offline Runtime**

**D1. Read-only runtime switch**

* **Write tests:** airplane mode → app reads from **active bundle**: lists, details, map tiles, planner **read-only**; “Last updated on ” visible.

* **Implement:** repository decorators (`…RepoOffline`) that serve from bundle if offline; planner UI disables edit affordances.

* **Exit:** Offline runtime tests pass.

**D2. Local search index**

* **Write tests:** token search over names/tags returns item ids; matches open detail screens offline.

* **Implement:** inverted index build per itinerary locale; query API.

* **Exit:** Search tests pass.

---

## **Phase E — Delta Updates**

**E1. Diff & apply**

* **Write tests:** given bundle v3 and server changes, **Refresh snapshot** fetches only diffs and yields v4 quickly; rollback to previous version on failure.

* **Implement:** `BundleDelta { upserts[], deletes[], assets[] }` \+ applier; verify content via checksums; keep last 2 bundles.

* **Exit:** Delta tests green.

---

## **Phase F — Share Flow (Link / File / PDF)**

**F1. Privacy redaction pipeline**

* **Write tests:** when PII/booking refs/prices/notes toggles are **off**, redacted snapshot excludes `email`, `phone`, `bookingRef`, `notes`, `price`.

* **Implement:** redactor that maps manifest → share-manifest; unit & snapshot tests.

* **Exit:** Redaction tests pass.

**F2. Share artifacts**

* **Write tests:**

  * **Link:** creates signed, read-only web snapshot (expiry 7/30/90 d); revocation invalidates.

  * **File:** `.tripbundle` archive; optional **PDF/image** overview export deterministic.

* **Implement:** Edge function to host viewer \+ signed URLs; local file exporter; QR/share sheet.

* **Exit:** Share tests pass.

**F3. Revocation & expiry**

* **Write tests:** revoking a link flips server state; recipients see “Expired/Revoked”; `shareId` idempotent by inputs.

* **Implement:** revoke endpoint \+ client UI.

* **Exit:** Revocation tests pass.

---

## **Phase G — Security, Privacy, A11y, Telemetry**

**G1. Security & integrity**

* **Write tests:** AES-GCM at rest for local bundles (when secure storage available); manifest written last; SHA-256 verified; EXIF stripping for photos.

* **Implement:** crypto wrappers; EXIF remover.

* **Exit:** Security tests pass.

**G2. Accessibility & i18n**

* **Write tests:** progress announced via ARIA live region; offline state announced; localized size/time estimates.

* **Implement:** semantics \+ `intl`.

* **Exit:** A11y/i18n tests green.

**G3. Telemetry**

* **Write tests (spy):** `offline_preflight_viewed`, `offline_bundle_started`, `offline_bundle_completed`, `offline_bundle_failed`, `offline_refresh`, `share_created`, `share_revoked`, `viewer_opened`.

* **Implement:** analytics hooks.

* **Exit:** Events verified.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate these scenarios end-to-end:

1. **AC1 — One-tap offline availability:** Preflight \+ download \+ mark as available.

2. **AC2 — Works fully offline:** airplane mode → lists, details, maps, photos, planner read-only; “Last updated on”.

3. **AC3 — Local search:** offline queries hit local index; open details.

4. **AC4 — Delta update:** vN → vN+1 using diffs only.

5. **AC5 — Privacy-aware share:** PII/booking refs excluded when disabled.

6. **AC6 — Revocation & expiry:** recipients see Expired/Revoked after owner action.

7. **AC7 — Size & failures:** exceed size → guidance; failed assets → retries/backoff/placeholders.

8. **AC8 — Read-only integrity:** editing disabled; attempts prompt to go online.

---

## **Deliverables**

* **Models:** `OfflineBundleManifest`, `BundleDelta`, `ShareOptions`, `ShareArtifact`.

* **Storage:** Drift tables for bundles/assets/index; on-device folder layout; checksum verifier.

* **Services:** `OfflinePackager`, `DeltaUpdater`, `OfflineRuntime`, `SearchIndex`, `ShareService` (link/file/PDF), `RedactionService`.

* **UI:** Preflight sheet, progress UI, Offline badge chip (vN) with **Refresh/Storage/Share/Remove**, Share wizard \+ viewer hooks.

* **Security:** encryption at rest; signed URLs; revocation endpoints; EXIF/PII stripping.

* **Tests:** unit (contracts, hashing, redaction, delta), widget (preflight/progress), integration (packaging/offline runtime), E2E (all ACs).

---

