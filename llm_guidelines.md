# LLM Guidelines for This Project (Riverpod Architecture)

## 1. Project overview

This is an itinerary-planning app.

Core concept:

- The user must always have an **Active Itinerary**.  
- All searches (transport, accommodation, entertainment, gastronomy, trails, events, etc.) happen **within** the active itinerary.  
- Whenever the user saves an item, it is automatically bound to:  
  - `itineraryId`  
  - `section` (Transport, Accommodation, Entertainment, Gastronomy, Trails, Events, etc.)  
- Saved items must:  
  - Appear immediately in the correct itinerary section.  
  - Be available offline.  
  - Be deduplicated per itinerary + section using a deterministic `dedupeKey`.  
- There is a single **Itinerary Map** that shows all saved items for the Active Itinerary with layer toggles.

Stories 1–8 define the MVP scope (Active Itinerary, six search verticals, Itinerary Map). Later stories (Planner, Email Scanner, Collaboration, Ranking, Billing, etc.) are **future work**. You may add **extension points / TODOs**, but must not implement them fully unless explicitly asked.

---

## 2. Architecture: Riverpod 4-Layer Model

We follow the **Riverpod Architecture** with four layers: **Presentation, Application, Domain, Data**. :contentReference[oaicite:1]{index=1}  

Unidirectional dependencies:

> Presentation → Application → Domain → Data

Domain is in the center and is importable by all other layers, but it does not depend on them.

### 2.1 Presentation layer (UI + Controllers)

**Goal**: Show application state and respond to user interaction.

Contains:

- **Widgets**: pages, screens, and reusable UI components.
- **Controllers**: Riverpod `Notifier` / `AsyncNotifier` classes (or their generated variants) that:
  - Expose `State` or `AsyncValue<State>` to widgets.
  - Call **Application services** to perform use cases.
  - Transform errors into user-friendly UI state (loading/error/empty).

Rules:

- Widgets should be as dumb as possible:
  - No business rules.
  - No direct access to repositories or data sources.
  - They only talk to **controllers** via providers.
- Controllers:
  - Live in the **presentation layer** of a feature.
  - Depend on **application services** via providers.
  - Should not depend directly on repositories or data sources.

### 2.2 Application layer (Services / Use cases)

**Goal**: Encapsulate use-case / orchestration logic that:

- Combines multiple repositories or data sources.
- Is reused across multiple controllers or features.
- Implements business workflows (e.g. “save item with dedupe + offline queue + sync”, “prefill search with itinerary + previous saves”, etc.).

Application layer contains:

- **Services** (sometimes called “use case” or “interactors”), e.g.:
  - `SaveItemService`
  - `SearchTransportService`
  - `ItineraryMapService`
- These services:
  - Depend on **domain models** and **repositories**.
  - Expose methods with **domain types** (no DTOs).

### 2.3 Domain layer (Models / Entities)

**Goal**: Represent our **business concepts** as immutable data classes.

Domain contains:

- Model classes like:
  - `Itinerary`
  - `SavedItem`
  - `TransportOffer`, `AccommodationOption`, `Event`, `Trail`, etc.
- Requirements (per article): :contentReference[oaicite:2]{index=2}  
  - Immutable (`const` / `freezed`).
  - Support serialization (`fromJson` / `toJson`) when needed.
  - Support value equality (`==` / `hashCode`).

Domain **does not know**:

- How data is stored (Supabase, SQLite, HTTP, etc.).
- How UI looks.
- How Riverpod providers are wired.

Domain is the **shared language** between layers. Use it everywhere (presentation, application, data) as the primary type for app logic.

### 2.4 Data layer (Data sources, DTOs, repositories)

**Goal**: Handle all data access.

Contains:

- **Data sources**:
  - Supabase clients, HTTP/Dio APIs, local storage (Drift), etc.
- **DTOs** (data transfer objects):
  - Raw representations used at the boundaries (e.g., JSON from Supabase).
- **Repositories**:
  - Convert DTOs ↔ domain models.
  - Decide which data source to use (remote vs. local).
  - Implement caching and sync strategies.

Rules:

- Only repositories are visible to **upper layers**:
  - Application services depend on repositories, not on data sources directly.
- DTOs and data sources should **not leak** beyond the data layer.
- Repositories enforce the **single source of truth** for persistent data (Supabase / Drift).

---

## 3. Tech stack & libraries

Use these technologies consistently across all features:

### 3.1 Flutter & state management

- Flutter 3.x, Material 3.
- **Riverpod**:
  - Use `riverpod` / `flutter_riverpod` + code generation (`riverpod_annotation` + `build_runner`) where appropriate.
  - `Notifier` / `AsyncNotifier` (and generated `*.g.dart`) for controllers.
- **Navigation**:
  - GoRouter with route guards that enforce the Active Itinerary.

### 3.2 Data & backend

- **Supabase**:
  - Postgres for persistent data.
  - Auth, Storage, Row Level Security.
  - Edge Functions for server logic where required.
- **Drift (SQLite)**:
  - Local caches (search results, saved items, itineraries).
  - Offline queue for operations to sync when online.
- **HTTP**:
  - `dio` for custom HTTP calls if needed.

### 3.3 Models & utilities

- `freezed` + `json_serializable` for domain models and DTOs.
- `mocktail` for testing.
- `flutter_test`, `integration_test` for widget & e2e tests.

---

## 4. Project & folder structure

Use a **feature-first, layered** structure inspired by the Riverpod architecture. :contentReference[oaicite:3]{index=3}  

Base path (mobile app):

```text
apps/mobile/lib/src/
  app/                 # Root app, theme, router
  core/                # Shared cross-feature code
    presentation/
    application/
    domain/
    data/
  features/
    itineraries/
      presentation/
      application/
      domain/
      data/
    transport/
      presentation/
      application/
      domain/
      data/
    accommodation/
      ...
    entertainment/
    gastronomy/
    events/
    trails/
    itinerary_map/
````

### 4.1 Layer responsibilities per feature

For each feature (e.g. `transport`):

* `features/transport/presentation/`

  * Screens: `transport_search_page.dart`, `transport_results_page.dart`, etc.
  * Widgets: feature-specific UI components.
  * Controllers (Riverpod Notifiers): `transport_search_controller.dart`, etc.
  * Providers for controllers.

* `features/transport/application/`

  * Services / use cases:

    * `transport_search_service.dart`
    * `transport_save_offer_service.dart`
  * Logic that orchestrates **multiple repositories** or cross-feature workflows.

* `features/transport/domain/`

  * Domain models:

    * `transport_offer.dart`
    * `transport_leg.dart`
  * Pure, immutable data classes.

* `features/transport/data/`

  * DTOs & mappers:

    * `transport_offer_dto.dart`
  * Data sources:

    * `transport_remote_data_source.dart`
  * Repositories:

    * `transport_repository.dart`

### 4.2 Core layer

`core/` holds cross-feature concepts:

* `core/domain/`:

  * `itinerary.dart`, `saved_item.dart`, shared value objects.
* `core/data/`:

  * `supabase_client_provider.dart`, `drift_database.dart`, generic `sync_queue_dao.dart`, etc.
* `core/application/`:

  * `save_item_service.dart`, `sync_service.dart`, etc., if they are shared.
* `core/presentation/`:

  * App shell, global app bar with Active Itinerary chip, common widgets.

### 4.3 Tests folder structure

Under `apps/mobile/test/src/`, mirror `lib/src/`:

```text
apps/mobile/test/src/
  features/
    transport/
      presentation/
        transport_search_page_test.dart
        transport_search_controller_test.dart
      application/
        transport_search_service_test.dart
      domain/
        transport_offer_test.dart
      data/
        transport_repository_test.dart
  core/
    ...
integration_test/
  story1_active_itinerary_flow_test.dart
  story2_transport_search_flow_test.dart
  ...
```

---

## 5. Riverpod providers & DI

### 5.1 Where providers live

* **Feature-scoped providers** live inside the feature folder.
* **Global / shared providers** (e.g. Supabase client, Drift DB) live in `core/data` or `core/application`.

Example (pseudo):

```dart
// core/data/supabase_client_provider.dart
@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  // ...
}
```

```dart
// features/transport/data/transport_repository.dart
@riverpod
TransportRepository transportRepository(TransportRepositoryRef ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseTransportRepository(client: client);
}
```

```dart
// features/transport/application/transport_search_service.dart
@riverpod
TransportSearchService transportSearchService(TransportSearchServiceRef ref) {
  final repo = ref.watch(transportRepositoryProvider);
  return TransportSearchService(repo: repo);
}
```

```dart
// features/transport/presentation/transport_search_controller.dart
@riverpod
class TransportSearchController extends AsyncNotifier<TransportSearchState> {
  @override
  FutureOr<TransportSearchState> build() {
    // initial state
  }

  Future<void> search(/* params */) async {
    final service = ref.read(transportSearchServiceProvider);
    // call service, update state
  }
}
```

### 5.2 Rules

* **Controllers** depend only on **application services** (and sometimes domain utilities).
* Application services depend on **repositories**.
* Repositories depend on **data sources / clients** and **DTOs**, and map them to **domain models**.
* Widgets use `ref.watch(controllerProvider)` to read state; they do not call repositories or data sources directly.

---

## 6. TDD: how you should work

Always follow **Test-Driven Development**:

1. **Read the relevant story** in `User_stories.md` and the related task in `tasks.md`.
2. Decide which **layer(s)** are affected (presentation, application, domain, data).
3. **Write or extend tests first**, in the appropriate layer:

   * Domain: pure model / value object tests.
   * Data: repository + mappers + data source tests (with fakes/mocks).
   * Application: service / use case tests.
   * Presentation: controller tests, widget tests, golden tests.
   * E2E: `integration_test` flows across layers.
4. Run tests:

   * They **must fail** initially (red).
5. Implement the **minimal** production code to make tests pass (green).
6. Refactor with tests green:

   * Keep behavior the same.
   * Do not weaken coverage.

Never:

* Implement production code first.
* Skip tests because a change looks “small”.
* Change test expectations just to make failing tests pass (unless the story/requirements were mis-encoded).

---

## 7. How to interpret tasks & stories

When a task says “implement X”:

1. **Locate the feature + layer**:

   * Example: “Implement save/unsave behavior with dedupe and offline queue”:

     * Domain: ensure `SavedItem` models support required fields.
     * Data: implement `SavedItemRepository`, Drift tables, Supabase sync.
     * Application: `SaveItemService` combining dedupe + offline queue + sync.
     * Presentation: controllers & UI buttons calling `SaveItemService`.

2. **Respect responsibilities**:

   * Do not put network code in controllers.
   * Do not put complex business logic inside widgets.
   * Do not bypass repositories to call Supabase directly from services or controllers.

3. **Map acceptance criteria to tests**:

   * Each AC should have at least one test in the appropriate layer.
   * For full flows, write **integration tests** (e.g., Story 1: create itinerary → set Active Itinerary → save item → see in overview & map).

4. **Keep architecture consistent**:

   * When adding a new feature, follow the same 4-layer pattern and folder structure.
   * Reuse existing domain models and services where possible.

---

## 8. Things you must NOT do

* Do not bypass the architecture:

  * No direct Supabase/HTTP calls from widgets or controllers.
  * No data-layer types (DTOs, raw JSON) leaking into presentation or application layers.
* Do not mix layers in the same file.
* Do not introduce new major libraries (state management, navigation, persistence) without explicit instructions.
* Do not modify `User_stories.md` or `tasks.md`.
* Do not silently change behavior that affects:

  * Active Itinerary selection / enforcement.
  * Save/unsave semantics and dedupe.
  * Offline queue/sync behavior.
  * Core invariants in domain models.
* Do not remove or weaken tests unless asked and the reason is clearly explained in comments.

---

## 9. Summary

* **Use the Riverpod 4-layer architecture**: presentation, application, domain, data.
* **Keep responsibilities clear and dependencies one-way**: UI → controllers → services → repositories → data sources.
* **Follow TDD**: write tests first, then implement minimal code to pass them.
* **Preserve business rules** from the user stories, especially around the Active Itinerary and saved items.
* **Keep the codebase consistent** in structure, naming, and use of Riverpod.

If a task or story seems ambiguous, choose the safest, most MVP-friendly interpretation and leave a clear `TODO` comment referencing the story and what needs clarification.
