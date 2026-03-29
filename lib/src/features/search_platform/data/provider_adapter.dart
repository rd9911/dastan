import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/search_platform/domain/search_models.dart';

/// Provider adapter configuration.
class ProviderConfig {
  final String name;
  final SearchVertical vertical;
  final List<String> capabilities;
  final int qpsLimit;
  final int burstLimit;
  final int timeoutMs;
  final List<String> regions;
  final double costWeight;
  final bool enabled;

  const ProviderConfig({
    required this.name,
    required this.vertical,
    this.capabilities = const [],
    this.qpsLimit = 10,
    this.burstLimit = 20,
    this.timeoutMs = 5000,
    this.regions = const ['*'],
    this.costWeight = 1.0,
    this.enabled = true,
  });
}

/// Result from a provider search.
class ProviderResult {
  final String providerName;
  final List<SearchResultItem> items;
  final ProviderStatus status;
  final int tookMs;
  final CacheStatus? cache;
  final String? error;

  const ProviderResult({
    required this.providerName,
    required this.items,
    required this.status,
    required this.tookMs,
    this.cache,
    this.error,
  });
}

/// Abstract interface for search provider adapters.
abstract class ProviderAdapter {
  /// Provider configuration.
  ProviderConfig get config;

  /// Search for items.
  Future<ProviderResult> search(SearchQuery query);

  /// Lookup a specific item by ID.
  Future<SearchResultItem?> lookup(String id);

  /// Check if provider is healthy.
  Future<bool> healthCheck();
}

/// Mock provider adapter for testing.
class MockProviderAdapter implements ProviderAdapter {
  @override
  final ProviderConfig config;
  final List<SearchResultItem> _fixtures;
  final int _simulatedLatencyMs;
  final bool _simulateTimeout;
  final bool _simulateError;

  MockProviderAdapter({
    required this.config,
    List<SearchResultItem>? fixtures,
    int simulatedLatencyMs = 100,
    bool simulateTimeout = false,
    bool simulateError = false,
  }) : _fixtures = fixtures ?? [],
       _simulatedLatencyMs = simulatedLatencyMs,
       _simulateTimeout = simulateTimeout,
       _simulateError = simulateError;

  @override
  Future<ProviderResult> search(SearchQuery query) async {
    final stopwatch = Stopwatch()..start();

    // Simulate network latency
    await Future.delayed(Duration(milliseconds: _simulatedLatencyMs));

    if (_simulateTimeout) {
      await Future.delayed(Duration(milliseconds: config.timeoutMs + 100));
      return ProviderResult(
        providerName: config.name,
        items: [],
        status: ProviderStatus.timeout,
        tookMs: stopwatch.elapsedMilliseconds,
        error: 'Request timed out',
      );
    }

    if (_simulateError) {
      return ProviderResult(
        providerName: config.name,
        items: [],
        status: ProviderStatus.error,
        tookMs: stopwatch.elapsedMilliseconds,
        error: 'Provider error',
      );
    }

    // Filter by vertical
    final items = _fixtures
        .where((item) => item.vertical == query.vertical)
        .skip(query.page * query.pageSize)
        .take(query.pageSize)
        .toList();

    stopwatch.stop();
    return ProviderResult(
      providerName: config.name,
      items: items,
      status: ProviderStatus.ok,
      tookMs: stopwatch.elapsedMilliseconds,
    );
  }

  @override
  Future<SearchResultItem?> lookup(String id) async {
    await Future.delayed(Duration(milliseconds: _simulatedLatencyMs));
    try {
      return _fixtures.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> healthCheck() async {
    return !_simulateError && !_simulateTimeout;
  }
}

/// Registry of provider adapters.
class ProviderRegistry {
  final Map<String, ProviderAdapter> _adapters = {};

  /// Register a provider adapter.
  void register(ProviderAdapter adapter) {
    _adapters[adapter.config.name] = adapter;
  }

  /// Get adapter by name.
  ProviderAdapter? get(String name) => _adapters[name];

  /// Get all adapters for a vertical.
  List<ProviderAdapter> forVertical(SearchVertical vertical) {
    return _adapters.values
        .where((a) => a.config.vertical == vertical && a.config.enabled)
        .toList();
  }

  /// Get all enabled adapters.
  List<ProviderAdapter> get allEnabled =>
      _adapters.values.where((a) => a.config.enabled).toList();

  /// Get all adapter names.
  List<String> get names => _adapters.keys.toList();
}

/// Provider for the adapter registry.
final providerRegistryProvider = Provider<ProviderRegistry>((ref) {
  final registry = ProviderRegistry();

  // Register mock adapters for each vertical
  for (final vertical in SearchVertical.values) {
    registry.register(
      MockProviderAdapter(
        config: ProviderConfig(
          name: 'mock_${vertical.name}',
          vertical: vertical,
          capabilities: ['search', 'lookup'],
        ),
        fixtures: _generateMockFixtures(vertical),
      ),
    );
  }

  return registry;
});

/// Generate mock fixtures for testing.
List<SearchResultItem> _generateMockFixtures(SearchVertical vertical) {
  return List.generate(
    50,
    (i) => SearchResultItem(
      id: '${vertical.name}_item_$i',
      dedupeKey: '${vertical.name}:mock_item_$i',
      vertical: vertical,
      title: '${vertical.name.toUpperCase()} Item ${i + 1}',
      subtitle: 'Mock result for testing',
      price: 50.0 + (i * 10),
      priceCurrency: 'USD',
      rating: 3.5 + (i % 3) * 0.5,
      reviewCount: 100 + i * 10,
      latitude: 40.7128 + (i * 0.01),
      longitude: -74.0060 + (i * 0.01),
      provenance: ['mock_${vertical.name}'],
    ),
  );
}
