# **Story 14 — Account & Billing — TDD Task Plan**

## **Scope recap (from story)**

Plans (Free/Pro) with perks, quotas & soft/hard limits, multi-channel billing (card \+ Apple/Google IAP), invoices/receipts, self-serve admin, entitlements enforcement, and compliance (SCA/3DS, PCI handled by processor, VAT/tax, refunds, deletion on cancel).

---

## **Phase A — Contracts & Local State (tests first)**

**A1. Client data models**

* **Write tests:** JSON round-trip \+ validation for `Plan`, `Subscription`, `UsageCounters`, `Invoice` exactly per schema.

* **Implement:** Freezed \+ `json_serializable`.

* **Exit:** Schema tests green.

**A2. Entitlements & quotas store**

* **Write tests:** `EntitlementsStore` exposes effective plan, flags (e.g., `collaboration: editor`), and counters; **global Pro override** returns Pro regardless of backend state (feature toggle).

* **Implement:** Riverpod store with stale-while-revalidate on app start and after webhook events.

* **Exit:** Store tests pass.

**A3. Drift persistence**

* **Write tests:** tables `subscription_cache`, `usage_counters_cache`, `invoices_cache` with TTL; forward/back migrations.

* **Implement:** DAOs \+ cache decorator.

* **Exit:** Migration/CRUD tests pass. (Schemas per A1.)

---

## **Phase B — Plans UI & Checkout (Web \+ IAP)**

**B1. Plans page**

* **Write widget tests:** comparison table, monthly/annual toggle, “Choose plan” CTAs, promo code field (optional).

* **Implement:** `/billing/plans`.

* **Exit:** Goldens & interactions pass.

**B2. Checkout flows**

* **Write integration tests:**

  * Web: create secure checkout session (SCA ready) → on success create subscription, set entitlements, show “what unlocked”.

  * Mobile: native IAP purchase → server receipt validation → entitlements minted.

* **Implement:** `BillingRepo.createCheckoutSession(planId)`, IAP receipt verifier; success screen with entitlements toast.

* **Exit:** Both flows green.

**B3. Telemetry**

* **Write tests (spy):** `upgrade_clicked`, `checkout_started/succeeded/failed`.

* **Implement:** analytics hooks on CTA and result screens.

* **Exit:** Events verified.

---

## **Phase C — Usage & Quotas**

**C1. Usage screen**

* **Write widget tests:** shows counters, period window, per-itinerary storage usage; progress rings; “resets on ”.

* **Implement:** `/account/usage` view; counters from `UsageCounters`.

* **Exit:** Widget tests pass.

**C2. Quota enforcement hooks**

* **Write unit/integration tests:**

  * Soft-limit (80%) banners; Hard-limit blocks with paywall modal \+ Upgrade CTA.

  * Counters increment atomically per action (save, email parse, snapshot, reminder).

* **Implement:** `QuotaGuard` middleware; counters in monthly window keyed by `{userId|orgId, period}`.

* **Exit:** Guard tests pass.

**C3. Paywall UX**

* **Write tests:** small, in-context paywall (“You’ve hit the snapshot limit”), localised currency/number/date formats.

* **Implement:** modal component \+ plan comparison \+ CTA.

* **Exit:** i18n/a11y checks pass.

---

## **Phase D — Plan Changes & Cancellations**

**D1. Plan change flows**

* **Write tests:** upgrade (instant proration & immediate entitlements), downgrade (scheduled at renewal with clear “Downgrades at ”), cancel (EOT by default; optional immediate with refund policy).

* **Implement:** `BillingRepo.changePlan({now|atPeriodEnd})`; UI banners; proration math mirrors processor shadow records.

* **Exit:** Flows verified.

**D2. Lapse & graceful degradation**

* **Write tests:** on lapsed subscription, collaboration becomes view-only; offline bundles still viewable but can’t refresh; scanner caps resume; gated actions trigger paywall.

* **Implement:** feature gates at API & client.

* **Exit:** Degradation tests pass.

---

## **Phase E — Invoices & Receipts**

**E1. Invoices list**

* **Write widget tests:** list with status (paid/pending/failed), totals; open invoice page with itemized lines; **Download PDF**; **Resend receipt**.

* **Implement:** `/billing/invoices` \+ invoice detail; signed short-lived PDF URLs.

* **Exit:** Widget & contract tests pass.

**E2. Dunning & retries**

* **Write tests:** failed renewal shows retry schedule banner; user can update payment method and force retry.

* **Implement:** dunning schedule display \+ “Update payment method” link.

* **Exit:** Dunning tests pass.

---

## **Phase F — Server & Webhooks (black-box tests)**

**F1. Webhook processing**

* **Write contract tests:** process `subscription_*`, `payment_*`, `invoice_*`, `entitlements_updated`, `usage_reset`; idempotent.

* **Implement:** webhook handlers → update subscription/entitlements/usage; trigger client SWR.

* **Exit:** Contracts verified.

**F2. Security & compliance**

* **Write tests:** SCA/3DS flows handled by processor; we store only last4/brand/exp; tax engine integration respected; endpoints idempotent.

* **Implement:** rely on processor for PCI; local shadow records for deterministic UI; idempotent plan change endpoints.

* **Exit:** Security tests pass.

---

## **Phase G — Entitlement Gating Across the App**

**G1. Gate checks**

* **Write tests:** on gated actions (e.g., 3rd offline bundle on Free) show modal; allow read-only when lapsed.

* **Implement:** `requireEntitlement(feature)` helper used in save/export/auto-day-builder entry points.

* **Exit:** Gates verified.

**G2. Initial “all-Pro” rollout switch**

* **Write tests:** when `billing.disabled=true`, gates never block and plan renders as Pro for all users.

* **Implement:** remote config flag adopted by `EntitlementsStore`.

* **Exit:** Rollout tests pass.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate these end-to-end scenarios from the story:

1. **AC1 — Upgrade to Pro** (web & IAP): Pro entitlements unlock immediately post-purchase.

2. **AC2 — Quota enforcement**: hitting parse limit blocks action and shows Upgrade with reset date.

3. **AC3 — Proration**: mid-cycle switch monthly→annual applies credit and moves renewal.

4. **AC4 — Cancellation & downgrade**: schedules at renewal; shows impact; data remains.

5. **AC5 — Invoices & receipts**: list, download PDF, resend receipt.

6. **AC6 — Failed payment dunning**: shows retry schedule; update method \+ immediate retry.

7. **AC7 — Team seats**: invite consumes a seat or prompts to buy one.

8. **AC8 — Entitlement gating**: lapsed sub triggers paywall; read-only continues.

---

## **Deliverables**

* **Models & DAOs:** `Plan`, `Subscription`, `UsageCounters`, `Invoice` \+ Drift caches.

* **Stores & Services:** `EntitlementsStore` (SWR), `QuotaGuard`, checkout/IAP verifiers; webhook handlers.

* **UI:** Plans, Usage, Paywall modal, Invoices list & detail.

* **Gates:** client/server feature flags; graceful degradation.

* **Security & Compliance:** SCA/3DS handled by processor; tax engine; store non-sensitive card meta only; signed PDF URLs.

* **Telemetry:** `upgrade_clicked`, `checkout_started/succeeded/failed`, `quota_soft/hard_limit`, `plan_changed`, `invoice_downloaded`, `payment_method_updated`.

---

