# **Story 21 — Search Assist APIs — TDD Task Plan**

## **Phase A — API Contracts & Validators (tests first)**

**A1. Envelope & vertical request/response schemas**

* **Write contract tests:** zod/JSON Schema for `GET /api/search/{vertical}` shared params (`locale,currency,timezone,q,bounds,sort,page.size,cursor,flags.debug/strict`) \+ vertical params (transport, accommodation, entertainment, gastronomy, events, trails). Validate enums, clamp ranges.

* **Implement:** validators \+ TS types; generate OpenAPI. Responses include `items[]`, `page{cursor,hasMore}`, `meta.providers[]`, and optional ranking explain (when `flags.debug`).

**A2. Canonical item schemas**

* **Write tests:** goldens for each vertical map to canonical fields (ISO datetimes, normalized currency, lat/lng, stable IDs/provenance).

* **Implement:** schema modules used by controllers and Save helpers.

**A3. Error model**

* **Write tests:** consistent `{code,message,details[]}` for `MISSING_ACTIVE_ITINERARY`, `FORBIDDEN`, `QUOTA_EXCEEDED`, `UNPROCESSABLE_ENTITY`.

* **Implement:** error helpers & middleware.

---

## **Phase B — Controllers → Orchestrator Wiring**

**B1. Search controllers**

* **Write unit tests:** route calls orchestrator with normalized query \+ user context; enforces boundsOnly, openNow, debug flags.

* **Implement:** pass-through to Story-16 `SearchOrchestrator`, returning merged results & provider cache meta.

**B2. Suggest & calendars**

* **Write tests:** `GET /api/search/suggest` (vertical, q, place) returns normalized tokens; `GET /api/search/transport/min-price-calendar` returns day→minPrice grid with normalized currency.

* **Implement:** delegate to orchestrator/adapters; attach rank/usage meta.

**B3. Caching & quotas**

* **Write tests:** edge cache headers (30–120s), Redis service cache keys \= `hash(vertical|normalizedParams|locale|currency|prefsSig|page.size)`; per-user soft quotas → `429` with `Retry-After`.

* **Implement:** CDN config \+ Redis layer \+ token-bucket per user/vertical.

---

## **Phase C — Save Helpers (idempotent; itinerary-bound)**

**C1. Routes**

* **Write contract tests:** `POST /api/search/{vertical}/save` body `{ payload: CanonicalItem, itineraryId?, dedupeKey? }`; require `X-Idempotency-Key`.

* **Implement:** resolve itinerary: if missing, look up user **Active Itinerary**, else verify RBAC; validate `section` vs vertical; sanitize URLs/HTML; compute canonical `dedupeKey`; upsert `(itineraryId, dedupeKey)` unique.

**C2. Idempotency & dedupe**

* **Write tests:** retry with same `X-Idempotency-Key` returns original response; repeat save with same dedupe resolves to `{created:false}`.

* **Implement:** idempotency key store; DB uniqueness on `(itineraryId, dedupeKey)`.

**C3. RBAC & Active-Itinerary binding**

* **Write tests:** Viewer trying to save to itinerary they can’t write → 403; omitting itineraryId binds to user’s Active itinerary.

* **Implement:** policy checks \+ Active-Itinerary lookup.

---

## **Phase D — “Open Now”, Bounds & Normalizations**

**D1. Open-now correctness**

* **Write tests:** with itinerary TZ, venues closed at local 20:30 are excluded; hours normalized to IANA TZ.

* **Implement:** hours normalizer using itinerary/user TZ.

**D2. Bounds filtering**

* **Write tests:** `boundsOnly=true` returns only items within viewport; list/map parity ensured.

* **Implement:** geospatial filter module reused across verticals.

---

## **Phase E — Security, Rate Limits, Observability**

**E1. Security rails**

* **Write tests:** sanitize vendor URLs; strip HTML in descriptions; WAF rules on search routes.

* **Implement:** sanitizer \+ allowlist \+ WAF annotations.

**E2. Rate limits & abuse**

* **Write tests:** per-IP and per-user limits; graceful errors; backoff headers.

* **Implement:** gateway limits \+ headers.

**E3. Tracing & metrics**

* **Write tests:** correlate `search_request_id` ↔ provider calls ↔ save helper; export cache hit ratio, p95, quota denials.

* **Implement:** OpenTelemetry spans \+ labeled metrics.

---

## **Phase F — Web & Mobile DX (thin clients)**

**F1. Response “Save contract”**

* **Write tests:** each item includes minimal `savePayload` the client can echo to `/save`; fields match canonical schemas.

* **Implement:** response decorator.

**F2. Error copy & fallbacks**

* **Write tests:** cache hits reflected in `meta.providers[*].cache` and faster p95 on repeat; friendly empty-state & retry guidance.

* **Implement:** meta annotations; standardized copy.

---

## **Phase G — End-to-End TDD (Acceptance Criteria)**

Automate the story’s ACs with fixtures:

1. **Active-Itinerary binding:** POST save without itineraryId files under user’s Active Itinerary and returns `{created:true}`.

2. **Dedupe on save:** second identical save returns `{created:false}`; DB holds one row.

3. **RBAC:** viewer saving to itinerary I-789 → 403 FORBIDDEN.

4. **Cache hits:** repeat Entertainment search shows `meta.providers[*].cache in {"service","edge"}` and lower p95.

5. **Bounds filtering:** Gastronomy with `boundsOnly=true` returns only in-viewport items.

6. **Open-now correctness:** Gastronomy at 20:30 local excludes closed venues; hours normalized.

7. **Transport calendar:** `/transport/min-price-calendar` returns normalized currency grid.

8. **Save idempotency:** repeated save with same `X-Idempotency-Key` returns original body; no duplicate.

9. **Suggest quality:** `suggest?q=vega` includes vegan/vegetarian ordered by popularity.

---

## **Deliverables**

* **Routes:** `GET /api/search/{vertical}`, `GET /api/search/suggest`, `GET /api/search/transport/min-price-calendar`, `POST /api/search/{vertical}/save`.

* **Contracts:** JSON Schemas \+ OpenAPI for all endpoints; canonical item schemas.

* **Save pipeline:** itinerary resolution, RBAC checks, sanitization, canonical `dedupeKey`, idempotency store, `(itineraryId,dedupeKey)` unique index.

* **Caching/Quotas:** CDN headers \+ Redis cache; per-user token buckets with `Retry-After`.

* **Observability:** traces correlated from request → provider → save; metrics dashboards.

* **Security:** WAF rules; URL/HTML sanitization; strict validators.

---

