# **Story 16 — Search Platform — TDD Task Plan**

**Scope recap:** Unified **Search Orchestrator** that fans out to per-vertical **ProviderAdapters**, normalizes to canonical schemas, merges & ranks, and returns paginated results with layered caching, resilience (timeouts, retries, breakers), cost/QoS controls, and rich observability.

---

## **Phase A — Contracts & Validators (tests first)**

**A1. Define service-level JSON Schemas**

* **Write tests:** validate `SearchQuery` (vertical, context `{itineraryId, locale, currency, timezone, userPrefs}`, params, page, flags) and `SearchResponse` (items\[\], page, meta.providers\[\], meta.ranking). Reject unknown enums & clamp ranges.

* **Implement:** zod/JSON Schema \+ Ajv validators; generate TS types for server and Dart models for client.

**A2. Canonical item schemas per vertical**

* **Write tests:** golden fixtures per vertical normalize to ISO datetimes, unified currency, stable IDs; ensure missing/extra fields quarantined not crashed.

* **Implement:** schema modules `transportItem`, `accommodationItem`, `entertainmentItem`, `gastronomyItem`, `eventItem`, `trailItem`.

**A3. Semantic dedupe keys**

* **Write tests:** identical entities from two providers map to the same dedupe key (e.g., hotel: `{name|geo|address}`, transport: `{origin|dest|depart|carrier|number}`, etc.).

* **Implement:** pure `makeDedupeKey(vertical, item)` helpers.

---

## **Phase B — Orchestrator Core**

**B1. Orchestrator skeleton**

* **Write unit tests:** fan-out to enabled providers; hard timeouts per provider; collect partials with status `{ok|timeout|error|budget_exhausted}`.

* **Implement:** `SearchOrchestrator.search(query)`; per-call `searchRequestId`; provider fan-out with cancellable promises.

**B2. Merge, dedupe, and paginate**

* **Write tests:** merged list has one canonical item per entity with provenance array; cursor pagination deterministic (no re-ranking earlier pages).

* **Implement:** merge pipeline, stable sort key, cursor serializer.

**B3. Ranking pipeline \+ explain**

* **Write tests:** vertical rankers (price/distance/quality/duration/popularity/policy friendliness) produce stable order; `flags.debug=ranking` returns explain vectors.

* **Implement:** ranker functions \+ `meta.ranking.strategy` and optional per-item explain.

---

## **Phase C — Caching & Coalescing**

**C1. Keys & edge/service caches**

* **Write tests:** cache key \= `hash(vertical|normalizedParams|locale|currency|userPrefsSig|page.size)`; cursor excluded; negative-cache 30s for empty sets.

* **Implement:** edge (CDN) cache headers \+ Redis service cache with TTL per vertical.

**C2. Request coalescing**

* **Write tests:** duplicate in-flight requests join a single upstream call; all await same promise.

* **Implement:** in-memory/singleflight guard around the cache key.

**C3. Cache metadata**

* **Write tests:** response `meta.providers[*].cache` reflects `"edge" | "service" | "miss"`; p95 improves on repeat queries.

* **Implement:** annotate provider meta; latency tracking.

---

## **Phase D — Resilience & QoS**

**D1. Timeouts, retries, breakers, bulkheads**

* **Write tests:** provider over timeout ⇒ marked `timeout`, others still return 200; consecutive failures open circuit; per-provider connection pool caps enforced.

* **Implement:** retry (idempotent only), circuit breaker state, bulkhead pools.

**D2. Budgets & adaptive throttling**

* **Write tests:** when monthly/QPS budgets exceed, adapter reports `budget_exhausted`; orchestrator rebalances to alternates; event logged.

* **Implement:** token bucket per provider \+ budget burn-down; adaptive traffic shifting by costWeight × latency × hitrate.

**D3. Graceful degradation**

* **Write tests:** if all providers fail, serve last-good cached within staleness budget; else return empty with friendly error.

* **Implement:** stale-while-revalidate \+ max-staleness policy.

---

## **Phase E — Provider Adapter Contract (MVP stubs)**

**E1. Adapter interface & SDK**

* **Write tests:** adapters declare `name, vertical, capabilities, limits{qps,burst,timeoutMs}, regions[], costWeight`; validate config hot-reload.

* **Implement:** `ProviderAdapter` TypeScript interface \+ helper SDK (auth headers, pagination, backoff, canonical builders).

**E2. Sandbox fixtures & fault injector**

* **Write tests:** fixtures per vertical for happy-path, 429, 5xx, schema drift; injector simulates timeouts and slow starts.

* **Implement:** deterministic fixtures \+ injectable adapter transport.

*(Actual provider integrations are Story 22; here we ship stable stubs that satisfy contracts.)*

---

## **Phase F — Security, Compliance, and Geo/TOS**

**F1. Input/output validation & sanitation**

* **Write tests:** reject unknown enums; clamp numeric ranges; sanitize vendor URLs; validate coordinates/hours.

* **Implement:** pre/post schema guards \+ URL sanitizer.

**F2. PII minimization & geo controls**

* **Write tests:** strip traveler PII from outbound requests; disallow providers in restricted countries; skip caching where TOS forbids.

* **Implement:** TOS registry \+ geo allow/deny lists; per-provider cache flags.

---

## **Phase G — Observability**

**G1. Tracing & metrics**

* **Write tests:** spans correlate `search_request_id` ↔ provider calls; record `tookMs, cacheHit, quotaDebit, itemsReturned`; dashboards expose per-provider SLIs.

* **Implement:** OpenTelemetry wiring \+ labeled metrics and error taxonomy.

**G2. Schema drift sampling**

* **Write tests:** 1% PII-scrubbed raw payload sampling stored for diffing & alerting on schema changes.

* **Implement:** sampling sink with retention policy.

---

## **Phase H — Feature Gates & Kill Switches**

**H1. Config service \+ canaries**

* **Write tests:** enable/disable providers per region/env; canary 5% traffic; kill-switch instantly halts a provider.

* **Implement:** hot-reload config \+ guard wrappers.

---

## **Phase I — End-to-End Acceptance Tests (from story)**

Automate these with fixtures:

1. **Normalization parity:** adapter maps native payload → canonical item with ISO times, normalized price, lat/lng, reviews.

2. **Timeout & partials:** slow provider marked `timeout`; others return within budget.

3. **Budget exhaustion:** over-budget provider returns `budget_exhausted`; traffic shifts; event logged.

4. **Cache & negative-cache:** repeat query hits service cache; empty-set negative-cached briefly.

5. **Schema drift protection:** unexpected enum/new field quarantined; SCHEMA\_ERROR logged; rest maps safely.

6. **Geo/TOS enforcement:** disallowed provider skipped based on country/TOS.

7. **Suggest & open-now correctness:** suggest normalizes vegan/vegetarian; openNow uses local time properly.

8. **Lookup parity:** lookup returns richer detail with same stable dedupe fields.

9. **Ranking explainability & cache effectiveness:** debug surfaces strategy; repeat queries reflect `"service"`/`"edge"` cache and faster p95.

---

## **Deliverables**

* **Service**: `SearchOrchestrator` with merge/dedupe/rank/paginate \+ resilience & caching.

* **Contracts**: JSON Schemas for `SearchQuery` / `SearchResponse` \+ canonical per-vertical items.

* **Caching**: CDN config, Redis cache, negative-cache, coalescing.

* **QoS**: token buckets, circuit breakers, bulkheads, graceful degradation.

* **Security & Compliance**: TOS registry, geo allow/deny, PII stripping, URL sanitizer.

* **Observability**: tracing, metrics, error taxonomy, sampling.

* **Adapter SDK \+ stubs** for all verticals (real integrations in Story 22).

* **Docs**: integration playbook & runbooks (provider down, schema drift, budget hit).

---

