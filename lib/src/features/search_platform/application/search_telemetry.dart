/// Telemetry events for search platform.
class SearchTelemetry {
  /// Log search query.
  static Map<String, dynamic> searchQuery({
    required String searchRequestId,
    required String vertical,
    required int pageSize,
  }) {
    return {
      'event': 'search_query',
      'search_request_id': searchRequestId,
      'vertical': vertical,
      'page_size': pageSize,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log search response.
  static Map<String, dynamic> searchResponse({
    required String searchRequestId,
    required int tookMs,
    required int itemCount,
    required int providerCount,
    required bool cacheHit,
  }) {
    return {
      'event': 'search_response',
      'search_request_id': searchRequestId,
      'took_ms': tookMs,
      'item_count': itemCount,
      'provider_count': providerCount,
      'cache_hit': cacheHit,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log provider result.
  static Map<String, dynamic> providerResult({
    required String searchRequestId,
    required String providerName,
    required String status,
    required int tookMs,
    required int itemCount,
  }) {
    return {
      'event': 'search_provider_result',
      'search_request_id': searchRequestId,
      'provider_name': providerName,
      'status': status,
      'took_ms': tookMs,
      'item_count': itemCount,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log cache event.
  static Map<String, dynamic> cacheEvent({
    required String cacheKey,
    required String action, // 'hit', 'miss', 'set', 'evict'
  }) {
    return {
      'event': 'search_cache',
      'cache_key': cacheKey,
      'action': action,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log budget exhaustion.
  static Map<String, dynamic> budgetExhausted({
    required String providerName,
    required String budgetType, // 'qps', 'monthly'
  }) {
    return {
      'event': 'search_budget_exhausted',
      'provider_name': providerName,
      'budget_type': budgetType,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log circuit breaker state change.
  static Map<String, dynamic> circuitBreaker({
    required String providerName,
    required String state, // 'open', 'half_open', 'closed'
  }) {
    return {
      'event': 'search_circuit_breaker',
      'provider_name': providerName,
      'state': state,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log schema drift.
  static Map<String, dynamic> schemaDrift({
    required String providerName,
    required String field,
    required String issue, // 'missing', 'type_mismatch', 'unknown_enum'
  }) {
    return {
      'event': 'search_schema_drift',
      'provider_name': providerName,
      'field': field,
      'issue': issue,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
