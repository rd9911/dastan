# **Story 1 — Create/Select Itinerary, Enforce In-Itinerary Search, and Auto-Bind Saves**

**As a** traveler  
**I want** to create or select an itinerary before I can search for transport, accommodation, entertainment, gastronomy, trails, or events.  
**So that** every result I save automatically knows its parent itinerary and section and is stored correctly without extra steps.

## **Why this matters (from the spec)**

* The itinerary is the app’s first page and wraps all search surfaces (searches are accessible only when you enter the itinerary); whatever I save goes into the current itinerary’s own folders/sections.  
* Sections include Transport, Accommodation, Entertainment, Gastronomy, Trails, and Events; search inputs reuse context (e.g., dates/city) from earlier steps where possible.  
* The final itinerary is viewable offline, so itinerary metadata and saved items must be available for offline access/sync.

## **Scope**

* Force an “Active Itinerary” context:  
  * The user must create or select an itinerary before accessing any search page.

  * A persistent top app-bar chip shows the current itinerary with a one-tap switcher.

* Auto-binding on save:

  * All “Save” actions attach `itineraryId` and `section` (transport, accommodation, entertainment, gastronomy, trails, events) without extra user input.

  * Items appear under the correct section within the itinerary overview immediately.

* Context propagation:

  * Search forms prefill from the active itinerary (destination, date range, travelers) and from previously saved items where the spec allows (e.g., accommodation can reuse transport dates).

* Offline-first shell:  
  * Itinerary metadata and saved items are cached locally; saves are queued if offline and synced later. Final itinerary snapshot support will be covered in a later story.

## **Non-Goals (covered in later stories)**

* Daily plan builder and final offline snapshot/map share.  
* Collaborators/permissions.  
* Email scanner ingestion.

## **Detailed Workflow**

1. **First run / empty state**  
   * User lands on “Itinerary Hub” with an empty state CTA: “Create itinerary” which has all itineraries, is exists (otherwise blank).  
   * Create Itinerary form: title (required), destination (city/region/country), date range (optional), travelers (optional).  
   * On create, new itinerary becomes Active; user is taken to the Itinerary Overview that has 2 cards (“Overview” and “Search” windows) that can be switched by tapping on them. In Overview window, you have list of reservations according to the category (e.g. flight, accommodation etc.). In Search window, it has 6 search cards: Transport, Accommodation, Entertainment, Events, Gastronomy, Hiking Trails.

2. **Accessing search**

   * From the Itinerary Overview/Search, the user taps any section (e.g., Transport) to open the respective search.  
   * The search form is prefilled using Active Itinerary’s destination/dates (if present) and can also reuse context as allowed by the spec (e.g., accommodation dates can be derived from transport legs).

3. **Saving results**

   * Every result card (ticket, hotel, place, restaurant, trail, event) has a **Save** action.  
   * On save:  
     * App binds `{ itineraryId, section }` and generates a deterministic `dedupeKey` (e.g., `hash(vendorId|externalId|startDate|itineraryId)`).  
     * Item is inserted into local store, appears immediately under the corresponding section in Itinerary Overview/Overview, and is queued for sync if offline.

4. **Switching itineraries**  
   * If the user switches the Active Itinerary while on a search screen:  
     * A toast confirms: “Active itinerary switched to X. New saves will go to X.”  
     * If there are unsaved changes (e.g., filters), keep the form values but update the binding target.

5. **Attempting search without an active itinerary**  
   * If user navigates (deep link or bookmark) to a search view with **no** Active Itinerary, show a blocking modal:  
     * “Select or create an itinerary to continue.”  
     * Provide quick-pick list \+ “Create new”.

## **Data Model (contract for binding)**

**Note:** This is a client-side model that mirrors backend contracts; exact backend schema will be finalized in the API story.

{  
  "Itinerary": {  
    "id": "uuid",  
    "title": "string",  
    "destination": { "type": "string", "granularity": "city|region|country" },  
    "dateRange": { "start": "date", "end": "date" },  
    "travelers": 2,  
    "createdAt": "iso-date-time",  
    "updatedAt": "iso-date-time"  
  },  
  "SavedItem": {  
    "id": "uuid",  
    "itineraryId": "uuid",  
    "section": "transport|accommodation|entertainment|gastronomy|trails|events",  
    "summary": "string",  
    "details": { "type": "object" },   
    "external": { "vendor": "string", "vendorUrl": "url", "externalId": "string" },  
    "time": { "start": "iso-date-time", "end": "iso-date-time" },  
    "location": { "name": "string", "lat": 0, "lng": 0 },  
    "media": \[{ "url": "url", "type": "image" }\],  
    "dedupeKey": "string",  
    "createdAt": "iso-date-time",  
    "updatedAt": "iso-date-time",  
    "sync": { "status": "queued|synced|error", "lastAttemptAt": "iso-date-time" }  
  }  
}

**Rules**

* `itineraryId` and `section` are **required** on every `SavedItem`.  
* Section values map 1:1 to the app’s sections defined in the spec.  
* For accommodation and transport, reuse dates/destination where the spec allows.

## **Acceptance Criteria (Gherkin)**

**AC1 — Must select itinerary before search**

Given I have no active itinerary  
When I try to open any search page  
Then I am blocked by a modal to create or select an itinerary  
And after selecting/creating one, I am taken back to the intended search page  
And that itinerary becomes Active.

**AC2 — Create itinerary (happy path)**

Given I am on the Itinerary Hub  
When I create a new itinerary with a title  
Then it becomes the Active Itinerary  
And I see the Itinerary Overview with 2 cards (“Overview” and “Search” windows) that can be switched by tapping on them.  In Overview window, you have list of reservations according to the category (e.g. flight, accommodation etc.). In Search window, it has 6 search cards: Transport, Accommodation, Entertainment, Events, Gastronomy, Trails.

(Sections per spec: Transport, Accommodation, Entertainment, Gastronomy, Trails, Events.)

**AC3 — Prefill search from itinerary**

Given an Active Itinerary with destination and dates  
When I open Accommodation search  
Then destination and date fields are prefilled from the itinerary (or prior transport) where applicable.

(Reuse of inputs per spec.)

**AC4 — Auto-binding on save**

Given an Active Itinerary and I view a Transport result  
When I tap Save  
Then the item is stored with itineraryId=\<Active\>, section=transport  
And it appears immediately under Transport in the Itinerary Overview/Overview.

(Identical AC applies to other sections with their respective `section` values.)

**AC5 — Dedupe protection**

Given I see the same vendor item I saved before the save button should look like “saved” When I press on it, it will unsave the item.  
And I get a snack bar telling me that I unsaved the item.

**AC6 — Itinerary switch while searching**

Given I am in Events search with Active Itinerary=A  
When I switch Active Itinerary to B from the top chip  
Then the UI confirms the switch  
And subsequent saves bind to itinerary B without losing my current filters.

**AC7 — Offline save queue**

Given I am offline  
When I save a result  
Then it is visible under the correct section immediately with a “Syncing…” badge  
And it syncs automatically when I regain connectivity.

(Offline availability of itinerary content is a requirement.)

**AC8 — Validation & errors**

Given I try to create an itinerary without a title  
Then the Create button is disabled and I see inline validation.

Given a save fails due to network/server error  
Then I see a retry affordance and the item remains queued with error state.

## **UX & Interaction Details**

* **Top app-bar itinerary chip:** shows title \+ caret; tap to open a sheet with My Itineraries (+ quick create).

* **Save buttons:** present on result cards as per each section’s UI; they never ask “which itinerary?”. The binding is implicit via Active Itinerary.  
* **Unsave buttons:** present on result cards as per each section’s UI where result cards are already saved. they never ask “which itinerary?”. The binding is implicit via Active Itinerary.

* **Itinerary Overview:** Lists 2 navigation links on top side of the window: Overview (default displayed window) and Search. Below the links there are contents of Overview and Search pages.  
  * Content of Overview window: list of all saved reservations, bookings, section items according to the section category.  
  * Content of Search window: lists six sections; each shows saved items as cards; tapping a section header goes to its search (prefilled if data exist).

* **Loading & empty states:** skeletons for lists, helpful empty copy, and retry actions.

## **Performance, Reliability, and Observability (DoD)**

* **Local cache:** Itinerary metadata \+ saved items persisted; reduced cold-start queries. (Supports final offline viewing later.)  
* **Idempotent saves:** Use `dedupeKey` to find items that are saved so that the item’s “save” button can change to “saved” type once it is revealed that the item is already saved.  
* **Telemetry:** Log `itinerary_created`, `itinerary_activated`, `search_opened`, `item_saved` (with `section`, anonymized vendor), `save_deduped`, `save_failed`, `save_synced`.  
* **Accessibility:** All actions reachable via keyboard/screen readers; labels on Save and Saved.  
* **i18n:** Copy pulled from localization tables.

## **Assumptions**

* ❓Assumption: A single Active Itinerary per user across the app; switching is global.  
* ❓Assumption: Destination/date reuse from transport → accommodation is allowed when unambiguous (user can override). Spec hints this reuse is desirable.

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

**Story 2 — Transport Search & Save (inside Active Itinerary)**

**As a** traveler  
 **I want** to search transport (flights, trains, buses) with flexible and exact dates, and advanced/group options  
 **So that** I can discover, compare, and save the best routes directly into my active itinerary’s Transport section.

---

## **Scope**

* **In-itinerary only:** Transport search is accessible **only** when an Active Itinerary exists; all saves bind `{ itineraryId, section:"transport" }` automatically.

* **Inputs (default/simple):** one-way/round-trip, dates or **flexible months**, origin (city/country), destination (city/region/country/region), travelers, modes (flights/trains/buses).

* **Flexible-date calendar:** Before showing fares, show a month grid with **minimum prices** for the cheapest mode of transport; user picks months, then drill to exact dates if needed.

* **Region/country hierarchy:** If user picks a region instead of a city, cascade: region → cheapest countries → cheapest cities; similarly handle broad origins to suggest **possible departure cities** with cheapest fares.

* **Results UX:** Each **mode** has its own tab; switch by tapping mode icon. Cards show key facts (dep/arr city, date/time; flights also show airport codes & baggage). Detail view lists **segments/transfers**, vendors with prices, and a **Go to Vendor** button.

* **Advanced search (subflow):** Multi-stop itineraries with per-leg mode selection. Hidden by default behind “Advanced.”

* **Group search (subflow):** Find **cheapest and shortest mutual destinations** for friends in different cities. Hidden by default behind “Group.”

* **Performance & offline:** API results **cached**; so that whenever another user searches for the same information, the app can give price information when they open a calendar.

---

## **Detailed Workflow**

1. **Open Transport (from Itinerary Overview)**  
    Prefill origin/destination/dates from itinerary if present; travelers from itinerary.

2. **Choose search type**  
   * **Simple:** one-way / round-trip; exact dates or **Flexible months**.  
   * **Advanced:** add legs (A→B mode1, B→C mode2…).  
   * **Group:** enter multiple origin cities; compute top mutual destinations by cost/time.  
3. **Flexible-date flow**  
    Show month grid with **min price for the cheapest mode of transportation**; user selects months; app then proposes **exact dates**.  
4. **Region/country drill-down**  
   If region chosen: show **countries → cities** with cheapest fares; if origin is “country,” suggest **departure cities** with cheapest fares.  
5. **Results & sorting**  
    Mode tabs (Flights / Trains / Buses). Sorting: price, duration. Tickets show dep/arr, times, (airports \+ baggage for flights). Tap → details (segments, vendors, price matrix, deep link).

6. **Save**  
    “Save” binds `{ itineraryId:<Active>, section:"transport" }`, generates `dedupeKey`, inserts to local store, appears immediately under Transport in Itinerary Overview; queued if offline.

7. **Vendor handoff**  
    “Go to vendor” opens external vendor page from the detail view.

---

## **Data Contracts (client-side, aligned to backend to be defined later)**

{

  "TransportSearchRequest": {

    "type": "object",

    "required": \["context", "tripType", "modes"\],

    "properties": {

      "context": {

        "type": "object",

        "required": \["itineraryId"\],

        "properties": {

          "itineraryId": { "type": "string", "format": "uuid" },

          "prefill": {

            "type": "object",

            "properties": {

              "origin": { "type": "string" },

              "destination": { "type": "string" },

              "dateRange": {

                "type": "object",

                "properties": {

                  "start": { "type": "string", "format": "date" },

                  "end": { "type": "string", "format": "date" },

                  "type": { "type": "string", "enum": \["exact","flexible-months"\] }

                }

              },

              "travelers": { "type": "integer", "minimum": 1 }

            }

          }

        }

      },

      "tripType": { "type": "string", "enum": \["oneway","roundtrip","multileg","group"\] },

      "modes": { "type": "array", "items": { "type": "string", "enum": \["flight","train","bus"\] }, "minItems": 1 },

      "legs": {

        "type": "array",

        "items": {

          "type": "object",

          "required": \["origin","destination","mode"\],

          "properties": {

            "origin": { "type": "string" },

            "destination": { "type": "string" },

            "mode": { "type": "string", "enum": \["flight","train","bus"\] },

            "date": { "type": "string", "format": "date" }

          }

        }

      },

      "group": {

        "type": "object",

        "properties": {

          "origins": { "type": "array", "items": { "type": "string" }, "minItems": 2 },

          "constraints": { "type": "object", "properties": { "maxDurationHrs": { "type": "number" } } }

        }

      }

    }

  },

  "TransportResultCard": {

    "type": "object",

    "required": \["id","mode","summary","price","duration","links"\],

    "properties": {

      "id": { "type": "string" },

      "mode": { "type": "string", "enum": \["flight","train","bus"\] },

      "summary": {

        "type": "object",

        "properties": {

          "origin": { "type": "string" },

          "destination": { "type": "string" },

          "departAt": { "type": "string", "format": "date-time" },

          "arriveAt": { "type": "string", "format": "date-time" },

          "airportCodes": { "type": "array", "items": { "type": "string" } },

          "baggage": { "type": "string" }

        }

      },

      "price": { "type": "object", "properties": { "amount": { "type": "number" }, "currency": { "type": "string" }, "isMinFare": { "type": "boolean" } } },

      "duration": { "type": "integer", "description": "minutes" },

      "segments": { "type": "array", "items": { "type": "object" } },

      "vendors": { "type": "array", "items": { "type": "object", "properties": { "name": { "type": "string" }, "price": { "type": "number" }, "url": { "type": "string", "format": "uri" } } } },

      "links": { "type": "object", "properties": { "vendorUrl": { "type": "string", "format": "uri" } } }

    }

  },

  "SavedItem.transport": {

    "type": "object",

    "required": \["itineraryId","section","external","time","location","dedupeKey"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "section": { "const": "transport" },

      "external": { "type": "object", "properties": { "vendor": { "type": "string" }, "externalId": { "type": "string" }, "vendorUrl": { "type": "string", "format": "uri" } } },

      "time": { "type": "object", "properties": { "start": { "type": "string","format":"date-time" }, "end": { "type": "string","format":"date-time" } } },

      "location": { "type": "object", "properties": { "origin": { "type": "string" }, "destination": { "type": "string" } } },

      "mode": { "type": "string", "enum": \["flight","train","bus"\] },

      "baggage": { "type": "string" },

      "segments": { "type": "array", "items": { "type": "object" } },

      "price": { "type": "object", "properties": { "amount": { "type": "number" }, "currency": { "type": "string" } } },

      "dedupeKey": { "type": "string" }

    }

  }

}

**Dedupe rule:** `dedupeKey = hash(itineraryId | mode | origin | destination | departAt | vendor | externalId)`.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Open only within an Active Itinerary**

Given no Active Itinerary exists

When I try to open Transport

Then I am blocked and asked to select/create an itinerary

And after doing so, I return to Transport with fields prefilled from the itinerary.

(Transport is wrapped by the itinerary; saves go to its folder.)

**AC2 — Simple search (exact dates)**

Given an Active Itinerary and tripType=roundtrip with exact dates

When I search with modes=\[flight,train\]

Then I see results separated by mode tabs

And I can sort by price or duration.

(Mode-separated results & sorting.)

**AC3 — Flexible months flow**

Given I choose flexible-months

When the calendar grid loads

Then each month shows the minimum fare per mode

And after selecting months, I can select exact dates to view tickets.

(Min-price calendar then pick exact dates.)

**AC4 — Region/country hierarchy**

Given destination is a region

When results load

Then I first see countries with cheapest fares

And selecting a country shows cities with cheapest fares

And selecting a city shows actual tickets.

(Similar drill-down for broad origin to departure cities.)

**AC5 — Ticket detail content**

Given I open a ticket

Then I see segments/transfers and vendors with their prices

And a button to open the vendor site.

(Detail view \+ vendor handoff.)

**AC6 — Save auto-binds to itinerary**

Given I am viewing results for Active Itinerary=A

When I press Save on a ticket

Then a SavedItem is created with itineraryId=A and section=transport

And it appears immediately under Transport in Itinerary Overview.

(In-itinerary binding.)

**AC7 — Advanced multi-leg**

Given I open Advanced search

When I add legs with specific modes

Then the system searches per-leg and returns a composed itinerary result.

(Advanced under a secondary flow.)

**AC8 — Group search**

Given I open Group search

When I enter 3 origins

Then I see a ranked list of mutual destinations by cheapest and shortest.

(Group feature requirement.)

**AC9 — Offline & errors**

Given I am offline

When I press Save

Then the item appears with a "Syncing…" badge and syncs later automatically.

Given a search call fails

Then I see a retry with exponential backoff and a helpful error message.

(Cache/offline expectation from spec; robust UX.)

**AC10 — Dedupe**

Given I see same vendor ticket I saved before in the same itinerary, the “save” button is changed to “saved” button icon. 

Then if I press on that “saved” button, the vendor ticket is going to be unsaved from the itinerary.

---

## **UX & Interaction Details**

* **Top app bar:** Active Itinerary chip (switcher).

* **Tabs:** Flights / Trains / Buses; badge with count and (if available) from-price.

* **Filters:** Airlines/operators, stops, depart/arrive windows, baggage (flights), refundable.

* **Cards:** show top facts; small icons for baggage/stops; price pill; **Save** & **Details**.

* **Detail page:** timeline of segments, fare rules (if provided), vendor list with prices, **Go to vendor**.

* **Advanced:** collapsible builder (leg rows with mode pickers). Hidden by default.

* **Group:** simple origins chips \+ results list of candidate destinations with metrics.

* **Accessibility:** labels for icons (baggage, transfers), keyboard focus order, large-hit targets.

* **i18n:** All copy from localization tables; currencies localized.

---

## **Engineering Notes (DoD level)**

* **State mgmt:** Each search has a stable `searchId`; paginated results append by mode.

* **Caching:** Key by normalized query (including region/country filters). Respect vendor TTLs; cache min-price calendars separately so that it can be shown to other users without making calls to API when the user requesting same information within 2-3 weeks of the initial cache was done (after 2-3 weeks, the new API calls need to be made).

* **Networking:** Retries with jitter, abort on tab switch; graceful cancel of inflight calls.

* **Pagination:** Cursor-based per mode; show loading skeletons.

* **Idempotency:** Saves protected by `dedupeKey`; local-first insert, background sync.

* **Security:** Vendor URLs opened with app-external browser; sanitize query inputs; rate-limit calls.

* **Telemetry:** `transport_search`, `transport_results_view`, `transport_filter_applied`, `ticket_opened`, `ticket_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Testing:** Unit tests for builders/normalizers; contract tests for calendar min-price and region drill-down; E2E for save & offline queue.

* **Performance:** Precompute cheap summaries for cards; lazy-load vendors list on detail; memoized sorting.

---

# **Story 3 — Accommodation Search & Save (prefill from Transport & strict in-itinerary binding)**

**As a** traveler  
 **I want** to search and compare places to stay that fit my dates, party size, and location context  
 **So that** I can save the right stay straight into my active itinerary’s **Accommodation** section with zero extra steps.

---

## **Scope**

* **In-itinerary only:** Accommodation search is accessible **only** with an **Active Itinerary**; every save auto-binds `{ itineraryId:<Active>, section:"accommodation" }`.

* **Context reuse:**  
  * **Dates:** Prefill check-in/out from itinerary dates (if exists; otherwise, ask it search form); if a Transport arrival/departure exists, propose check-in at arrival date and check-out before departure.  
  * **Location:** Prefill city/region from itinerary (if exists; otherwise, ask it search form);  
  * **Guests/rooms:** Prefill traveler count (if exists; otherwise, ask it search form); compute default rooms (e.g., 2 adults → 1 room).  
* **Inventory covered:** hotels, aparthotels, hostels, vacation rentals.  
* **Views:** List view (default) and Map view with price pins and neighborhood overlays.  
* **Filters:** price range, property type, rating, review score, distance to POI, free cancellation, pay at property, breakfast included, amenities (Wi-Fi, kitchen, AC, washer), accessibility.  
* **Sort:** recommended, lowest price, best reviewed, closest to POI, best value (price × rating), cancellation-friendly.  
* **Details page:** room types with board plans, total price incl. taxes/fees, cancellation window, payment policy, photos, amenities, house rules, check-in/out times, distance/time-to-key POIs or event venue.  
* **Performance & offline:** **Save** is local-first with offline queue and background sync.  
* **Safety rails:** Idempotent saves; sanitization of vendor links; rate limiting; graceful retries.

---

## **Detailed Workflow**

1. **Open Accommodation (from Itinerary Overview)**  
   * Prefill **City/Region**, **Check-in/Check-out**, **Guests** from Active Itinerary (if exists; otherwise ask it i search form).  
   * If the itinerary has **Transport**:  
     * Suggest **Smart Dates** chip: “Arrive Tue 14 → Check-in Tue 14; Depart Sat 18 → Check-out Sat 18.”  
     * If dates missing, propose ranges around transport dates (±1 day quick toggles).

2. **(Optional) Choose a Point of Interest (POI)**  
   * User can set a POI (conference venue, landmark, friend’s address).  
   * Distance filter switches to “ min by transit/walk/drive” and results show ETA badges.

3. **Search & results**  
   * Show results with mini-cards: thumbnail, name, neighborhood, rating/reviews, **Total price incl. taxes** for the stay, refundability badge, and ETA to POI.  
   * Toggle **Map**: pins labeled with total price; tap → mini-card → details.

4. **Open property detail**  
   * Carousel, neighborhood info, distance/ETA to POI & transport hub, sustainability/accessibility badges.  
   * Room matrix with board plans (room-only, breakfast, half-board), cancellation policy with deadline in local time, payment policy, full price breakdown.

5. **Save**  
   * Tap **Save** on card or detail: app binds `{ itineraryId:<Active>, section:"accommodation" }`, computes `dedupeKey`, inserts to local store, and shows it immediately under **Accommodation** in Itinerary Overview/Overview.  
   * If offline, show “Syncing…”; on success, badge clears automatically.

6. **Vendor handoff**  
   * “Go to vendor” deep links to partner/OTA or property site in external browser sandbox.

7. **Conflict helper (edge case)**  
   * If saved accommodation dates conflict with transport, show a subtle banner in Itinerary Overview: “Stay overlaps flight on Sat 18 07:30 — adjust dates?” → quick-fix opens edit.

---

## **Data Contracts (client-side; backend contracts to be finalized later)**

{

  "AccommodationSearchRequest": {

    "type": "object",

    "required": \["context", "place", "dates", "guests"\],

    "properties": {

      "context": {

        "type": "object",

        "required": \["itineraryId"\],

        "properties": {

          "itineraryId": { "type": "string", "format": "uuid" },

          "poi": {

            "type": "object",

            "properties": {

              "name": { "type": "string" },

              "lat": { "type": "number" },

              "lng": { "type": "number" },

              "travelMode": { "type": "string", "enum": \["walk","transit","drive"\] },

              "maxEtaMinutes": { "type": "integer" }

            }

          },

          "transportHints": {

            "type": "object",

            "properties": {

              "arrivalDate": { "type": "string", "format": "date" },

              "departureDate": { "type": "string", "format": "date" },

              "arrivalHub": { "type": "string" },

              "departureHub": { "type": "string" }

            }

          }

        }

      },

      "place": {

        "type": "object",

        "required": \["granularity","value"\],

        "properties": {

          "granularity": { "type": "string", "enum": \["city"\] },

          "value": { "type": "string" }

        }

      },

      "dates": {

        "type": "object",

        "required": \["checkIn","checkOut"\],

        "properties": {

          "checkIn": { "type": "string", "format": "date" },

          "checkOut": { "type": "string", "format": "date" }

        }

      },

      "guests": {

        "type": "object",

        "required": \["adults"\],

        "properties": {

          "adults": { "type": "integer", "minimum": 1 },

          "children": { "type": "array", "items": { "type": "integer", "minimum": 0 } },

          "rooms": { "type": "integer", "minimum": 1 }

        }

      },

      "filters": {

        "type": "object",

        "properties": {

          "priceRange": { "type": "object", "properties": { "min": { "type": "number" }, "max": { "type": "number" }, "currency": { "type": "string" } } },

          "propertyTypes": { "type": "array", "items": { "type": "string", "enum": \["hotel","aparthotel","hostel","rental"\] } },

          "ratingStars": { "type": "array", "items": { "type": "integer", "minimum": 1, "maximum": 5 } },

          "reviewScoreMin": { "type": "number", "minimum": 0, "maximum": 10 },

          "freeCancellation": { "type": "boolean" },

          "payAtProperty": { "type": "boolean" },

          "amenities": { "type": "array", "items": { "type": "string" } },

          "accessibility": { "type": "array", "items": { "type": "string" } },

          "sustainability": { "type": "boolean" },

          "maxEtaMinutes": { "type": "integer" }

        }

      },

      "sort": { "type": "string", "enum": \["recommended","price","review","distance","value","cancellation"\] }

    }

  },

  "AccommodationResultCard": {

    "type": "object",

    "required": \["id","name","location","price","policies","rating","links"\],

    "properties": {

      "id": { "type": "string" },

      "name": { "type": "string" },

      "thumbnail": { "type": "string", "format": "uri" },

      "location": {

        "type": "object",

        "properties": {

          "city": { "type": "string" },

          "neighborhood": { "type": "string" },

          "lat": { "type": "number" },

          "lng": { "type": "number" },

          "etaToPoiMinutes": { "type": "integer" }

        }

      },

      "rating": { "type": "object", "properties": { "stars": { "type": "number" }, "reviewScore": { "type": "number" }, "reviewCount": { "type": "integer" } } },

      "price": {

        "type": "object",

        "required": \["total","currency"\],

        "properties": {

          "total": { "type": "number" },

          "currency": { "type": "string" },

          "includesTaxesAndFees": { "type": "boolean" }

        }

      },

      "policies": {

        "type": "object",

        "properties": {

          "freeCancellationUntil": { "type": "string", "format": "date-time" },

          "payAtProperty": { "type": "boolean" }

        }

      },

      "badges": { "type": "array", "items": { "type": "string" } },

      "links": { "type": "object", "properties": { "vendorUrl": { "type": "string", "format": "uri" } } }

    }

  },

  "SavedItem.accommodation": {

    "type": "object",

    "required": \["itineraryId","section","external","time","location","dedupeKey"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "section": { "const": "accommodation" },

      "summary": { "type": "string" },

      "time": {

        "type": "object",

        "properties": {

          "checkIn": { "type": "string","format":"date" },

          "checkOut": { "type": "string","format":"date" }

        }

      },

      "guests": { "type": "object", "properties": { "adults": { "type": "integer" }, "children": { "type": "array", "items": { "type": "integer" } }, "rooms": { "type": "integer" } } },

      "location": {

        "type": "object",

        "properties": {

          "name": { "type": "string" },

          "address": { "type": "string" },

          "lat": { "type": "number" },

          "lng": { "type": "number" }

        }

      },

      "price": { "type": "object", "properties": { "total": { "type": "number" }, "currency": { "type": "string" }, "includesTaxesAndFees": { "type": "boolean" } } },

      "policies": { "type": "object", "properties": { "freeCancellationUntil": { "type": "string","format":"date-time" }, "payAtProperty": { "type": "boolean" } } },

      "external": { "type": "object", "properties": { "vendor": { "type": "string" }, "externalId": { "type": "string" }, "vendorUrl": { "type": "string", "format": "uri" } } },

      "media": \[{ "type": "object", "properties": { "url": { "type": "string","format":"uri" }, "type": { "type": "string" } } }\],

      "dedupeKey": { "type": "string" }

    }

  }

}

**Dedupe rule:**  
 `dedupeKey = hash(itineraryId | checkIn | checkOut | vendor | externalId | location.name)`

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Open only within an Active Itinerary**

Given no Active Itinerary exists

When I try to open Accommodation

Then I must create or select an itinerary before proceeding

And the selected itinerary becomes Active for this search and any saves.

**AC2.1 — Prefill from itinerary & transport**

Given an Active Itinerary with destination and dates

And a Transport arrival on 2026-04-14 and departure on 2026-04-18

When I open Accommodation search

Then check-in defaults to 2026-04-14 and check-out to 2026-04-18

And the search area defaults to the itinerary city

And guests default to the itinerary traveler count.

**AC2.2 — Search form**

Given an Active Itinerary without destination and dates

Show the search form that asks for destination city, dates, guests number, and “Search” button.

When pressed the button it searches for accommodation according the the information in the search form.

**AC3 — POI distance filter**

Given I set a POI

When I filter by max 20 minutes by transit

Then results only include stays whose ETA to the POI is ≤ 20 minutes by transit

And each result shows the ETA badge.

**AC4 — Results completeness**

Given I open a property detail

Then I can see room options, total price including taxes/fees, cancellation deadline, payment policy, amenities, and house rules

And I can open the vendor site.

**AC5 — Save auto-binds & appears immediately**

Given I press Save on a property

Then a SavedItem is created with itineraryId=\<Active\> and section=accommodation

And it appears immediately under Accommodation in Itinerary Overview.

Next time I see the same saved property within this itinerary, the “save” button icon will turn to “saved” icon. Pressing “saved” icon will result the property to be unsaved from the itinerary.

**AC7 — Offline queue**

Given I am offline

When I press Save

Then the item appears with a "Syncing…" badge

And it syncs automatically when I am back online.

**AC8 — Price transparency & policies**

Given a result displays a price

Then it must reflect the total stay price including mandatory taxes/fees

And any free-cancellation window shows a local timestamp and a relative countdown (e.g., "free for 36h").

**AC9 — Conflict helper**

Given my saved accommodation dates overlap with a departure flight before check-out

Then I see a warning banner with a shortcut to adjust dates.

**AC10 — Map view parity**

Given I switch to Map view

Then visible pins and list results stay in sync with filters and sort

And selecting a pin shows the same mini-card actions as list view.

---

## **UX & Interaction Details**

* **Top App Bar:** Active Itinerary chip; tap to switch itineraries (confirms that new saves bind to the new itinerary).

* **Smart Dates chip:** one-tap adopt from transport; toggling shows a diff if it changes the current date range.

* **Neighborhood/Distance module:** quick filters like “Near Center,” “Near Station,” “Quiet Area”; distance slider and ETA mode switch.

* **Property card:** refundability badge, “Includes taxes & fees,” **Save**, **Details**.

* **Detail page:** timeline-like policies view showing cancellation deadlines and penalties.

* **Map:** clusters and neighborhood polygons; hover/press → price balloon; double-tap to zoom.

* **Accessibility:** alt text for images, high-contrast badges, keyboard focus order.

* **i18n & currency:** localize copy; currency from user profile with fallback to itinerary destination currency.

---

## **Engineering Notes (Definition of Done)**

* **Prefill orchestration:** Small service that composes defaults from itinerary and the latest Transport save (arrival/departure/hub).

* **Cache strategy:** Cache normalized query (place, dates, guests, filters, sort). TTL per vendor guidance; evict on itinerary switch.

* **Networking:** Abort in-flight calls on filter/sort change; exponential backoff with jitter; circuit breaker per vendor.

* **Pricing normalization:** Always compute “total incl. taxes/fees”; store vendor raw breakdown and normalized total.

* **ETA computation:** If POI set, prefetch matrix (walk/transit/drive) for top N; lazy compute for the rest on scroll.

* **Security:** Sanitize vendor URLs; open in external web context; validate all inputs.

* **Idempotency:** Enforce `dedupeKey`; local-first insert → background sync.

* **Observability:** Metrics and events — `accommodation_search`, `accommodation_result_view`, `filter_applied`, `map_shown`, `property_opened`, `property_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Testing:**

  * Unit: prefill logic, price normalization, ETA filter, dedupe key.

  * Contract: room matrix & policy parsing across vendors.

  * E2E: save offline → sync; itinerary switch while on results; map/list parity; conflict helper detection.

---

# **Story 4 — Entertainment Search & Save (things to do, sights, tours) with map-first UX and strict in-itinerary binding**

**As a** traveler  
 **I want** to discover and save places to visit (museums, gardens, landmarks) for my trip  
 **So that** they’re stored under my active itinerary’s **Entertainment** section, ready to view on a map or in a list.

---

## **Scope**

* **In-itinerary only:** The Entertainment surface is accessible **only** when an Active Itinerary exists; all saves auto-bind `{ itineraryId:<Active>, section:"entertainment" }`. This follows the app rule that “whatever the user saves… will be added to the current itinerary into its own folders.”  
* **Inputs & prefill:** Destination (city/region/country) and travel dates; reuse from hotel/flight if available.  
* **Results & details:** Show a list of cards (leading picture). Card → details with swipeable photos, name, tag, Save/Share, short → full description, location, distance from center, opening hours, and a website button.  
* **Map-first UX:** Integrated map that can display itinerary items; supports viewing saved Entertainment on a trip map (and later snapshotting the itinerary map for sharing).  
* **Caching:** Data comes from APIs and is cached as much as practical.

---

## **Detailed Workflow**

1. **Open Entertainment (from Itinerary Overview)**  
   * Guard: if no Active Itinerary → blocking select/create flow (as established earlier). Saved items always bind to that itinerary.  
   * Prefill destination and dates from itinerary/transport/accommodation context (if exists; otherwise show search form that searches for places based on the destination city).

2. **Search & browse**  
   * Default to **Map** view with clustered pins; toggle to **List** view (cards with hero image). Map and list remain in sync as filters/panning change.  
   * Quick filter chips: tags (museum, garden, landmark), open-now, free, kid-friendly.

3. **Open place details**  
   * Show photo carousel (horizontal swipe), tag, Save, Share, short → full description, opening hours, distance from city center, and website button.

4. **Save**  
   * Press **Save** on card or details → create `SavedItem` with `{ itineraryId:<Active>, section:"entertainment" }`; item appears immediately under Entertainment in the itinerary. (Local-first; queue sync if offline.)

5. **Map snapshot (preview hook)**  
   * Saved Entertainment appears on the integrated itinerary map; later stories will cover generating a shareable final snapshot.

---

## **Data Contracts (client-side; backend to be finalized later)**

{

  "EntertainmentSearchRequest": {

    "type": "object",

    "required": \["context", "place"\],

    "properties": {

      "context": {

        "type": "object",

        "required": \["itineraryId"\],

        "properties": {

          "itineraryId": { "type": "string", "format": "uuid" },

          "dates": {

            "type": "object",

            "properties": {

              "start": { "type": "string", "format": "date" },

              "end": { "type": "string", "format": "date" }

            }

          }

        }

      },

      "place": {

        "type": "object",

        "required": \["granularity","value"\],

        "properties": {

          "granularity": { "type": "string", "enum": \["city","region","country"\] },

          "value": { "type": "string" }

        }

      },

      "filters": {

        "type": "object",

        "properties": {

          "tags": { "type": "array", "items": { "type": "string" } },

          "openNow": { "type": "boolean" },

          "free": { "type": "boolean" },

          "kidFriendly": { "type": "boolean" }

        }

      },

      "sort": { "type": "string", "enum": \["recommended","distance","rating","popularity"\] },

      "pagination": { "type": "object", "properties": { "cursor": { "type": "string" } } }

    }

  },

  "EntertainmentResultCard": {

    "type": "object",

    "required": \["id","name","thumbnail","tag","location"\],

    "properties": {

      "id": { "type": "string" },

      "name": { "type": "string" },

      "thumbnail": { "type": "string", "format": "uri" },

      "tag": { "type": "string" },

      "shortDescription": { "type": "string" },

      "location": {

        "type": "object",

        "properties": {

          "lat": { "type": "number" },

          "lng": { "type": "number" },

          "distanceFromCenterKm": { "type": "number" }

        }

      },

      "openingHours": { "type": "object", "additionalProperties": true }

    }

  },

  "SavedItem.entertainment": {

    "type": "object",

    "required": \["itineraryId","section","location","external","dedupeKey"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "section": { "const": "entertainment" },

      "summary": { "type": "string" },

      "details": {

        "type": "object",

        "properties": {

          "tag": { "type": "string" },

          "shortDescription": { "type": "string" },

          "openingHours": { "type": "object", "additionalProperties": true }

        }

      },

      "location": {

        "type": "object",

        "properties": {

          "name": { "type": "string" },

          "lat": { "type": "number" },

          "lng": { "type": "number" },

          "distanceFromCenterKm": { "type": "number" }

        }

      },

      "external": {

        "type": "object",

        "properties": {

          "website": { "type": "string", "format": "uri" }

        }

      },

      "media": \[{ "type": "object", "properties": { "url": { "type": "string","format":"uri" } } }\],

      "dedupeKey": { "type": "string" }

    }

  }

}

**Dedupe rule:**  
 `dedupeKey = hash(itineraryId | location.name | tag | website)` — prevents double-saves from the same source.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Gate behind Active Itinerary**

Given no Active Itinerary exists

When I try to open Entertainment

Then I must create or select an itinerary

And subsequent saves bind to that itinerary automatically.

(Items always file into the current itinerary.)

**AC2.1 — Prefill inputs**

Given my itinerary has destination=Paris and dates=2026-05-10..2026-05-15

When I open Entertainment

Then the search is prefilled with Paris and those dates.

(Prefill from hotel/flight if present.)

**AC2.2 — Prefill inputs**

Given my itinerary has no destination.

Show a search form that asks for destination city and search button.

Once pressed on Search button, it gives all interesting places to visit.

**AC3 — Map-first & list parity**

Given I am on the Entertainment map

When I pan or filter

Then the list updates to show the same items (and vice versa).

(Integrated map for itinerary items.)

**AC4.1 — Card** 

Given the search results showing each place as a card with swipeable photos, tag, distance from the city center, short description, and “more” button.

The cards can be vertically swiped like instagram reels.

**AC4 — Card → details content**

Given I open a place card by tapping on “more” button

Then I see photos I can swipe, tag, Save and Share, a short description with "more",

And on expand I see full description, opening hours, location, distance from center, and a website button.

**AC5 — Save auto-binds & appears**

Given I press Save on a place

Then a SavedItem is created with itineraryId=\<Active\> and section=entertainment

And it appears immediately under Entertainment in the itinerary.

**AC6 — Offline queue & caching**

Given I am offline

When I press Save

Then the item appears with a "Syncing…" badge and syncs later

And search responses are cached where feasible.

**AC7 — Dedupe**

Given I see same place I saved before in the same itinerary, the “save” button is changed to “saved” button icon. 

Then if I press on that “saved” button, the place is going to be unsaved from the itinerary.

**AC8 — Filter**

Given I see all results of the search

Then I can filter results based on the tag (e.g. museums, gardens, landmarks, architecture etc.)

---

## **UX & Interaction Details**

* **Map view:** clusters & pins; pin → mini-card with Save/Details; “Show only within map bounds” toggle.

* **List view:** image-led cards; chips for tags (museum, garden, landmark, boat ride).

* **Details:** photo carousel, tag, description expander, opening hours, distance from center, website link, Save/Share buttons.

* **Accessibility & i18n:** alt text for images; readable tap targets; localized copy.

---

## **Engineering Notes (Definition of Done)**

* **State & caching:** Normalize queries (place, dates, filters). Cache results per query; respect vendor TTLs.

* **Map/list sync:** Single source of truth list; map subscribes to filtered slice; viewport filtering behind a toggle.

* **Networking:** Retries with jitter; graceful cancel on filter changes; error UI with retry.

* **Security:** Sanitize external website URLs; open in an external web context.

* **Idempotency:** Enforce `dedupeKey`; local-first insert → background sync.

* **Telemetry:** `ent_search`, `ent_result_view`, `ent_filter_applied`, `ent_map_viewed`, `ent_place_opened`, `ent_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Testing:** Unit tests for filters and dedupe; contract tests for opening-hours parsing; E2E for map/list parity and offline save flow.

---

# **Story 5 — Gastronomy Search & Save (restaurants, cafés, dietary filters) with strict in-itinerary binding**

**As a** traveler  
 **I want** to find places to eat and drink that fit my preferences and restrictions  
 **So that** I can save them straight into my active itinerary’s **Gastronomy** section without extra steps.

---

## **Scope**

* **In-itinerary only:** The Gastronomy surface is available **only** with an Active Itinerary; every save auto-binds `{ itineraryId:<Active>, section:"gastronomy" }`. (Everything saved must land in the current itinerary’s own folders/sections.)

* **Inputs & prefill:** Destination city and food/dietary restrictions; structure mirrors Entertainment cards but list view shows **swipeable pictures, name, rating, and price tag**.  
* **Details page:** Menu, additional photos, facilities (dogs allowed, child-friendly, noise level, etc.), **opening hours per day**, location, phone, website link. Data sourced via APIs and **cached where it makes sense**.  
* **Map integration:** Items appear on the integrated map alongside itinerary items; later stories will cover the shareable itinerary map snapshot.

---

## **Detailed Workflow**

1. **Open Gastronomy (from Itinerary Overview)**  
   * Guard: if no Active Itinerary → blocking select/create flow; selected itinerary becomes Active.  
   * Prefill destination from itinerary (if exists; otherwise ask for it in the search form).

2. **Search & results**  
   * Filters (chips/drawer): dietary (vegan, vegetarian, halal, kosher, gluten-free), cuisine, price band, rating, open-now, kid-friendly, dog-friendly, noise level.  
   * Results list cards show swipeable **photos, name, rating, price tag**; map toggle keeps list/map in sync.

3. **Open place details**  
   * Show **menu**, photo gallery, facilities (dogs, kids, noise), **opening hours per weekday**, address on map, phone, website link.

4. **Save**  
   * Tap **Save** on card or details → create `SavedItem` with `{ itineraryId:<Active>, section:"gastronomy" }`; item appears immediately under **Gastronomy** in the itinerary (local-first; queued if offline).

5. **Vendor/website handoff**  
   * “Website” / “Call” actions open external handlers; sanitize URLs.

6. **Map presence**  
   * Saved Gastronomy items are visible on the itinerary map layer.

---

## **Data Contracts (client-side; backend contracts to be finalized later)**

{

  "GastronomySearchRequest": {

    "type": "object",

    "required": \["context", "place"\],

    "properties": {

      "context": {

        "type": "object",

        "required": \["itineraryId"\],

        "properties": {

          "itineraryId": { "type": "string", "format": "uuid" },

       }

      },

      "place": {

        "type": "object",

        "required": \["granularity","value"\],

        "properties": {

          "granularity": { "type": "string", "enum": \["city","region","country"\] },

          "value": { "type": "string" }

        }

      },

      "filters": {

        "type": "object",

        "properties": {

          "dietary": { "type": "array", "items": { "type": "string" } },

          "cuisines": { "type": "array", "items": { "type": "string" } },

          "priceBands": { "type": "array", "items": { "type": "string", "enum": \["$","$$","$$$","$$$$"\] } },

          "ratingMin": { "type": "number", "minimum": 0, "maximum": 5 },

          "openNow": { "type": "boolean" },

          "kidFriendly": { "type": "boolean" },

          "dogFriendly": { "type": "boolean" },

          "noiseLevel": { "type": "string", "enum": \["quiet","moderate","lively","loud"\] }

        }

      },

      "sort": { "type": "string", "enum": \["recommended","rating","price","distance","openNow"\] },

      "pagination": { "type": "object", "properties": { "cursor": { "type": "string" } } }

    }

  },

  "GastronomyResultCard": {

    "type": "object",

    "required": \["id","name","thumbnail","rating","priceTag","location"\],

    "properties": {

      "id": { "type": "string" },

      "name": { "type": "string" },

      "thumbnail": { "type": "string", "format": "uri" },

      "rating": { "type": "number" },

      "priceTag": { "type": "string", "enum": \["$","$$","$$$","$$$$"\] },

      "location": { "type": "object", "properties": { "lat": { "type": "number" }, "lng": { "type": "number" }, "address": { "type": "string" } } },

      "badges": { "type": "array", "items": { "type": "string" } }

    }

  },

  "SavedItem.gastronomy": {

    "type": "object",

    "required": \["itineraryId","section","location","details","external","dedupeKey"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "section": { "const": "gastronomy" },

      "summary": { "type": "string" },

      "details": {

        "type": "object",

        "properties": {

          "rating": { "type": "number" },

          "priceTag": { "type": "string" },

          "dietary": { "type": "array", "items": { "type": "string" } },

          "facilities": { "type": "array", "items": { "type": "string" } },

          "openingHours": { "type": "object", "additionalProperties": true },

          "menu": { "type": "array", "items": { "type": "object" } }

        }

      },

      "location": {

        "type": "object",

        "properties": { "name": { "type": "string" }, "address": { "type": "string" }, "lat": { "type": "number" }, "lng": { "type": "number" } }

      },

      "contact": { "type": "object", "properties": { "phone": { "type": "string" }, "website": { "type": "string", "format": "uri" } } },

      "media": \[{ "type": "object", "properties": { "url": { "type": "string", "format": "uri" } } }\],

      "dedupeKey": { "type": "string" }

    }

  }

}

**Dedupe rule:**  
 `dedupeKey = hash(itineraryId | location.name | address | website)` — prevents duplicate saves of the same place from the same source.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Gate behind Active Itinerary**

Given no Active Itinerary exists

When I try to open Gastronomy

Then I must create or select an itinerary

And subsequent saves bind to that itinerary automatically.

(Items always file into the current itinerary.)

**AC2 — Prefill & filters**

Given my itinerary destination is Rome

When I open Gastronomy

Then the search is prefilled with Rome

And I can filter by dietary needs, cuisine, price band, rating, open-now, kid-/dog-friendly, and noise level.

(List card fields: picture, name, rating, price tag.)

**AC3 — Details completeness**

Given I open a restaurant detail

Then I can see the menu, more photos, facilities (dogs/kids/noise), opening hours for each weekday, location, phone, and a website link.

**AC4 — Save auto-binds & appears immediately**

Given I press Save on a restaurant

Then a SavedItem is created with itineraryId=\<Active\> and section=gastronomy

And it appears immediately under Gastronomy in the Itinerary Overview.

**AC5 — Offline queue & caching**

Given I am offline

When I press Save

Then the item appears with a "Syncing…" badge and syncs later

And search responses are cached where reasonable per vendor TTLs.

**AC6 — Map presence**

Given I have saved Gastronomy items

When I open the trip map

Then I can see those items on the map layer.

**AC7 — Dedupe**

Given I see same event item I saved before in the same itinerary, the “save” button is changed to “saved” button icon. 

Then if I press on that “saved” button, the item is going to be unsaved from the itinerary.

---

## **UX & Interaction Details**

* **List cards:** photo, name, rating, price tag, quick badges (vegan, kid-friendly, dog-friendly, quiet).

* **Details:** prominent **Menu** section; opening-hours table (Mon–Sun); “Call” and “Website” buttons; Save/Share.

* **Map:** pins for results and saved items; “show items in map bounds” toggle; itinerary map integration.

* **Accessibility & i18n:** alt text for images; readable focus order; localized copy and formats.

---

## **Engineering Notes (Definition of Done)**

* **Query normalization & caching:** Key by (place, filters, sort); respect vendor TTLs; evict cache on itinerary switch.

* **Networking:** Abort on filter/sort changes; retries with jitter; graceful error UI with retry. (See testing/observability expectations captured in the broader doc.)

* **Security:** Sanitize external URLs; open in external browser; rate-limit requests.

* **Idempotency:** Enforce `dedupeKey`; local-first insert → background sync; robust error states.

* **Telemetry:** `gast_search`, `gast_result_view`, `filter_applied`, `map_viewed`, `gast_place_opened`, `gast_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Testing:**

  * Unit: dietary filter logic; opening-hours parsing; dedupe key.

  * Contract: menu/facilities schema across sources.

  * E2E: offline save → sync; map/list parity; external link handling.

---

**Story 6 — Events Search & Save (date-bound happenings) with itinerary binding and calendar awareness**

**As a** traveler  
 **I want** to find concerts, shows, festivals, and other dated happenings at my destination  
 **So that** I can save them straight into my active itinerary’s **Events** section and see how they fit my trip calendar.

---

## **Scope**

* **In-itinerary only:** Events is accessible **only** with an Active Itinerary; every save auto-binds `{ itineraryId:<Active>, section:"events" }` into the itinerary’s own folders.  
* **Inputs & prefill:** Destination **city** and **dates of visit** (prefilled from itinerary / hotel / flight context). Structure and UX mirror **Entertainment**, but data is fetched from events APIs.  
* **Results & details:** Cards with leading image; tapping opens details with images (swipeable), title, category (concert, exhibition, theatre), short → full description, venue location, distance from center, **start date/time**, **ending time** (if known), opening hours when relevant (exhibitions), and a **Website / Tickets** button. (Same pattern as Entertainment.)  
* **Map integration:** Integrated map that can display itinerary items, with events plotted by venue; later we’ll support generating a shareable snapshot of the full trip map.  
* **Caching & offline:** Event data comes from APIs and is cached where practical; saved items must remain available offline.

---

## **Detailed Workflow**

1. **Open Events (from Itinerary Overview)**

   * Guard: if no Active Itinerary → blocking select/create flow; the chosen itinerary becomes Active. (All saves go to that itinerary.)  
   * Prefill **destination** and **date window** from itinerary (if exists; otherwise, ask the user in the search form); if hotel/transport exist, reuse their city/dates.

2. **Search & browse**  
   * Default list of **date-sorted** cards; quick filter chips: category (concert, theatre, sports, festival, exhibition), **during my dates**, **free**, **family-friendly**, **now/this weekend**.  
   * Toggle **Map** view; panning or filtering keeps list and map in sync.

3. **Event details**  
   * Swipeable photos, Save/Share, short → full description; venue, distance from center, start/end date-time, and **Website/Tickets** button. (Same interaction model as Entertainment.)

4. **Save**  
   * Press **Save** → create `SavedItem` bound to `{ itineraryId:<Active>, section:"events" }`; show immediately under **Events** in the itinerary (local-first; queued if offline).

5. **Calendar awareness (helper banners)**  
   * If an event time overlaps transport departure/arrival or falls **outside** the itinerary date window, surface a subtle banner in the Events section with a quick-fix (e.g., “Clashes with flight on Tue 19:05 — view options”).

6. **Map presence**  
   * Saved events appear on the integrated itinerary map; venue marker → mini-card → details.

---

## **Data Contracts (client-side; backend contracts to be finalized later)**

{

  "EventsSearchRequest": {

    "type": "object",

    "required": \["context", "place", "dateWindow"\],

    "properties": {

      "context": {

        "type": "object",

        "required": \["itineraryId"\],

        "properties": {

          "itineraryId": { "type": "string", "format": "uuid" }

        }

      },

      "place": {

        "type": "object",

        "required": \["granularity", "value"\],

        "properties": {

          "granularity": { "type": "string", "enum": \["city","region","country"\] },

          "value": { "type": "string" }

        }

      },

      "dateWindow": {

        "type": "object",

        "required": \["start","end"\],

        "properties": {

          "start": { "type": "string", "format": "date" },

          "end": { "type": "string", "format": "date" }

        }

      },

      "filters": {

        "type": "object",

        "properties": {

          "categories": { "type": "array", "items": { "type": "string" } },

          "free": { "type": "boolean" },

          "familyFriendly": { "type": "boolean" },

          "timeOfDay": { "type": "string", "enum": \["morning","afternoon","evening","late"\] }

        }

      },

      "sort": { "type": "string", "enum": \["date","popularity","distance","price"\] },

      "pagination": { "type": "object", "properties": { "cursor": { "type": "string" } } }

    }

  },

  "EventResultCard": {

    "type": "object",

    "required": \["id","title","category","start","venue","thumbnail"\],

    "properties": {

      "id": { "type": "string" },

      "title": { "type": "string" },

      "category": { "type": "string" },

      "thumbnail": { "type": "string", "format": "uri" },

      "start": { "type": "string", "format": "date-time" },

      "end": { "type": "string", "format": "date-time" },

      "venue": {

        "type": "object",

        "properties": {

          "name": { "type": "string" },

          "address": { "type": "string" },

          "lat": { "type": "number" },

          "lng": { "type": "number" },

          "distanceFromCenterKm": { "type": "number" }

        }

      },

      "website": { "type": "string", "format": "uri" }

    }

  },

  "SavedItem.events": {

    "type": "object",

    "required": \["itineraryId","section","time","venue","external","dedupeKey"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "section": { "const": "events" },

      "summary": { "type": "string" },

      "details": {

        "type": "object",

        "properties": {

          "category": { "type": "string" },

          "shortDescription": { "type": "string" }

        }

      },

      "time": {

        "type": "object",

        "properties": {

          "start": { "type": "string", "format": "date-time" },

          "end": { "type": "string", "format": "date-time" }

        }

      },

      "venue": {

        "type": "object",

        "properties": {

          "name": { "type": "string" },

          "address": { "type": "string" },

          "lat": { "type": "number" },

          "lng": { "type": "number" }

        }

      },

      "external": {

        "type": "object",

        "properties": {

          "website": { "type": "string", "format": "uri" },

          "ticketUrl": { "type": "string", "format": "uri" }

        }

      },

      "media": \[{ "type": "object", "properties": { "url": { "type": "string","format":"uri" } } }\],

      "dedupeKey": { "type": "string" }

    }

  }

}

**Dedupe rule:**  
 `dedupeKey = hash(itineraryId | title | start | venue.name | website)` — prevents double-saves of the same event instance.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Gate behind Active Itinerary**

Given no Active Itinerary exists

When I try to open Events

Then I must create or select an itinerary

And subsequent saves bind to that itinerary automatically.

**AC2 — Prefill inputs**

Given my itinerary destination is Barcelona and dates are 2026-06-10..2026-06-15

When I open Events

Then the search is prefilled with Barcelona and that date window.

(Events uses Entertainment’s structure but with events APIs.)

**AC3 — List → details content**

Given I open an event card

Then I see images I can swipe, category, Save and Share, short description with "more",

And on expand I see full description, venue, distance from center, start/end time, and a Website/Tickets button.

**AC4 — Save auto-binds & appears immediately**

Given I press Save on an event

Then a SavedItem is created with itineraryId=\<Active\> and section=events

And it appears immediately under Events in the Itinerary Overview.

**AC5 — Date window filter**

Given my itinerary dates are 2026-06-10..2026-06-15

When I enable "during my dates"

Then the results only include events with start within that window (or overlapping).

**AC6 — Conflict helper**

Given I saved an event overlapping my departure flight

Then I see a warning banner in the Events section with a shortcut to resolve the conflict.

**AC7 — Map parity**

Given I switch to Map view

Then the pins reflect the same filtered list

And selecting a pin shows the mini-card with Save/Details.

(Integrated itinerary map.)

**AC8 — Offline queue & caching**

Given I am offline

When I press Save

Then the item appears with a "Syncing…" badge and syncs later

And event responses are cached where reasonable.

**AC9 — Dedupe**

Given I see same place I saved before in the same itinerary, the “save” button is changed to “saved” button icon. 

Then if I press on that “saved” button, the place is going to be unsaved from the itinerary.

---

## **UX & Interaction Details**

* **List cards:** leading image, title, category chip, date/time pill, venue, distance from center, Save. (Mirrors Entertainment styling.)

* **Details:** photo carousel, description expander, venue map snippet, Website/Tickets, Save/Share controls.

* **Filters:** category, during-my-dates, free, family-friendly, time-of-day; clear-all chip.

* **Map:** venue markers; tap → mini-card with Save/Details; “show only within map bounds” toggle.

* **Accessibility & i18n:** readable tap targets; announce start times; localized formats.

---

## **Engineering Notes (Definition of Done)**

* **Query normalization & caching:** Key by (place, dateWindow, filters, sort); respect vendor TTLs; evict on itinerary switch.

* **Calendar awareness:** small service to compute conflicts with transport/accommodation time ranges and surface banners.

* **Networking:** Abort on filter/sort changes; retries with jitter; robust error UI.

* **Security:** Sanitize external ticketing URLs; open in external browser; rate-limit calls.

* **Idempotency:** Enforce `dedupeKey`; local-first insert → background sync.

* **Telemetry:** `events_search`, `events_result_view`, `filter_applied`, `events_map_viewed`, `event_opened`, `event_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Testing:**

  * Unit: date-window filtering, conflict detection, dedupe key.

  * Contract: ticketing/website URL parsing; venue schema.

  * E2E: offline save → sync; list/map parity; conflict banner surfacing.

---

Got it — here’s **Story \#7** only. Say **“Next”** when you want me to continue.

# **Story 7 — Trails Search & Save (routes with duration/difficulty) with map-first UX and external map handoff**

**As a** traveler  
 **I want** to discover walking trails with clear duration and difficulty info  
 **So that** I can save them directly into my active itinerary’s **Trails** section, view them on the trip map, or open them in an external maps app.

---

## **Scope**

* **In-itinerary only:** Trails is accessible **only** when an Active Itinerary exists; every save auto-binds `{ itineraryId:<Active>, section:"trails" }` into the itinerary’s own folders.  
* **Inputs & prefill:** Destination (city/country) and travel dates; structure mirrors Entertainment. Initial list shows leading picture, trail **name**, **duration**, **difficulty**, Save/Share.  
* **Details page:** Photo gallery; duration; difficulty (derived from elevation change/grade); **Show on map** button that opens either the **in-app map** or an **external map** (Google Maps / OpenStreetMap).  
* **Map integration:** Integrated map can display itinerary items (including saved trails) and later produce a shareable itinerary snapshot with highlights.  
* **Data source & caching:** Trails come from API calls and are cached where practical.

---

## **Detailed Workflow**

1. **Open Trails (from Itinerary Overview)**  
   * Guard: if no Active Itinerary → select/create itinerary first; that itinerary becomes Active and receives all saves.  
   * Prefill destination/dates from itinerary context (mirrors Entertainment inputs).

2. **Browse results (map-first \+ list)**  
   * Default **Map** view with clustered pins; list view shows cards with leading photo \+ name \+ duration \+ difficulty \+ Save/Share. Views stay in sync.

3. **Open trail details**  
   * Gallery; duration; difficulty; distance from center (if available); actions: **Save**, **Share**, **Show on Map** → choose **In-app** or **External** (deep link).

4. **Save**  
   * Tapping **Save** creates a `SavedItem` bound to `{ itineraryId:<Active>, section:"trails" }`, inserts locally (offline-first), appears immediately in the Trails section; queued for sync when offline.

5. **Map presence & snapshot**  
   * Saved trails render on the integrated itinerary map; later, users can generate a snapshot with highlighted pics to share.

---

## **Data Contracts (client-side; backend contracts to be finalized later)**

{

  "TrailsSearchRequest": {

    "type": "object",

    "required": \["context", "place"\],

    "properties": {

      "context": {

        "type": "object",

        "required": \["itineraryId"\],

        "properties": {

          "itineraryId": { "type": "string", "format": "uuid" },

          "dates": {

            "type": "object",

            "properties": {

              "start": { "type": "string", "format": "date" },

              "end": { "type": "string", "format": "date" }

            }

          }

        }

      },

      "place": {

        "type": "object",

        "required": \["granularity", "value"\],

        "properties": {

          "granularity": { "type": "string", "enum": \["city","region","country"\] },

          "value": { "type": "string" }

        }

      },

      "filters": {

        "type": "object",

        "properties": {

          "durationMaxMinutes": { "type": "integer" },

          "difficulty": { "type": "string", "enum": \["easy","moderate","hard"\] },

          "elevationGainMin": { "type": "integer" },

          "elevationGainMax": { "type": "integer" },

          "loopOnly": { "type": "boolean" },

          "kidFriendly": { "type": "boolean" },

          "dogFriendly": { "type": "boolean" }

        }

      },

      "sort": { "type": "string", "enum": \["recommended","duration","difficulty","distance"\] },

      "pagination": { "type": "object", "properties": { "cursor": { "type": "string" } } }

    }

  },

  "TrailResultCard": {

    "type": "object",

    "required": \["id","name","thumbnail","durationMinutes","difficulty","location"\],

    "properties": {

      "id": { "type": "string" },

      "name": { "type": "string" },

      "thumbnail": { "type": "string", "format": "uri" },

      "durationMinutes": { "type": "integer" },

      "difficulty": { "type": "string", "enum": \["easy","moderate","hard"\] },

      "elevationGainM": { "type": "integer" },

      "distanceKm": { "type": "number" },

      "location": {

        "type": "object",

        "properties": {

          "lat": { "type": "number" },

          "lng": { "type": "number" },

          "distanceFromCenterKm": { "type": "number" }

        }

      },

      "website": { "type": "string", "format": "uri" }

    }

  },

  "SavedItem.trails": {

    "type": "object",

    "required": \["itineraryId","section","details","location","dedupeKey"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "section": { "const": "trails" },

      "summary": { "type": "string" },

      "details": {

        "type": "object",

        "properties": {

          "durationMinutes": { "type": "integer" },

          "difficulty": { "type": "string", "enum": \["easy","moderate","hard"\] },

          "elevationGainM": { "type": "integer" },

          "loop": { "type": "boolean" }

        }

      },

      "location": {

        "type": "object",

        "properties": {

          "name": { "type": "string" },

          "lat": { "type": "number" },

          "lng": { "type": "number" }

        }

      },

      "external": { "type": "object", "properties": { "website": { "type": "string", "format": "uri" } } },

      "media": \[{ "type": "object", "properties": { "url": { "type": "string","format":"uri" } } }\],

      "dedupeKey": { "type": "string" }

    }

  }

}

**Dedupe rule:**  
 `dedupeKey = hash(itineraryId | location.name | durationMinutes | difficulty | website)` — avoids double-saving the same trail entry.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Gate behind Active Itinerary**

Given no Active Itinerary exists

When I try to open Trails

Then I must create or select an itinerary

And subsequent saves bind to that itinerary automatically.

**AC2 — Result card content**

Given I open Trails search

Then each card shows a photo, name, duration, and difficulty with Save/Share actions.

**AC3 — Details & map handoff**

Given I open a trail

Then I can view photos, duration, difficulty

And I can tap "Show on map" to open either the in-app map or an external maps app.

**AC4 — Save auto-binds & appears immediately**

Given I press Save on a trail

Then a SavedItem is created with itineraryId=\<Active\> and section=trails

And it appears immediately under Trails in the Itinerary Overview.

**AC5 — Map presence & snapshot**

Given I have saved trails

When I open the trip map

Then I can see those trails pinned

And (in a later story) I can generate a shareable snapshot with highlighted photos.

**AC6 — Offline & caching**

Given I am offline

When I press Save

Then the item appears with a "Syncing…" badge and syncs later

And trail responses are cached where reasonable.

**AC7 — Dedupe**

Given I see same trail item I saved before in the same itinerary, the “save” button is changed to “saved” button icon. 

Then if I press on that “saved” button, the item is going to be unsaved from the itinerary.

---

## **UX & Interaction Details**

* **Map view:** clusters & pins; “show only within map bounds” toggle; tap → mini-card with Save/Details; consistent with Entertainment/Events map.

* **List view:** photo-led cards with duration & difficulty chips; Share opens OS share sheet.

* **Details:** prominent **Show on map** CTA; small disclaimer if external map is used.

* **Accessibility & i18n:** descriptive alt text; clear chip labels; localized units (km/mi, meters/feet).

---

## **Engineering Notes (Definition of Done)**

* **Query normalization & caching:** Key by (place, filters, sort); respect vendor TTLs; evict on itinerary switch. (Same strategy as other sections.)

* **Difficulty derivation:** Normalize difficulty bands from vendor data (e.g., elevation gain \+ grade) to `easy/moderate/hard`.

* **External map handoff:** Build deep links for Google Maps / OSM; sanitize URLs; open in external web context.

* **Idempotency:** Enforce `dedupeKey`; local-first insert → background sync; robust error states.

* **Networking:** Retries with jitter; graceful cancel on filter/sort/map moves; clear error UI with retry.

* **Telemetry:** `trails_search`, `trails_result_view`, `filter_applied`, `trails_map_viewed`, `trail_opened`, `trail_saved`, `save_deduped`, `save_failed`, `save_synced`.

* **Testing:**

  * Unit: difficulty normalization, dedupe key.

  * Contract: vendor trail schema (duration/elevation).

  * E2E: offline save → sync; map/list parity; external map handoff.

---

# **Story 8 — Itinerary Map (unified layers & shareable snapshot)**

**As a** traveler  
 **I want** a single interactive map that layers all my saved items and my trip photos  
 **So that** I can see my plan spatially and export a shareable snapshot with highlights.  
 (The spec calls for an integrated map that can show itinerary items and user’s uploaded pictures, and to create a final snapshot with photo highlights for social sharing.)

---

## **Scope**

* **Unified layers:** Render Transport, Accommodation, Entertainment, Gastronomy, Events, and Trails on one map; items reflect the **Active Itinerary** only.  
* **User photos layer (private by default):** Allow attaching user photos to places/pins; visible to the owner and collaborators who have access to the itinerary.  
* **Snapshot export:** On demand, generate a “final snapshot” image of the map with selected highlights (photos) suitable for social sharing.  
* **Map/list parity:** Panning/zooming the map filters the list pane (and vice versa) across sections.  
* **Offline-readiness:** Saved itinerary content remains viewable offline; snapshots can be created from cached tiles/items when possible.  
* **Safety & performance:** Tile caching, rate limits, idempotent snapshot jobs, and sanitized external links.

---

## **Detailed Workflow**

1. **Open Itinerary Map**  
   * From Itinerary Overview, open **Map**. Only items bound to the **Active Itinerary** render (icons per section).

2. **Layers & filters**  
   * Layer toggles: Transport, Accommodation, Entertainment, Gastronomy, Events, Trails, **Photos**.  
   * Quick filters: “Today”, “During My Dates”, “Open Now” (where applicable), “Only items in view”.

3. **Pin behaviors**  
   * Tap pin → **mini-card** (title, time/date if any, quick actions: Details, Save/Unsave, Navigate).  
   * Trails show a polyline when available; Transport may show hubs/lines if provided.

4. **Attach photos**  
   * From any pin: **Add Photo** → choose from device → photo is associated with that item’s location; permissions inherit itinerary sharing rules (viewers/collaborators).

5. **Create snapshot**  
   * CTA: **Create Shareable Snapshot** → wizard: choose bounds/zoom, select up to N highlights (photos), pick theme (light/dark), annotate title/dates → **Generate**.  
   * Output: a high-res image with map, pins, and photo callouts ready to share.

6. **Offline considerations**  
   * If offline, show “Using cached tiles and items”; snapshot generation succeeds if required assets are cached, otherwise warn for missing tiles.

---

## **Data Contracts (client-side; server contracts finalized later)**

{

  "MapState": {

    "type": "object",

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "bounds": { "type": "object", "properties": {

        "north": { "type": "number" }, "south": { "type": "number" },

        "east": { "type": "number" }, "west": { "type": "number" }

      }},

      "zoom": { "type": "number" },

      "visibleLayers": {

        "type": "array",

        "items": { "type": "string", "enum": \["transport","accommodation","entertainment","gastronomy","events","trails","photos"\] }

      },

      "filters": {

        "type": "object",

        "properties": {

          "timeWindow": { "type": "object", "properties": { "start": { "type":"string","format":"date-time" }, "end": { "type":"string","format":"date-time" } } },

          "openNow": { "type": "boolean" },

          "inViewOnly": { "type": "boolean" }

        }

      }

    },

    "required": \["itineraryId","bounds","zoom","visibleLayers"\]

  },

  "MapItem": {

    "type": "object",

    "required": \["id","section","lat","lng","title"\],

    "properties": {

      "id": { "type": "string" },

      "section": { "type": "string", "enum": \["transport","accommodation","entertainment","gastronomy","events","trails"\] },

      "lat": { "type": "number" },

      "lng": { "type": "number" },

      "title": { "type": "string" },

      "time": { "type": "object", "properties": { "start": { "type":"string","format":"date-time" }, "end": { "type":"string","format":"date-time" } } },

      "icon": { "type": "string" },

      "polyline": { "type": "array", "items": { "type": "array", "items": { "type": "number" }, "minItems": 2, "maxItems": 2 } }

    }

  },

  "MapPhoto": {

    "type": "object",

    "required": \["id","itineraryId","lat","lng","url","visibility"\],

    "properties": {

      "id": { "type": "string","format":"uuid" },

      "itineraryId": { "type": "string","format":"uuid" },

      "lat": { "type": "number" },

      "lng": { "type": "number" },

      "attachedToItemId": { "type": "string" },

      "url": { "type": "string", "format": "uri" },

      "caption": { "type": "string" },

      "visibility": { "type": "string", "enum": \["owner","collaborators","public-export"\] }

    }

  },

  "MapSnapshotRequest": {

    "type": "object",

    "required": \["itineraryId","bounds","zoom","highlights"\],

    "properties": {

      "itineraryId": { "type": "string","format":"uuid" },

      "bounds": { "$ref": "\#/definitions/MapState/properties/bounds" },

      "zoom": { "type": "number" },

      "theme": { "type": "string", "enum": \["light","dark"\] },

      "title": { "type": "string" },

      "dates": { "type": "string" },

      "highlights": { "type": "array", "items": { "type": "object", "properties": {

        "photoId": { "type": "string","format":"uuid" },

        "itemId": { "type": "string" }

      }}, "maxItems": 10 }

    }

  },

  "MapSnapshotResponse": {

    "type": "object",

    "required": \["snapshotId","imageUrl","createdAt"\],

    "properties": {

      "snapshotId": { "type": "string","format":"uuid" },

      "imageUrl": { "type": "string","format":"uri" },

      "createdAt": { "type": "string","format":"date-time" }

    }

  }

}

**Idempotency rule:** `snapshotId = hash(itineraryId | bounds | zoom | theme | highlights[])` ensures repeated requests with identical inputs return the same artifact.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Show only items from the Active Itinerary**

Given I open the Itinerary Map

Then I see only pins/polylines for the currently active itinerary

And toggles let me show/hide sections (transport, accommodation, entertainment, gastronomy, events, trails).

**AC2 — Photos layer with sharing-aware visibility**

Given I add a photo to a pin

Then the photo is visible to me

And collaborators with access to the itinerary can also see it

And others cannot unless I export a snapshot.

**AC3 — Map/list parity**

Given I pan/zoom the map or change filters

Then the adjacent list updates to reflect the items in view (and vice versa).

**AC4 — Snapshot generation**

Given I select map bounds, theme, and up to N highlights

When I press Create Shareable Snapshot

Then I receive a high-resolution image containing the map, relevant pins, and my selected photo highlights suitable for social media.

**AC5 — Offline-readiness**

Given I am offline with cached tiles and items

When I open the map

Then items still render and a notice says cached tiles are used

And snapshot creation works if required assets are cached.

**AC6 — Privacy & safety**

Given I generate a snapshot

Then no private itinerary metadata (emails, booking IDs, internal notes) is embedded

And only the selected photo thumbnails and visible pins appear in the image.

**AC7 — Performance**

Given I toggle layers rapidly or move the map quickly

Then pins and tiles load smoothly with progressive rendering and no UI jank.

---

## **UX & Interaction Details**

* **Layer chips:** sticky row above the map; badges show counts per layer.

* **Pin styles:** per-section icons; Events have date pill; Trails can display a simplified route polyline.

* **Mini-card:** actions: Details, Navigate (external map), Add Photo, Share (snapshot).

* **Snapshot wizard:** preview pane; drag-to-reorder highlights; watermark toggle.

* **Accessibility:** large tap targets, high-contrast mode, spoken feedback for selected pins.

* **i18n:** localized labels; units (km/mi) from locale.

---

## **Engineering Notes (Definition of Done)**

* **Tiles & caching:** Use vector tiles where available; cache tiles and item geojson keyed by itinerary and bounds; purge on itinerary switch.

* **State management:** Single source of truth for items; viewport queries derive a filtered slice for the list.

* **Snapshot service:** Client renders canvas → uploads, or server-side headless map renderer; ensure **idempotency** and content hashing.

* **Security & privacy:** Photos stored with itinerary-scoped ACLs (owner/collaborators); snapshot export strips EXIF and PII; sanitize any external links.

* **Rate limiting & retries:** Respect gateway limits; exponential backoff with jitter for tile or item fetches. (See security/perf guidance in the brief.)

* **Observability:** Metrics — `map_opened`, `layer_toggled`, `viewport_changed`, `snapshot_requested`, `snapshot_generated`, `tile_cache_hit`.

* **Testing:**

  * Unit: layer visibility filters; snapshot idempotency.

  * Contract: geojson schema; photo ACL propagation.

  * E2E: map/list parity, offline rendering, snapshot with/without cached tiles.

---

Got it — here’s **Story \#9** only. Say **“Next”** when you want me to continue.

# **Story 9 — Daily Planner (manual & smart auto-day builder) inside the Active Itinerary**

**As a** traveler  
 **I want** to build day-by-day plans from my saved items (entertainment, gastronomy, events, trails, and time blocks like travel or rest)  
 **So that** I have a clear, conflict-free schedule I can adjust, share, and use offline—always bound to my Active Itinerary.

---

## **Scope**

* **In-itinerary only:** Planner surfaces only when an **Active Itinerary** exists. All plan entries are bound `{ itineraryId:<Active> }`.  
* **Two build modes:**  
  1. **Manual** drag-drop from the Saved Items drawer into a timeline.  
  2. **Smart Auto-Build** that proposes a draft plan using constraints (dates, opening hours, event start times, restaurant mealtimes, walking/driving ETAs, user energy/pace).

* **Time primitives:** fixed-time items (events, transport), flexible-time items (sights, trails, meals), and **custom blocks** (buffer, commute, nap, “work session”).

* **Travel time aware:** Inserts realistic commute/buffer using the map/ETA service; warns if an item is unreachable in time.

* **Conflict engine:** Detects and explains overlaps, venue closed hours, too-short transfers, and outside-itinerary-date issues; offers one-tap fixes.

* **Views:** Day timeline (primary), 7-day strip nav, calendar grid, and map view with daily routing polyline.

* **Offline-first:** Planner state and referenced item essentials cached; editing and reordering work offline with later sync.

* **Export & share:** Share a read-only day plan (PDF/image snapshot) or itinerary-scoped link (respecting permissions).

* **Notifications:** Local reminders (opt-in) for upcoming fixed items and leave-now prompts based on ETA.

---

## **Detailed Workflow**

1. **Open Planner**  
   * Guard for Active Itinerary. Show date strip (itinerary range). First day opens by default with empty timeline and **Saved Items** drawer grouped by section (Entertainment, Gastronomy, Events, Trails, Accommodation, Transport).

2. **Manual build**  
   * Drag a saved item onto the timeline → if fixed (e.g., event 19:30–21:00) it pins to that slot; if flexible, user drops into a time slot and can adjust start/duration.  
   * On drop, planner auto-inserts **Commute** blocks before/after based on current day’s last item and selected travel mode (walk/transit/drive).  
   * User can add **Custom Blocks** (title, icon, start, duration, optional location).

3. **Smart Auto-Build**  
   * Inputs: preferred start/end of day, pace (easy/normal/packed), transport mode priority, meal cadence (lunch \~13:00, dinner \~19:30), must-dos (pinned), avoid crowds (bias earlier for popular sights).

   * Output: a **draft** timeline per day that respects:

     * fixed items (events/transport check-in/out)

     * opening hours & last-entry times

     * ETAs between consecutive items

     * reasonable buffers (configurable per pace)  
     * Least time spent on transit (if 2 items out of 3 are near to each other, then the user should visit them before going to the item 3 so that they will spend less time on going back and forth)

   * User can accept all or “apply per day,” then tweak.

4. **Conflict resolution**

   * Real-time banners & inline chips: **Overlap**, **Closed**, **Tight transfer**, **Outside itinerary**.

   * One-tap fixes: shift earlier/later by N minutes, auto-swap order, extend lunch, replace with alternative nearby item.

   * Explainers link to the cause (e.g., “Louvre last entry 16:30”).

5. **Map & calendar parity**  
   * **Map tab**: shows the day’s route in order; tapping a pin focuses the timeline; reordering the timeline reorders the route.  
   * **Calendar tab**: day/week grid; edits sync back to the timeline.

6. **Dining helper**  
   * If a meal slot lacks a venue, suggest nearby restaurants matching dietary filters within ETA ≤ X minutes from the preceding item; insert with duration and hold a “reservation” note field.

7. **Trails & weather awareness (optional hooks)**  
   * If a trail is scheduled during poor weather (from itinerary’s city forecast), display a nudge to move it (actual weather integration can be added later; stub for now).

8. **Export & reminders**  
   * Export day as **PDF** or **image snapshot** (map \+ timeline).  
   * Optional reminders: “Leave at 18:45 to be on time for 19:30 show (ETA 32m \+ buffer)”.

---

## **Data Contracts (client-side; server contracts finalized later)**

{

  "DayPlan": {

    "type": "object",

    "required": \["itineraryId", "date", "entries", "version"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "date": { "type": "string", "format": "date" },

      "entries": {

        "type": "array",

        "items": { "$ref": "\#/definitions/DayPlanEntry" }

      },

      "notes": { "type": "string" },

      "version": { "type": "integer" },

      "updatedAt": { "type": "string", "format": "date-time" }

    }

  },

  "definitions": {

    "DayPlanEntry": {

      "type": "object",

      "required": \["id","type","start","end","source"\],

      "properties": {

        "id": { "type": "string", "format": "uuid" },

        "type": { "type": "string", "enum": \["savedItem","custom","commute","buffer"\] },

        "start": { "type": "string", "format": "date-time" },

        "end": { "type": "string", "format": "date-time" },

        "location": {

          "type": "object",

          "properties": { "name": { "type": "string" }, "lat": { "type":"number" }, "lng": { "type":"number" }, "address": { "type": "string" } }

        },

        "source": {

          "type": "object",

          "required": \["origin"\],

          "properties": {

            "origin": { "type": "string", "enum": \["savedItem","user"\] },

            "savedItemId": { "type": "string" },          // present if origin=savedItem

            "section": { "type": "string", "enum": \["transport","accommodation","entertainment","gastronomy","events","trails"\] }

          }

        },

        "meta": {

          "type": "object",

          "properties": {

            "fixed": { "type": "boolean" },               // true for events/transport

            "durationMinutes": { "type": "integer" },

            "openingWindow": { "type": "object", "properties": { "start": { "type":"string", "format":"time" }, "end": { "type":"string", "format":"time" } } },

            "reservationNote": { "type": "string" },      // for meals

            "travelMode": { "type": "string", "enum": \["walk","transit","drive","none"\] },

            "etaMinutes": { "type": "integer" },

            "bufferMinutes": { "type": "integer" }

          }

        }

      }

    },

    "AutoBuildRequest": {

      "type": "object",

      "required": \["itineraryId","days","prefs"\],

      "properties": {

        "itineraryId": { "type": "string", "format": "uuid" },

        "days": { "type": "array", "items": { "type": "string", "format": "date" } },

        "mustDos": { "type": "array", "items": { "type": "string" } },  // savedItemIds that must appear

        "prefs": {

          "type": "object",

          "properties": {

            "dayStart": { "type": "string", "format": "time" },

            "dayEnd": { "type": "string", "format": "time" },

            "pace": { "type": "string", "enum": \["easy","normal","packed"\] },

            "travelModePriority": { "type": "array", "items": { "type":"string","enum":\["walk","transit","drive"\] } },

            "mealCadence": { "type": "object", "properties": { "lunch": { "type":"string", "format":"time" }, "dinner": { "type":"string", "format":"time" } } },

            "avoidCrowds": { "type": "boolean" }

          }

        }

      }

    },

    "Conflict": {

      "type": "object",

      "required": \["type","entryIds","message","suggestions"\],

      "properties": {

        "type": { "type": "string", "enum": \["overlap","closed","tightTransfer","outsideItinerary"\] },

        "entryIds": { "type": "array", "items": { "type": "string" } },

        "message": { "type": "string" },

        "suggestions": { "type": "array", "items": { "type": "string" } }

      }

    }

  }

}

**Idempotency & ordering:** planner operations carry a `version` and are applied via CRDT-like transforms or server-side revision checks to avoid overwrites when collaborating (future story can add multi-user).

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Gate behind Active Itinerary**

Given no Active Itinerary exists

When I open the Planner

Then I must select or create an itinerary

And the planner binds all entries to that itinerary automatically.

**AC2 — Drag & drop from Saved Items**

Given I have saved items

When I drag one onto the day timeline

Then it appears as a plan entry with start/end time

And commute/buffer blocks are inserted if needed based on ETA to the previous/next item.

**AC3 — Fixed vs flexible handling**

Given an event with a fixed start/end

When I add it to a day

Then it locks to those times and cannot be moved across the window without a conflict warning (indicate fixed nature of the item in colors).

Given a museum (flexible)

When I add it

Then the system proposes a default duration and places it within opening hours, which I can adjust.

**AC4 — Smart Auto-Build**

Given I choose Auto-Build with dayStart=09:30, dayEnd=20:30, pace=normal

And I pin two must-do items

When I run Auto-Build

Then I receive a draft plan that includes the must-dos, adds lunch/dinner around my cadence, respects opening hours, and inserts commutes/buffers.

**AC5 — Conflict detection and one-tap fixes**

Given my plan has two overlapping entries

When the conflict engine runs

Then I see an "Overlap" chip with suggestions (shift earlier 30m, push later 45m, swap order)

And choosing a suggestion updates the timeline and revalidates.

**AC6 — Map/calendar parity**

Given I reorder entries on the timeline

Then the route order on the Map tab updates immediately

And the Calendar tab reflects the same times.

**AC7 — Custom blocks & notes**

Given I add a custom "Work session" block 15:00–17:00

Then it appears in the timeline, participates in conflicts, and is included in exports.

**AC8 — Offline editing & sync**

Given I am offline

When I reorder and add entries

Then my changes persist locally and sync without data loss when back online.

**AC9 — Export & reminders**

Given I finalize a day

When I tap Export

Then I can save a PDF or image snapshot of the day timeline (with optional map)

And if reminders are enabled, I receive a "leave now" alert based on live ETA \+ buffer.

---

## **UX & Interaction Details**

* **Layout:** Date strip (sticky) → Day timeline (vertical) with hour rails and blocks; right-side **Saved Items drawer** (collapsible).

* **Blocks:** color-coded by section; commute shown as subtle connective chips with ETA; buffers as translucent bands.

* **Inline editors:** tap an entry to edit duration, travel mode, notes; long-press to duplicate or move to another day.

* **Conflict chips:** appear on affected entries; tapping opens a bottom sheet with explanations & fixes.

* **Map tab:** step-by-step route; pin → scrolls timeline; toggle travel mode to recompute ETAs.

* **Accessibility:** full keyboard support for reordering; screen reader announcements for conflicts and time changes; high-contrast palette.

* **i18n:** localized time/date formats; 12/24h preference; units (km/mi).

---

## **Engineering Notes (Definition of Done)**

* **State management:** normalized `DayPlan` per date with optimistic updates; undo/redo stack.

* **ETA service:** memoized point-to-point ETAs (walk/transit/drive) with caching by (origin, dest, mode, timeWindow).

* **Opening hours:** canonical format (per venue/day) with last-entry; validator ensures planned interval ∈ opening window minus dwell time.

* **Auto-Build engine:** scoring function balances distance, category variety, user prefs, and fixed anchors; produces deterministic output for same inputs (hash for idempotency).

* **Conflict engine:** runs on every mutation; debounced to avoid thrash; returns a list of `Conflict` objects with actionable suggestions.

* **Persistence & sync:** local DB for plans; background sync; per-entry `updatedAt` and `version`; conflict-free merges (last-writer-wins per field or CRDT where needed).

* **Security:** input validation; sanitize external links in item notes; permission checks on share links.

* **Telemetry:** `planner_opened`, `entry_added`, `entry_reordered`, `auto_build_run`, `conflict_raised`, `conflict_resolved`, `export_created`, `reminder_fired`.

* **Testing:**

  * Unit: ETA memoization, opening-hours validator, auto-build scoring, conflict suggestions.

  * Contract: SavedItem → DayPlanEntry mapping across sections.

  * E2E: offline edit → sync; drag-drop; one-tap conflict fix; export artifact integrity.

---

# **Story 10 — Final Offline Snapshot (full itinerary bundle for no-signal use) & Share Flow**

**As a** traveler  
 **I want** a complete, read-only offline snapshot of my itinerary (content \+ maps \+ day plans)  
 **So that** I can use the app confidently with no connection and optionally share a safe, privacy-aware version with others.

---

## **Scope**

* **One-tap “Make Available Offline”** for the **Active Itinerary** that packages everything required for a no-signal experience.

* **Bundle contents (read-only):** itinerary metadata; all Saved Items (Transport, Accommodation, Entertainment, Gastronomy, Events, Trails) with essential details; Day Planner timelines; lightweight maps; photos/thumbnails; and a local search index.

* **Delta updates:** subsequent runs fetch only changes (additions/edits/removals) for fast refresh.

* **Share flow:** export a **privacy-filtered** read-only share (link or file) that others can view in-app or in a lightweight web viewer.

* **Security & privacy:** strip PII/booking IDs by default in shares; owner can toggle what to include.

* **No background dependence:** the snapshot must **fully function offline** (navigation between screens, viewing details, maps from cached tiles, image galleries from cached thumbnails).

---

## **Detailed Workflow**

1. **Start from Itinerary Overview**  
   * CTA: **Make Available Offline** (also accessible from the Map and Planner).  
   * Preflight sheet shows estimated size and what will be downloaded (items, photos, tiles). Toggle to include/exclude large media.

2. **Packaging (client-first, server-assisted)**  
   * Compute **manifest** (versioned) describing items, media, map regions, day plans.  
   * Download missing assets to local storage:  
     * **Metadata \+ Saved Items** (JSON)  
     * **Day Plans** (JSON)  
     * **Image thumbnails** (e.g., ≤ 1024 px longest edge)  
     * **Map tiles/vector data** for itinerary bounds \+ 1 zoom level tighter around saved pins and daily routes  
     * **Local search index** (destination names, items, tags)  
   * Build **bundle vN** and mark it active.

3. **Using the snapshot**  
   * When offline, the app transparently serves content from the bundle: list/map/detail screens, Planner read-only view, photos, and search.  
   * Detail pages show “Last updated on ” and surface a **Refresh** button when back online.

4. **Delta updates**  
   * On **Refresh snapshot**, compare current server state vs. manifest vN → fetch only diffs, produce vN+1.  
   * Keep up to **2 previous bundles** for instant rollback (space permitting).

5. **Share flow**  
   * CTA: **Share Offline Snapshot** → wizard with privacy controls:  
     * Include/exclude: traveler names, emails/phone, booking refs/PNRs, prices, notes.  
     * Choose output:  
       * **Link (preferred):** creates a signed, read-only web snapshot (expires after X days).  
       * **File export:** .tripbundle (read-only), plus optional **PDF** or **image** overview.  
   * Generate & present share options (copy link, QR code, system share).

6. **Revocation & expiry**  
   * Owner can revoke shared links at any time. Links expire by default; recipients see an “Expired” page with request-access option.

---

## **Data Contracts (client-side; server contracts to be finalized later)**

{

  "OfflineBundleManifest": {

    "type": "object",

    "required": \["id","itineraryId","version","createdAt","sections","assets","searchIndex"\],

    "properties": {

      "id": { "type": "string", "format": "uuid" },

      "itineraryId": { "type": "string", "format": "uuid" },

      "version": { "type": "integer" },

      "createdAt": { "type": "string", "format": "date-time" },

      "sections": {

        "type": "object",

        "properties": {

          "transport": { "type": "array", "items": { "type": "object" } },

          "accommodation": { "type": "array", "items": { "type": "object" } },

          "entertainment": { "type": "array", "items": { "type": "object" } },

          "gastronomy": { "type": "array", "items": { "type": "object" } },

          "events": { "type": "array", "items": { "type": "object" } },

          "trails": { "type": "array", "items": { "type": "object" } }

        }

      },

      "dayPlans": { "type": "array", "items": { "type": "object" } },

      "assets": {

        "type": "object",

        "properties": {

          "images": { "type": "array", "items": { "type": "object", "properties": {

            "id": { "type": "string" },

            "url": { "type": "string", "format": "uri" },

            "localPath": { "type": "string" },

            "width": { "type": "integer" },

            "height": { "type": "integer" },

            "hash": { "type": "string" }

          } } },

          "mapTiles": { "type": "array", "items": { "type": "object", "properties": {

            "z": { "type": "integer" }, "x": { "type": "integer" }, "y": { "type": "integer" }, "hash": { "type": "string" },

            "localPath": { "type": "string" }

          } } }

        }

      },

      "searchIndex": {

        "type": "object",

        "properties": {

          "tokens": { "type": "array", "items": { "type": "string" } },

          "locale": { "type": "string" }

        }

      },

      "privacy": {

        "type": "object",

        "properties": {

          "piiIncluded": { "type": "boolean" },

          "pricesIncluded": { "type": "boolean" },

          "notesIncluded": { "type": "boolean" }

        }

      }

    }

  },

  "BundleDelta": {

    "type": "object",

    "required": \["fromVersion","toVersion","ops"\],

    "properties": {

      "fromVersion": { "type": "integer" },

      "toVersion": { "type": "integer" },

      "ops": {

        "type": "array",

        "items": { "type": "object", "properties": {

          "op": { "type": "string", "enum": \["add","update","remove"\] },

          "path": { "type": "string" },        // e.g., "sections.events\[12\]"

          "value": {}

        } }

      }

    }

  },

  "ShareRequest": {

    "type": "object",

    "required": \["itineraryId","version","visibility"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "version": { "type": "integer" },

      "visibility": { "type": "string", "enum": \["link","file"\] },

      "expireAt": { "type": "string", "format": "date-time" },

      "privacy": { "$ref": "\#/definitions/OfflineBundleManifest/properties/privacy" },

      "title": { "type": "string" }

    }

  },

  "ShareResponse": {

    "type": "object",

    "required": \["shareId","url","expireAt"\],

    "properties": {

      "shareId": { "type": "string", "format": "uuid" },

      "url": { "type": "string", "format": "uri" },

      "expireAt": { "type": "string", "format": "date-time" },

      "revocable": { "type": "boolean" }

    }

  }

}

**Idempotency rules**

* `bundle.id = hash(itineraryId | version | manifestHash)`

* Delta refreshes are idempotent: applying the same `BundleDelta` twice yields no changes.

* Share links: `shareId = hash(itineraryId | version | privacy | expireAt)`; repeat requests with same inputs return the existing link.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — One-tap offline availability**

Given I have an Active Itinerary

When I tap "Make Available Offline"

Then the app downloads required content and marks the itinerary as available offline

And the preflight shows estimated size and toggles for large media.

**AC2 — Works fully offline**

Given I am in airplane mode

When I open the itinerary, items, maps, photos, and day plans

Then everything loads from the offline bundle without errors

And details pages show "Last updated on \<date\>".

**AC3 — Local search**

Given I am offline

When I search by place name, tag, or venue

Then I receive results from the local index with links to the corresponding offline detail pages.

**AC4 — Delta update**

Given I have bundle v3

And I saved new items while online

When I tap "Refresh snapshot"

Then only changed data is fetched and bundle v4 is created quickly.

**AC5 — Privacy-aware share**

Given I open Share Offline Snapshot

When I leave PII and booking references disabled

Then the generated link/file excludes traveler names, emails, booking numbers, and internal notes.

**AC6 — Revocation & expiry**

Given I created a share link

When I revoke it

Then recipients see an "Expired/Revoked" page and can no longer access the snapshot.

**AC7 — Size & failure handling**

Given the bundle would exceed the device's storage threshold

Then the app warns me with choices (exclude large media / reduce map area / cancel).

Given a tile or image fails to download

Then the app retries with backoff and falls back gracefully with a placeholder if ultimately unavailable.

**AC8 — Read-only integrity**

Given I open an offline snapshot

Then editing actions are disabled or clearly labeled as unavailable

And any attempted edit prompts me to go online to sync live data first.

---

## **UX & Interaction Details**

* **Preflight sheet:** size estimate, toggles (include photos, include high-res tiles), region preview, “Download now”.

* **Progress UI:** determinate progress bar with sections (Items ▸ Photos ▸ Maps ▸ Index).

* **Offline badge:** top app-bar chip “Offline snapshot vN” with quick actions: Refresh, Storage, Share, Remove.

* **Share wizard:** privacy checklist (PII, prices, notes), output (link/file/PDF), expiry (7/30/90 days), **Create** → success screen with copy link \+ QR.

* **Viewer (recipient):** read-only; map \+ lists \+ details; “Request edit access” button (sends owner a notification).

* **Accessibility:** progress announced via ARIA live region; offline state clearly announced on screen readers.

* **Internationalization:** localized size/time estimates and labels.

---

## **Engineering Notes (Definition of Done)**

* **Storage layout:** `/bundles/<itineraryId>/<version>/` with subfolders `items/`, `plans/`, `tiles/`, `images/`, `index/`.

* **Map caching:** compute minimal tile coverage from pins & daily routes; store both raster and/or vector tiles based on provider limits.

* **Thumbnails:** generate on device when possible; store WebP/AVIF to minimize size; retain original URLs for online viewing.

* **Indexing:** build lightweight inverted index (tokens → item ids); language-aware tokenization per itinerary locale.

* **Consistency:** write manifest last; verify SHA-256 of assets; rollback to previous version on failure.

* **Delta protocol:** server returns a `BundleDelta` set; client applies ops, downloads any new assets, updates manifest.

* **Privacy filtering:** redaction pipeline removes keys (`email`, `phone`, `bookingRef`, `notes`, `price`) before packaging share artifacts.

* **Security:** signed URLs for share; AES-GCM encrypt local bundles on devices with secure storage available; protect revocation endpoints.

* **Telemetry:** `offline_preflight_viewed`, `offline_bundle_started`, `offline_bundle_completed`, `offline_bundle_failed`, `offline_refresh`, `share_created`, `share_revoked`, `viewer_opened`.

* **Testing:**

  * Unit: delta apply, index search, privacy redaction.

  * Contract: manifest schema compatibility across versions.

  * E2E: airplane-mode run-through; interrupted download resume; link expiry & revoke; large-media exclusion flow.

---

# **Story 11 — Collaboration & Permissions (invite, roles, concurrency, audit)**

**As an** itinerary owner  
 **I want** to invite others to view or edit my itinerary with the right permissions  
 **So that** we can co-plan safely, with clear change history and no accidental overwrites.  
 (The spec requires inviting people to view/edit an itinerary; invitees can add/remove activities, and shared map photos are visible only to the owner and those with access.)

---

## **Scope**

* **Invite & roles:** Owner can invite collaborators by email; roles: **viewer** (read-only), **editor** (add/remove items), **owner** (original owner; can transfer). Spec calls out view/edit and that invitees may add/remove activities.

* **AuthN/AuthZ:** OAuth2/OIDC sign-in; role/attribute-based access checks on every itinerary endpoint.

* **Map/photo visibility:** User photos on the itinerary map are visible to the owner and “whoever has access to the itinerary.” Inherit the itinerary’s ACL.

* **Real-time presence & concurrency:** Presence indicators; optimistic edits with conflict resolution (last-writer-wins per field \+ server merge for collections).

* **Audit & activity feed:** Append-only log of membership changes and item edits (who/what/when); owner can revoke access.

* **Invited user lifecycle:** If invitee lacks an account, they must sign up before editing (explicit in spec).

* **Security baselines:** Rate limiting, input validation, CSRF/XSS/SQLi protections, secrets management; audit logging and regional storage as applicable.

---

## **Detailed Workflow**

1. **Share & invite**  
   * Owner taps **Share** → **Invite collaborators**.  
   * Enter email(s), choose role (**Viewer/Editor**), optional message → **Send invite**.  
   * System sends a signed invite link. If the recipient lacks an account, they must sign up before edit access is granted (viewer may still require sign-in depending on setting).

2. **Accept invite**  
   * Recipient opens link → sign-in/sign-up → sees the itinerary with the granted role.  
   * First open posts an **activity**: “Samantha joined as Editor.”

3. **Permissions in action**  
   * **Viewer:** can see all itinerary content, day plans, and map/photos; cannot modify.

   * **Editor:** can add/edit/remove saved items across sections; can upload photos; cannot change roles or delete the itinerary. (Matches “invitees can also add/remove activities”.)  
   * **Owner:** full control, including role changes and transfer.

4. **Presence & collisions**  
   * Show avatars of online collaborators; show inline “editing…” chips on items being edited.  
   * If two users edit the same item: optimistic update \+ server merge; conflicts produce a non-blocking banner with a diff and “apply mine/keep theirs” options.

5. **Access management**  
   * **Manage access** screen lists members, roles, last seen; actions: change role, revoke, resend invite.  
   * Revocation is immediate; affected user is kicked from the live session and loses item/map photo visibility tied to the itinerary.

6. **Activity & audit**  
   * Activity feed: “Priya added ‘Louvre’ to Entertainment”, “Sam removed ‘Trail X’,” “Role changed: Sam → Viewer,” with timestamps.  
   * Server stores an immutable audit log for compliance (who/what/when), per security guidance.

---

## **Data Contracts (client-side; backend to finalize)**

{

  "ItineraryMember": {

    "type": "object",

    "required": \["userId","email","role","joinedAt"\],

    "properties": {

      "userId": { "type": "string", "format": "uuid" },

      "email": { "type": "string", "format": "email" },

      "role": { "type": "string", "enum": \["owner","editor","viewer"\] },

      "joinedAt": { "type": "string", "format": "date-time" },

      "lastSeenAt": { "type": "string", "format": "date-time" }

    }

  },

  "InviteRequest": {

    "type": "object",

    "required": \["itineraryId","emails","role"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "emails": { "type": "array", "items": { "type": "string", "format": "email" }, "minItems": 1 },

      "role": { "type": "string", "enum": \["editor","viewer"\] },

      "message": { "type": "string", "maxLength": 500 }

    }

  },

  "InviteAccept": {

    "type": "object",

    "required": \["inviteToken"\],

    "properties": { "inviteToken": { "type": "string" } }

  },

  "AclCheck": {

    "type": "object",

    "required": \["itineraryId","userId","action"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "userId": { "type": "string", "format": "uuid" },

      "action": {

        "type": "string",

        "enum": \["read","write","manage","upload\_photo"\]

      }

    }

  },

  "ActivityEvent": {

    "type": "object",

    "required": \["id","itineraryId","type","actorId","createdAt"\],

    "properties": {

      "id": { "type": "string","format":"uuid" },

      "itineraryId": { "type": "string","format":"uuid" },

      "type": {

        "type": "string",

        "enum": \["member\_invited","member\_joined","role\_changed","member\_removed","item\_added","item\_updated","item\_removed","plan\_updated"\]

      },

      "actorId": { "type": "string","format":"uuid" },

      "targetId": { "type": "string" },

      "details": { "type": "object" },

      "createdAt": { "type": "string","format":"date-time" }

    }

  }

}

**User entity (roles example):** the brief includes a JSON Schema with `role` for users; adapt to include itinerary-scoped roles vs. global.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Invite with role**

Given I am the itinerary owner

When I invite Samantha@example.com as Editor

Then Samantha receives an invite link

And upon accepting (after sign-up if needed) Samantha can add/remove activities. 

(Invitees must sign up to edit.)

**AC2 — Viewer vs Editor enforcement**

Given Sam is a Viewer

When Sam tries to save or delete an item

Then the action is blocked with a permission error

But Sam can see all items and the map/photos.

(Map/photos visible to those with access.)

**AC3 — Presence & edit collision**

Given two editors open the same item

When both edit within 10s

Then the first save succeeds and the second sees a non-blocking conflict banner with a diff and resolve options.

**AC4 — Audit trail**

Given any collaborator adds or removes an activity

Then an ActivityEvent is recorded with actor, target, and timestamp

And the owner can view it in the activity feed.

(Aligns with security/audit requirements.)

**AC5 — Manage access**

Given I am the owner

When I change Priya's role from Editor to Viewer or revoke access

Then the change takes effect immediately and Priya loses write or all access respectively.

**AC6 — Rate limits & abuse handling**

Given an attacker hammers invite endpoints

Then the gateway enforces per-user and per-IP rate limits and returns 429 with Retry-After.

**AC7 — Privacy of photos**

Given I remove a collaborator

Then my itinerary photos are no longer visible to that person on the map.

---

## **UX & Interaction Details**

* **Share menu:** “Invite collaborators,” “Manage access,” “Create read-only share” (from Story 10).

* **Invite dialog:** emails (tokenized chips), role picker, optional message; error states for invalid/duplicate emails.

* **Member list:** avatars, role dropdowns, last seen, revoke button, “Resend invite.”

* **Presence:** tiny avatar stack in the app bar; on item detail, show who’s editing.

* **Conflict banner:** “Your version conflicts with Priya’s save. Review changes ▸ Apply mine ▸ Keep theirs.”

* **Activity feed:** chronological, filterable (members, items, dates).

* **Accessibility:** role controls reachable via keyboard; live regions announce membership changes.

---

## **Engineering Notes (Definition of Done)**

* **AuthN/AuthZ:** OIDC login; short-lived access tokens; server checks `{ userId, itineraryId, action }` on every write. Follow least-privilege and input/output hardening.

* **RBAC model:** Itinerary-scoped membership table `(itineraryId, userId, role)`; computed permissions map actions to roles.

* **Invite tokens:** Signed, single-use, TTL (e.g., 7 days); redeem to create membership; log `member_invited/member_joined`.

* **Concurrency:** ETags or `updatedAt` precondition on writes; server merges arrays (e.g., saved items) by id; return 409 with merge payload on true conflicts.

* **Activity & audit:** Write compact `ActivityEvent` and append detailed audit log; redaction pipeline for PII in logs as needed.

* **Security baselines:** WAF, rate limits, CSRF/XSS/SQLi defenses, secrets management, CORS, encryption in transit/at rest, regional storage controls.

* **Email deliverability:** DKIM/SPF; retry with backoff; “Resend” with cooldown.

* **Telemetry:** `invite_sent`, `invite_accepted`, `role_changed`, `member_removed`, `presence_online`, `conflict_raised/resolved`.

* **Testing:**

  * Unit: permission checks, token redemption, merge/conflict resolution.

  * Contract: invite/accept flows, activity schema.

  * E2E: viewer blocked on write; editor allowed; revoke removes access immediately; concurrent edit conflict flow.

---

# **Story 12 — Email Scanner (ingest bookings, auto-parse, and bind to the Active Itinerary)**

**As a** traveler  
 **I want** the app to scan my booking emails (flights, trains, buses, hotels, tickets)  
 **So that** confirmed items are auto-extracted, normalized, and saved into the correct section of my **Active Itinerary** with minimal effort.

---

## **Scope**

* **Opt-in connection:** User connects an email account (OAuth; granular scope like read-only \+ metadata).

* **Safe import surface:** A dedicated “Inbox ▸ Travel” screen shows detected booking threads with a per-item **Add to itinerary** flow.

* **Strict binding:** Every imported item is created with `{ itineraryId:<Active>, section:<derived> }` (transport / accommodation / events). If no Active Itinerary exists, user must create/select one before importing.

* **Parser coverage:** Major vendors and common formats (PNRs, fare details, legs, passenger names, confirmation numbers, stay dates, addresses, check-in/out windows, ticket start times).

* **Deduping:** Re-scan-safe. If the same confirmation appears again (e.g., amended email), it updates the existing SavedItem rather than duplicating it.

* **Offline-ready:** Once imported, items are available offline like any other SavedItem.

* **Privacy controls:** User can pause or disconnect email at any time; scoped search (“travel” labels, sender allow-list), redaction of PII in shares, and local-only previews before saving.

---

## **Detailed Workflow**

1. **Connect email (one-time)**

   * Settings ▸ Integrations ▸ “Connect Email.”

   * OAuth to provider (e.g., Gmail, Outlook). Request **read-only** \+ thread metadata scopes.

   * User selects default behavior: (a) **Manual add** (review before saving) or (b) **Auto-file to Active Itinerary** (still shows a review queue).

2. **Detection & triage**

   * Background job fetches **headers \+ snippets** for recent messages from known travel senders and with travel keywords.

   * ML/regex hybrid classifier marks messages as **Transport / Accommodation / Event / Other**; confidence score attached.

   * “Inbox ▸ Travel” lists grouped conversations with badges: New, Updated, Low Confidence.

3. **Parse & normalize**

   * Open a conversation → the app renders a structured preview:

     * **Transport:** legs (origin/destination, times, carriers, numbers), baggage, fare class, confirmation (PNR), vendor deep link.

     * **Accommodation:** property name, address/geo, check-in/out, room/board plan, confirmation ID.

     * **Events/Tickets:** title, venue/location, date/time, seats/QR if present, order ID.

   * User taps **Add to itinerary** (or bulk-add). System creates `SavedItem` with correct `section` and `itineraryId`.

4. **Auto-file (optional)**

   * If enabled, new high-confidence parses are auto-created under the **current Active Itinerary** and appear in an “Imported” tray for quick review/undo.

   * If Active Itinerary changes, subsequent auto-files bind to the new one; already-saved items remain in their original itinerary.

5. **Updates & cancellations**

   * If a later email for the same booking is detected (schedule change, room change, cancellation):

     * Compute `dedupeKey`, match existing SavedItem → update fields and append a change note to the item’s activity log.

     * For cancellations, mark the item as **Cancelled** (non-deletive) and suggest alternatives.

6. **Security & privacy**

   * Vendor links are sanitized; QR codes/ticket barcodes are stored but hidden by default until the user explicitly reveals them.

   * PII (passenger names, phone, email) stays in the item but is **excluded** from exported snapshots by default (Story 10 rules).

---

## **Data Contracts (client-side; backend to be finalized)**

{

  "EmailConnection": {

    "type": "object",

    "required": \["provider","status","scopes"\],

    "properties": {

      "provider": { "type": "string", "enum": \["gmail","outlook","imap"\] },

      "status": { "type": "string", "enum": \["connected","paused","disconnected"\] },

      "scopes": { "type": "array", "items": { "type": "string" } },

      "autoFile": { "type": "boolean" },

      "allowList": { "type": "array", "items": { "type": "string" }, "description": "trusted senders/domains" },

      "lastSyncAt": { "type": "string", "format": "date-time" }

    }

  },

  "ParsedMessage": {

    "type": "object",

    "required": \["messageId","threadId","category","confidence","payload"\],

    "properties": {

      "messageId": { "type": "string" },

      "threadId": { "type": "string" },

      "category": { "type": "string", "enum": \["transport","accommodation","events","other"\] },

      "confidence": { "type": "number", "minimum": 0, "maximum": 1 },

      "payload": { "type": "object" },          // raw extracted fields per category

      "attachments": { "type": "array", "items": { "type": "object", "properties": {

        "id": { "type": "string" }, "filename": { "type": "string" }, "mime": { "type": "string" }

      }}}

    }

  },

  "ImportRequest": {

    "type": "object",

    "required": \["itineraryId","category","payload","source"\],

    "properties": {

      "itineraryId": { "type": "string", "format": "uuid" },

      "category": { "type": "string", "enum": \["transport","accommodation","events"\] },

      "payload": { "type": "object" },          // normalized fields mapped below

      "source": {

        "type": "object",

        "properties": {

          "provider": { "type": "string" },

          "messageId": { "type": "string" },

          "threadId": { "type": "string" },

          "sender": { "type": "string" }

        }

      }

    }

  }

}

### **Normalized payload mappings → SavedItem.\***

* **Transport** (`SavedItem.transport`)

  * `mode`, `time.start/end`, `location.origin/destination`, `carriers`, `baggage`, `price`, `external.vendor/vendorUrl/externalId=PNR`, `passengers` (optional).

  * `dedupeKey = hash(itineraryId | mode | origin | destination | time.start | externalId)`.

* **Accommodation** (`SavedItem.accommodation`)

  * `location.name/address/geo`, `time.checkIn/checkOut`, `room/board`, `policies.checkinWindow/checkoutWindow`, `price.total/currency`, `external.vendor/vendorUrl/externalId=confirmationId`.

  * `dedupeKey = hash(itineraryId | checkIn | checkOut | location.name | externalId)`.

* **Events** (`SavedItem.events`)

  * `summary=title`, `time.start/end`, `venue.name/address/geo`, `external.website/ticketUrl`, ticket barcode metadata (hidden).

  * `dedupeKey = hash(itineraryId | title | time.start | venue.name)`.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Connect & scope**

Given I connect my email account

Then the app requests read-only, travel-limited scopes

And I can pause or disconnect later.

**AC2 — Gate behind Active Itinerary**

Given no Active Itinerary exists

When I try to import a parsed booking

Then I must create or select an itinerary

And the imported item binds to that itinerary automatically.

**AC3 — Manual add flow**

Given the scanner detects a hotel email

When I open it in Inbox ▸ Travel and tap Add to itinerary

Then a SavedItem is created in section=accommodation with parsed check-in/out and property details

And it appears immediately in the Accommodation section.

**AC4 — Auto-file option**

Given Auto-file is enabled and Paris Trip is Active

When a new flight confirmation arrives with high confidence

Then a Transport item is created under Paris Trip

And I can review/undo from the Imported tray.

**AC5 — Update & cancel handling**

Given I previously imported Flight AB123 (PNR XYZ789)

When a schedule change email arrives

Then the existing SavedItem is updated (times/segments) and the item shows an "Updated from email" note.

Given a cancellation email for my hotel arrives

Then the SavedItem is marked Cancelled with the cancellation timestamp and policy.

**AC6 — Deduping & idempotency**

Given I re-scan the same confirmation

Then no duplicate item is created; the scan is idempotent based on dedupeKey.

**AC7 — Privacy & QR handling**

Given a ticket email contains a barcode/QR

Then the code is stored securely but blurred/hidden in the UI until I tap Reveal

And the code is never included in shared snapshots by default.

**AC8 — Offline-ready outcome**

Given I imported items from email

When I go offline

Then all imported items remain fully viewable like any other SavedItem.

---

## **UX & Interaction Details**

* **Inbox ▸ Travel list:** cards show sender, subject, detected category, confidence chip, **Preview** ▸ **Add** / **Ignore** / **Snooze**.

* **Preview sheet:** parsed fields in a tidy summary; raw email open on demand; warning banner for **Low confidence** with field highlights needing confirmation.

* **Imported tray:** shows the last N auto-filed items with Undo; links into the relevant itinerary section.

* **Connection pill:** app bar chip shows “Email connected/paused”; tap for settings.

* **Permissions coach-marks:** explain read-only scope and how to revoke.

* **Accessibility:** expose parsed fields as labeled rows; announce confidence and actions.

---

## **Engineering Notes (Definition of Done)**

* **Providers:** Start with Gmail \+ Outlook; IMAP fallback (metadata fetch \+ full message fetch on preview only).

* **Security:** OAuth tokens stored in secure storage; server-side token exchange with short-lived access tokens; encrypt any cached message bodies.

* **Least privilege:** Prefer label/subject filtering at the provider (e.g., Gmail “category:travel OR label:travel”); never send full mailbox to our servers.

* **Parsing pipeline:**

  * Stage 1: header/sender heuristics \+ keyword model → category \+ confidence.

  * Stage 2: template/ML extraction per category (regex \+ layout models).

  * Stage 3: normalization \+ geo-resolution \+ currency normalization.

  * Stage 4: dedupeKey compute → upsert SavedItem.

* **Error handling:** backoff on provider rate limits; surface “Paused due to errors — Retry” state.

* **Observability:** `email_connected`, `scan_started`, `message_classified`, `parse_success`, `parse_low_confidence`, `import_created`, `import_updated`, `import_cancelled`, `auto_file_on/off`.

* **Testing:**

  * Unit: vendor template parsers, timezone normalization, dedupe keys.

  * Contract: provider auth/scopes; message fetch limits.

  * E2E: connect → detect → preview → add; auto-file; update/cancel; offline viewing; revoke.

---

# **Story 13 — Settings & Profile (travelers, currency, units, notification prefs, data controls)**

**As a** traveler  
 **I want** a clear place to manage my profile, traveler details, preferences, and data controls  
 **So that** searches/prefills are smarter, pricing/units look right, notifications are useful, and my data is handled safely.

---

## **Scope**

* **Profile basics:** name, avatar, home city/timezone, default language, default currency, units (km/mi; °C/°F; 12/24h).

* **Travelers:** manage party presets (adults/children ages), passport/nationality (optional), special needs (wheelchair access, service animals, allergies) for better filters and suggestions.

* **Search defaults:** preferred transport modes, lodging preferences (property types, min review score), dietary restrictions, accessibility needs — used to **prefill** section searches in the active itinerary.

* **Notifications:** channels (push/email), categories (booking updates, save/sync errors, planner reminders, leave-now ETA nudges), quiet hours, trip-only mode (mute outside active trip dates).

* **Privacy & data controls:** export data, delete account, revoke integrations (Email Scanner, calendars), snapshot sharing defaults (PII/price redaction toggles), photo visibility defaults.

* **Security:** sign-in methods, 2FA, recent sessions/devices, sign out everywhere.

* **Storage:** local cache controls (view size, clear by itinerary), offline bundles management (from Story 10).

* **Compliance:** consent/ToS, cookie/telemetry opt-ins, regional data residency note (informational).

---

## **Detailed Workflow**

1. **Open Settings**  
   * Tabbed sections: Profile ▸ Travelers ▸ Preferences ▸ Notifications ▸ Privacy & Data ▸ Security ▸ Storage.

2. **Profile**  
   * Edit name, avatar, home city/timezone (used for date/time rendering & leave-now logic), language, currency, units.  
   * Changing language/units updates UI immediately; itinerary content re-renders where applicable.

3. **Travelers**  
   * Create **Party Presets** (e.g., “Family of 4”): adults, child ages; pick a default.  
   * Optional documents: nationality/passport country (for visa hints later), special needs tags.  
   * When an itinerary is created, its default travelers and constraints prefill from the default preset.

4. **Preferences**  
   * Transport: preferred modes (flight/train/bus), max stops, earliest/latest depart windows.  
   * Accommodation: property types, min review score, must-have amenities, sustainability/accessibility flags.  
   * Food: dietary restrictions, cuisine likes/dislikes.  
   * Entertainment/Trails: kid-/dog-friendly, max trail difficulty/duration.  
   * These act as **prefill defaults** and chip suggestions on each search surface (overridable per itinerary/search).

5. **Notifications**

   * Enable Push/Email independently; pick categories.  
   * Quiet hours (local to home timezone); “Only during active trip dates” toggle.  
   * Planner reminders: event start, leave-now (ETA \+ buffer), daily agenda at chosen time.

6. **Privacy & Data**  
   * **Export** my data (JSON \+ media links) and **Delete account** (two-step confirm).  
   * Integrations: show connected email/calendar; **Pause** or **Disconnect**.  
   * Snapshot sharing defaults: redact PII/prices/notes by default; photo layer default visibility (owner/collaborators).  
   * Consent toggles for analytics/diagnostics.

7. **Security**  
   * Password & social sign-ins; **2FA** (TOTP/SMS); device/session list with revoke.  
   * Email change verification; recovery codes.

8. **Storage**  
   * Offline bundles list with sizes; **Refresh / Remove**; clear cache by itinerary or global.  
   * Display total storage used and per-section breakdown.

---

## **Data Contracts (client-side; server contracts to finalize)**

{

  "UserProfile": {

    "type": "object",

    "required": \["userId","name","locale","timezone","currency","units"\],

    "properties": {

      "userId": { "type": "string", "format": "uuid" },

      "name": { "type": "string" },

      "avatarUrl": { "type": "string", "format": "uri" },

      "homeCity": { "type": "string" },

      "timezone": { "type": "string" },          // e.g., "America/New\_York"

      "locale": { "type": "string" },            // e.g., "en-US"

      "currency": { "type": "string" },          // e.g., "USD"

      "units": {

        "type": "object",

        "properties": {

          "distance": { "type": "string", "enum": \["km","mi"\] },

          "temperature": { "type": "string", "enum": \["C","F"\] },

          "timeFormat": { "type": "string", "enum": \["12h","24h"\] }

        }

      }

    }

  },

  "TravelerPreset": {

    "type": "object",

    "required": \["id","label","adults"\],

    "properties": {

      "id": { "type": "string", "format": "uuid" },

      "label": { "type": "string" },

      "adults": { "type": "integer", "minimum": 1 },

      "childrenAges": { "type": "array", "items": { "type": "integer", "minimum": 0, "maximum": 17 } },

      "specialNeeds": { "type": "array", "items": { "type": "string" } },

      "nationality": { "type": "string" }

    }

  },

  "SearchDefaults": {

    "type": "object",

    "properties": {

      "transport": {

        "type": "object",

        "properties": { "preferredModes": { "type": "array", "items": { "type": "string", "enum": \["flight","train","bus"\] } },

                        "maxStops": { "type": "integer" },

                        "departWindow": { "type": "object", "properties": { "earliest": { "type": "string","format":"time" }, "latest": { "type": "string","format":"time" } } } }

      },

      "accommodation": {

        "type": "object",

        "properties": { "propertyTypes": { "type": "array", "items": { "type": "string" } },

                        "minReviewScore": { "type": "number", "minimum": 0, "maximum": 10 },

                        "amenities": { "type": "array", "items": { "type": "string" } },

                        "sustainability": { "type": "boolean" },

                        "accessibility": { "type": "array", "items": { "type": "string" } } }

      },

      "food": {

        "type": "object",

        "properties": { "dietary": { "type": "array", "items": { "type": "string" } },

                        "likedCuisines": { "type": "array", "items": { "type": "string" } },

                        "dislikedCuisines": { "type": "array", "items": { "type": "string" } } }

      },

      "trails": {

        "type": "object",

        "properties": { "maxDurationMinutes": { "type": "integer" },

                        "maxDifficulty": { "type": "string", "enum": \["easy","moderate","hard"\] } }

      }

    }

  },

  "NotificationPrefs": {

    "type": "object",

    "properties": {

      "channels": { "type": "object", "properties": { "push": { "type": "boolean" }, "email": { "type": "boolean" } } },

      "categories": { "type": "object", "properties": {

        "bookingUpdates": { "type": "boolean" },

        "saveSyncStatus": { "type": "boolean" },

        "plannerReminders": { "type": "boolean" },

        "leaveNow": { "type": "boolean" }

      }},

      "quietHours": { "type": "object", "properties": { "start": { "type":"string","format":"time" }, "end": { "type":"string","format":"time" } } },

      "tripOnlyMode": { "type": "boolean" }

    }

  },

  "PrivacySettings": {

    "type": "object",

    "properties": {

      "analyticsOptIn": { "type": "boolean" },

      "diagnosticsOptIn": { "type": "boolean" },

      "snapshotDefaults": { "type": "object", "properties": {

        "redactPII": { "type": "boolean" },

        "redactPrices": { "type": "boolean" },

        "redactNotes": { "type": "boolean" },

        "photoVisibility": { "type": "string", "enum": \["owner","collaborators","public-export"\] }

      }},

      "integrations": { "type": "object", "properties": { "email": { "type": "string", "enum": \["connected","paused","disconnected"\] } } }

    }

  }

}

**Mapping to Itinerary creation & searches**

* When creating a new itinerary, default `travelers`/`dates` presets and preference chips are pulled from `TravelerPreset` \+ `SearchDefaults`.

* Each search surface reads `SearchDefaults` to prefill (overridable per itinerary/search).

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Immediate localization & units**

Given I change currency to EUR and distance to km

Then prices render in EUR and distance chips show km across the app without restarting.

**AC2 — Traveler presets feed itinerary**

Given I set a default preset "Family of 4"

When I create a new itinerary

Then the itinerary form is prefilled with 2 adults \+ 2 children and this becomes its default travelers.

**AC3 — Preferences prefill searches**

Given I prefer trains and min hotel review 8.0 with vegan meals

When I open Transport and Accommodation and Gastronomy searches

Then trains are preselected, hotels below 8.0 are filtered out by default, and vegan appears as an active dietary chip (all overridable).

**AC4 — Notification categories & quiet hours**

Given I enable leave-now and planner reminders and set quiet hours 22:00–07:00

Then I receive those notifications outside quiet hours only,

And during active trip dates if Trip-only mode is on.

**AC5 — Privacy & integrations control**

Given my email is connected

When I pause or disconnect it from Settings

Then scanning stops immediately and previously imported items remain but no new scans occur.

Given I toggle snapshot redaction defaults to hide PII and prices

Then future shared snapshots exclude those fields by default.

**AC6 — Security hygiene**

Given I enable 2FA and revoke a stale device session

Then new sign-ins prompt for 2FA,

And the revoked session can no longer access my itineraries.

**AC7 — Storage management**

Given I have multiple offline bundles

When I open Storage and remove one

Then device storage decreases accordingly and the itinerary loses its offline badge.

**AC8 — Data export & deletion**

Given I request a data export

Then I receive a downloadable archive of my profile, itineraries, saved items, and settings.

Given I confirm account deletion

Then my account and associated data are scheduled for deletion and I’m signed out on all devices.

---

## **UX & Interaction Details**

* **Sticky save bar** on forms with “Save” and “Reset”.

* **Live preview** for language/units.

* **Chips & toggles** mirror search UI for familiarity (dietary, amenities, modes).

* **Explainers** under sensitive settings (what data is exported; what redaction removes).

* **Accessibility:** labeled controls, large touch targets, focus order consistent with tabs; screen-reader summaries for each section.

* **i18n:** fully localized labels; RTL support where applicable.

---

## **Engineering Notes (Definition of Done)**

* **Single source of truth:** settings fetched once and cached; reactive store updates UI across surfaces.

* **Prefill pipeline:** search modules subscribe to settings to compute default queries; itinerary creation seeds from `TravelerPreset`.

* **Security:** enforce server-side checks on settings writes; encrypt sensitive fields (emails, 2FA secrets); rotate tokens on email disconnect.

* **Notifications:** per-channel tokens stored securely; enforce quiet-hours and trip-only gating before enqueue.

* **Storage APIs:** expose offline bundle inventory with sizes; safe deletion & space reclamation.

* **Compliance:** implement GDPR-like export/delete flows; asynchronous deletion with grace period and audit entry.

* **Telemetry:** `settings_opened`, `profile_updated`, `preset_saved`, `prefs_applied`, `notifs_changed`, `privacy_changed`, `bundle_deleted`.

* **Testing:**

  * Unit: prefill mapping from settings → search queries.

  * Contract: settings schema migrations (new fields defaulting).

  * E2E: change units → verify everywhere; quiet hours respected; export file integrity; delete flow.

---

# **Story 14 — Account & Billing (tiers, quotas, payments, invoices)**

**As a** user  
 **I want** to manage a paid plan for the app  
 **So that** I can unlock premium limits/features, view usage, and handle payments and invoices confidently. But for the beginning, all users will be pro users by default. No restrictions should apply.

---

## **Scope**

* **Plans & perks**

  * **Free:** basic search, saving, and itinerary map; limited offline bundle size; limited email-scanner parses/month; no collaboration.

  * **Pro (monthly / annual):** unlimited itineraries; larger offline bundles; collaboration (Viewer/Editor); auto-day builder; email-scanner higher quota; priority sync; snapshot export themes; upcoming features early access.

* **Quotas**

  * Counters for: saved items/month, email parses/month, offline bundle size per itinerary, snapshot exports/month, planner reminder notifications/day.

  * Soft-limit warnings (80%) and hard-limit enforcement with clear CTAs (“Upgrade”, “Buy more snapshots”).

* **Billing**

  * Card on file (Stripe-like), Apple/Google IAP support on mobile, invoicing for Team.

  * Currency rendered from user profile; tax/VAT collection with address.

  * Proration on mid-cycle plan changes; immediate effect on quotas.

* **Invoices & receipts**

  * Downloadable PDFs; itemized (plan, seats, taxes, adjustments); past payments list; retry failed payments.

* **Self-serve admin**

  * Upgrade/Downgrade/Cancel; change billing cycle; add/remove payment methods; view next charge date/amount.

* **Entitlements enforcement**

  * Feature gates at API and client; graceful degradation (read-only where appropriate).

* **Compliance & safety**

  * SCA/3DS flows; PCI-DSS handled by processor; refund window; data deletion on cancel after grace period; email confirmations.

---

## **Detailed Workflow**

1. **Plans page**  
   * Shows Free/Pro with comparison table and “Choose plan” CTAs.  
   * Annual toggle with savings; promo code entry (optional).

2. **Purchase (Pro)**  
   * If web: secure checkout (SCA ready). If mobile: native IAP flow.  
   * On success: create subscription, set `entitlements`, start trial if applicable, show success screen with what unlocked.  
       
3. **Usage & limits**  
   * **Account ▸ Usage** shows counters, reset date, per-itinerary storage usage, top consumers.

   * Soft-limit banners in-context (e.g., when generating nth snapshot).

4. **Plan changes**

   * Upgrade: proration credit applied instantly; new entitlements live immediately.

   * Downgrade: scheduled for next renewal; show what will change (e.g., collaboration will become read-only).

   * Cancel: end-of-term by default; optional immediate cancel with refund per policy.

5. **Invoices**

   * **Billing ▸ Invoices**: list with status (paid, pending, failed), download PDF, resend receipt email.

   * Failed payment dunning: retry schedule \+ in-app banner \+ email.

6. **Entitlement checks**

   * On gated actions (e.g., creating 3rd offline bundle on Free), show modal with plan comparison \+ upgrade button.

   * If subscription lapses, features degrade smoothly: collaboration → view-only, offline bundles stay viewable but cannot refresh, scanner caps resume.

---

## **Data Contracts (client-side; server contracts to finalize)**

{

  "Plan": {

    "type": "object",

    "required": \["id","name","cycle","price","currency","features"\],

    "properties": {

      "id": { "type": "string", "enum": \["free","pro\_monthly","pro\_annual","team\_monthly","team\_annual"\] },

      "name": { "type": "string" },

      "cycle": { "type": "string", "enum": \["monthly","annual","none"\] },

      "price": { "type": "number" },

      "currency": { "type": "string" },

      "features": { "type": "array", "items": { "type": "string" } }

    }

  },

  "Subscription": {

    "type": "object",

    "required": \["userId","planId","status","currentPeriodEnd","entitlements"\],

    "properties": {

      "userId": { "type": "string","format":"uuid" },

      "orgId": { "type": "string","format":"uuid" },

      "planId": { "type": "string" },

      "status": { "type": "string", "enum": \["trialing","active","past\_due","canceled","incomplete"\] },

      "currentPeriodStart": { "type": "string","format":"date-time" },

      "currentPeriodEnd": { "type": "string","format":"date-time" },

      "cancelAtPeriodEnd": { "type": "boolean" },

      "entitlements": {

        "type": "object",

        "properties": {

          "maxItineraries": { "type": "integer" },

          "offlineBundleMB": { "type": "integer" },

          "emailParsesPerMonth": { "type": "integer" },

          "snapshotsPerMonth": { "type": "integer" },

          "collaboration": { "type": "string", "enum": \["none","viewer","editor"\] },

          "prioritySync": { "type": "boolean" },

          "autoDayBuilder": { "type": "boolean" }

        }

      }

    }

  },

  "UsageCounters": {

    "type": "object",

    "required": \["periodStart","periodEnd","counters"\],

    "properties": {

      "periodStart": { "type": "string","format":"date-time" },

      "periodEnd": { "type": "string","format":"date-time" },

      "counters": {

        "type": "object",

        "properties": {

          "savedItems": { "type": "integer" },

          "emailParses": { "type": "integer" },

          "offlineBundleMBUsed": { "type": "integer" },

          "snapshotsCreated": { "type": "integer" },

          "remindersSent": { "type": "integer" }

        }

      }

    }

  },

  "Invoice": {

    "type": "object",

    "required": \["id","status","amountDue","currency","createdAt","lines"\],

    "properties": {

      "id": { "type": "string" },

      "status": { "type": "string", "enum": \["paid","open","uncollectible","void"\] },

      "amountDue": { "type": "number" },

      "amountPaid": { "type": "number" },

      "currency": { "type": "string" },

      "createdAt": { "type": "string","format":"date-time" },

      "pdfUrl": { "type": "string","format":"uri" },

      "lines": { "type": "array", "items": { "type": "object", "properties": {

        "description": { "type": "string" },

        "quantity": { "type": "number" },

        "unitAmount": { "type": "number" },

        "currency": { "type": "string" },

        "taxAmount": { "type": "number" }

      } } }

    }

  }

}

**Events & Webhooks (server)**

* `subscription_created/updated/canceled`, `payment_succeeded/failed`, `invoice_finalized/paid/voided`, `entitlements_updated`, `usage_reset`.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Upgrade to Pro**

Given I am on Free

When I purchase Pro Monthly

Then my subscription becomes active immediately

And Pro entitlements (e.g., collaboration, higher offline limit) unlock without reinstalling.

**AC2 — Quota enforcement with graceful UX**

Given I am on Free with 100% of my email-parse quota used

When I trigger a new scan

Then I see a limit modal explaining remaining time until reset and offering Upgrade,

And the scan is not performed.

**AC3 — Proration**

Given I am on Pro Monthly

When I switch to Pro Annual mid-cycle

Then proration is applied and my next charge reflects the credit,

And my renewal date moves to one year from the change.

**AC4 — Cancellation & downgrade**

Given I am on Pro

When I schedule a downgrade to Free

Then the UI shows "Downgrades at \<date\>" and what features will become read-only,

And on that date the entitlements are reduced but my data remains.

**AC5 — Invoices & receipts**

Given I open Billing ▸ Invoices

Then I see a list of invoices with status and totals

And I can download the PDF and resend the receipt for any paid invoice.

**AC6 — Failed payment dunning**

Given a renewal payment fails

Then I receive email and in-app banners with a retry schedule

And I can update my payment method and trigger an immediate retry.

**AC7 — Team seats**

Given my org has 5 seats and 4 members

When I invite a new Editor

Then a seat is assigned automatically

And if there are no seats left, I'm prompted to purchase another seat first.

**AC8 — Entitlement gating**

Given my subscription lapses

When I try to use the auto-day builder

Then I see a paywall explaining the feature and plans,

And I can continue browsing my itinerary in read-only mode.

---

## **UX & Interaction Details**

* **Plan picker:** comparison table; monthly/annual toggle; VAT/tax hint by country.

* **Usage screen:** progress rings for each quota; “resets on ”.

* **Entitlement toasts:** lightweight toasts after purchase and plan changes.

* **Paywall modal:** small, specific (“You’ve hit the snapshot limit”) with in-context benefits and “Upgrade” CTA.

* **Invoices list:** simple table; each invoice page shows itemized lines and a **Download PDF** button.

* **Error states:** friendly copy for SCA failures, card declines, IAP errors with “Try again” and support link.

* **Accessibility & i18n:** screen-reader labels; localize currency/number/date formats.

---

## **Engineering Notes (Definition of Done)**

* **Entitlements service:** source of truth; cached on client; stale-while-revalidate on app open and post-webhook events.

* **Multi-channel payments:** web checkout session \+ mobile IAP; reconcile IAP receipts with server to mint entitlements.

* **Quotas:** counters in a monthly window keyed by `{userId|orgId, period}`; atomic increments; 80% soft-warning events.

* **Security & compliance:** processor handles card data; we store last4/brand/exp only; 3DS support; tax engine integration; rigorous audit of plan/seat changes.

* **Proration & schedule:** rely on processor proration; keep local shadow records for deterministic UI; idempotent plan change endpoints.

* **Invoices:** webhook-ingested invoice objects with signed PDF URLs (short-lived); email via transactional provider.

* **Feature flags:** client/server gates guard every Pro/Team feature; graceful downgrades (no data loss).

* **Telemetry:** `upgrade_clicked`, `checkout_started/succeeded/failed`, `quota_soft/hard_limit`, `plan_changed`, `invoice_downloaded`, `payment_method_updated`.

* **Testing:**

  * Unit: entitlement checks, quota math, proration math.

  * Contract: webhooks (subscription/invoice/payment).

  * E2E: upgrade flow (web & IAP), failed payment → dunning → recovery, seat exhaustion handling, downgrade to read-only.

---

# **Story 15 — Admin Console (support tooling: user lookup, refunds, plan overrides, abuse controls)**

**As a** support/admin agent  
 **I want** a secure web console to look up users and itineraries, resolve billing issues, override entitlements, and mitigate abuse  
 **So that** I can help customers quickly without risking data leakage or breaking production integrity.

---

## **Scope**

* **Access & roles**  
  * Admin roles: **Support**, **Billing Admin**, **Trust & Safety**, **Super Admin** (all permissions), **Read-Only**.  
  * SSO-only access (no password logins), device posture checks, IP allowlists for sensitive actions.  
  * Every action is **audited** with actor, target, diff, and reason code.

* **Core capabilities**  
  * **User lookup**  
    * Search by email, userId, invoiceId, itineraryId.  
    * View profile (name, locale, timezone), subscription status, entitlements, usage counters, recent sessions/devices.  
    * Safe view of itineraries: titles \+ high-level counts only; open one to see metadata and section counts (not raw PII unless elevated scope).

  * **Itinerary tools**  
    * Force transfer owner, add/remove collaborator, reset offline bundles, unlock stuck sync, restore deleted items (within retention).

  * **Billing**  
    * View invoices/charges, update payment method (via secure link to processor), apply credit/coupon, trigger proration, change plan on next renewal or immediately.  
    * Refunds/voids (partial/full) with mandatory reason and evidence link.

  * **Entitlements & quotas**  
    * Temporary overrides (duration-limited), permanent plan feature flags, manual counter reset.

  * **Email scanner & integrations**  
    * View connector status, revoke/rehydrate tokens, inspect last sync errors (summaries only).

  * **Trust & Safety**  
    * Abuse review queue (rate-limit hits, scraping signals, spam invites), user silencing/muting, device/IP blocks, snapshot link takedowns/revocations.

  * **Operational monitors**  
    * Live health (API error rates, queue backlog), search latency, cache hit rate; link-outs to observability stack.

* **Safety baselines**  
  * **Justification prompts** on sensitive actions.  
  * **Two-person approval** for destructive org-wide actions (e.g., data export for a user).  
  * **Data minimization**: PII redacted unless explicitly elevated; ticket hyperlinks for context instead of copy-pasting PII.  
  * **Rate-limited** admin endpoints; idempotent mutation APIs; strong CSRF protection.

---

## **Detailed Workflow**

1. **Sign-in & role gating**  
* Admin visits `/admin` → SSO (IdP-mapped groups → console roles).  
* Landing page shows global health tiles and a universal search bar.

2. **User case handling**  
* Type “samantha@example.com” → **User Overview**:  
  * Profile capsule (name, userId, status), Subscription box (plan, period end, delinquency), Usage (month-to-date counters), Integrations (email scanner state).  
  * **Actions**: send passwordless login link, reset 2FA, revoke sessions, set language/units for troubleshooting.

3. **Billing remediation**

* Open **Billing** tab:  
  * Invoices table (status, totals, failure reason).  
  * Action drawer: “Refund/Partial Refund”, “Void”, “Re-issue invoice”, “Update payment method” (generates secure customer-portal link), “Apply credit/coupon”, “Change plan (now/at EOT)”.  
  * Every change requires **reason** and **ticket URL**; emits `billing_action` audit events.

4. **Entitlement override**

* **Entitlements** tab:  
  * Toggle flags (e.g., `autoDayBuilder`, `collaboration=editor`) with **expiry** (e.g., 14 days) and reason.  
  * Bump quotas (snapshots/month, email parses) with **until** timestamp.  
  * Overrides show as a stack merged over base plan; display effective values.

5. **Itinerary operations**  
* Search itinerary → **Itinerary Panel**:

  * Metadata (title, date range, owner, members, counts per section, offline bundle versions).

  * **Actions**: transfer ownership, add/remove member, **rebuild search index**, clear failed sync jobs, roll back to previous offline bundle, revoke public snapshot links.

6. **Trust & Safety**

* **Abuse Queue**:

  * Rows: signal type (API scraping, mass invites, suspicious link shares), severity, user, evidence summary.

  * Actions: rate-limit user/org, block device fingerprint, suspend scanner integration, suspend account (soft/hard), purge public shares.

  * Takedowns require second approver; links are revoked immediately.

7. **Operational monitors**

* Read-only charts (error rate, latency, queue backlog) with last 1h/24h toggles.

* Drill-down opens external dashboards (Grafana/Datadog) in a new tab.

---

## **Data Contracts (admin APIs; JSON over HTTPS)**

{

  "AdminSession": {

    "type": "object",

    "required": \["adminId","role","issuedAt","expiresAt"\],

    "properties": {

      "adminId": { "type": "string","format":"uuid" },

      "role": { "type": "string","enum":\["support","billing\_admin","trust\_safety","super\_admin","read\_only"\] },

      "issuedAt": { "type": "string","format":"date-time" },

      "expiresAt": { "type": "string","format":"date-time" }

    }

  },

  "UserOverview": {

    "type": "object",

    "required": \["userId","email","status","subscription","usage","integrations"\],

    "properties": {

      "userId": { "type": "string","format":"uuid" },

      "email": { "type": "string","format":"email" },

      "status": { "type": "string","enum":\["active","suspended","deleted"\] },

      "profile": { "type": "object" },

      "subscription": { "$ref": "\#/definitions/SubscriptionLite" },

      "usage": { "$ref": "\#/definitions/UsageLite" },

      "integrations": { "type": "object","properties": { "emailScanner": { "type": "string","enum":\["connected","paused","disconnected","error"\] } } }

    }

  },

  "definitions": {

    "SubscriptionLite": {

      "type": "object",

      "properties": {

        "planId": { "type": "string" },

        "status": { "type": "string" },

        "currentPeriodEnd": { "type": "string","format":"date-time" },

        "delinquent": { "type": "boolean" }

      }

    },

    "UsageLite": {

      "type": "object",

      "properties": {

        "savedItems": { "type": "integer" },

        "emailParses": { "type": "integer" },

        "offlineBundleMBUsed": { "type": "integer" },

        "snapshotsCreated": { "type": "integer" }

      }

    }

  },

  "AdminAction": {

    "type": "object",

    "required": \["action","actorId","target","reason","createdAt"\],

    "properties": {

      "action": { "type": "string" },

      "actorId": { "type": "string","format":"uuid" },

      "target": { "type": "object" },

      "parameters": { "type": "object" },

      "reason": { "type": "string" },

      "ticketUrl": { "type": "string","format":"uri" },

      "createdAt": { "type": "string","format":"date-time" },

      "approval": { "type": "object","properties": { "required": { "type":"boolean" }, "approvedBy": { "type":"string" }, "approvedAt": { "type":"string","format":"date-time" } } }

    }

  },

  "OverrideGrant": {

    "type": "object",

    "required": \["userId","key","value","expiresAt","reason"\],

    "properties": {

      "userId": { "type": "string","format":"uuid" },

      "key": { "type": "string" },                 // e.g., "entitlements.snapshotsPerMonth"

      "value": {},

      "expiresAt": { "type": "string","format":"date-time" },

      "reason": { "type": "string" }

    }

  }

}

**Idempotency rules**

* All mutating endpoints accept `Idempotency-Key` header; repeating the same key within 24h returns the original result.

* Refunds and plan changes log a stable `AdminAction` id based on `{userId|invoiceId, action, amount, reason}`.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Role-gated access**

Given I am a Support admin

When I open the Admin Console

Then I can search users and itineraries and perform support actions

But I cannot issue refunds or takedowns.

**AC2 — Billing actions with audit**

Given I have Billing Admin role

When I issue a partial refund on invoice INV-123 by $25

Then the refund succeeds,

And an audit record is created with actor, amount, reason, and a link to the ticket.

**AC3 — Entitlement overrides with expiry**

Given a user hit the snapshots limit

When I grant \+3 snapshots until next Monday with reason "press trip"

Then the user's effective quota increases immediately,

And it automatically reverts after the expiry.

**AC4 — Itinerary ownership transfer**

Given a team requests owner transfer

When I set Owner from A to B with a justification

Then B becomes the owner and an activity event is recorded on the itinerary.

**AC5 — Abuse takedown (two-person rule)**

Given a public snapshot violates policy

When I submit a takedown with reason and select a second approver

Then the link is revoked upon approval,

And both the request and approval are logged immutably.

**AC6 — PII minimization**

Given I am Read-Only

When I open an itinerary

Then I only see metadata and counts (no emails, booking refs, QR codes) unless elevated temporarily with a reason.

**AC7 — Idempotent mutations**

Given I retry a "Change plan to Pro Monthly" call due to a network hiccup

Then the user ends up with a single, correct subscription change,

And the second call returns the same mutation id and result.

**AC8 — Session security**

Given my SSO session expires or my device posture fails

Then the console logs me out and blocks sensitive actions until re-authenticated.

---

## **UX & Interaction Details**

* **Global search bar** with typeahead (user/email/invoice/itinerary).

* **Tabbed user view:** Overview ▸ Billing ▸ Entitlements ▸ Itineraries ▸ Security ▸ Logs.

* **Action drawers** with inline validation, preview (e.g., refund breakdown), and justification field.

* **Sensitive actions** show a confirmation modal with reason input and optional second approver selector.

* **Read-only redactions**: masked PII with “Reveal for 15 minutes” (requires elevated role \+ reason).

* **Log viewer**: filter by action type, actor, target; export CSV.

* **Empty/error states**: human-centered copy; links to runbooks.

---

## **Engineering Notes (Definition of Done)**

* **Architecture**  
  * Separate **admin API** service with its own authorization boundary.  
  * Policy engine (OPA-style) that evaluates `{actor.role, action, resource}`; rules centrally managed.

* **Security**  
  * SSO via SAML/OIDC; conditional access (device posture, geo/IP allowlist).  
  * CSRF protection, per-action rate limits, structured input validation, output escaping.  
  * All downloads (logs/CSVs) are signed, short-lived URLs.

* **Audit**  
  * Immutable append-only store for `AdminAction` with cryptographic chaining (hash of previous entry) for tamper-evidence.  
  * Logs replicate to a separate region; searchable index with retention policy.

* **Observability**  
  * Trace admin actions end-to-end; alerts on burst patterns (potential insider abuse).

* **Idempotency**  
  * Redis-backed idempotency keys; dedupe window configurable; response bodies cached per key.

* **Integrations**  
  * Billing through processor API with webhooks; refunds/voids reconcile to source of truth.  
  * Read-only views fetch summaries; “Reveal” path requests signed, time-limited PII tokens.

* **Testing**  
  * Unit: policy rules, idempotency, input validation.  
  * Contract: billing webhooks, refund/void actions.  
  * E2E: role restrictions, two-person takedown, owner transfer, override expiry.

* **Runbooks**  
  * Pager playbooks: billing outage, search degradation, stuck sync queue, snapshot abuse wave.

---

**Story 16 — Search Platform (providers, normalization, caching, ranking, resilience)**

**As a** platform engineer  
 **I want** a unified search layer that talks to multiple content providers (transport, accommodation, entertainment, gastronomy, events, trails)  
 **So that** features can query consistently, results look and behave the same, and we stay fast, reliable, and cost-efficient under load.

---

## **Scope**

* **Provider abstraction:** Stable interfaces (`Search`, `LookupById`, optional `MinPriceCalendar`, `Suggest`), per vertical.

* **Normalization:** Canonical schemas per vertical; strict units/timezones/IDs; all providers mapped into these before ranking.

* **Aggregation & ranking:** Merge results from N providers, dedupe by semantic keys, rank with vertical-specific scoring (price, duration, quality, distance, popularity, policy friendliness).

* **Caching & TTLs:** Layered cache (edge ➜ service ➜ client hints) with per-provider TTLs and negative-cache for “no results”.

* **Resilience:** Timeouts, retries with jitter, circuit breakers, bulkheads, graceful degradation (partial results \+ provenance).

* **Cost/QoS controls:** Per-provider QPS and monthly budget; adaptive throttling; query coalescing; collapse duplicate concurrent requests.

* **Observability:** Traces across providers, success/error taxonomy, cache metrics, ranking diagnostics, per-vertical SLIs/SLOs.

* **Privacy & compliance:** PII never sent to providers unless necessary; destination country data-flow flags; provider T\&Cs compliance stored per integration.

* **Feature gates:** Canary by provider/version; kill-switch toggles.

* **Security:** Key management, request signing if needed, input sanitization, response validation.

---

## **Architecture Overview**

* **Search Orchestrator (SO):** Receives normalized `SearchQuery` from feature modules; fans out to enabled `ProviderAdapters`, applies timeouts, collects, normalizes, dedupes, ranks, paginates, returns `SearchResponse`.

* **ProviderAdapters:** Thin connectors per provider/vertical; own retry/timeouts; transform raw → canonical.

* **Cache:**

  * **Edge (CDN) cache** for GET-able queries (hashed normalized query).

  * **Service cache** (Redis) for normalized results and min-price calendar tiles.

  * **Client hints**: “cacheable until”/“stale-while-revalidate” for UI.

* **Resilience:** Circuit breaker per provider, adaptive concurrency, fallback providers when primaries fail/timeout.

* **Ranking Pipeline:** Vertical scoring function \+ blending; explainability payload for QA/AB testing.

* **AB & Config:** Central config (Provider enablement, keys, quotas, geography allowlist) hot-reloadable.

---

## **Data Contracts (Service level)**

{

  "SearchQuery": {

    "type": "object",

    "required": \["vertical","context","params"\],

    "properties": {

      "vertical": { "type": "string", "enum": \["transport","accommodation","entertainment","gastronomy","events","trails"\] },

      "context": {

        "type": "object",

        "required": \["itineraryId","locale","currency","timezone"\],

        "properties": {

          "itineraryId": { "type": "string","format":"uuid" },

          "locale": { "type": "string" },

          "currency": { "type": "string" },

          "timezone": { "type": "string" },

          "userPrefs": { "type": "object" }   // subset of Settings defaults (Story 13\)

        }

      },

      "params": { "type": "object" },          // vertical-specific, already validated

      "page": { "type": "object", "properties": { "cursor": { "type": "string" }, "size": { "type": "integer","minimum": 10,"maximum": 100 } } },

      "flags": { "type": "object", "properties": { "strict": { "type": "boolean" }, "experimental": { "type": "array","items": { "type": "string" } } } }

    }

  },

  "SearchResponse": {

    "type": "object",

    "required": \["vertical","items","page","meta"\],

    "properties": {

      "vertical": { "type": "string" },

      "items": { "type": "array", "items": { "type": "object" } },   // canonical per-vertical item

      "page": { "type": "object", "properties": { "cursor": { "type": "string" }, "hasMore": { "type": "boolean" } } },

      "meta": {

        "type": "object",

        "properties": {

          "providers": { "type": "array", "items": { "type": "object", "properties": {

            "name": { "type": "string" },

            "tookMs": { "type": "integer" },

            "status": { "type": "string", "enum": \["ok","timeout","error","partial"\] },

            "cache": { "type": "string", "enum": \["edge","service","miss"\] }

          } } },

          "ttlSeconds": { "type": "integer" },

          "ranking": { "type": "object", "properties": { "strategy": { "type": "string" }, "explain": { "type": "array","items": { "type":"string" } } } }

        }

      }

    }

  },

  "CachePolicy": {

    "type": "object",

    "required": \["ttl","staleWhileRevalidate","key"\],

    "properties": {

      "ttl": { "type": "integer" },

      "staleWhileRevalidate": { "type": "integer" },

      "key": { "type": "string" }   // hash(normalized(SearchQuery))

    }

  },

  "ProviderResultEnvelope": {

    "type": "object",

    "properties": {

      "provider": { "type": "string" },

      "status": { "type": "string", "enum": \["ok","timeout","error","partial"\] },

      "tookMs": { "type": "integer" },

      "items": { "type": "array", "items": { "type": "object" } },  // canonical already

      "raw": { "type": "object" },                                   // kept for logging under PII rules

      "quotaConsumed": { "type": "integer" }

    }

  }

}

### **Canonical item keys (dedupe/merge)**

* **Transport:** `(mode, originCode, destCode, departAt, operator|flightNo)`

* **Accommodation:** `(propertyId|name+geo, checkIn, checkOut, boardPlan)`

* **Entertainment/Gastronomy:** `(name+geo, website|placeId)`

* **Events:** `(title, venueId|name+geo, start)`

* **Trails:** `(name+geo, website)`

---

## **Ranking (vertical-specific)**

* **Transport:** price (normalized to user currency) ↑, duration ↓, stops ↓, departure window match, baggage inclusion, reliability signals.

* **Accommodation:** total price ↑ (value score combines review score & price), distance to center/POI ↓, free cancellation, pay-at-property, sustainability/accessibility boosts.

* **Entertainment/Gastronomy:** popularity/review score, distance, “open now” alignment, diversity (anti-dupe across very similar venues).

* **Events:** within date window, popularity, price (if any), time-of-day preference, distance.

* **Trails:** duration vs. user max, difficulty vs. user max, popularity, distance to base.

All ranking functions emit an **explain vector** per item (for QA and AB), stored for 24h.

---

## **Resilience & QoS**

* **Timeout budget:** SO total budget (e.g., 1800ms); per-provider budget split with tail-cutting (cancel slowest when enough results).

* **Retries:** `RetryPolicy{max=1, backoff=jittered}` for idempotent GETs; no retry on 4xx.

* **Circuit breaker:** Open after consecutive failures/timeouts; half-open probes; backoff resets.

* **Bulkheads:** Per-provider connection pools and concurrency caps.

* **Graceful degradation:** If all providers for a vertical fail, return cached last-good (if ≤ max staleness) with banner; else empty with helpful error.

* **Adaptive throttling:** Reduce fan-out on high latency or provider 429s; prioritize cheapest winners (historical hit rate × latency × cost).

* **Geo compliance:** Disable certain providers by country; SO respects allowlists/denylists from config.

---

## **Cost & Caching Strategy**

* **Keying:** `hash(vertical | normalized params | locale | currency | userPrefsSignature | page.size)`; `cursor` for pagination not in base key.

* **Edge cache:** 30–120s for popular queries (e.g., “Paris museums”), SWR 300s.

* **Service cache:** vertical-specific TTLs (transport fast-expiring; trails longer); min-price calendars cached per (origin, dest, month, mode).

* **Negative caching:** short TTL (e.g., 30s) for empty result sets to protect providers.

* **Coalescing:** requests with the same cache key in flight join the same promise (single provider hit).

---

## **Provider Integration Contract (Adapter)**

{

  "ProviderAdapterSpec": {

    "type": "object",

    "required": \["name","vertical","capabilities","limits","regions"\],

    "properties": {

      "name": { "type": "string" },

      "vertical": { "type": "string" },

      "capabilities": { "type": "array", "items": { "type": "string", "enum": \["search","lookup","minPriceCalendar","suggest"\] } },

      "limits": { "type": "object", "properties": {

        "qps": { "type": "number" }, "burst": { "type": "integer" }, "timeoutMs": { "type": "integer" }

      }},

      "regions": { "type": "array", "items": { "type": "string" } },   // ISO country codes allowlist

      "costWeight": { "type": "number" }                                // used in adaptive throttling

    }

  }

}

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Normalization parity**

Given two providers return the same hotel with different schemas

When the Search Orchestrator merges results

Then a single canonical Accommodation item appears with unified fields (price total, policies, geo) and a provenance list.

**AC2 — Dedupe by semantic keys**

Given duplicate transport tickets from two providers

When results are returned

Then they are merged into one card with a vendors list rather than shown twice.

**AC3 — Ranking explainability**

Given I request results with debug=ranking

Then the response meta includes an ordered ranking strategy and per-item explain vectors.

**AC4 — Cache effectiveness**

Given I repeat the same Entertainment query within TTL

Then response time improves and meta.providers\[\*\].cache reflects "service" or "edge".

**AC5 — Provider failover**

Given the primary accommodation provider times out consecutively

When I search again

Then the circuit opens and another provider is used,

And the response meta marks the primary as "timeout" while still returning results.

**AC6 — Budget & quotas**

Given provider X hits its daily request budget

When further queries arrive

Then the orchestrator throttles X and shifts traffic to other providers, logging "budget\_exhausted" events.

**AC7 — Graceful degradation**

Given all transport providers fail

When I search

Then the orchestrator serves the last good cached response if it's fresh enough,

Otherwise returns an empty result with a retryable error and no app crash.

**AC8 — Pagination & cursor integrity**

Given I paginate accommodation results

When I request with page.cursor

Then I receive the next slice deterministically without re-ranking earlier pages.

**AC9 — Security & PII**

Given a query includes traveler names or emails

Then adapters redact PII from outbound requests unless strictly required, and responses are validated before use.

**AC10 — Observability**

Given I view service metrics

Then I can see per-provider latency, error rate, cache hit ratio, and ranker contribution,

With traces that correlate a user query across all provider calls.

---

## **Engineering Notes (Definition of Done)**

* **Contracts & validators:** JSON Schemas for each vertical’s canonical item \+ Ajv-like validation; strict reject/repair strategy.

* **Time & currency:** All providers normalized to ISO datetimes (with timezone) and prices normalized via FX service; surface both raw and normalized.

* **Provenance:** Each item carries `providers[]` with source name and raw IDs for support/debug.

* **Feature compatibility:** Respect per-vertical features (e.g., `MinPriceCalendar` for Transport).

* **AB & kill switches:** Dynamic config service; canary new adapters to 5% traffic; instant kill on incident.

* **Security:** Secrets in KMS; outbound proxies; allowlisted domains; schema-level response sanitation.

* **Backpressure:** Token buckets for QPS/burst per provider; shed load with 503 \+ `Retry-After` internally when needed.

* **Testing:**

  * Unit: adapter mappers, dedupe keys, ranker math.

  * Contract: provider fixtures and golden snapshots of canonical items.

  * Chaos: inject timeouts/errors to validate breaker & fallback.

  * Perf: p95/p99 SLIs per vertical; load with mixed cache hit/miss.

* **Rollout:** Shadow mode (log-only) for new adapters; then mirror; then partial prod; then full.

* **Docs & playbooks:** Integration guide template; runbooks for “provider down”, “cache stampede”, “ranker drift”.

---

# **Story 17 — Mobile App Shell (Flutter) scaffolding & offline/local DB**

**As a** user  
 **I want** a fast, stable mobile app that works offline and syncs later  
 **So that** I can plan and use my itinerary anywhere, with every saved item always bound to the **Active Itinerary**.

---

## **Scope**

* **Framework & targets:** Flutter (iOS/Android). Min iOS 15 / Android 8.0.

* **App shell:** Route graph, theming (light/dark), localization, state container, error boundary screens.

* **Local-first data:** Encrypted local DB with migration pipeline; optimistic writes; background sync.

* **Itinerary binding rule:** All create/save actions require an **Active Itinerary**; every record includes `itineraryId` and `section`.

* **Offline behavior:** Full read of saved items, map placeholder tiles, planner timelines; save queues & retry with backoff.

* **Sync engine:** Pull (delta by `updatedAt`), Push (batched ops), conflict resolution (idempotent \+ field-wise merge).

* **Observability:** Crash/analytics hooks, network & sync logs (PII-safe).

---

## **Detailed Workflow**

1. **App bootstrap**

* Splash → secure store init → local DB open/migrate → session/token check → **Home/Itineraries**.

* If no itineraries, onboarding CTA to create one (sets Active).

2. **Navigation & layout**

* Bottom nav: **Itinerary**, **Search**, **Map**, **Planner**, **Settings**.  
* Each surface reads **Active Itinerary** from a central store which by default should be the latest itinerary that was opened/modified (switcher in app bar).

3. **Local DB & repositories**  
* Entities: `Itinerary`, `SavedItem{section}`, `DayPlan`, `Media`, `SyncOp`, `UserSettings`.  
* Repository pattern with offline-first methods: `get`, `list`, `upsert`, `queueOp`.

4. **Optimistic create/save (local-first)**

* On **Save**:

  * Validate Active Itinerary exists.

  * Build record with `itineraryId`, `section`, and `dedupeKey`.

  * Insert locally, show immediately; enqueue `SyncOp{type:"UPSERT", payloadHash}`.

  * If duplicate by `dedupeKey`, show “Already saved”.

5. **Sync loop**  
* **Pull** at app open, itinerary switch, and periodic timer; pass `since=lastSyncAt`.  
* **Push** processes `SyncOp` queue: retry policy with jitter; marks success/failure; surfaces non-blocking errors.  
* **Conflicts:** server returns `409` with server doc; client merges per field (timestamps/ETags). If irreconcilable → user banner with “Use mine / Keep server”.

6. **Offline experience**  
* Reads from local DB; show offline badge; queue writes.  
* Map shows cached pins; tiles gracefully degrade if not cached.  
* Planner editable offline; sync on reconnect.

7. **Security & privacy**  
* DB encryption-at-rest; keys from platform secure storage (Keychain/Keystore).  
* PII minimized in logs; redact on crash reports.

---

## **Data Contracts (app-side models; simplified)**

{

  "Itinerary": {

    "type": "object",

    "required": \["id","title","dateStart","dateEnd","active"\],

    "properties": {

      "id": {"type":"string","format":"uuid"},

      "title": {"type":"string"},

      "dateStart": {"type":"string","format":"date"},

      "dateEnd": {"type":"string","format":"date"},

      "active": {"type":"boolean"},

      "updatedAt": {"type":"string","format":"date-time"}

    }

  },

  "SavedItem": {

    "type": "object",

    "required": \["id","itineraryId","section","dedupeKey","updatedAt"\],

    "properties": {

      "id": {"type":"string","format":"uuid"},

      "itineraryId": {"type":"string","format":"uuid"},

      "section": {"type":"string","enum":\["transport","accommodation","entertainment","gastronomy","events","trails"\]},

      "payload": {"type":"object"},     // section-specific fields

      "dedupeKey": {"type":"string"},

      "status": {"type":"string","enum":\["active","cancelled"\]},

      "updatedAt": {"type":"string","format":"date-time"}

    }

  },

  "SyncOp": {

    "type": "object",

    "required": \["id","type","entity","entityId","payloadHash","status","retries","createdAt"\],

    "properties": {

      "id": {"type":"string","format":"uuid"},

      "type": {"type":"string","enum":\["UPSERT","DELETE"\]},

      "entity": {"type":"string","enum":\["SavedItem","Itinerary","DayPlan"\]},

      "entityId": {"type":"string"},

      "payloadHash": {"type":"string"},

      "status": {"type":"string","enum":\["queued","inflight","failed","done"\]},

      "lastError": {"type":"string"},

      "retries": {"type":"integer"},

      "createdAt": {"type":"string","format":"date-time"}

    }

  },

  "UserSettings": {

    "type": "object",

    "required": \["id","locale","timezone","currency"\],

    "properties": {

      "id": {"type":"string"},

      "locale": {"type":"string"},

      "timezone": {"type":"string"},

      "currency": {"type":"string"},

      "units": {"type":"object"},

      "updatedAt": {"type":"string","format":"date-time"}

    }

  }

}

**Idempotency:** all mutations carry `If-Match` (ETag) or `updatedAt`; client also attaches `X-Idempotency-Key` (UUIDv4) per `SyncOp`.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — App starts with local cache ready**

Given I’ve used the app before

When I launch it in airplane mode

Then I can open my Active Itinerary, view saved items, map pins, and day plans without errors.

**AC2 — Save requires Active Itinerary**

Given no Active Itinerary is selected

When I try to Save an item from Search

Then I am prompted to select/create an itinerary

And after selection the Save binds to that itinerary automatically.

**AC3 — Optimistic insert & offline queue**

Given I am offline

When I Save a restaurant

Then it appears immediately in Gastronomy with a "Syncing…" badge

And later, when online, the badge clears and the item persists.

**AC4 — Dedupe on Save**

Given I see the same vendor ticket I saved for the same itinerary, “Save” button icon should change to “Saved”

Then when pressing on “Saved” button, the item is going to be unsaved from the itinerary.

**AC5 — Conflict merge**

Given the same SavedItem was edited on another device

When my push hits a 409

Then I see a non-blocking banner with server vs. local differences and can pick which to keep.

**AC6 — Secure storage**

Given I examine the app’s local files

Then data is encrypted at rest and cannot be read without device unlock.

**AC7 — Crash safety**

Given the app crashes during a sync

When I reopen it

Then the queue resumes safely without duplicating remote mutations.

---

## **UX & Interaction Details**

* **Active Itinerary chip** in the app bar with a quick switcher; switch triggers cache swap & scoped sync.

* **Badges:** “Syncing…”, “Failed — Retry”, “Offline”.

* **Errors:** friendly toasts with retry; detailed logs hidden behind a developer toggle.

* **Theme:** system-following light/dark; accessible contrast; scalable fonts.

* **Localization:** string catalog (must be done at least for English, Mandarin, Spanish, German, Russian, French, Korean)  & date/number formats; RTL safe layouts.

---

## **Engineering Notes (Definition of Done)**

* **State mgmt:** Riverpod/Provider (lightweight), immutable models, JSON serialization.

* **DB:** SQLite (pick one) with migrations; background isolates for heavy ops; write-ahead logging.

* **Encryption:** SQLCipher (SQLite); keys from Keychain/Keystore; automatic rekey on app reinstall.

* **Networking:** `dio` with interceptors: auth, idempotency key, retry/backoff, logging (PII redacted).

* **Sync:**

  * Pull: `/sync/pull?since=timestamp&itineraryId=<id>`

  * Push: `/sync/push` accepting a batch of changes with per-record ETags.

  * Backoff: exponential with jitter; cap & circuit break after N failures.

* **Dedupe:** compute and index `dedupeKey` per section; unique constraint `(itineraryId, dedupeKey)`.

* **Feature flags:** remote-config for toggling providers/features; cached locally.

* **CI/CD:** Fastlane \+ Gradle; flavors (dev/stage/prod); unit/widget/integration tests; crash reporting (Sentry/Crashlytics).

* **Telemetry:** `app_start`, `itinerary_switched`, `save_queued`, `sync_success/fail`, `dedupe_hit`, `conflict_shown`, `offline_read`.

* **Testing:**

  * Unit: repos, dedupe logic, conflict merge.

  * Widget: Save flows, badges.

  * Integration: offline queue → online sync; crash mid-sync → resume.

  * Perf: cold start, scroll jank, DB query p95.

---

Got it — here’s **Story \#18** only. Say **“Next”** when you want me to continue.

# **Story 18 — Web App Shell (Next.js) with shared components and auth**

**As a** user on desktop  
 **I want** a fast, secure web app that mirrors the mobile experience (including offline-read for snapshots and local-first saves)  
 **So that** I can plan trips comfortably on a big screen, with every saved item still bound to the **Active Itinerary**.

---

## **Scope**

* **Framework:** Next.js (App Router), React Server Components \+ Client Components where necessary.

* **Platforms:** Modern evergreen browsers (Chromium, Firefox, Safari); responsive from 360px–1920px+.

* **Design system:** Shared component library (tokens, icons, cards, list \+ map, chips, banners) consumed by web and mobile (via generated CSS variables and TS types).

* **Auth:** OIDC/OAuth2 login, session cookies (httpOnly, SameSite=Lax), CSRF protection for mutations.

* **Local-first:** IndexedDB for cached queries and optimistic SavedItems; offline-read of **Offline Snapshot** (Story 10\) bundles; background sync.

* **Itinerary binding:** All save/create flows enforce an **Active Itinerary**; UI chip for quick switch; server validates `itineraryId` on writes.

* **Routing:** App-level layouts, nested routes, dynamic segments: `/itineraries/[id]/{overview|search|map|planner|settings}`.

* **SEO:** Minimal (gated behind auth), but share-view pages (read-only web snapshot) are crawl-safe with `noindex`.

* **Accessibility:** WCAG 2.2 AA; keyboard navigation, focus states, ARIA for live regions (sync, conflicts).

---

## **Key Pages & Features**

1. **Auth & onboarding**

   * `/login` → OIDC → redirect to last itinerary or `/itineraries`.

   * First-run: create/select itinerary modal.

2. **Itinerary workspace**

   * **Overview:** sections grid (Transport, Accommodation, etc.), recent saves, Active Itinerary chip.

   * **Search surfaces:** Transport/Accommodation/Entertainment/Gastronomy/Events/Trails—list+map parity with mobile, optimistic **Save**.

   * **Map:** unified layers, photo layer, snapshot export (runs server-side renderer or client canvas).

   * **Planner:** day timeline with drag-drop, calendar view, conflict chips, ETA/buffer helpers.

3. **Settings & billing**

   * Profile, travelers, defaults, notifications, privacy, storage; account & billing pages (plans, invoices).

4. **Offline snapshot viewer (web)**

   * `/share/[snapshotId]` read-only, privacy-filtered; PWA-capable for offline after first load; link revocation respected.

---

## **UX & Interaction Notes**

* **Layouts:** left nav rail (persistent at ≥1024px), top bar at smaller widths; sticky layer chips on map.

* **Optimistic UI:** Save → shows in section immediately with “Syncing…” badge; errors roll back with a toast \+ retry.

* **Conflict banners:** non-blocking diff modal if server returns newer version.

* **Keyboard:** `,`/`.` to flip days in Planner; `S` to save; `/` to focus search.

* **Internationalization:** Next-intl; server-rendered locale; user setting overrides browser.

---

## **Data & State (client)**

* **Stores:** Zustand/Redux Toolkit for UI state; React Query/TanStack Query for data (cache, SWR).

* **IndexedDB schema:** `saved_items`, `itineraries`, `day_plans`, `snapshots`, `cache_entries`, `sync_ops`.

* **Sync ops:** identical to mobile (Story 17\) with `X-Idempotency-Key` and `updatedAt` guards.

---

## **API Contracts (HTTP, summarized)**

* `GET /api/itineraries?mine=1` → list user itineraries.

* `POST /api/saved-items` (body includes `{ itineraryId, section, payload, dedupeKey }`) → upsert; idempotent.

* `GET /api/search/{vertical}` → normalized search responses with provider meta.

* `POST /api/planner/day` → upsert day plan; conflict if stale `updatedAt`.

* `GET /api/snapshot/{id}` → read-only public artifact (if valid & unrevoked).

(Contracts align with prior stories; no new fields.)

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Auth & itinerary gate**

Given I am logged out

When I visit /itineraries/active/map

Then I am redirected to login,

And after login I land on the same route with my Active Itinerary set.

**AC2 — Save requires Active Itinerary (web)**

Given no Active Itinerary is selected

When I click Save on a restaurant

Then a picker prompts me to select/create an itinerary

And after selection the Save binds to that itinerary automatically.

**AC3 — Optimistic save \+ offline**

Given I am offline

When I Save an attraction

Then it appears immediately with "Syncing…" in Entertainment

And sync completes automatically when I reconnect.

**AC4 — List/map parity**

Given I filter Entertainment and pan the map

Then the list updates to match the visible pins,

And selecting a pin opens the same card actions as in the list.

**AC5 — Planner drag-drop**

Given I open the Planner

When I drag a saved item into a time slot

Then the entry is placed, ETAs/buffers update, and conflicts (if any) are flagged with fix actions.

**AC6 — Snapshot viewer**

Given I open a shared snapshot link

Then I see a read-only map and lists with no PII or booking refs,

And if the link was revoked I see an Expired page.

**AC7 — Accessibility**

Given I navigate by keyboard only

When I tab through search results and controls

Then all interactive elements are reachable with visible focus

And screen readers announce status changes (Syncing, Conflict, Saved).

---

## **Engineering Notes (Definition of Done)**

* **Next.js structure**

  * `/app` router with nested layouts; server components for data-heavy lists; client components for interactive map, planner timeline.

  * Edge/runtime: Node on server routes; CDN caching for public snapshot assets only.

* **Security**

  * Session cookies: `Secure`, `httpOnly`, `SameSite=Lax`; CSRF token double-submit for POST/PUT/DELETE.

  * Input validation with zod/valibot; output encoding; Content-Security-Policy (no `unsafe-inline`), Trusted Types for map renderer if needed.

* **PWA**

  * Service Worker caches: HTML shell for snapshot viewer, static assets, map tiles in-limits; runtime caching strategies with versioned precache manifest.

* **Maps**

  * WebGL map (MapLibre/Leaflet depending on provider); clustering; vector tile fallback; snapshot renderer (canvas or headless server).

* **Planner**

  * Timeline virtualization for performance; DnD via pointer events; deterministic auto-place helpers (shared with mobile logic via worker/module).

* **Shared design system**

  * Tokens from a single source (Style Dictionary): colors, spacing, radius, typography; ship as CSS variables \+ TS enums.

* **Testing**

  * Unit: reducers, hooks, validators.

  * Component: card/list/map interactions, planner DnD.

  * E2E (Playwright): auth, save offline→online, list/map parity, snapshot revoked path, accessibility checks (axe).

* **Observability**

  * Web vitals (LCP/INP/CLS); error boundaries with source maps; client logs redacting PII; tracing for API calls.

* **Performance targets**

  * LCP \< 2.5s on 3G Fast for authenticated shell; INP \< 200ms for card interactions; \<60ms main-thread long tasks budget.

---

# **Story 19 — Shared Design System (tokens, components, theming, cross-platform build)**

**As a** product/dev team  
 **I want** a single source of truth for UI tokens, components, and themes that works on **Web (Next.js)** and **Mobile (Flutter)**  
 **So that** the app looks/behaves consistently, is accessible, and ships fast with minimal duplication.

---

## **Scope**

* **Single source of truth tokens:** color, typography, spacing, radius, elevation, motion, shadows, z-index, breakpoints, icon sizes.

* **Cross-platform builds:** generate artifacts for **Web** (CSS variables \+ TypeScript types \+ Tailwind preset) and **Flutter** (Dart constants \+ ThemeData).

* **Component library:** a core set of primitives and composites used throughout the app (cards, list+map items, chips, badges, buttons, inputs, toasts, banners, tabs, carousels, timeline blocks, modals/bottom sheets, skeletons, progress, avatars, stepper, rating stars, ETA pill, map pin styles).

* **Theming:** light/dark \+ brand accents; support **high-contrast** and **compact** density modes. Runtime switching without reload; user \+ OS preference aware.

* **Accessibility:** WCAG 2.2 AA color contrast; focus states; motion-reduction; screen-reader/semantics guidance; hit-target sizing.

* **Versioned delivery:** server packages, changelogs, Storybook \+ Widgetbook previews, visual regression tests.

* **Internationalization-aware components:** number/date formatting hooks, bidirectional (LTR/RTL) mirroring.

* **Performance:** tree-shakeable builds, minimal bundle weight, icon subset generation.

---

## **Component Inventory (MVP)**

**Primitives**

* Button (primary/secondary/ghost/destructive, sizes xs–xl, loading state)

* Icon \+ IconButton (sizes, accessible labels)

* Input/TextArea/Select/Checkbox/Radio/Toggle \+ Field wrappers (label, help, error)

* Chip & FilterChip (selectable, dismissible, with count)

* Badge (info/success/warn/error/neutral)

* Tooltip, Popover, Dropdown, Menu

* Modal & BottomSheet (with focus trap and escape handling)

* Toast & Inline Banner (status \+ actions)

**Data display**

* Card (header, media, content, actions)

* List item (swipeable images, title, subtitle, metadata pills)

* Carousel (images; swipe/pinch mobile-friendly)

* Progress (linear, circular; determinate/indeterminate)

* Skeleton loader

**Map/UI specific**

* MapPin styles (section icons: transport, accommodation, entertainment, gastronomy, events, trails), cluster badges  
* ETA pill, Refundability/Cancelation badge, Price pill, Rating stars  
* Timeline Block (Planner): flexible/fixed/commute/buffer variants with drag handles

**Navigation**

* App Bar with **Active Itinerary chip**  
* Tabs, Segmented control  
* Breadcrumb/Stepper for snapshot/checkout flows

---

## **Tokens & Theming**

### **Token model (authoring)**

Author tokens once in `tokens.json` (or Figma Tokens). Example:

{

  "$schema": "https://design-system/schema/tokens.json",

  "color": {

    "bg": { "default": "\#0B0B0C", "inverse": "\#FFFFFF" },

    "surface": { "1": "\#101114", "2": "\#17191D" },

    "brand": { "primary": "\#4F8BFF", "secondary": "\#00C39A" },

    "semantic": {

      "info": "\#2F80ED", "success": "\#27AE60", "warn": "\#E2B93B", "error": "\#E05555"

    }

  },

  "typography": {

    "fontFamily": { "sans": "Inter, system-ui, \-apple-system, Segoe UI, Roboto" },

    "sizes": { "xs": 12, "sm": 14, "md": 16, "lg": 18, "xl": 20, "display": 32 },

    "lineHeights": { "tight": 1.2, "normal": 1.5, "loose": 1.7 }

  },

  "space": { "0": 0, "1": 4, "2": 8, "3": 12, "4": 16, "6": 24, "8": 32, "10": 40, "12": 48 },

  "radius": { "sm": 8, "md": 12, "lg": 16, "xl": 24, "2xl": 32 },

  "elevation": { "1": "0 1px 2px rgba(0,0,0,.12)", "2": "0 3px 8px rgba(0,0,0,.16)" },

  "motion": { "duration": { "fast": 120, "base": 180, "slow": 240 }, "easing": { "inOut": "cubic-bezier(.4,0,.2,1)" } }

}

### **Build outputs**

* **Web:**

  * `/dist/web/tokens.css` → `:root { --color-brand-primary: #4F8BFF; ... }`

  * `/dist/web/tokens.d.ts` (TS types), `/dist/web/tailwind.preset.cjs` (so Tailwind utility classes align)

* **Flutter:**

  * `/dist/flutter/tokens.dart` (`AppColors.brandPrimary`, `AppSpace.s4`, etc.)

  * Theme factories → `ThemeData lightTheme`, `darkTheme`, `highContrastTheme`

### **Theme switching**

* Web: CSS variables \+ `prefers-color-scheme`, runtime `data-theme` attribute with smooth transitions and **reduced motion** honor via `prefers-reduced-motion`.

* Flutter: `ThemeMode.system | light | dark | highContrast`; live rebuild of `MaterialApp`.

---

## **Accessibility & Motion**

* **Contrast:** All interactive component color pairs meet ≥ 4.5:1; large text ≥ 3:1.

* **Focus:** Highly visible focus rings; no reliance on color alone; logical tab order.

* **Motion:** Respect reduced motion; swap complex transitions for fades/instant updates.

* **Hit areas:** minimum 44×44 dp/px; list items and map pins have generous targets.

* **Localization & RTL:** Mirrored icons/layouts for RTL; numerical/date format slots on relevant components.

---

## **Engineering — Delivery & Tooling**

* **Monorepo** with `packages/`:

  * `@design/tokens` (source \+ builders)

  * `@design/web` (React components \+ Tailwind preset \+ Storybook)

  * `@design/icons` (SVG → tree-shaken React components \+ Flutter vector assets)

  * `design_flutter` (Dart package consumed by app)

* **Build pipeline:** Style Dictionary (or Theo) → generators → lint (ESLint/TS, Dart analyze), typecheck, unit tests, **visual regression** (Chromatic/Playwright for web; golden tests for Flutter).

* **Publishing:** Changesets \+ semantic-release; version tags replicated to both npm and pub.dev (internal registry if private).

* **Icons:** central SVGs; script produces React components and Flutter `IconData`; subset by usage to keep bundles lean.

* **Storybook & Widgetbook:** interactive docs, accessibility checks (axe), knobs for theme/density/RTL; snapshots for CI.

* **Design handoff:** Figma styles named to match tokens; CI can pull token JSON from Figma Tokens plugin to stay in sync (optional).

* **Performance:** side-effect-free ESM, exports per component; CSS only via tokens/utilities to enable tree shaking; Flutter package avoids heavy deps.

---

## **Contracts (Schemas)**

### **Token file schema (excerpt)**

{

  "type": "object",

  "required": \["color","typography","space","radius"\],

  "properties": {

    "color": { "type": "object", "additionalProperties": { "type": "object", "additionalProperties": { "type": \["string","number"\] } } },

    "typography": { "type": "object" },

    "space": { "type": "object", "patternProperties": { "^\[0-9\]+$": { "type": "number" } } },

    "radius": { "type": "object" },

    "motion": { "type": "object" },

    "elevation": { "type": "object" }

  }

}

### **Component versioning metadata**

{

  "ComponentMeta": {

    "name": "Card",

    "version": "1.3.0",

    "tokens": \["color.surface.1","radius.lg","elevation.1","space.4"\],

    "a11y": { "role": "group", "keyboard": \["Enter","Space"\], "minContrast": "AA" }

  }

}

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Token parity across platforms**

Given I change brand.primary in tokens.json

When I rebuild the design system

Then Web variables and Flutter ThemeData both reflect the new color

And Storybook/Widgetbook previews update accordingly.

**AC2 — Theme switching**

Given I toggle dark mode in Settings

Then all components switch to the dark palette with no layout shift

And reduced motion users see simplified transitions.

**AC3 — Accessibility guarantees**

Given I run automated a11y checks

Then all components meet WCAG 2.2 AA contrast,

Have visible focus, and pass keyboard navigation tests.

**AC4 — Component API stability**

Given a minor version update of @design/web

When I upgrade in the web app

Then no breaking prop changes occur and release notes list any new features or fixes.

**AC5 — Performance & size**

Given I import only Button and Chip

Then the built bundle contains only those components and necessary tokens

And initial CSS payload stays under the target budget.

**AC6 — RTL & i18n**

Given I flip the app to an RTL locale

Then components mirror appropriately and icons that imply direction are flipped.

**AC7 — Map pin & badge consistency**

Given I view saved items across sections

Then pins and badges use the same colors/icons across Web and Mobile

And section changes (e.g., Events) auto-update the legend.

**AC8 — Density modes**

Given I enable Compact mode

Then list cards and table rows reduce vertical padding consistently without breaking tap targets.

---

## **UX & Usage Guidelines (for product teams)**

* **Do** use tokens and primitives; avoid ad-hoc CSS or magic numbers.

* **Keep** list/map parity components aligned: the same card props should render in list or pin popover.

* **Prefer** component composition over new variants; if a new variant is needed, add a tokenized style prop rather than a hardcoded class.

* **Document** do/don’t examples in Storybook for each component.

---

## **Definition of Done (Engineering)**

* Tokens compile to web \+ Flutter artifacts; CI verifies parity.

* Storybook & Widgetbook cover all components with controls for **theme/density/RTL**.

* Automated a11y checks pass (axe/pa11y \+ golden color contrast tests).

* Visual regression baseline created; CI blocks on pixel diffs over threshold.

* Packages versioned and published; changelog generated; upgrade guide for apps.

* Integration PRs:

  * Web: replace legacy styles with tokens; configure Tailwind preset; migrate 3 representative pages.

  * Mobile: wire `ThemeData` and use design\_flutter in 3 representative screens.

* Performance budgets enforced (bundle analyzer on web; APK/IPA size checks on mobile).

* Telemetry hooks: `ds_component_rendered`, `ds_theme_switched` (dev mode only), to catch perf regressions.

---

# **Story 20 — Backend Foundations (Auth, Users, Itineraries, SavedItems, Sync, RBAC)**

**As a** platform  
 **I need** a secure, scalable backend for auth, user/org records, itineraries, saved items, planner data, and offline sync  
 **So that** every save/search is scoped to an **Active Itinerary**, collaboration is enforced via RBAC, and clients can work offline with safe, idempotent sync.

---

## **Scope (what this story delivers)**

* **Auth & identity:** OIDC/OAuth2 login, short-lived access tokens, refresh tokens, passwordless support.

* **Users & orgs:** user profile \+ settings.

* **Itineraries:** CRUD with membership (owner/editor/viewer). Active itinerary tracking per user.

* **Saved items:** Transport, Accommodation, Entertainment, Gastronomy, Events, Trails — all **must** include `itineraryId` and `section`.

* **Planner (DayPlan) storage:** versioned daily timelines.

* **Sync service:** delta **pull**/batched **push**, ETags, idempotency keys, conflict responses.

* **RBAC & ACL:** itinerary-scoped permissions with server-side enforcement on every write.

* **Observability & security baselines:** structured logs, metrics, rate limits, WAF, input validation.

Golden rule (enforced server-side): **No item can be created/updated without a valid `itineraryId` that the caller can write.** All search-facing endpoints require an `itineraryId` (or an active one resolved serverside) for save actions.

---

## **Architecture overview**

* **API Gateway** → **Auth** (OIDC) → **App API** (GraphQL or REST)

* **Services:** `identity`, `itineraries`, `saved-items`, `planner`, `sync`, `billing` (later), `admin` (later)

* **Data store:** Postgres (row-level ACL-friendly), Redis (caching, idempotency keys, job queues), Object storage (images/snapshots).

* **Events bus:** “item\_saved”, “plan\_updated”, “member\_changed” for downstream processors (search indexer, notifications).

---

## **Data model (relational, simplified)**

\-- Users & Orgs

create table users (

  id uuid primary key,

  email citext unique not null,

  name text,

  locale text default 'en-US',

  timezone text default 'America/New\_York',

  currency text default 'USD',

  created\_at timestamptz default now(),

  updated\_at timestamptz default now()

);

create table orgs (

  id uuid primary key,

  name text not null,

  owner\_id uuid not null references users(id),

  created\_at timestamptz default now()

);

create table org\_members (

  org\_id uuid references orgs(id),

  user\_id uuid references users(id),

  role text check (role in ('owner','admin','member','viewer')),

  primary key (org\_id, user\_id)

);

\-- Itineraries & membership

create table itineraries (

  id uuid primary key,

  org\_id uuid references orgs(id),

  owner\_id uuid not null references users(id),

  title text not null,

  date\_start date,

  date\_end date,

  created\_at timestamptz default now(),

  updated\_at timestamptz default now()

);

create table itinerary\_members (

  itinerary\_id uuid references itineraries(id),

  user\_id uuid references users(id),

  role text check (role in ('owner','editor','viewer')) not null,

  primary key (itinerary\_id, user\_id)

);

\-- Active itinerary per user (server uses this when client omits)

create table user\_active\_itinerary (

  user\_id uuid primary key references users(id),

  itinerary\_id uuid references itineraries(id),

  updated\_at timestamptz default now()

);

\-- Saved items (polymorphic via JSON payload \+ section)

create table saved\_items (

  id uuid primary key,

  itinerary\_id uuid not null references itineraries(id) on delete cascade,

  section text check (section in ('transport','accommodation','entertainment','gastronomy','events','trails')) not null,

  payload jsonb not null,                    \-- section-specific fields

  status text default 'active',              \-- 'active'|'cancelled'

  dedupe\_key text not null,

  updated\_at timestamptz not null default now(),

  created\_at timestamptz not null default now(),

  unique (itinerary\_id, dedupe\_key)          \-- server-enforced idempotency

);

\-- Planner (per day)

create table day\_plans (

  id uuid primary key,

  itinerary\_id uuid not null references itineraries(id) on delete cascade,

  date date not null,

  entries jsonb not null,                    \-- ordered blocks

  version int not null default 1,

  updated\_at timestamptz not null default now(),

  unique (itinerary\_id, date)

);

\-- Sync bookkeeping (optional)

create table change\_log (

  id bigserial primary key,

  itinerary\_id uuid not null,

  entity\_type text check (entity\_type in ('SavedItem','Itinerary','DayPlan')),

  entity\_id uuid not null,

  op text check (op in ('UPSERT','DELETE')) not null,

  updated\_at timestamptz not null default now()

);

Indexes to add: `(itinerary_id, updated_at)` on `saved_items` and `day_plans`; GIN on `saved_items.payload` for filtering; `(user_id, itinerary_id)` on membership; B-tree on `change_log (itinerary_id, updated_at)`.

---

## **API (REST examples; GraphQL equivalent OK)**

### **Auth**

* `POST /auth/oidc/callback` → session/refresh tokens

* `POST /auth/refresh` → new access token

* `POST /auth/logout`

### **User & Settings**

* `GET /me` → profile, activeItineraryId

* `PUT /me/active-itinerary` `{ itineraryId }`

### **Itineraries**

* `GET /itineraries?mine=1`

* `POST /itineraries` `{ title, dateStart, dateEnd }`

* `GET /itineraries/{id}`

* `PUT /itineraries/{id}` (owner/editor)

* `DELETE /itineraries/{id}` (owner)

* `POST /itineraries/{id}/members` `{ email, role }` (owner)

* `PUT /itineraries/{id}/members/{userId}` `{ role }` (owner)

* `DELETE /itineraries/{id}/members/{userId}` (owner)

### **Saved Items (strict itinerary binding)**

* `POST /saved-items` `{ itineraryId, section, payload, dedupeKey }`

  * Headers: `X-Idempotency-Key`, `If-None-Match` optional

* `GET /saved-items?itineraryId=...&section=...`

* `GET /saved-items/{id}`

* `PUT /saved-items/{id}` `{ payload, status }` (RBAC check)

* `DELETE /saved-items/{id}`

Server rejects any create/update missing `itineraryId` or where caller lacks `write`.

### **Planner**

* `GET /planner/day?itineraryId=...&date=YYYY-MM-DD`

* `PUT /planner/day` `{ itineraryId, date, entries, version, updatedAt }`

  * On stale `version/updatedAt` → `409 Conflict` \+ server doc for merge.

### **Sync**

* `GET /sync/pull?itineraryId=...&since=ISO8601`  
   → `{ items:[...], dayPlans:[...], cursor }`

* `POST /sync/push`  
   `{ ops: [{ type:'UPSERT'|'DELETE', entity:'SavedItem'|'DayPlan'|'Itinerary', body:{...}, idempotencyKey }] }`  
   → per-op results with `status`, `conflictPayload` if any.

---

## **RBAC & authorization**

* **Subject:** `{ userId, orgIds[] }` from access token.

* **Resource:** `{ itineraryId, entityType, entityId }`.

* **Action:** `read | write | manage`.

* **Policy:**

  * Owner → manage \+ write \+ read

  * Editor → write \+ read

  * Viewer → read

* **Enforcement points:** every `POST/PUT/DELETE` on `itineraries`, `saved-items`, `planner`, `sync/push`.

* **Active itinerary resolution:** if a client calls a **search → save** helper without `itineraryId`, server looks up `user_active_itinerary.itinerary_id` and rejects if null.

---

## **Idempotency, conflicts, and consistency**

* **Write idempotency:** require `X-Idempotency-Key` on mutation endpoints; persisted in Redis with 24h window; return same result on repeat.

* **Dedupe guard:** `(itinerary_id, dedupe_key)` unique in DB prevents duplicates even across devices.

* **Optimistic concurrency:** ETag/`updatedAt` precondition; on mismatch return `409` with `{ serverDoc, diffHints }`.

* **Ordering:** `change_log` provides per-itinerary monotonic order for pull sync.

---

## **Validation & normalization**

* Strict JSON Schemas per `section` (transport/accommodation/…); validate `payload` at the edge.

* Canonical units/timezones (ISO 8601 with timezone; distances in meters; prices as `{ amountMicros, currency }`).

* Sanitize URLs (website/ticket/vendor links) and strip dangerous HTML in descriptions.

---

## **Observability & quotas**

* **Metrics:** request rates, latency, error taxonomy, RBAC denials, idempotency hits, dedupe violations, sync queue sizes.

* **Logs:** structured (userId, itineraryId, route, status); PII redacted.

* **Rate limits:** per-user and per-IP for mutations and search assists; 429 with `Retry-After`.

* **Backups:** PITR for Postgres; encrypted object storage; rotation for access keys.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Itinerary binding enforced**

Given a client calls POST /saved-items without itineraryId

Then the server rejects with 400 "Missing itineraryId" (or binds to user’s Active Itinerary if endpoint explicitly supports it)

And any request with an itineraryId the user cannot write returns 403\.

**AC2 — Dedupe & idempotency**

Given a client submits the same SavedItem with the same dedupeKey

When it’s already present under that itinerary

Then the server returns 200 with the existing resource (no duplicate row).

Given a network retry repeats a mutation with the same X-Idempotency-Key

Then the server returns the original response and performs no extra work.

**AC3 — RBAC**

Given a Viewer calls PUT /saved-items/{id}

Then the server returns 403

But GET on the same resource returns 200\.

**AC4 — Planner conflict**

Given device A and B edit the same day plan

When B pushes an older version

Then the API returns 409 with the current server document to merge.

**AC5 — Sync pull window**

Given I call GET /sync/pull?since=\<t0\>

Then only items and plans updated after t0 are returned, ordered by updatedAt, with a cursor if more exist.

**AC6 — Active itinerary resolution**

Given a user has an Active Itinerary set to I-123

When the client calls POST /saved-items with itineraryId omitted on the save-helper route

Then the server binds the item to I-123 and returns 201\.

**AC7 — Validation & sanitation**

Given payload contains unsafe HTML in description or an invalid URL

Then the server strips/normalizes it and stores a safe version, or rejects with 422 with error details.

---

## **Engineering notes (Definition of Done)**

* **Auth:** OIDC with short-lived JWT access tokens (aud, iss, exp, sub), 30-day refresh; rotate signing keys.

* **HTTP hygiene:** JSON only; gzip/br; pagination via cursor; consistent error shape `{ code, message, details[] }`.

* **Security:** TLS everywhere; CSP on public assets; SSRF/command injection safe; OWASP ASVS L2.

* **Performance:** p95 \< 200ms for reads, \< 400ms for writes at baseline; DB connection pool sizing; N+1 query audits.

* **Migrations:** `ALTER TABLE ...` safe; backfill scripts; feature flags for new columns.

* **Testing:**

  * Unit: RBAC checks, schema validators, dedupe/idempotency helpers.

  * Integration: full flows (create itinerary → add member → save item → pull/push sync → conflict).

  * Load: save/search typical QPS; sync storm simulation.

  * Security: auth replay, privilege escalation attempts, injection fuzz.

---

Got it — here’s **Story \#21** only. Say **“Next”** when you want me to continue.

# **Story 21 — Search Assist APIs (normalized queries, provider fan-out, caching) with Save Hooks bound to Active Itinerary**

**As a** feature team  
 **I want** unified HTTP APIs for all search surfaces (transport, accommodation, entertainment, gastronomy, events, trails)  
 **So that** clients get normalized results fast, with **one-tap Save** that always files under the **Active Itinerary**.

---

## **Scope**

* **Endpoints per vertical** using a shared query envelope \+ vertical params.

* **Provider fan-out** behind the scenes (Search Platform from Story 16).

* **Normalization**: canonical item schemas across providers; stable IDs; provenance.

* **First-class “Save”**: each search response includes a **Save** contract and a server-side **/save** helper that:

  * Resolves/binds to `{ itineraryId:<Active> }` if omitted (server looks up user’s active itinerary).

  * Writes to the correct `section` with dedupe & idempotency.

* **Caching & quotas**: edge+service caching; per-user rate/usage limits with graceful errors.

* **Resilience & telemetry**: timeouts, fallbacks, ranking explain (debug only), structured logs.

Golden rule enforced here too: **every save is filed into the caller’s active itinerary or an explicitly provided `itineraryId` they can write.**

---

## **API Surface (REST)**

Base path: `/api/search`

### **1\) Search**

`GET /api/search/{vertical}`

**Query parameters (shared):**

* `itineraryId` (optional) — for personalization and **save binding** if using `saveHelper=inline`.

* `locale`, `currency`, `timezone` (optional; defaults from user).

* `q` (free text, optional), `bounds` (optional JSON `{north,south,east,west}`), `sort`, `page.size` (10–50), `page.cursor`.

* `flags.strict` (bool), `flags.debug` (enum: `none|ranking|providers`).

**Vertical params (examples):**

* `transport`: `origin`, `destination`, `depart`, `return`, `modes[]`, `adults`, `children`, `bags`.

* `accommodation`: `place`, `checkIn`, `checkOut`, `guests`, `rooms`, `minScore`, `amenities[]`, `price.min/max`.

* `entertainment/gastronomy`: `place`, `openNow`, `rating.min`, `priceBands[]`, `dietary[]`, `kidFriendly`, `dogFriendly`.

* `events`: `place`, `date.start/end`, `categories[]`, `free`.

* `trails`: `place`, `duration.max`, `difficulty`, `elevation.min/max`, `loopOnly`.

**Response 200**

{

  "vertical": "accommodation",

  "items": \[ /\* canonical items, see schemas below \*/ \],

  "page": { "cursor": "eyJvZmZzZXQiOjUw...","hasMore": true },

  "meta": {

    "ttlSeconds": 90,

    "providers": \[{ "name":"ProviderA","tookMs":342,"status":"ok","cache":"service" }\],

    "ranking": { "strategy": "accom\_v2", "explain": \[\] },

    "save": {

      "helper": "/api/search/accommodation/save",

      "section": "accommodation",

      "required": \["payload","dedupeKey"\], 

      "itineraryBinding": "activeOrProvided"

    }

  }

}

### **2\) Save helper (per vertical)**

`POST /api/search/{vertical}/save`

**Body (shared contract):**

{

  "itineraryId": "UUID-OPTIONAL",   // if omitted, server binds to user’s Active Itinerary

  "section": "accommodation",        // server validates matches vertical

  "payload": { /\* canonical item payload for section \*/ },

  "dedupeKey": "string"              // supplied by client OR returned by search item; server recomputes & enforces

}

**Headers:** `X-Idempotency-Key: <uuid4>`

**Responses**

* `201 Created` → `{ id, itineraryId, section, status:"active", created:true }`

* `200 OK` (dedupe hit) → `{ id, itineraryId, section, status:"active", created:false }`

* `400` if missing binding & no active itinerary.

* `403` if user lacks write access to the supplied itinerary.

* `409` on true conflict with merge hints.

---

## **Canonical Item Schemas (excerpt)**

Returned by search; **exactly** what the Save helper expects in `payload`.

{

  "AccommodationItem": {

    "id": "string",                       // stable across providers when possible

    "name": "string",

    "location": { "lat": 0, "lng": 0, "address": "string", "distanceFromCenterKm": 0 },

    "photos": \[{ "url": "https://..." }\],

    "price": { "totalMicros": 123000000, "currency": "USD", "nightlyMicros": 41000000 },

    "review": { "score": 8.7, "count": 1342 },

    "policies": { "freeCancelUntil": "2026-06-01T18:00:00+02:00", "payAtProperty": true },

    "stay": { "checkIn": "2026-06-10", "checkOut": "2026-06-15", "guests": 2, "rooms": 1 },

    "website": "https://...",

    "provenance": \[{ "provider": "ProviderA", "id": "abc123" }\],

    "\_dedupeKeySeed": \["name","location.address","stay.checkIn","stay.checkOut","website"\]

  },

  "TransportItem": {

    "mode": "flight",

    "legs": \[{

      "origin": { "code": "JFK", "name": "John F Kennedy Intl" },

      "destination": { "code": "CDG", "name": "Charles de Gaulle" },

      "departAt": "2026-06-10T19:10:00-04:00",

      "arriveAt": "2026-06-11T08:45:00+02:00",

      "carrier": "AF", "flightNo": "AF009",

      "baggage": { "carryOn": 1, "checked": 1 }

    }\],

    "price": { "totalMicros": 750000000, "currency": "USD" },

    "website": "https://...",

    "provenance": \[{ "provider": "ProviderX", "id": "xyz" }\],

    "\_dedupeKeySeed": \["mode","legs\[0\].origin.code","legs\[-1\].destination.code","legs\[0\].departAt","provenance\[0\].id"\]

  }

}

**Server computes** `dedupeKey = hash(itineraryId | section | selected fields from _dedupeKeySeed | website?)`.  
 Clients may pass a client-side guess; server’s canonical computation wins.

---

## **Behavior & Workflows**

1. **Search → Save in one call (recommended)**

   * Client hits `GET /api/search/{vertical}` with `itineraryId` or none.

   * Taps **Save** on an item → client posts item’s `payload` (unchanged), optional `itineraryId`, and `dedupeKey` to `/save`.

   * Server binds to **Active Itinerary** when `itineraryId` is absent, validates RBAC, computes `dedupeKey`, upserts with idempotency.

2. **Map-bounds and “In view”**

   * Clients can pass `bounds` to bias/limit results; response includes pins-ready items.

   * For large cities, `boundsOnly=true` returns only entities within current viewport.

3. **Open-now & calendars**

   * Entertainment/Gastronomy: server applies **open-now** using provider hours normalized to itinerary timezone.

   * Transport: optional `GET /api/search/transport/min-price-calendar` for (origin, dest, month).

4. **Suggestions & typeahead**

   * `GET /api/search/suggest?vertical=...&q=...&place=...` returns normalized suggestion tokens (POIs, cuisines, categories, venues) to power chips.

5. **Quotas & caching**

   * Edge cache 30–120s on popular queries; service cache honors per-provider TTL; negative caching for empty sets (30s).

   * Per-user soft quotas (e.g., searches/min, per vertical) return `429` with `Retry-After` when exceeded; clients backoff.

6. **Debugging**

   * `flags.debug=ranking|providers` returns extra `meta` (only for trusted users) to aid ranking QA; never exposed to standard clients.

---

## **Errors (consistent shape)**

{ "code":"MISSING\_ACTIVE\_ITINERARY", "message":"No Active Itinerary set.", "details":\[\] }

{ "code":"FORBIDDEN", "message":"You don't have write access to this itinerary.", "details":\[{"itineraryId":"..."}\] }

{ "code":"QUOTA\_EXCEEDED", "message":"Search limit reached. Try again later.", "details":\[{"resetAt":"..."}\] }

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Active Itinerary save binding**

Given I have Active Itinerary I-123

When I POST /api/search/accommodation/save without itineraryId

Then the item is created under itinerary I-123

And the response returns { itineraryId:"I-123", created:true }.

**AC2 — Dedupe on save**

Given I saved Hotel X for I-123

When I POST the same payload/dedupeKey again

Then the server responds 200 { created:false } and no duplicate row exists.

**AC3 — RBAC enforcement on save**

Given I am Viewer on itinerary I-789

When I POST /api/search/events/save with itineraryId=I-789

Then I receive 403 FORBIDDEN and the item is not saved.

**AC4 — Cache hits reflected**

Given I repeat the same Entertainment search within TTL

Then the response meta.providers\[\*\].cache is "service" or "edge"

And p95 latency is lower than the cold miss baseline.

**AC5 — Bounds filtering**

Given I pass bounds for central Rome

When I search Gastronomy with boundsOnly=true

Then only items whose coordinates fall within those bounds are returned.

**AC6 — Open-now correctness**

Given I search Gastronomy at 20:30 local time with openNow=true

Then closed venues are excluded and each result has openingHours normalized to the itinerary timezone.

**AC7 — Transport min-price calendar**

Given I query /transport/min-price-calendar for JFK→CDG in June 2026

Then I get a grid of day→minPrice entries with currency normalized to the user's settings.

**AC8 — Save helper idempotency**

Given a network retry repeats a save with the same X-Idempotency-Key

Then the server returns the original result body and performs no extra save.

**AC9 — Suggest/typeahead quality**

Given I type "vega" in Gastronomy suggest

Then suggestions include "vegan" and "vegetarian" tags for the current place, ordered by popularity.

---

## **Engineering Notes (Definition of Done)**

* **Contracts:** zod/JSON Schema validators for each vertical’s request/response; strict coercion of dates/currency/timezones.

* **Fan-out:** calls routed to Search Orchestrator (Story 16); include user context (locale/currency/timezone) and limited prefs from Settings (Story 13).

* **Ranking:** per-vertical rankers; attach `meta.ranking.strategy` and (optionally) `explain`.

* **Save helper:** hard-validate `section` vs vertical; recompute `dedupeKey`; enforce `(itineraryId, dedupeKey)` unique in DB; require `X-Idempotency-Key`.

* **Open-now:** normalize provider hours to IANA timezone supplied (fall back to place tz).

* **Security:** sanitize URLs, strip HTML; rate limits per IP/user; WAF rules on search endpoints.

* **Observability:** traces that correlate `search_request_id` ↔ provider calls ↔ save helper; metrics for cache hit ratio, p95, quota denials.

* **AB & flags:** kill-switch per provider; ship new rankers behind feature flags; dark-launch with `flags.experimental`.

* **Testing:**

  * Unit: bounds filter, open-now logic, dedupe computation, idempotency keys.

  * Contract: golden fixtures from each provider → canonical items.

  * E2E: search → save under active itinerary (no itineraryId), RBAC forbidden path, repeated save → dedupe, cache hit latency delta.

---

# **Story 22 — Provider Integrations (per-vertical adapters, keys/quotas, sandbox fixtures)**

**As a** platform  
 **I want** robust adapters to third-party providers for each vertical (transport, accommodation, entertainment, gastronomy, events, trails)  
 **So that** the Search Platform (Story 16\) and Search Assist APIs (Story 21\) can return normalized results quickly, cheaply, and reliably—while every **Save** still files into the **Active Itinerary**.

---

## **Scope**

* **Adapters** for initial provider set per vertical, each behind a clean interface (`search`, `lookup`, optional `minPriceCalendar`/`suggest`).  
* **Credentials & quotas**: per-provider API keys, QPS caps, monthly budgets, and cost weights.  
* **Normalization mappers** that convert raw payloads → canonical schemas (Story 16/21) with timezone/currency unification.  
* **Resilience**: timeouts, retries (idempotent only), circuit breakers, partial results handling.  
* **Compliance**: terms-of-service (TOS) flags, geo allow/deny lists, and PII minimization.  
* **Sandbox**: local fixtures \+ deterministic simulators for load, timeouts, malformed responses, and ranking edge cases.  
* **Observability**: per-provider tracing, error taxonomy, cacheability hints, and budget/usage metrics.

All **save** operations remain routed through Story-21 save helpers → Server computes `dedupeKey` and enforces `{ itineraryId, section }` binding. Adapters never write directly.

---

## **Initial provider slate (example)**

* **Transport:** Global flights (GDS/OTA), intercity rail (EU/UK/JP,KR), intercity bus (EU/US), public transit schedules (suggest/ETA only).

* **Accommodation:** Major OTA/meta \+ boutique aggregator.

* **Entertainment/Gastronomy:** Place/POI graph with hours/reviews; supplemental local guides.

* **Events:** Ticketing/what’s-on APIs \+ city calendars.

* **Trails:** Outdoor routes catalog (GPX/polyline, difficulty/duration metadata).

Choose 1–2 stable vendors per vertical for MVP \+ 1 backup where licensing allows.

---

## **Adapter contract (concrete)**

export interface ProviderAdapter {

  name: string;                      // "AcmeFlights"

  vertical: "transport"|"accommodation"|"entertainment"|"gastronomy"|"events"|"trails";

  // Capabilities

  capabilities: ("search"|"lookup"|"minPriceCalendar"|"suggest")\[\];

  // Core calls (must be pure/idempotent)

  search(params: NormalizedQuery, ctx: ProviderContext): Promise\<ProviderResultEnvelope\>;

  lookup?(id: string, ctx: ProviderContext): Promise\<ProviderResultEnvelope\>;

  minPriceCalendar?(params: CalendarQuery, ctx: ProviderContext): Promise\<ProviderResultEnvelope\>;

  suggest?(q: string, ctx: ProviderContext): Promise\<ProviderResultEnvelope\>;

  // Health and limits

  limits: { qps: number; burst: number; timeoutMs: number; };

  regions?: string\[\];                // ISO country allowlist

  costWeight?: number;               // lower \= cheaper, used by orchestrator

}

**`ProviderContext`** includes: `requestId`, `locale`, `currency`, `timezone`, `userPrefsSubset`, `ipCountry`, `budgetRemaining`, `traceSpan`.

---

## **Normalization & validation**

* **Timezones:** all datetimes as ISO 8601 with explicit TZ; convert provider local times to the itinerary/user TZ for “open now” and calendars.

* **Currencies:** normalize numeric prices to `{ amountMicros, currency }`; FX via internal rate service; preserve provider raw.

* **Locations:** lat/lng mandatory; addresses normalized; distances computed from itinerary destination center when provided.

* **Quality fields:** review score (0–10 normalized), review count, popularity index (0–1) for ranking inputs.

* **Safety:** sanitize text (strip HTML/script), validate URLs (HTTP/HTTPS), image dimensions optional.

---

## **Resilience & QoS**

* **Timeout budgets:** adapter `timeoutMs` ≤ orchestrator slice; tail-cutting when enough results collected.

* **Retries:** single jittered retry on network/timeouts for GETs only; no retry on 4xx.

* **Circuit breakers:** per adapter (open/half-open/closed) with exponential backoff and health probes.

* **Bulkheads:** per-provider connection pool \+ concurrency caps; adaptive throttling on 429/5xx.

* **Budget guard:** track per-day/per-month request budgets; if exhausted, adapter reports `status:"budget_exhausted"` to orchestrator which downranks or disables it for the window.

---

## **Caching**

* **Edge**: cache GET-like queries when provider TOS permits; respect `ttlSeconds` hint per adapter.

* **Service (Redis)**: normalized result cache keyed by normalized query; negative caching 30s for empty sets/error classes.

* **Lookup**: longer TTL (e.g., 24h) when entities are stable (trails, venues).

* **Calendar tiles**: cache matrix cells by `(origin, dest, month, mode)`.

---

## **Compliance & data governance**

* **TOS registry**: per-provider settings (cache allowed, display rules, required attribution, rate limits, geo restrictions).

* **PII rules**: strip traveler names/emails from outbound requests unless required (e.g., price holds); never persist PII from provider responses unless explicit.

* **Geo controls**: disable providers for jurisdictions that prohibit use; fall back gracefully.

---

## **Sandbox & testing**

* **Fixtures**: goldens for each vertical/provider with diverse locales/currencies/timezones; corrupt/edge samples (missing hours, invalid coords).

* **Fault injector**: simulate 429, 5xx, timeouts, slow starts, partial pages, schema drifts.

* **Load harness**: replay popular queries with mixed cache hit/miss; verify p95 budgets and breaker behavior.

* **Ranking probes**: labeled result sets to validate ranker signals (price vs. distance vs. popularity trade-offs).

---

## **Telemetry & diagnostics**

* **Per-call spans** with attributes: `provider`, `vertical`, `status`, `tookMs`, `cacheHit`, `quotaDebit`, `itemsReturned`.

* **Error taxonomy**: `BAD_REQUEST`, `AUTH_FAILED`, `RATE_LIMITED`, `TIMEOUT`, `UPSTREAM_5XX`, `SCHEMA_ERROR`.

* **Dashboards**: latency/error SLI per provider; cache hit ratio; budget burn-down; breaker state.

* **Sampling**: record 1% of raw payloads (PII-scrubbed) for diffing when schemas drift.

---

## **Security**

* **Key management**: provider keys in KMS; rotated; least-privilege service accounts.

* **Outbound egress**: pinned domains, DNS-over-HTTPS, TLS verification; optional egress proxy.

* **Input/output validation**: strict schema checks before mapping; reject unknown enums; clamp out-of-range values.

* **Abuse controls**: throttle per user/IP; detect scraping patterns; return soft errors with `Retry-After`.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Happy path normalization**

Given Provider A returns a hotel in its native schema

When the adapter maps the response

Then the Search Platform receives a canonical AccommodationItem with ISO dates, normalized price, lat/lng, and review fields populated.

**AC2 — Timeout & partials**

Given Provider B is slow and exceeds its timeout

When the orchestrator aggregates results

Then Provider B is marked "timeout" and results from other providers still return with 200,

And latency stays within the overall budget.

**AC3 — Budget exhaustion**

Given Provider C exceeds its daily request budget

When further searches would hit C

Then the adapter reports "budget\_exhausted",

And the orchestrator shifts traffic to alternates and logs a budget event.

**AC4 — Cache & negative-cache**

Given the same events query is issued repeatedly

Then the second call serves from the service cache with reduced latency,

And empty-result queries are negative-cached briefly to protect providers.

**AC5 — Schema drift protection**

Given Provider D adds a new field and changes an enum unexpectedly

When the adapter validates the payload

Then invalid parts are quarantined, a SCHEMA\_ERROR is logged, and the rest of the response still maps safely.

**AC6 — Geo/TOS enforcement**

Given Provider E forbids caching or is disallowed in Country X

When a user in Country X issues a query

Then E is skipped and other providers serve results without violating TOS.

**AC7 — Suggest & open-now correctness**

Given I type "vega" in Gastronomy suggest

Then the adapter returns normalized tags (vegan/vegetarian) appropriate for the place,

And openNow filters use correct local time with timezone conversion.

**AC8 — Lookup parity**

Given I call lookup on an item ID from search results

Then the adapter returns a canonical item with richer details and the same stable dedupe fields.

---

## **Engineering Notes (Definition of Done)**

* Adapters implemented for MVP provider list with **unit tests covering mappers** and **integration tests** against sandbox fixtures.

* **Config-driven** enablement (per environment, per region) with hot reload; kill-switch toggles.

* **Per-provider quotas** enforced via token buckets; usage persisted for budget rollups.

* **Adapter SDK**: helpers for auth headers, pagination, rate-limit backoff, and canonical field builders (price/time/location).

* **Docs**: integration playbook (auth, limits, mapping guide, error codes) \+ runbooks (provider down, schema drift, budget hit).

* **No direct saves**: all client Save flows go through `/api/search/{vertical}/save` → back end (Story 21\) to preserve itinerary binding and dedupe/idempotency.

---

# **Story 25 — Reviews & Notes (private notes, shared comments, provenance, moderation)**

**As a** traveler (and collaborator)  
 **I want** to add notes, reviews, and threaded comments to items and day plans  
 **So that** I can remember details, discuss with my tripmates, and see where information came from — safely and without spam.

All notes/comments are **itinerary-scoped** and every record stores `{ itineraryId, parentType, parentId }`. Save actions still require an **Active Itinerary** and RBAC applies (Owner/Editor/Viewer).

---

## **Scope**

* **Private Notes (per user, per item/plan):** lightweight rich-text (markdown subset), checklists, optional rating (for Gastronomy/Entertainment/Trails). Default visibility: **me only**; can be promoted to shared comment.

* **Shared Comments (threads):** per SavedItem and per DayPlanEntry; replies, @mentions, emoji reactions, attachments (images/PDFs).

* **Provenance panel:** shows **how this item got here** (search provider, email scanner, manual add), who added it, and key edits.

* **Moderation & safety:** profanity filter, spam heuristics, link sanitization, image size/type limits, report/resolve workflow; admin escalation (from Story 15).

* **Visibility & roles:**

  * **Viewer:** read comments, add comments/replies, add private notes; cannot delete others’ content.

  * **Editor/Owner:** everything viewers can \+ edit/delete own comments, pin/resolve threads; Owner can hard-delete and lock threads.

* **Notifications:** mention pings; thread replies (digest); owner can mute threads.

* **Offline:** notes & comments are cached; edits queue and sync later.

* **Export/Share:** snapshots (Story 10\) exclude **private notes** and can optionally exclude comments; iCal export never includes notes/comments.

---

## **Detailed Workflows**

1. **Add a private note**

   * From any item or day entry → **Notes** tab → editor with markdown toolbar \+ checklist.

   * Optional rating (1–5) \+ tags (e.g., “must-try”, “skip”).

   * Can **Promote to comment** (creates a shared comment; original stays private).

2. **Comment thread**

   * **Comments** tab → thread list (newest on top, resolved grouped below).

   * Start a thread or reply; @mention users; attach up to N images (auto-compress, strip EXIF).

   * Thread actions: **Resolve**, **Pin**, **Edit** (own), **Delete** (own; Owner can delete any), **Mute**.

3. **Provenance**

   * **Info → Provenance** shows: source (“Saved from Provider X on 2025-06-01 by Priya”), edits (“Title updated by Samantha”), email imports (“Updated from email XYZ”).

   * Quick link: “View change log” (compact, human-readable).

4. **Moderation**

   * On submit, content passes: profanity/abuse model, URL sanitizer, attachment scanner.

   * If flagged → soft-hold (visible to author with banner) pending auto-review; severe → hidden from others, Owner notified.

   * Users can **Report** a comment (reason codes); Owner can **Lock thread**.

5. **Notifications**

   * @mention → push/in-app; reply digest batched per thread; respect **Quiet Hours** and **Trip-Only** (Story 23).

   * Mute per thread or per itinerary.

---

## **Data Contracts (client-side models; server mirrors with RBAC)**

{

  "Note": {

    "id": "uuid",

    "itineraryId": "uuid",

    "parentType": "SavedItem|DayPlanEntry",

    "parentId": "uuid",

    "authorId": "uuid",

    "visibility": "private",                // notes are always private

    "markdown": "string",

    "checklist": \[{ "id":"uuid", "text":"string", "done":false }\],

    "rating": { "value": 4, "max": 5 },

    "tags": \["must-try","kid-friendly"\],

    "updatedAt": "2025-11-09T14:12:00Z",

    "createdAt": "2025-11-09T14:10:00Z"

  },

  "CommentThread": {

    "id":"uuid",

    "itineraryId":"uuid",

    "parentType":"SavedItem|DayPlanEntry",

    "parentId":"uuid",

    "status":"open|resolved|locked|hidden",

    "pinned": false,

    "createdBy":"uuid",

    "createdAt":"2025-11-09T14:15:00Z",

    "updatedAt":"2025-11-09T14:16:00Z",

    "messages":\[{ "$ref":"\#/definitions/CommentMessage" }\],

    "lastMessageAt":"2025-11-09T14:16:00Z",

    "participants":\["uuid","uuid"\]

  },

  "definitions": {

    "CommentMessage": {

      "id":"uuid",

      "authorId":"uuid",

      "textMarkdown":"string",

      "mentions":\["uuid"\],

      "attachments":\[{ "id":"uuid","type":"image|pdf","url":"https://...","width":1200,"height":800,"sizeKB":320 }\],

      "reactions":\[{ "emoji":"👍","userId":"uuid" }\],

      "moderation":{"status":"ok|held|hidden","reason":"profanity|spam|malware|other"},

      "createdAt":"2025-11-09T14:16:00Z",

      "updatedAt":"2025-11-09T14:16:00Z"

    },

    "Provenance": {

      "savedBy":"uuid",

      "savedAt":"2025-06-01T10:12:00Z",

      "source":"provider|email|manual",

      "provider":"AcmeFlights",

      "emailMessageId":"string",

      "history":\[{ "at":"2025-06-10T09:00:00Z","actorId":"uuid","action":"title\_updated" }\]

    }

  }

}

**Idempotency & ordering:** comment/attachment creates require `X-Idempotency-Key`; message IDs monotonic per thread for deterministic merges.

---

## **API (REST summary; GraphQL equivalent fine)**

* `GET /notes?itineraryId&parentType&parentId`

* `POST /notes` `{ itineraryId, parentType, parentId, markdown, checklist, rating, tags }`

* `PUT /notes/{id}` (author only)

* `DELETE /notes/{id}` (author/Owner)

* `GET /comments?itineraryId&parentType&parentId`

* `POST /comments/threads` `{ itineraryId, parentType, parentId, textMarkdown, attachments[] }`

* `POST /comments/threads/{id}/reply`

* `PUT /comments/threads/{id}` `{ status, pinned }` (Owner/Editor for status; Owner for lock)

* `DELETE /comments/messages/{id}` (author/Owner)

* `POST /comments/messages/{id}/react` `{ emoji }`

* `POST /comments/messages/{id}/report` `{ reason }`

* `GET /provenance?parentType&parentId`

All writes enforce RBAC and itinerary binding; all text sanitized server-side.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Private note stays private**

Given I add a note on "Louvre" with rating 5

When another collaborator opens "Louvre"

Then they do not see my note

But I can promote it to a shared comment if I choose.

**AC2 — Thread with mentions & attachments**

Given a SavedItem

When I post a comment with @Samantha and attach a photo

Then Samantha receives a mention notification

And the photo renders as a thumbnail, stored with EXIF stripped.

**AC3 — Resolve & pin**

Given a discussion thread on a restaurant

When I mark it Resolved and Pin it

Then it moves to the resolved group and remains pinned at the top until unpinned.

**AC4 — Moderation hold**

Given a comment trips the profanity filter

Then it is visible only to its author with a "Held for review" banner

And collaborators see a placeholder until approved or edited.

**AC5 — Provenance transparency**

Given an item was imported via Email Scanner and later edited

When I open Provenance

Then I see "Imported from email" with timestamp and "Edited title by \<user\>" entries.

**AC6 — RBAC enforcement**

Given I am a Viewer

When I try to delete another user's comment

Then I receive a permission error

But I can add my own comment and delete my own.

**AC7 — Offline edit & sync**

Given I am offline

When I add a comment

Then it appears with a "Syncing…" badge

And it is posted to the server when connectivity resumes, preserving order.

**AC8 — Export redaction**

Given I export a shareable snapshot

Then private notes are excluded

And shared comments are included only if I choose "Include comments" in export options.

**AC9 — Anti-spam & rate limits**

Given a user posts \>5 messages in 30 seconds

Then the API returns 429 with a friendly cooldown message.

---

## **UX & Interaction Details**

* **Tabs:** Info ▸ Notes ▸ Comments ▸ Provenance.

* **Editor:** markdown shortcuts (**/** for checklist), paste-image to attach; 4k char soft limit with counter.

* **Thread list:** avatars, compact metadata, reaction bar; “Only my notes” filter; search within notes/comments (local index).

* **Moderation UI:** banners with “Edit & Resubmit” or “Appeal” (Owner review).

* **Accessibility:** ARIA live regions for new messages; keyboard shortcuts (Cmd/Ctrl+Enter to post); high-contrast compliant.

---

## **Engineering Notes (Definition of Done)**

* **Storage:**

  * `notes` and `comment_threads` tables keyed by `(itineraryId, parentType, parentId)`; `messages` child table; attachments in object storage with itinerary-scoped ACL.

  * Full-text index on notes/comments (tokenized by locale) for search.

* **Security & Safety:**

  * Markdown → HTML sanitizer (allow lists only); link rel=noopener,noreferrer; image proxy with size caps; EXIF stripped server-side.

  * Profanity/spam model (deterministic \+ heuristics); abuse rate limits; user/report logs (Story 15 escalation).

  * PII redaction in logs; signed, short-lived URLs for attachments.

* **Sync & Offline:**

  * Local queue for notes/comments; conflict policy: last-write-wins per message; thread status changes use ETags.

  * Idempotency on message create via client-supplied key; duplicate suppress.

* **Notifications:**

  * Mention detection server-side; pushes obey Quiet Hours/Trip-Only; digest grouping by thread.

* **Observability:**

  * Metrics: `notes_created`, `comments_created`, `messages_flagged`, `reports_submitted`, `attachments_uploaded`; trace message pipeline incl. moderation.

* **Testing:**

  * Unit: sanitizer, profanity/spam rules, RBAC checks, provenance aggregation.

  * Contract: API validators for markdown length, attachment types, rate limits.

  * E2E: offline add → sync; held comment flow; snapshot export redaction; mention notifications.

---

Got it — here’s **Story \#26** only. Say **“Next”** when you want me to continue.

# **Story 26 — Search Quality & Personalization (signals, re-ranking, learning loops)**

**As a** traveler  
 **I want** results that feel spot-on for *me* and *this trip*  
 **So that** I spend less time sifting and more time saving great options into my **Active Itinerary**.

---

## **Scope**

* **Signal platform:** collect and aggregate *trip-, user-, and context-level* signals (implicit \+ explicit) with strong privacy controls.

* **Personalization layer:** per-vertical re-rankers that blend base ranking (Story 16\) with **user profile (Story 13\)**, **itinerary context**, and **behavioral signals**.

* **Learning loops:** online click/save feedback, dwell time, hide/undo, and downstream conversions (booked/imported) feed models.

* **Cold start & guardrails:** sensible defaults by destination; strict safety to avoid over-filtering and echo chambers.

* **Explainability:** lightweight “Why this result” hints and debug vectors for internal QA.

* **A/B experimentation:** feature flags, offline evaluation with golden sets, online experiments with guardrails (latency, diversity, fairness).

* **Itinerary binding:** all Save/Hide actions remain scoped `{ itineraryId:<Active> }` and drive **within-trip** re-ranking first.

---

## **Key Signals**

### **A) User & profile**

* Locale, currency, **units**, **dietary**, **accessibility** needs, preferred transport modes, lodging prefs, party composition (adults/kids).

### **B) Itinerary context**

* Destination & neighborhood centroid(s), date window, current day phase (morning/afternoon/evening), weather stub (hook), trip theme tags (e.g., “family”, “hiking”, “foodie”), **saved mix** so far for diversity.

### **C) Behavioral**

* **Implicit:** impressions, card scroll depth, dwell time on details, map pin hovers, route previews.

* **Explicit:** Save (positive), Hide/Remove (negative), Add to Planner soon (strong positive), “Not for me” reason chips, price alerts set, share actions.

### **D) Provider quality**

* Reliability & freshness signals, price stability, review score coverage, venue hours completeness.

All signals are **anonymized and bucketed**; PII never goes to model training.

---

## **Ranking & Re-ranking**

1. **Base rank (per vertical)** — from Story 16 (cost, distance, time, popularity, etc.).

2. **Personalization re-rank** — pointwise/learning-to-rank score `S_personal`.

3. **Diversity & fairness** — MMR/intent-aware diversification to avoid near-duplicates and category monotony.

**Final score:**  
 `S_final = α * S_base + β * S_personal + γ * S_diversity + ε`

* `α, β, γ` tuned per vertical and user cold/warm state.

* **Cold start**: low β, rely on destination priors \+ diversity.

* **Warm**: increase β as we collect saves/clicks for this itinerary.

---

## **Personalization Features (examples)**

* **Accommodation:** value-for-money vs. user budget band; property types and amenities from profile; distance decay relative to trip centroid(s); kid-friendly boost if children present.

* **Gastronomy:** dietary compliance hard filter; cuisine preferences; mealtime window alignment (lunch/dinner); boost places near current day’s plan.

* **Entertainment/Events:** align to dates/time windows; popularity × novelty; indoor/outdoor based on weather hook; family-safe if needed.

* **Trails:** difficulty/duration vs. user maxima; proximity to transit or car availability; scenery/popularity blend.

**Diversity policy:** ensure top-N includes at least K distinct neighborhoods/categories; prevent \>2 near-duplicate venues in top 10\.

---

## **Feedback & Controls**

* **Inline controls:** “Not for me” (reasons: too far, too pricey, not my cuisine, accessibility issues), “More like this,” “Fewer like this”.

* **Why this result:** chip with 1–2 hints (“near your hotel”, “vegan-friendly”, “fits lunch window”).

* **Reset per trip:** user can reset personalization for the current itinerary.

---

## **Data Contracts (service-level)**

{

  "PersonalizationContext": {

    "userId": "uuid",

    "itineraryId": "uuid",

    "profile": {

      "dietary": \["vegan"\],

      "accessibility": \["wheelchair"\],

      "transportPrefs": \["train","walk"\],

      "lodgingPrefs": { "types": \["apartment","hotel"\], "minReview": 8.0 },

      "budgetBand": "mid"             // derived from past saves/prices

    },

    "itinerary": {

      "destination": { "lat": 48.8566, "lng": 2.3522 },

      "dateStart": "2026-06-10", "dateEnd": "2026-06-15",

      "centroids": \[{ "lat": 48.86, "lng": 2.34, "label": "Hotel" }\],

      "themeTags": \["family","art"\]

    },

    "behavior": {

      "positive": \[{ "section": "gastronomy", "features": { "cuisine": "vegan","priceBand":"$$" } }\],

      "negative": \[{ "section": "entertainment", "features": { "category":"nightlife" } }\],

      "recency": { "lastSaveAt": "2025-11-08T20:11:00Z" }

    }

  },

  "ReRankRequest": {

    "vertical": "gastronomy",

    "items": \[ { "id":"prov:123", "canonical": { /\* ... \*/ } } \],

    "context": { "$ref": "\#/definitions/PersonalizationContext" },

    "flags": { "debug": false }

  },

  "ReRankResponse": {

    "items": \[

      { "id":"prov:123", "score": 0.82, "explain": \["vegan", "near plan"\] }

    \],

    "diversity": { "categorySpread": { "italian": 2, "thai": 1 } },

    "meta": { "tookMs": 23 }

  }

}

---

## **Privacy & Safety**

* **Trip-scoped learning:** model state keyed by `{ userId, itineraryId }`; resets when trip ends unless user opts in to longer memory.

* **On-device heuristics (mobile)** for quick boosts (dietary/open-now) with server confirmation later.

* **No PII in model data**; aggregate counters only; configurable data retention; full opt-out.

* **Fairness checks:** monitor skew (e.g., over-boosting expensive venues); diversity constraints keep variety.

---

## **Offline & Latency**

* If personalization service is unavailable or times out (\>60–80ms budget), **fall back** to base rank \+ cached preferences; never block results.

* Cache recent re-rank outcomes for identical contexts for 2–5 minutes (per itinerary).

---

## **Telemetry & Evaluation**

* **Metrics:** top-N save-through rate (STR), click-through rate (CTR), dwell, eventual conversion/import rate, diversity score, latency.

* **Experiments:** percentage rollouts; guardrails (p95 latency, minimum diversity); auto-rollback on regressions.

* **Offline eval:** golden queries with labeled relevance; NDCG@k, MRR, coverage, fairness.

---

## **Acceptance Criteria (Gherkin)**

**AC1 — Diet & accessibility respected**

Given my profile has dietary=vegan and accessibility=wheelchair

When I search Gastronomy

Then top results exclude non-compliant venues

And “Why this result” hints include “vegan-friendly” or “wheelchair accessible” when applicable.

**AC2 — Trip-aware boosts**

Given my Active Itinerary center is near Montmartre and I saved two kid-friendly museums

When I search Entertainment

Then family-friendly options near Montmartre rank higher than distant nightlife.

**AC3 — Diversity guarantee**

Given many Italian restaurants match my prefs

When I search Gastronomy

Then the top 10 includes at least 3 distinct cuisines or neighborhoods per diversity policy.

**AC4 — Feedback affects ranking**

Given I choose "Not for me → too pricey" on several $$$ venues

When I search again

Then $$$ items are downranked and $$ items appear higher for this itinerary.

**AC5 — Cold start fallback**

Given I have no prior signals

When I search Trails

Then results rank by base quality and distance with broad diversity, without personal hints.

**AC6 — Latency guardrail**

Given the personalization service exceeds its SLA

When I search

Then results still return with base ranking,

And a debug flag (internal) notes "personalization\_timeout".

**AC7 — Privacy controls**

Given I opt out of personalization

When I search

Then only base ranking is used

And no new behavioral signals are stored.

---

## **UX & Interaction Details**

* **Explainability microcopy:** “Recommended because: near your hotel · vegan-friendly”. Keep ≤60 chars.

* **Controls:** *More like this* / *Fewer like this* chips on cards; *Reset trip personalization* in itinerary menu.

* **Map/list parity:** re-ranking applies equally; pins cluster logic honors the same ordering for “Top Picks” overlay.

* **Accessibility:** hints are screen-reader friendly; controls reachable via keyboard; no color-only explanations.

---

## **Engineering Notes (Definition of Done)**

* **Service:** `personalization` stateless API; gRPC/HTTP with 60–80ms p95 target; per-vertical models or rulesets.

* **Models:** start with **feature-engineered gradient boosting** or **scoring rules**; pave a path to LTR (LambdaMART/XGBoost) with periodic offline training.

* **Features pipeline:**

  * Real-time: from request context (profile/itinerary), recent saves/hides (Redis).

  * Batch: destination priors, long-term anonymized aggregates.

* **Storage & retention:** Redis for hot behavior (trip window), warehouse (BigQuery/Snowflake) for aggregated training data with strict retention and anonymization.

* **APIs:** `/rerank` per vertical; `/feedback` to ingest explicit signals (`save`, `hide`, `like`, reasons).

* **Failovers:** circuit breaker → base ranking; cached re-rank; config kill-switch.

* **Security:** no raw PII in logs or features; access scoped by service tokens; rate limiting on `/feedback`.

* **Testing:**

  * Unit: feature calc, diversity, feedback application.

  * Offline eval: NDCG@10/20 on golden sets; regression thresholds.

  * E2E: feedback loop visibly shifts ranks; opt-out respected; latency fallback path.

---

