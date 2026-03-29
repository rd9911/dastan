import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';
import 'package:dastan/src/features/search_platform/application/search_orchestrator.dart';

/// Unified search service that provides a simplified interface for vertical-specific searches.
/// This bridges the SearchOrchestrator with the existing vertical controllers.
class UnifiedSearchService {
  final SearchOrchestrator _orchestrator;

  UnifiedSearchService(this._orchestrator);

  /// Search for transport options.
  Future<SearchResponse> searchTransport({
    required String origin,
    required String destination,
    required DateTime departureDate,
    DateTime? returnDate,
    int passengers = 1,
    String locale = 'en',
    String currency = 'USD',
  }) async {
    return _orchestrator.search(
      SearchQuery(
        vertical: SearchVertical.transport,
        context: SearchContext(locale: locale, currency: currency),
        params: {
          'origin': origin,
          'destination': destination,
          'departureDate': departureDate.toIso8601String(),
          if (returnDate != null) 'returnDate': returnDate.toIso8601String(),
          'passengers': passengers,
        },
      ),
    );
  }

  /// Search for accommodation options.
  Future<SearchResponse> searchAccommodation({
    required String location,
    required DateTime checkIn,
    required DateTime checkOut,
    int guests = 1,
    int rooms = 1,
    String? propertyType,
    String locale = 'en',
    String currency = 'USD',
  }) async {
    return _orchestrator.search(
      SearchQuery(
        vertical: SearchVertical.accommodation,
        context: SearchContext(locale: locale, currency: currency),
        params: {
          'location': location,
          'checkIn': checkIn.toIso8601String(),
          'checkOut': checkOut.toIso8601String(),
          'guests': guests,
          'rooms': rooms,
          if (propertyType != null) 'propertyType': propertyType,
        },
      ),
    );
  }

  /// Search for entertainment options.
  Future<SearchResponse> searchEntertainment({
    required String location,
    String? category,
    DateTime? date,
    String locale = 'en',
    String currency = 'USD',
  }) async {
    return _orchestrator.search(
      SearchQuery(
        vertical: SearchVertical.entertainment,
        context: SearchContext(locale: locale, currency: currency),
        params: {
          'location': location,
          if (category != null) 'category': category,
          if (date != null) 'date': date.toIso8601String(),
        },
      ),
    );
  }

  /// Search for gastronomy options.
  Future<SearchResponse> searchGastronomy({
    required String location,
    String? cuisine,
    List<String>? dietaryFilters,
    bool? openNow,
    String locale = 'en',
    String currency = 'USD',
  }) async {
    return _orchestrator.search(
      SearchQuery(
        vertical: SearchVertical.gastronomy,
        context: SearchContext(
          locale: locale,
          currency: currency,
          userPrefs: dietaryFilters != null
              ? SearchPrefs(dietaryFilters: dietaryFilters)
              : null,
        ),
        params: {
          'location': location,
          if (cuisine != null) 'cuisine': cuisine,
          if (openNow != null) 'openNow': openNow,
        },
      ),
    );
  }

  /// Search for events.
  Future<SearchResponse> searchEvents({
    required String location,
    DateTime? startDate,
    DateTime? endDate,
    String? category,
    String locale = 'en',
    String currency = 'USD',
  }) async {
    return _orchestrator.search(
      SearchQuery(
        vertical: SearchVertical.events,
        context: SearchContext(locale: locale, currency: currency),
        params: {
          'location': location,
          if (startDate != null) 'startDate': startDate.toIso8601String(),
          if (endDate != null) 'endDate': endDate.toIso8601String(),
          if (category != null) 'category': category,
        },
      ),
    );
  }

  /// Search for trails.
  Future<SearchResponse> searchTrails({
    required String location,
    String? difficulty,
    double? minDistance,
    double? maxDistance,
    String locale = 'en',
    String currency = 'USD',
  }) async {
    return _orchestrator.search(
      SearchQuery(
        vertical: SearchVertical.trails,
        context: SearchContext(locale: locale, currency: currency),
        params: {
          'location': location,
          if (difficulty != null) 'difficulty': difficulty,
          if (minDistance != null) 'minDistance': minDistance,
          if (maxDistance != null) 'maxDistance': maxDistance,
        },
      ),
    );
  }

  /// Generic search by vertical.
  Future<SearchResponse> search({
    required SearchVertical vertical,
    required Map<String, dynamic> params,
    String locale = 'en',
    String currency = 'USD',
    SearchPrefs? userPrefs,
    int page = 0,
    int pageSize = 20,
    bool debugRanking = false,
  }) async {
    return _orchestrator.search(
      SearchQuery(
        vertical: vertical,
        context: SearchContext(
          locale: locale,
          currency: currency,
          userPrefs: userPrefs,
        ),
        params: params,
        page: page,
        pageSize: pageSize,
        flags: SearchFlags(debugRanking: debugRanking),
      ),
    );
  }
}

/// Provider for the unified search service.
final unifiedSearchServiceProvider = Provider<UnifiedSearchService>((ref) {
  return UnifiedSearchService(ref.watch(searchOrchestratorProvider));
});

/// Extension to convert SearchResultItem to vertical-specific models.
extension SearchResultItemExtension on SearchResultItem {
  /// Convert to a map that can be used by vertical-specific constructors.
  Map<String, dynamic> toVerticalMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'price': price,
      'currency': priceCurrency,
      'rating': rating,
      'reviewCount': reviewCount,
      'latitude': latitude,
      'longitude': longitude,
      ...?details,
    };
  }
}

/// State for unified search results.
class UnifiedSearchState {
  final SearchResponse? response;
  final bool isLoading;
  final String? error;
  final SearchVertical? currentVertical;

  const UnifiedSearchState({
    this.response,
    this.isLoading = false,
    this.error,
    this.currentVertical,
  });

  UnifiedSearchState copyWith({
    SearchResponse? response,
    bool? isLoading,
    String? error,
    SearchVertical? currentVertical,
  }) {
    return UnifiedSearchState(
      response: response ?? this.response,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentVertical: currentVertical ?? this.currentVertical,
    );
  }

  List<SearchResultItem> get items => response?.items ?? [];
  int get totalItems => response?.totalItems ?? 0;
  bool get hasMore => (response?.nextCursor != null);
}

/// Notifier for unified search state.
class UnifiedSearchNotifier extends Notifier<UnifiedSearchState> {
  @override
  UnifiedSearchState build() => const UnifiedSearchState();

  /// Perform a search.
  Future<void> search(SearchQuery query) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      currentVertical: query.vertical,
    );

    try {
      final service = ref.read(unifiedSearchServiceProvider);
      final response = await service.search(
        vertical: query.vertical,
        params: query.params,
        locale: query.context.locale,
        currency: query.context.currency,
        userPrefs: query.context.userPrefs,
        page: query.page,
        pageSize: query.pageSize,
      );

      state = state.copyWith(response: response, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Load next page.
  Future<void> loadNextPage() async {
    if (state.response == null || state.response!.nextCursor == null) return;

    final currentPage = state.response!.page;
    // Would extract page from cursor in real implementation
    await search(
      SearchQuery(
        vertical: state.currentVertical!,
        context: const SearchContext(),
        params: {},
        page: currentPage + 1,
      ),
    );
  }

  /// Clear results.
  void clear() {
    state = const UnifiedSearchState();
  }
}

/// Provider for unified search notifier.
final unifiedSearchNotifierProvider =
    NotifierProvider<UnifiedSearchNotifier, UnifiedSearchState>(
      UnifiedSearchNotifier.new,
    );
