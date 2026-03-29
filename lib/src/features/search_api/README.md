# Search API Feature

> REST-like API layer for search operations

## Overview

The Search API feature provides a structured API layer on top of the Search Platform, implementing rate limiting, caching, idempotent saves, and RBAC.

## Structure

```
search_api/
├── application/           # Service Layer (3 files)
│   ├── search_api_controller.dart
│   └── search_save_helper.dart
└── domain/                # Models (3 files)
    ├── search_api_models.dart
    ├── search_api_models.freezed.dart
    └── search_filters.dart
```

## API Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/api/search/{vertical}` | GET | Execute search with filters |
| `/api/search/suggest` | GET | Autocomplete suggestions |
| `/api/search/transport/min-price-calendar` | GET | Price calendar grid |
| `/api/search/{vertical}/save` | POST | Save item to itinerary |

## Key Components

### SearchApiController

Main API controller with:
- Rate limiting (per-user, per-vertical)
- Response caching (2 min TTL)
- Bounds filtering (viewport-based)
- Query validation and clamping

```dart
class SearchApiController {
  final SearchOrchestrator _orchestrator;
  final RateLimiter _rateLimiter;
  final SearchApiCache _cache;
  
  Future<SearchApiResult> search(SearchApiQuery query, {String? userId});
  Future<SuggestApiResponse> suggest({...});
  Future<PriceCalendarResponse> getTransportPriceCalendar({...});
}
```

### SearchSaveHelper

Handles save operations with:
- Idempotency (X-Idempotency-Key)
- Deduplication (canonical dedupe key)
- RBAC enforcement
- Active itinerary binding

```dart
class SearchSaveHelper {
  Future<SaveApiResult> save({
    required SearchApiSavePayload payload,
    required String userId,
    String? itineraryId,
    required String idempotencyKey,
  });
}
```

## Models

### SearchApiQuery

```dart
@freezed
abstract class SearchApiQuery with _$SearchApiQuery {
  const factory SearchApiQuery({
    required SearchVertical vertical,
    String? q,
    @Default('en') String locale,
    @Default('USD') String currency,
    SearchBounds? bounds,
    @Default(false) bool boundsOnly,
    @Default(SearchApiSort.relevance) SearchApiSort sort,
    @Default(20) int pageSize,
    String? cursor,
    @Default(SearchApiFlags()) SearchApiFlags flags,
  }) = _SearchApiQuery;
}
```

### SearchApiError

Standardized error responses:

```dart
enum ErrorCode {
  MISSING_ACTIVE_ITINERARY,
  FORBIDDEN,
  QUOTA_EXCEEDED,
  UNPROCESSABLE_ENTITY,
}

@freezed
abstract class SearchApiError with _$SearchApiError {
  const factory SearchApiError({
    required String code,
    required String message,
    @Default([]) List<SearchApiErrorDetail> details,
  }) = _SearchApiError;
}
```

## Filters

### OpenNowFilter

```dart
class OpenNowFilter {
  static bool isOpen({
    required Map<String, String>? openingHours,
    required String timezone,
    DateTime? checkTime,
  });
}
```

### BoundsFilter

```dart
class BoundsFilter {
  static List<SearchResultItem> filterByBounds(
    List<SearchResultItem> items,
    double north, south, east, west,
  );
}
```

### TextSanitizer

```dart
class TextSanitizer {
  static String stripHtml(String text);
  static String? sanitizeUrl(String? url);
}
```

## Rate Limiting

Per-user, per-vertical limits:

```dart
class RateLimiter {
  final int maxRequests;      // Default: 100
  final Duration window;      // Default: 1 minute
  
  bool checkLimit(String userId, SearchVertical vertical);
  int getRetryAfter(String userId);
}
```

## RBAC

Permission checking:

```dart
abstract class RbacChecker {
  Future<bool> canWrite(String userId, String itineraryId);
}
```

## Providers

| Provider | Type | Purpose |
|----------|------|---------|
| `searchApiControllerProvider` | `Provider` | API controller |
| `searchSaveHelperProvider` | `Provider` | Save helper |

## Dependencies

- `search_platform` - Search orchestration
- `core/domain/saved_item` - SavedItem model
- `itineraries` - Active itinerary resolution
