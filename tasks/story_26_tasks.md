# **Story 26 — Search Quality & Personalization — TDD Task Plan**

**Scope recap:** Trip-scoped signal collection (implicit & explicit), per-vertical personalization re-rankers layered on Story-16 base rank, diversity guarantees, explainability, opt-out, latency guardrails, and A/B evaluation. All saves/hides are **bound to the Active Itinerary** and primarily affect ranking within that trip.

---

## **Phase A — Contracts & Flags (tests first)**

**A1. Service schemas**

* **Tests:** zod/JSON Schema for `RerankRequest{vertical,items[],context{userId,itineraryId,profile,centroids[],dateWindow,localTime},flags.debug}` and `RerankResponse{items[],meta{strategy,explain?,diversity,tookMs,personalizationTimeout?}}`.

* **Implement:** validators \+ TS types; Dart models for hints; reject unknown enums, clamp ranges.

**A2. Feedback API contract**

* **Tests:** `POST /feedback` accepts `FeedbackEvent{itineraryId,itemId,action:save|hide|like|more_like_this|fewer_like_this,reason?}`; idempotent per `{user,itinerary,item,action,bucket}`.

* **Implement:** endpoint \+ Redis hot store; warehouse sink.

**A3. Feature flags & privacy**

* **Tests:** if `personalization.disabled=true` or user opted out → pipeline returns **base ranking only** and stores **no signals**.

* **Implement:** flag check; PII redaction on inputs & logs.

---

## **Phase B — Feature Engineering**

**B1. Context features**

* **Tests:** derive centroids from itinerary items; detect day phase; compute saved-mix diversity seed; profile features (dietary, accessibility, units).

* **Implement:** pure mappers with snapshot tests.

**B2. Item features per vertical**

* **Tests:** distance from centroids, open-now correctness (TZ aware), budget band vs price, kid/family friendly, popularity normalization.

* **Implement:** shared utilities reused by rankers.

---

## **Phase C — Scoring, Diversity, Explainability**

**C1. Blend formula**

* **Tests:** `S_final = α*S_base + β*S_personal + γ*S_diversity + ε` with cold/warm schedules; vertical-specific α,β,γ.

* **Implement:** rule-based/GBM stub with deterministic seeds; pluggable per vertical.

**C2. Diversity constraints**

* **Tests:** top-10 diversity across cuisines/neighborhoods; max 2 near-dupes in top-10.

* **Implement:** MMR/intent-aware diversifier; return `meta.diversity`.

**C3. “Why this result”**

* **Tests:** ≤2 concise hints (≤60 chars) per item, e.g., “near your hotel · vegan-friendly”.

* **Implement:** reason generator from feature attributions.

---

## **Phase D — Latency & Resilience**

**D1. SLA budget & fallback**

* **Tests:** personalize within 60–80 ms p95; on timeout set `personalizationTimeout=true` and return base rank unchanged.

* **Implement:** timeout wrapper; cache last-good rerank 2–5 min per itinerary/query.

**D2. Map/list parity**

* **Tests:** same ordering used in list and “Top Picks” map overlay; clustering unaffected.

* **Implement:** shared ordering source wired into Story-21 controllers.

---

## **Phase E — Wiring Into Story-21/16**

**E1. Controller integration**

* **Tests:** `GET /api/search/{vertical}` calls personalization after orchestrator merge; honors `flags.debug`; preserves pagination determinism.

* **Implement:** hook into Story-21 pipeline; pass itinerary/user context.

**E2. Save/Hide feedback loop**

* **Tests:** Save/Hide/“Not for me” chips emit `FeedbackEvent`; subsequent queries for same itinerary reflect adjustments.

* **Implement:** client emits events; server updates trip-scoped weights in Redis.

---

## **Phase F — A/B, Metrics, Offline Eval**

**F1. Experiment framework**

* **Tests:** sticky bucketing; guardrails on diversity ≥ policy & p95 latency; auto-rollback on regression.

* **Implement:** assignment \+ metric hooks (CTR, STR, dwell, conversion, diversity).

**F2. Offline evaluation**

* **Tests:** NDCG@10/20, MRR on golden query sets; CI blocks on regression.

* **Implement:** eval harness with labeled fixtures.

---

## **Phase G — Security, Privacy, Retention**

**G1. Trip-scoped storage**

* **Tests:** model state keyed by `{userId,itineraryId}`; resets when trip ends unless user opted into longer memory.

* **Implement:** TTLs; anonymized aggregates only.

**G2. Opt-out enforcement**

* **Tests:** opt-out removes signals and disables re-rank; export/delete wipes personalization state.

* **Implement:** erase job \+ switches.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

1. **Diet & accessibility respected:** vegan \+ wheelchair profile → non-compliant venues excluded; hints mention compliance.

2. **Trip-aware boosts:** Montmartre \+ saved kid-friendly museums → nearby family options bubble up in Entertainment.

3. **Diversity guarantee:** many Italians match → top-10 includes ≥3 distinct cuisines/neighborhoods.

4. **Feedback affects ranking:** “too pricey” on $$$ downranks $$$, boosts $$ for this itinerary.

5. **Cold start fallback:** no signals → base ranking \+ broad diversity; no personal hints.

6. **Latency guardrail:** personalization timeout → base ranking returned with meta flag.

7. **Privacy controls:** opt-out → base ranking only; no new signals stored.

---

## **Deliverables**

* **APIs:** `/rerank` and `/feedback` with strict schemas; debug explain vectors (internal).

* **Features & rankers:** context & item feature mappers; blend \+ diversity; explainability strings.

* **Integration:** Story-21 controllers call personalization; Save/Hide emit feedback; pagination preserved.

* **Resilience:** 60–80 ms p95 budget; cached outcomes; timeout fallback.

* **Privacy:** trip-scoped state; PII-free features; opt-out & erasure.

* **A/B & metrics:** CTR/STR/dwell/conversion/diversity/latency dashboards; guardrails & rollback.

* **Tests:** unit (features, blend, diversity, explain), contract (schemas), integration (feedback→rerank), E2E (AC1–AC7), offline eval (NDCG).

---

