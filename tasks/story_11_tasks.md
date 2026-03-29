# **Story 11 — Collaboration & Permissions — TDD Task Plan**

**Scope recap:** Owner can invite collaborators by email with roles (**viewer/editor**); invitees must sign up to edit; RBAC enforced server-side on every write; real-time presence \+ optimistic edits with merge/conflict banner; photos on the itinerary map inherit the itinerary ACL; owner can change roles or revoke; immutable audit trail; rate-limit and security baselines.

---

## **Phase A — Data Contracts, RBAC & RLS (tests first)**

**A1. Contracts (client models \+ validators)**

* **Write tests:** JSON round-trip for:

  * `ItineraryMember { userId, email, role: owner|editor|viewer, joinedAt, lastSeenAt }`

  * `InviteRequest { itineraryId, emails[], role, message? }`

  * `InviteAccept { inviteToken }`

  * `AclCheck { itineraryId, userId, action: read|write|manage|upload_photo }`

  * `ActivityEvent { id, itineraryId, type, actorId, targetId?, details?, createdAt }`

* **Implement:** Freezed \+ json\_serializable; strict validators.

**A2. Postgres schema \+ RLS (Supabase)**

* **Write SQL unit tests (edge/e2e):** Role-scoped CRUD: owner can invite/change/revoke; editor can write items but not roles; viewer read-only; RLS denies cross-itinerary.

* **Implement:** tables `itinerary_memberships`, `invites`, `activity_events`; RLS: `user_id = auth.uid()`; policies map actions to roles. Log `member_invited/member_joined/role_changed/member_removed`.

**A3. Permission matrix (client checks)**

* **Write tests:** local `can(action)` resolver mirrors server RBAC (non-authoritative); blocks UI affordances for viewers; allows photo upload only when `upload_photo` allowed.

---

## **Phase B — Invite & Accept Flows**

**B1. Invite dialog & send**

* **Write widget tests:** email chip entry/validation; role picker; duplicate/invalid emails errors; disabled **Send** until valid.

* **Implement:** `POST /invites` via `CollabRepo.sendInvites(InviteRequest)`; show success \+ “Resend”.

* **Exit:** Contract & widget tests green.

**B2. Accept invite**

* **Write integration tests:** open invite link → sign-in/sign-up → `POST /invites/accept` with token → membership created → activity “joined”.

* **Implement:** deep link handler \+ repo call; first-open logs event; redirect to itinerary.

**B3. Rate-limit & abuse**

* **Write tests:** hammer `/invites` → API returns 429 with `Retry-After`; UI shows friendly throttle message.

* **Implement:** gateway limits \+ client backoff.

---

## **Phase C — Manage Access UI**

**C1. Member list**

* **Write widget tests:** render avatars, role dropdown, last seen, **Revoke**, **Resend**; owner sees **Transfer ownership** (stubbed).

* **Implement:** `/members` list bound to `ItineraryMembersProvider`; actions call repo; optimistic UI with rollback on 4xx.

**C2. Role change & revoke**

* **Write integration tests:** change Editor→Viewer; revoke removes access immediately; kicked user can no longer see photos/map items.

* **Implement:** `PUT /members/{userId}`, `DELETE /members/{userId}`; invalidate caches; presence kick via realtime channel.

---

## **Phase D — Presence, Concurrency & Conflicts**

**D1. Presence indicators**

* **Write tests:** joining/leaving itinerary channel updates small avatar stack and “editing…” chips per item.

* **Implement:** Supabase Realtime channel `presence:<itineraryId>`; debounce updates.

**D2. Optimistic edits \+ merge**

* **Write tests:** two editors modify same SavedItem inside 10s → first write 200; second receives 409 with merge payload; banner shows diff with “Apply mine / Keep theirs”.

* **Implement:** ETag/`updatedAt` precondition on writes; server merges array fields; client conflict reducer \+ diff UI.

---

## **Phase E — Photos ACL & Map Visibility**

**E1. Photo inheritance**

* **Write tests:** photos added by Editor are visible to Owner/Editors/Viewers; revoking user hides their access immediately.

* **Implement:** storage paths under itinerary ACL; listing filtered by membership; reuse Map layer from Story 8\.

---

## **Phase F — Activity Feed & Audit**

**F1. Activity feed UI**

* **Write widget tests:** chronological feed; filters by member/item/date; renders messages for `item_added/item_removed/role_changed/plan_updated`.

* **Implement:** `GET /activity?itineraryId` \+ stream for new events.

**F2. Append-only audit**

* **Write integration tests:** every membership or item mutation appends an immutable `ActivityEvent`; redaction pipeline for PII where needed.

* **Implement:** server appends compact events \+ durable audit log, per security notes.

---

## **Phase G — Security, A11y, i18n, Telemetry**

**G1. Security baselines**

* **Write tests:** CSRF/XSS sanitization on invite message; CORS locked; secrets not leaked; DKIM/SPF pass for emails (mock).

* **Implement:** input validation; email deliverability retries \+ cooldown for **Resend**.

**G2. Accessibility & i18n**

* **Write tests:** keyboardable role controls; live region announces “member joined/role changed”; localized timestamps.

* **Implement:** semantics \+ `intl`.

**G3. Telemetry**

* **Write tests (spy):** `invite_sent`, `invite_accepted`, `role_changed`, `member_removed`, `presence_online`, `conflict_raised/resolved`.

* **Implement:** analytics hooks on actions.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate these end-to-end scenarios:

1. **AC1 — Invite with role:** Invite `Samantha@example.com` as **Editor** → receives link → after sign-up can add/remove items.

2. **AC2 — Viewer vs Editor enforcement:** Viewer blocked on save/delete but can view all items and map/photos.

3. **AC3 — Presence & edit collision:** Two editors edit within 10s → first save succeeds; second sees conflict banner with diff \+ resolve options.

4. **AC4 — Audit trail:** Any add/remove logs an `ActivityEvent`; owner sees it in activity feed.

5. **AC5 — Manage access:** Owner changes role or revokes; effect is immediate (write loss or full loss).

6. **AC6 — Rate limits & abuse:** Hammer invites → 429 w/ Retry-After; UI shows throttle copy.

7. **AC7 — Photo privacy:** Remove collaborator → itinerary photos no longer visible to them.

---

## **Deliverables**

* **Models & Validators:** `ItineraryMember`, `InviteRequest`, `InviteAccept`, `AclCheck`, `ActivityEvent`.

* **Backend & RBAC:** membership \+ invite tables; RLS policies; invite token issuance/redeem; ETag preconditions; merge on collections; rate limits.

* **Repositories:** `CollabRepo` (send/resend/accept/revoke/changeRole), `ActivityRepo`, `PresenceService`.

* **UI:** Invite dialog; Manage Access screen; avatar presence; conflict banner; Activity feed.

* **Photos ACL:** map/photo visibility honoring itinerary ACL; immediate revocation effects.

* **Tests:** unit (contracts/permissions), widget (invite/member list/conflict banner), integration (invite→accept, role change, revoke, presence), E2E (all ACs).

---

