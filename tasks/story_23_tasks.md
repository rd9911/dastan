# **Story 23 — Search Quality & Ranking — TDD Task Plan**

## **Phase A — Contracts, Feature Flags & Guards (tests first)**

**A1. Service contracts**

* **Write tests:** zod/JSON Schemas for:

  * `RerankRequest{vertical, items[], context{userId,itineraryId,profile,centroids[],dateWindow,localTime}, flags{debug}}`

  * `RerankResponse{items[], meta{strategy, explain?[], diversity, tookMs, personalizationTimeout?}}`

  * `FeedbackEvent{itineraryId, itemId, action: save|hide|like|more_like_this|fewer_like_this, reason?}`

* **Implement:** validators \+ TS types; Dart models for hints on client.

* **Exit:** Contract tests pass.

**A2. Feature flags & privacy guardrails**

* **Write tests:** if `personalization.disabled=true` or user opted out → pipeline returns **base ranking only** and stores **no signals**.

* **Implement:** flag/opt-out checks; redact PII from features.

* **Exit:** Opt-out tests pass.

---

## **Phase B — Feature Engineering (deterministic, tested)**

**B1. Context features**

* **Write tests:** correct derivation of profile (dietary, accessibility, units), itinerary centroids, time-of-day, “saved mix” diversity seed.

* **Implement:** pure feature mappers; snapshot tests.

**B2. Item features (per vertical)**

* **Write tests:** compute distance, price band vs. user budget, open-now alignment (TZ-correct), family/kid-friendly, popularity normalized.

* **Implement:** vertical modules reused by orchestrator rankers.

* **Exit:** Feature tests pass.

---

## **Phase C — Scoring & Diversity**

**C1. Base \+ personal blend**

* **Write tests:** `S_final = α*S_base + β*S_personal + γ*S_diversity + ε`, with cold/warm β schedule and vertical-specific α,γ.

* **Implement:** gradient-boosted model stub or ruleset; pluggable per vertical; deterministic seeds.

* **Exit:** Blend tests pass.

**C2. Diversity constraints (MMR/intent-aware)**

* **Write tests:** enforce **top-10** diversity (distinct cuisines/areas) and “no \>2 near-dupes in top-10”.

* **Implement:** post-rank diversifier; exposes `meta.diversity`.

* **Exit:** Diversity unit tests green.

**C3. Explainability chips**

* **Write tests:** each item can yield ≤2 short reasons (≤60 chars) like “near your hotel · vegan-friendly”.

* **Implement:** reason generator from features; a11y-safe strings.

* **Exit:** Explain tests pass.

---

## **Phase D — Latency & Resilience**

**D1. SLA & timeouts**

* **Write tests:** personalization budget ≤80 ms p95; on timeout return base ranking and set `meta.personalization_timeout=true`.

* **Implement:** timeout wrapper \+ fallback; cache last good re-rank for 2–5 min per itinerary/query.

* **Exit:** Latency/timeout tests pass.

**D2. Map/list parity**

* **Write tests:** re-rank applies identically to list and map “Top Picks” overlay; clustering unaffected.

* **Implement:** shared ordering source for both views.

* **Exit:** Parity tests pass.

---

## **Phase E — Feedback Loop & APIs**

**E1. Feedback ingestion**

* **Write tests:** `/feedback` accepts explicit signals; rate-limited; idempotent by `(user,itinerary,item,action,timestampBucket)`.

* **Implement:** endpoint \+ Redis hot store; warehouse sink for batch training.

* **Exit:** API tests pass.

**E2. Online updates**

* **Write tests:** “Not for me → too pricey” downranks $$$ and up-ranks $$ for the **current itinerary**; “More like this” boosts similar features.

* **Implement:** trip-scoped adjustments applied in `S_personal`.

* **Exit:** Feedback effect tests pass.

**E3. Controls**

* **Write tests:** chips **More like this / Fewer like this** emit feedback; “Reset trip personalization” clears trip-scoped store.

* **Implement:** UI events wired to `/feedback`; reset route.

* **Exit:** Control tests pass.

---

## **Phase F — A/B Testing & Evaluation**

**F1. Experiment framework**

* **Write tests:** guardrails (diversity ≥ policy, p95 ≤ budget) auto-rollback on regression; sticky bucketing.

* **Implement:** assignment service \+ metric hooks.

* **Exit:** AB tests green.

**F2. Offline evaluation**

* **Write tests:** NDCG@10/20 on golden sets; fail CI on regression.

* **Implement:** evaluation harness \+ labeled fixtures.

* **Exit:** Offline eval integrated.

---

## **Phase G — Security, Privacy, Storage**

**G1. Data minimization**

* **Write tests:** no raw PII in features/logs; signals keyed by `{userId,itineraryId}`; retention windows enforced.

* **Implement:** anonymization/bucketing; TTLs; service tokens for access.

* **Exit:** Privacy tests pass.

**G2. Opt-out enforcement**

* **Write tests:** when user opts out, no signal writes and only base rank used; export/delete wipes personalization state.

* **Implement:** switches \+ data deletion job.

* **Exit:** Opt-out/erase tests pass.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate:

1. **Diet & accessibility respected:** vegan \+ wheelchair profile → non-compliant venues excluded; hints show “vegan-friendly/wheelchair accessible”.

2. **Trip-aware boosts:** saved kid-friendly museums near Montmartre → nearby family options bubble up for Entertainment.

3. **Diversity guarantee:** top-10 has ≥3 distinct cuisines/neighborhoods when many Italians match.

4. **Feedback affects ranking:** mark “too pricey” on $$$ → $$ up-ranked on next Gastronomy search.

5. **Cold-start fallback:** no signals → base scoring \+ broad diversity; no personal hints.

6. **Latency guardrail:** personalization timeout → results still return (base rank) with `personalization_timeout` meta flag.

7. **Privacy controls:** opt-out → base ranking only; no new signals stored.

---

## **Deliverables**

* **Personalization service** (`/rerank`, `/feedback`) with 60–80 ms p95, trip-scoped learning, and cached outcomes.

* **Feature mappers** (profile, itinerary, item) \+ diversity module and explainability generator.

* **Client hooks & UI** for chips (“More/Fewer like this”), “Why this result”, and **Reset trip personalization**.

* **A/B framework & metrics** (CTR, STR, dwell, diversity score, latency) with rollback guardrails.

* **Privacy & storage**: Redis hot signals; warehouse aggregates (anonymized); retention & opt-out enforcement.

* **Tests:** unit (features/blend/diversity/explain), contract (schemas), integration (feedback → re-rank), E2E (AC1–AC7), offline eval (NDCG).

---

