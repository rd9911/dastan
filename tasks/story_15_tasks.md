# **Story 15 — Admin Console — TDD Task Plan**

## **Phase A — Access, Roles, and Session (tests first)**

**A1. Roles & session schema**

* **Write contract tests** for `AdminSession` and role enums (support, billing\_admin, trust\_safety, super\_admin, read\_only). Validate `issuedAt/expiresAt` and deny expired sessions.

* **Implement**: Admin auth middleware (SAML/OIDC → role mapping) and `/admin/session` endpoint.

**A2. Policy engine (OPA-style) and route guards**

* **Write unit tests** for policy decisions `{actor.role, action, resource}` (e.g., Support can’t refund; Billing Admin can).

* **Implement**: central `can(action, resource)` with per-route guards; deny by default.

**A3. CSRF, rate limits, IP allowlist**

* **Write integration tests**: CSRF token required, per-action rate limits enforced, sensitive actions require IP allowlist pass.

* **Implement**: CSRF filter \+ per-route limiters; allowlist check.

---

## **Phase B — Audit & Idempotency**

**B1. Immutable audit log**

* **Write contract tests** for `AdminAction` (actor, target, reason, ticketUrl, approval block).

* **Implement**: append-only table with **cryptographic chaining**; write helpers on every mutation.

**B2. Idempotent mutations**

* **Write tests**: repeat a mutation with the same `Idempotency-Key` → identical result; stable action IDs for refunds/plan changes.

* **Implement**: Redis-backed key store; 24h dedupe window.

---

## **Phase C — Global Search & User Overview**

**C1. Universal search**

* **Write tests**: typeahead matches by email, userId, invoiceId, itineraryId; returns sanitized summaries only for read\_only.

* **Implement**: `/admin/search?q=` indexing users, invoices, itineraries (summary safe).

**C2. User Overview page**

* **Write widget tests**: renders profile/subscription/usage/integrations; sensitive fields redacted unless elevated \+ reason.

* **Implement**: `UserOverview` view \+ “Reveal for 15 minutes” gated token flow.

---

## **Phase D — Billing Remediation (Billing Admin only)**

**D1. Invoice table & actions drawer**

* **Write tests**: list invoices with status; open drawer to **Refund/Partial/Void/Re-issue/Change plan/Apply credit**; **reason \+ ticket URL** required.

* **Implement**: mutations call processor APIs via Admin API; result audited as `billing_action`.

**D2. Idempotent refunds & plan changes**

* **Write tests** mirroring ACs: partial refund succeeds and audit row emitted; retry returns same mutation id.

* **Implement**: reconcile webhooks → local shadow records for deterministic UI.

---

## **Phase E — Entitlements & Quotas Overrides**

**E1. Override grants**

* **Write contract tests** for `OverrideGrant { userId, key, value, expiresAt, reason }`; compute **effective entitlements** \= base plan ⊕ non-expired overrides.

* **Implement**: CRUD with expiry job; merge logic in view.

**E2. Manual counter reset & bump-until**

* **Write tests**: bump snapshots/email-parses until timestamp; revert at expiry automatically.

* **Implement**: counters table \+ scheduled reversion worker.

---

## **Phase F — Itinerary Operations**

**F1. Safe itinerary panel**

* **Write tests**: metadata \+ counts only for read\_only; Owner transfer requires justification; member add/remove allowed per policy.

* **Implement**: actions: transfer owner, add/remove collaborator, rebuild search index, clear stuck sync, rollback offline bundle, revoke snapshot links.

**F2. Ownership transfer audit**

* **Write tests**: transfer emits itinerary activity \+ admin audit record.

* **Implement**: mutation \+ event emit.

---

## **Phase G — Trust & Safety**

**G1. Abuse queue**

* **Write tests**: lists signals (scraping, spam invites, suspicious shares) with severity; actions include rate-limit, block device/IP, suspend scanner/account.

* **Implement**: queue view \+ action endpoints (policy-gated).

**G2. Two-person takedowns**

* **Write E2E tests**: request takedown (reason \+ approver) → link revoked only after approval; both actions audited immutably.

* **Implement**: approval workflow & signed revocation.

---

## **Phase H — Operational Monitors (read-only)**

**H1. Health tiles & charts**

* **Write tests**: tiles show API error rate, queue backlog, latency with 1h/24h toggles; links open external dashboards.

* **Implement**: read-only widgets \+ signed short-lived URLs for CSV/exports.

---

## **Phase I — Security UX & PII Minimization**

**I1. Justification prompts & reveal gates**

* **Write tests**: sensitive actions require modal with reason (and optional second approver); PII masked unless reveal token granted.

* **Implement**: shared confirmation modal \+ PII reveal token path.

**I2. Session security**

* **Write tests**: expired SSO/device-posture failure logs out and blocks actions until re-auth.

* **Implement**: session heartbeat \+ posture checks.

---

## **Phase J — Logs & Runbooks**

**J1. Log viewer**

* **Write tests**: filter by action/actor/target; export CSV via signed URL; pagination.

* **Implement**: query audited `AdminAction` chain.

**J2. Runbook links**

* **Write tests**: empty/error states surface runbook links for common incidents.

* **Implement**: static mapping in UI.

---

## **Phase K — Acceptance Criteria → Gherkin E2E**

Automate the story’s ACs:

1. **AC1 — Role-gated access:** Support can search and use support tools but cannot refund/takedown.

2. **AC2 — Billing audit:** Partial refund on INV-123 emits audit w/ actor, amount, reason, ticket URL.

3. **AC3 — Override with expiry:** Grant “+3 snapshots until Mon” takes effect immediately and auto-reverts.

4. **AC4 — Owner transfer:** Setting owner A→B records itinerary activity.

5. **AC5 — Two-person takedown:** Takedown request \+ approver → link revoked; both logged immutably.

6. **AC6 — PII minimization:** Read-Only sees metadata & counts only; elevation requires reason.

7. **AC7 — Idempotent mutations:** Retry “Change plan to Pro Monthly” with same key → single change, same mutation id.

8. **AC8 — Session security:** Expired SSO/posture failure forces logout and blocks sensitive actions.

---

## **Deliverables**

* **Admin API** with its own auth boundary \+ policy engine; CSRF & rate limits; IP allowlist.

* **Audit system**: append-only, chained `AdminAction`; searchable with retention \+ CSV exports.

* **Idempotency**: Redis-backed keys \+ stable mutation IDs for refunds/plan changes.

* **Console UI**: `/admin` with global search; User Overview; tabs for **Billing / Entitlements / Itineraries / Security / Logs**; action drawers with justification prompts.

* **Billing tools**: refunds/voids/credits, plan changes (now/EOT), secure customer-portal links, full audit.

* **Entitlement overrides**: temporary & permanent flags; quota bumps with expiry; effective view.

* **Itinerary ops**: owner transfer, member management, sync unlock, index rebuild, offline bundle rollback, snapshot revocation.

* **Trust & Safety**: abuse queue, device/IP blocks, scanner/account suspension, two-person takedown.

* **Monitors**: health tiles/charts; links to observability stack.

* **Tests**: unit (policy/idempotency/validators), contract (billing webhooks & refund/void), E2E (role restrictions, takedown, owner transfer, override expiry).

---

