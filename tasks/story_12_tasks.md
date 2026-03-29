# **Story 12 — Email Scanner — TDD Task Plan**

**Scope recap:** Opt-in email connection; safe “Inbox ▸ Travel” triage; strict binding to **Active Itinerary** on import; parsers for major vendors; re-scan-safe dedupe; offline readiness; privacy/QR handling.

## **Phase A — Contracts, Storage & Dedupe (tests first)**

**A1. Client contracts**

* **Write tests:** JSON round-trip & validation for `EmailConnection`, `ParsedMessage`, `ImportRequest`, `ImportResult`.

* **Implement:** Freezed \+ `json_serializable` exactly per spec (providers, status, scopes, autoFile, allowList, lastSyncAt; parsed message payload \+ attachments).

**A2. SavedItem provenance & dedupe**

* **Write tests:** imported items carry `{source:'email', provider, emailMessageId}` in provenance; compute `dedupeKey` per section; re-scan is idempotent.

* **Implement:** add provenance fields; unify dedupe rules with section seeds; enforce upsert on `dedupeKey`.

**A3. Drift tables**

* **Write tests:** `email_connections`, `email_parsed_cache` (by `threadId/messageId`, TTL), `email_import_log`.

* **Implement:** schema, DAOs, migrations (fwd/back).

* **Exit:** CRUD/migration tests green.

---

## **Phase B — Provider Auth, Fetch & Classify**

**B1. OAuth connect (Gmail/Outlook; IMAP fallback)**

* **Write tests:** scope validation (read-only \+ thread metadata), token storage in secure storage, pause/disconnect.

* **Implement:** Connect screen (Settings ▸ Integrations ▸ “Connect Email”), provider SDKs, secure token vault.

**B2. Fetch headers/snippets \+ prefilter**

* **Write tests:** label/subject prefilters (e.g., Gmail “category:travel OR label:travel”); rate-limit backoff.

* **Implement:** background fetcher → recent threads (headers/snippets only).

**B3. Classifier (stage 1\)**

* **Write tests:** hybrid ML/regex classifier tags `transport|accommodation|events|other` with confidence score.

* **Implement:** header/sender/keyword features → category \+ confidence; log observability events.

---

## **Phase C — Parse & Normalize (stage 2/3)**

**C1. Template/ML extractors**

* **Write tests:** per category fields:

  * **Transport:** legs, carriers, PNR, baggage, fare class.

  * **Accommodation:** property, address/geo, check-in/out, board plan, confirmation.

  * **Events:** title, venue, datetime, seats/QR, order ID.

* **Implement:** vendor templates (regex/layout models) \+ attachments (PDF) hooks.

**C2. Normalizers**

* **Write tests:** timezone & currency normalization; geo-resolution; price rollups; robust date parsing.

* **Implement:** pure utilities; snapshot tests.

**C3. Preview rendering**

* **Write tests:** Preview sheet shows structured fields; opens raw email on demand; warns on low confidence with highlighted fields.

* **Implement:** Preview sheet UI.

---

## **Phase D — Inbox ▸ Travel & Import**

**D1. Inbox list**

* **Write tests:** grouped conversations with badges (New/Updated/Low Confidence); cards show sender, subject, detected category, confidence.

* **Implement:** screen \+ Riverpod store; pagination.

**D2. Add to itinerary (manual)**

* **Write tests:** pressing **Add** creates `SavedItem` with `{itineraryId:<Active>, section:<derived>}`, shows instantly in the relevant section.

* **Implement:** import orchestrator → `SavedItem` upsert \+ activity note. Guard if no Active Itinerary.

**D3. Auto-file (optional)**

* **Write tests:** high-confidence parses auto-create under current Active Itinerary; appear in **Imported** tray with Undo.

* **Implement:** toggle in connection; queue processor; imported tray UI.

**D4. Updates & cancellations**

* **Write tests:** later emails match on `dedupeKey` → update existing SavedItem; cancellations mark item **Cancelled** \+ policy/timestamp.

* **Implement:** updater merges fields; add “Updated from email” activity note.

---

## **Phase E — Security, Privacy, QR handling**

**E1. Safety rails**

* **Write tests:** sanitized vendor links; barcodes/QR stored securely and hidden until **Reveal**; excluded from shared snapshots by default.

* **Implement:** URL sanitizer; secure media store; “Reveal” control with audit entry.

**E2. Token/PII handling**

* **Write tests:** tokens in secure storage; encrypt any cached bodies; shares redact PII per Story 10 defaults.

* **Implement:** crypto wrappers; redaction integration.

---

## **Phase F — Offline & Error UX**

**F1. Offline-ready outcome**

* **Write tests:** once imported, items are viewable offline like any SavedItem.

* **Implement:** reuse local models/DAOs; ensure previews persist key fields.

**F2. Provider limits & pause**

* **Write tests:** backoff on 429; surface “Paused due to errors — Retry.”

* **Implement:** error state \+ manual resume.

---

## **Phase G — Telemetry, A11y, i18n**

**G1. Observability**

* **Write tests (spy):** `email_connected`, `scan_started`, `message_classified`, `parse_success`, `parse_low_confidence`, `import_created/updated/cancelled`, `auto_file_on/off`.

* **Implement:** analytics hooks.

**G2. Accessibility & i18n**

* **Write tests:** labeled rows for parsed fields; announce confidence/actions; localized timestamps/currencies.

* **Implement:** semantics \+ `intl`.

---

## **Phase H — Acceptance Criteria → Gherkin E2E**

Automate:

1. **AC1 — Opt-in connect:** connect Gmail; status shows **connected**; can pause/disconnect.

2. **AC2 — Gate behind Active Itinerary:** try to import with none active → forced select/create → import binds to that itinerary.

3. **AC3 — Manual add flow:** hotel email → **Add** → `section=accommodation` with parsed dates/details appears immediately.

4. **AC4 — Auto-file:** high-confidence flight auto-files under current Active Itinerary and shows in Imported tray with Undo.

5. **AC5 — Update & cancel:** schedule-change updates item; hotel cancellation marks **Cancelled** with policy/time.

6. **AC6 — Deduping & idempotency:** re-scan same confirmation → no duplicate (key-based).

7. **AC7 — Privacy & QR:** QR stored/hidden until Reveal; never included in shared snapshots by default.

8. **AC8 — Offline-ready:** imported items viewable offline.

---

## **Deliverables**

* **Integrations:** Gmail/Outlook OAuth \+ IMAP fallback (read-only scopes; metadata-first).

* **Parsing pipeline:** classifier → template/ML extractors → normalizers → upsert via `dedupeKey`.

* **UI:** Settings connect; **Inbox ▸ Travel** list; Preview sheet; Imported tray; connection status pill.

* **Data & security:** Drift caches/logs; provenance; encrypted message cache; sanitized vendor links; hidden QR.

* **Tests:** unit (parsers, timezones, keys), contract (auth/scopes, fetch limits), E2E (connect→detect→preview→add, auto-file, update/cancel, offline, revoke).

* **Policy notes:** least-privilege fetching; never ingest whole mailbox; rate-limit backoff; DKIM/SPF already tracked in global notes.

---

