# **Story 25 — Reviews & Notes — TDD Task Plan**

**Scope recap (from file):** itinerary-scoped **Private Notes** (per user, per item/plan), **Shared Comments** (threads with replies, @mentions, reactions, attachments), **Provenance** panel, **Moderation & safety**, **Notifications**, **Offline edits & sync**, and **Export redaction** rules. RBAC applies (Viewer/Editor/Owner).

---

## **Phase A — Contracts & Validators (tests first)**

**A1. Client models (Freezed) & JSON round-trip**

* Tests for `Note`, `CommentThread`, `CommentMessage`, and `Provenance` exactly per schema; validate lengths, enums, and required fields.

* Implement models \+ validators; enforce idempotency/comments ordering hints.

**A2. REST API shapes**

* Tests for routes:

  * `GET/POST/PUT/DELETE /notes`

  * `GET /comments`, `POST /comments/threads`, `POST /comments/threads/{id}/reply`, `PUT /comments/threads/{id}`, `DELETE /comments/messages/{id}`, `POST /comments/messages/{id}/react|report`

  * `GET /provenance?parentType&parentId`

* Implement request/response validators; error model.

---

## **Phase B — Storage, RBAC & Sync**

**B1. DB schema & migrations (Drift/Postgres)**

* Tests create: `notes`, `comment_threads`, `comment_messages`, `attachments`, FK to `(itineraryId, parentType, parentId)`, full-text indices; object storage paths scoped by itinerary.

* Implement migrations \+ DAOs.

**B2. RBAC & itinerary binding**

* Tests: Viewer can read \+ add comments, delete only own; Editor/Owner extra powers; all writes require active itinerary and pass sanitizer.

* Implement RLS/policies & server checks.

**B3. Sync \+ idempotency**

* Tests: client supplies `X-Idempotency-Key` on message create; repeated call returns original; message IDs monotonic per thread; offline queue resumes safely.

* Implement push/pull batch endpoints & ETags for thread status.

---

## **Phase C — Moderation & Safety Rails**

**C1. Sanitizers & scanners**

* Tests: Markdown→safe HTML allowlist; URL sanitizer; attachment type/size caps; EXIF stripped.

* Implement sanitizer pipeline & media proxy.

**C2. Profanity/spam & rate limits**

* Tests: profanity → status `held`; API returns 429 after \>5 msgs/30s; reporting workflow creates record.

* Implement rule engine \+ per-IP/user token bucket.

**C3. Escalation hooks (Admin)**

* Tests: severe → hidden for others, Owner notified; report → queue item for Story 15\.

* Implement status transitions \+ audit.

---

## **Phase D — Provenance Service**

**D1. Aggregation**

* Tests: combines source (“provider|email|manual”), savedBy/At, and history entries (“title\_updated”, etc.) for a SavedItem/DayPlanEntry.

* Implement `/provenance` read model.

**D2. UI panel**

* Tests (widget): shows source line, change log, and link to activity feed.

* Implement Info ▸ **Provenance** tab.

---

## **Phase E — UI/UX (Flutter) with Offline-first**

**E1. Tabs & editors**

* Tests (widget/golden): **Info ▸ Notes ▸ Comments ▸ Provenance**; markdown editor with checklist shortcuts (`/`), char counter (4k).

* Implement editors \+ local DB cache.

**E2. Threads & actions**

* Tests: new thread, reply, @mention autocomplete, reactions, attachments; **Resolve**, **Pin**, **Lock** (Owner), **Mute**; resolved grouped.

* Implement thread list \+ detail; optimistic updates with rollback on 4xx.

**E3. Offline states**

* Tests: offline create shows “Syncing…” badge and orders deterministically after reconnect.

* Implement badges and queue visual states.

---

## **Phase F — Notifications**

**F1. Mentions & digests**

* Tests: server detects @mentions → push/in-app, honoring **Quiet Hours** and **Trip-Only**.

* Implement notifier, per-thread mute, per-itinerary mute.

---

## **Phase G — Export & Privacy**

**G1. Snapshot redaction**

* Tests: private notes excluded; shared comments included only if “Include comments” chosen in export options.

* Implement export filter integration with Story 10\.

**G2. PII minimization & logs**

* Tests: logs redact PII; attachments served via short-lived signed URLs.

* Implement logging filters \+ signed URL helpers.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate from the story:

1. **AC1 Private note stays private** (promote to comment optional).

2. **AC2 Mentions & attachments** (EXIF stripped; thumbnail render).

3. **AC3 Resolve & pin** (resolved group \+ pinned at top).

4. **AC4 Moderation hold** (held visible to author only; placeholder to others).

5. **AC5 Provenance transparency** (email import \+ later edits visible).

6. **AC6 RBAC enforcement** (Viewer cannot delete others; can delete own).

7. **AC7 Offline edit & sync** (“Syncing…” → posts later, preserves order).

8. **AC8 Export redaction** (private notes out; comments opt-in).

9. **AC9 Anti-spam & rate limits** (429 cooldown).

---

## **Deliverables**

* **Models & Validators:** `Note`, `CommentThread`, `CommentMessage`, `Provenance`.

* **DB & Storage:** notes/comments tables \+ full-text; itinerary-scoped attachments with EXIF stripping.

* **APIs (RBAC-enforced):** notes CRUD, threads/messages, reactions, report, provenance read.

* **Moderation:** profanity/spam filters, URL/HTML sanitizers, rate limits, escalation hooks.

* **Client UX:** tabs, markdown editor \+ checklist, thread list with actions, badges, mention chips, mute.

* **Sync & Idempotency:** offline queue, ETags for status, `X-Idempotency-Key` on creates.

* **Notifications:** mentions \+ reply digests respecting Quiet Hours/Trip-Only.

* **Export integration:** snapshot redaction options.

* **Tests:** unit (sanitizer, profanity/spam, RBAC, provenance), widget (editor/threads), integration (offline→sync, held comment flow), E2E (AC1–AC9).

---

