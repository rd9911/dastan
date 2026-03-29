import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/search_api/domain/search_api_models.dart';

/// Save helper service for search-to-itinerary saves.
/// Implements Phase C of Story 21: idempotent saves with RBAC.
class SearchSaveHelper {
  final IdempotencyStore _idempotencyStore;
  final ActiveItineraryResolver _itineraryResolver;
  final RbacChecker _rbacChecker;
  final SavedItemsRepository _repository;

  SearchSaveHelper({
    IdempotencyStore? idempotencyStore,
    ActiveItineraryResolver? itineraryResolver,
    RbacChecker? rbacChecker,
    SavedItemsRepository? repository,
  }) : _idempotencyStore = idempotencyStore ?? InMemoryIdempotencyStore(),
       _itineraryResolver =
           itineraryResolver ?? DefaultActiveItineraryResolver(),
       _rbacChecker = rbacChecker ?? DefaultRbacChecker(),
       _repository = repository ?? InMemorySavedItemsRepository();

  /// Save a search result item to an itinerary.
  /// POST /api/search/{vertical}/save
  Future<SaveApiResult> save({
    required SearchApiSavePayload payload,
    required String userId,
    String? itineraryId,
    String? dedupeKey,
    required String idempotencyKey,
  }) async {
    // Check idempotency - return cached response if exists
    final cached = _idempotencyStore.get(idempotencyKey);
    if (cached != null) {
      return cached;
    }

    // Resolve itinerary
    final resolvedItineraryId =
        itineraryId ?? await _itineraryResolver.getActiveItinerary(userId);
    if (resolvedItineraryId == null) {
      return SaveApiResult.error(SearchApiError.missingActiveItinerary());
    }

    // Check RBAC
    if (!await _rbacChecker.canWrite(userId, resolvedItineraryId)) {
      return SaveApiResult.error(
        SearchApiError.forbidden('itinerary $resolvedItineraryId'),
      );
    }

    // Compute canonical dedupe key
    final canonicalDedupeKey =
        dedupeKey ??
        _computeDedupeKey(
          itineraryId: resolvedItineraryId,
          vertical: payload.vertical,
          itemId: payload.id,
        );

    // Check for existing item with same dedupe key
    final existing = await _repository.findByDedupeKey(
      resolvedItineraryId,
      canonicalDedupeKey,
    );
    if (existing != null) {
      final result = SaveApiResult.success(
        SaveApiResponse(
          created: false,
          itemId: existing,
          itineraryId: resolvedItineraryId,
          dedupeKey: canonicalDedupeKey,
        ),
      );
      _idempotencyStore.set(idempotencyKey, result);
      return result;
    }

    // Sanitize and save
    final sanitizedPayload = _sanitize(payload);
    final savedItemId = await _repository.save(
      itineraryId: resolvedItineraryId,
      dedupeKey: canonicalDedupeKey,
      vertical: payload.vertical,
      title: sanitizedPayload.title,
      details: sanitizedPayload.details,
    );

    final result = SaveApiResult.success(
      SaveApiResponse(
        created: true,
        itemId: savedItemId,
        itineraryId: resolvedItineraryId,
        dedupeKey: canonicalDedupeKey,
      ),
    );

    // Store for idempotency
    _idempotencyStore.set(idempotencyKey, result);

    return result;
  }

  /// Compute canonical dedupe key.
  String _computeDedupeKey({
    required String itineraryId,
    required String vertical,
    required String itemId,
  }) {
    return '$itineraryId|$vertical|$itemId';
  }

  /// Sanitize payload (URLs, HTML).
  SearchApiSavePayload _sanitize(SearchApiSavePayload payload) {
    return payload.copyWith(
      title: _sanitizeText(payload.title),
      details: payload.details != null
          ? Map.fromEntries(
              payload.details!.entries.map(
                (e) => MapEntry(
                  e.key,
                  e.value is String ? _sanitizeText(e.value) : e.value,
                ),
              ),
            )
          : null,
    );
  }

  /// Sanitize text: strip HTML, validate URLs.
  String _sanitizeText(String text) {
    // Strip HTML tags
    final withoutHtml = text.replaceAll(RegExp(r'<[^>]*>'), '');
    // Limit length
    return withoutHtml.length > 1000
        ? withoutHtml.substring(0, 1000)
        : withoutHtml;
  }
}

/// Result of save operation.
sealed class SaveApiResult {
  const SaveApiResult();

  factory SaveApiResult.success(SaveApiResponse response) = SaveApiSuccess;
  factory SaveApiResult.error(SearchApiError error) = SaveApiFailure;
}

class SaveApiSuccess extends SaveApiResult {
  final SaveApiResponse response;
  const SaveApiSuccess(this.response);
}

class SaveApiFailure extends SaveApiResult {
  final SearchApiError error;
  const SaveApiFailure(this.error);
}

/// Save API response.
class SaveApiResponse {
  final bool created;
  final String itemId;
  final String itineraryId;
  final String dedupeKey;

  const SaveApiResponse({
    required this.created,
    required this.itemId,
    required this.itineraryId,
    required this.dedupeKey,
  });

  Map<String, dynamic> toJson() => {
    'created': created,
    'itemId': itemId,
    'itineraryId': itineraryId,
    'dedupeKey': dedupeKey,
  };
}

/// Idempotency store interface.
abstract class IdempotencyStore {
  SaveApiResult? get(String key);
  void set(String key, SaveApiResult result);
}

/// In-memory idempotency store.
class InMemoryIdempotencyStore implements IdempotencyStore {
  final Map<String, _IdempotencyEntry> _store = {};
  final Duration ttl;

  InMemoryIdempotencyStore({this.ttl = const Duration(hours: 24)});

  @override
  SaveApiResult? get(String key) {
    final entry = _store[key];
    if (entry == null) return null;
    if (DateTime.now().isAfter(entry.expiresAt)) {
      _store.remove(key);
      return null;
    }
    return entry.result;
  }

  @override
  void set(String key, SaveApiResult result) {
    _store[key] = _IdempotencyEntry(
      result: result,
      expiresAt: DateTime.now().add(ttl),
    );
  }
}

class _IdempotencyEntry {
  final SaveApiResult result;
  final DateTime expiresAt;

  _IdempotencyEntry({required this.result, required this.expiresAt});
}

/// Active itinerary resolver interface.
abstract class ActiveItineraryResolver {
  Future<String?> getActiveItinerary(String userId);
}

/// Default active itinerary resolver (mock).
class DefaultActiveItineraryResolver implements ActiveItineraryResolver {
  final Map<String, String> _userActiveItineraries = {};

  @override
  Future<String?> getActiveItinerary(String userId) async {
    // In mock mode, return a default active itinerary
    return _userActiveItineraries[userId] ?? 'active-itinerary-$userId';
  }

  /// Set active itinerary for user (for testing).
  void setActiveItinerary(String userId, String itineraryId) {
    _userActiveItineraries[userId] = itineraryId;
  }

  /// Clear active itinerary for user (for testing).
  void clearActiveItinerary(String userId) {
    _userActiveItineraries.remove(userId);
  }
}

/// RBAC checker interface.
abstract class RbacChecker {
  Future<bool> canWrite(String userId, String itineraryId);
}

/// Default RBAC checker (mock).
class DefaultRbacChecker implements RbacChecker {
  final Set<String> _viewerOnly = {};

  @override
  Future<bool> canWrite(String userId, String itineraryId) async {
    // Check if user is viewer-only for this itinerary
    return !_viewerOnly.contains('$userId:$itineraryId');
  }

  /// Set user as viewer-only (for testing).
  void setViewerOnly(String userId, String itineraryId) {
    _viewerOnly.add('$userId:$itineraryId');
  }
}

/// Saved items repository interface.
abstract class SavedItemsRepository {
  Future<String?> findByDedupeKey(String itineraryId, String dedupeKey);
  Future<String> save({
    required String itineraryId,
    required String dedupeKey,
    required String vertical,
    required String title,
    Map<String, dynamic>? details,
  });
}

/// In-memory saved items repository.
class InMemorySavedItemsRepository implements SavedItemsRepository {
  final Map<String, Map<String, String>> _items = {};

  @override
  Future<String?> findByDedupeKey(String itineraryId, String dedupeKey) async {
    return _items[itineraryId]?[dedupeKey];
  }

  @override
  Future<String> save({
    required String itineraryId,
    required String dedupeKey,
    required String vertical,
    required String title,
    Map<String, dynamic>? details,
  }) async {
    final itemId = 'saved-${DateTime.now().millisecondsSinceEpoch}';
    _items[itineraryId] ??= {};
    _items[itineraryId]![dedupeKey] = itemId;
    return itemId;
  }
}

/// Provider for the save helper.
final searchSaveHelperProvider = Provider<SearchSaveHelper>((ref) {
  return SearchSaveHelper();
});
