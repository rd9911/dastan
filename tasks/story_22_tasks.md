# **Story 22 — Provider Integrations — TDD Task Plan**

## **Phase A — Adapter SDK, Contracts, Keys (tests first)**

**A1. Adapter interface & context**

* **Write contract tests:** Type checks for `ProviderAdapter` (name, vertical, capabilities, limits{qps, burst, timeoutMs}, regions\[\], costWeight). Validate hot-reload config.

* **Implement:** TS interface \+ helper SDK (auth headers, pagination, backoff, canonical builders).

**A2. Key & quota store**

* **Write tests:** KMS-stored API keys; token-bucket per adapter (QPS/burst); monthly budget counters.

* **Implement:** secrets loader \+ Redis buckets; budget roll-ups.

**A3. TOS/geo registry**

* **Write tests:** per-provider `cacheAllowed`, `attribution`, `geoAllow`, `displayRules`; queries in disallowed regions are skipped.

* **Implement:** registry \+ guard middleware.

---

## **Phase B — Normalizers & Canonical Mappers**

**B1. Time/currency/location utilities**

* **Write tests:** provider local times → ISO with TZ; prices → `{amountMicros,currency}` via FX; lat/lng validation & distance computation.

* **Implement:** pure mappers with snapshot tests.

**B2. Per-vertical canonical builders**

* **Write tests:** golden fixtures per vertical map to canonical schemas (Story 16/21), including review scores & popularity.

* **Implement:** `toTransportItem`, `toAccommodationItem`, `toEntertainmentItem`, `toGastronomyItem`, `toEventItem`, `toTrailItem`.

**B3. Semantic dedupe keys**

* **Write tests:** duplicate entities from two providers share same dedupe key; preserved in `provenance[]`.

* **Implement:** helpers reused by orchestrator merge step.

---

## **Phase C — MVP Provider Adapters (search/lookup/suggest/calendar)**

Pick 1–2 reliable vendors per vertical \+ 1 backup where licensing allows. Ship behind flags.

**C1. Transport**

* **Tests:** `search`, `lookup`, `minPriceCalendar` with fare families; retry idempotent GETs only; circuit breaker on timeouts.

* **Implement:** Flights \+ Rail \+ Bus adapters with cost weights.

**C2. Accommodation**

* **Tests:** taxes/fees normalization; cancellation policy fields; amenity mapping.

* **Implement:** OTA/meta \+ boutique aggregator.

**C3. Entertainment & Gastronomy**

* **Tests:** hours (open-now), price bands, dietary tags; suggest tokens (“vegan/vegetarian”).

* **Implement:** POI graph \+ local guide adapter.

**C4. Events**

* **Tests:** start/end/dates, venue, ticket links; cacheability hints.

* **Implement:** ticketing \+ city calendars.

**C5. Trails**

* **Tests:** duration/difficulty normalization, optional GPX/polyline.

* **Implement:** outdoor routes adapter.

---

## **Phase D — Resilience, Caching & Coalescing**

**D1. Timeouts/retries/breakers**

* **Write tests:** provider timeout → `status:"timeout"`; others still return 200; breaker opens after N consecutive failures.

* **Implement:** per-adapter breaker \+ jittered retry for idempotent ops.

**D2. Layered caching**

* **Write tests:** service cache keys `hash(vertical|normalizedParams|locale|currency|prefsSig|page.size)`; negative-cache 30s for empty/error.

* **Implement:** Redis \+ edge cache headers; longer TTL for stable lookups (e.g., trails).

**D3. Request coalescing**

* **Write tests:** duplicate inflight requests join one upstream.

* **Implement:** singleflight around cache key.

---

## **Phase E — Compliance, Security & PII Minimization**

**E1. Outbound/Inbound validation**

* **Write tests:** clamp ranges; reject unknown enums; sanitize vendor URLs; strip HTML.

* **Implement:** schema guards \+ sanitizer.

**E2. PII & geo controls**

* **Write tests:** redact traveler names/emails unless strictly required; skip disallowed countries/providers; honor “no cache” TOS.

* **Implement:** PII filter \+ geo/TOS enforcement.

**E3. Secrets & egress**

* **Write tests:** KMS key rotation; pinned domains, TLS verification; optional egress proxy.

* **Implement:** key loader \+ HTTP client with pinning.

---

## **Phase F — Sandbox, Fixtures, Chaos & Load**

**F1. Fixtures**

* **Write tests:** golden JSON for each provider/vertical (multiple locales/currencies/timezones; edge/corrupt samples).

* **Implement:** checked into repo with snapshot tests.

**F2. Fault injector**

* **Write tests:** simulate 429/5xx/timeouts/slow starts/partial pages/schema drift; verify breakers & fallbacks.

* **Implement:** injectable transport.

**F3. Load harness**

* **Write tests:** replay popular queries with mixed hit/miss; assert p95 budgets per vertical.

* **Implement:** scripted scenarios \+ dashboards.

---

## **Phase G — Observability & Rollout**

**G1. Tracing/metrics/taxonomy**

* **Write tests:** spans per provider with `status,tookMs,cacheHit,quotaDebit,itemsReturned`; error codes (`TIMEOUT`,`RATE_LIMITED`,`SCHEMA_ERROR`, …).

* **Implement:** OpenTelemetry \+ labeled metrics & dashboards.

**G2. Shadow → mirror → partial → full**

* **Write tests:** new adapter ships in shadow (log-only), then mirrored %, then region canary 5%, then full.

* **Implement:** config flags & kill-switch.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate from the story:

1. **Normalization parity:** two providers same hotel → one canonical card with provenance list.

2. **Dedupe by semantic keys:** duplicate transport merged; vendors aggregated.

3. **Ranking explainability (debug):** meta includes strategy \+ per-item explain vectors.

4. **Cache effectiveness:** repeat Entertainment query improves p95; `meta.providers[*].cache` shows `"service"`/`"edge"`.

5. **Provider failover:** primary accommodation times out ⇒ breaker opens; alternate serves; meta marks `"timeout"`.

6. **Budget & quotas:** provider budget exhausted ⇒ `budget_exhausted` and traffic shifts.

7. **Graceful degradation:** all transport fail ⇒ serve last-good cached within freshness window, else empty with retryable error.

8. **Pagination integrity:** cursor returns deterministic next slice; no re-ranking earlier pages.

9. **Security & PII:** outbound PII stripped; responses validated pre-map.

10. **Suggest & open-now:** “vega” → vegan/vegetarian; open-now uses correct local time.

11. **Lookup parity:** lookup returns richer detail with same stable dedupe fields.

---

## **Deliverables**

* **Adapter SDK \+ contracts** with config, limits, and helpers.

* **MVP adapters** per vertical (primary \+ backup), mappers, and tests.

* **Quotas & budgets** (QPS, burst, monthly) \+ cost weights.

* **Resilience & caching** (timeouts, retries, breakers; Redis \+ edge; negative-cache).

* **Compliance & security** (TOS/geo, PII stripping, KMS keys, pinned egress).

* **Sandbox suite** (fixtures, fault injector, load harness).

* **Observability & rollout** (traces, metrics, dashboards; shadow→mirror→canary→full).

* **Docs & runbooks**: integration guide, error codes, provider-down/schema-drift/budget-hit playbooks.

---

