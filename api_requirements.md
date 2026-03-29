# External API Requirements

> Comprehensive list of API requests needed for the Dastan project to support search verticals.

## 1. Locations

Core service for geocoding and place suggestions, used by all verticals as an entry point.

### A. Autocomplete
**Purpose**: Suggest places (cities, airports, districts) as user types.
- **Request**: `GET /api/locations/autocomplete`
  - `q`: Partial query string (min 3 chars)
  - `types`: Optional filter (e.g., `(cities)`, `airport`, `address`)
  - `language`: User's locale (e.g., `en`)
- **Response**: List of basic location objects `{ id, name, country, subway_station, airport_code }`.

### B. Place Details (Geocoding)
**Purpose**: Resolve a selected suggested item to full coordinates and metadata.
- **Request**: `GET /api/locations/details`
  - `place_id`: The ID returned from autocomplete
- **Response**: Full location object `{ lat, lng, viewport {ne, sw}, formatted_address, timezone }`.

### C. Reverse Geocoding
**Purpose**: Get place name from coordinates (for "My Location" features).
- **Request**: `GET /api/locations/reverse`
  - `lat`, `lng`: Coordinates
- **Response**: Nearest valid place/address info.

---

## 2. Transportation

Covers flights, trains, and buses.

### A. Code/Station Lookup
**Purpose**: Validate origin/destination IATA codes or station identifiers if not provided by generic location search.
- **Request**: `GET /api/transport/lookup`
  - `q`: Query string
  - `type`: `airport` | `station`

### B. Price Calendar
**Purpose**: Show cheapest price per day for a route (for the month view).
- **Request**: `GET /api/transport/calendar`
  - `origin`: IATA/Station code
  - `destination`: IATA/Station code
  - `start_date`: Range start
  - `end_date`: Range end
  - `currency`: User preference (e.g., `USD`)
- **Response**: Map of `date -> min_price`.

### C. Search Offers
**Purpose**: Main search for transport options.
- **Request**: `GET /api/transport/search`
  - `trip_type`: `one_way` | `round_trip` | `multi_city`
  - `legs`: List of `{ origin, destination, date }`
  - `passengers`: Map `{ adults: int, children: int, infants: int }`
  - `cabin_class`: `economy` | `business` | `first`
  - `filters`:
    - `max_stops`: int (0, 1, 2+)
    - `refundable_only`: bool
    - `transport_mode`: `flight` | `train` | `bus` (optional, default any)
- **Response**: List of `TransportOffer` items (price, total duration, list of segments).

---

## 3. Accommodation

Hotels, hostels, apartments.

### A. Search Properties
**Purpose**: Find places to stay.
- **Request**: `GET /api/accommodation/search`
  - `location`: `{ lat, lng }` or `place_id`
  - `check_in`: Date
  - `check_out`: Date
  - `guests`: List of rooms configs e.g. `[{adults: 2}, {adults: 1, children: 1, child_ages: [8]}]`
  - `filters`:
    - `price_min`, `price_max`
    - `property_types`: List [`hotel`, `apartment`, `hostel`...]
    - `min_stars`: 1-5
    - `min_rating`: 0-10
    - `amenities`: List [`pool`, `wifi`, `parking`, `pet_friendly`, `ac`]
    - `cancellation`: `free` (bool)
  - `sort`: `recommended` | `price` | `rating` | `distance_to_poi`
- **Response**: List of property summaries.

### B. Property Details
**Purpose**: Get full amenities, photos, and room availability for a specific property.
- **Request**: `GET /api/accommodation/details`
  - `property_id`: External ID
  - `check_in`, `check_out`, `guests`: (To get precise room availability)
- **Response**: Detailed object with `rooms` list, full description, all amenities, policies.

---

## 4. Entertainment

Museums, landmarks, attractions using tags.

### A. Place Search
**Purpose**: Find things to do.
- **Request**: `GET /api/entertainment/search`
  - `center`: `{ lat, lng }` (search around this point)
  - `radius`: meters
  - `tags`: List [`museum`, `landmark`, `park`, `zoo`...] (mapped from specific filters)
  - `date`: Optional (to check generic opening hours)
  - `filters`:
    - `open_now`: bool
    - `free_entry`: bool
    - `kid_friendly`: bool
- **Response**: List of venues with tags, rating, thumbnail.

### B. Venue Details
**Purpose**: Get specific info.
- **Request**: `GET /api/entertainment/details`
  - `venue_id`: External ID
- **Response**: Opening hours (all week), website, phone, full gallery, description.

---

## 5. Gastronomy

Restaurants, cafes, bars.

### A. Restaurant Search
**Purpose**: Find dining options.
- **Request**: `GET /api/gastronomy/search`
  - `center`: `{ lat, lng }`
  - `radius`: meters
  - `filters`:
    - `cuisine`: List [`italian`, `chinese`, `vegetarian`...]
    - `dietary`: List [`vegan`, `gluten_free`, `halal`...]
    - `price_band`: `budget` | `moderate` | `expensive` | `luxury`
    - `min_rating`: 0-5
    - `open_now`: bool
    - `atmosphere`: `quiet` | `lively` (optional)
  - `sort`: `recommended` | `distance` | `rating`
- **Response**: List of restaurants with price level, cuisines tags, rating, thumbnail.

### B. Restaurant Details
**Purpose**: Get full details including menu highlights.
- **Request**: `GET /api/gastronomy/details`
  - `place_id`: External ID
- **Response**: Full menu (or link), opening hours, reservation link, phone.

---

## 6. Events

Concerts, festivals, match-day events.

### A. Event Search
**Purpose**: Find scheduled events.
- **Request**: `GET /api/events/search`
  - `location`: `{ lat, lng }`
  - `date_range`: `{ start, end }` (Required)
  - `filters`:
    - `categories`: List [`concert`, `sports`, `theatre`, `festival`]
    - `free`: bool
    - `family_friendly`: bool
- **Response**: List of events with time, venue, ticket price range, category.

### B. Event Details
**Purpose**: Get full description and ticket links.
- **Request**: `GET /api/events/details`
  - `event_id`: External ID
- **Response**: Full lineup (if concert), ticket platform links, seating map (optional), precise venue address.

---

## 7. Trails

Hiking and walking routes.

### A. Trail Search
**Purpose**: Find outdoor routes.
- **Request**: `GET /api/trails/search`
  - `location`: `{ lat, lng }`
  - `filters`:
    - `difficulty`: `easy` | `moderate` | `hard`
    - `length_min`, `length_max` (km)
    - `elevation_gain` (min/max)
    - `loop_trail`: bool
    - `kid_friendly`: bool
- **Response**: List of trails with length, estimated time, difficulty, thumbnail.

### B. Trail Details (GPX)
**Purpose**: Get detailed route geometry (e.g., GPX/Polyline) for map display.
- **Request**: `GET /api/trails/details`
  - `trail_id`: External ID
- **Response**: Full description, waypoints/polyline geometry for map rendering, user tips.
