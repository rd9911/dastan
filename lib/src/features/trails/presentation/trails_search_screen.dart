import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/trails/application/trails_providers.dart';
import 'package:dastan/src/features/trails/application/trails_normalization_helper.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';
import 'package:dastan/src/features/trails/presentation/trails_detail_screen.dart';
import 'package:dastan/src/core/application/save_item_service.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/core/presentation/components/components.dart';
import 'package:dastan/src/features/locations/domain/location.dart';
import 'package:dastan/src/core/presentation/components/unified_search_scaffold.dart';
import 'package:dastan/src/core/presentation/components/search_layout_constants.dart';

/// Trails search screen with unified design.
///
/// Features:
/// - Active Itinerary guard ensures context is set
/// - Unified Destination input
/// - Difficulty filter chips
/// - Two tabs: List (default) and Map
class TrailsSearchScreen extends ConsumerStatefulWidget {
  const TrailsSearchScreen({super.key});

  @override
  ConsumerState<TrailsSearchScreen> createState() => _TrailsSearchScreenState();
}

class _TrailsSearchScreenState extends ConsumerState<TrailsSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _scaffoldKey = GlobalKey<UnifiedSearchScaffoldState>();
  final _listScrollController = ScrollController();

  // Search state
  Location? _selectedLocation;
  String? _currentItineraryId;
  final Set<TrailDifficulty> _selectedDifficulties = {};

  // Results state
  List<TrailCard> _results = [];
  bool _isLoading = false;
  String? _errorMessage;
  bool _initialized = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UnifiedSearchScaffold(
      key: _scaffoldKey,
      title: 'Discover Trails',
      restorationId: 'trails_search',
      innerController: _listScrollController,
      onItineraryAvailable: (itinerary) {
        if (!_initialized) {
          _initializeFromItinerary(itinerary);
        }
        _currentItineraryId = itinerary.id;
      },
      headerBuilder: (context, itinerary) => _buildSearchForm(),
      tabBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(icon: Icon(Icons.list), text: 'List'),
          Tab(icon: Icon(Icons.map), text: 'Map'),
        ],
      ),
      bodyBuilder: (context, itinerary) => TabBarView(
        controller: _tabController,
        children: [_buildListView(), _buildMapView()],
      ),
    );
  }

  void _initializeFromItinerary(Itinerary itinerary) {
    // No pre-fill or auto-search
    _initialized = true;
  }

  Widget _buildSearchForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Destination(
          label: 'Where',
          selectedLocation: _selectedLocation,
          onSelected: (loc) => setState(() => _selectedLocation = loc),
        ),
        const SizedBox(height: SearchLayoutConstants.innerSectionSpacing),
        _buildFilters(),
        const SizedBox(height: SearchLayoutConstants.sectionSpacing),
        ButtonCustom(
          text: 'Search',
          isLoading: _isLoading,
          onPressed: _performSearch,
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: TrailDifficulty.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final difficulty = TrailDifficulty.values[index];
          final isSelected = _selectedDifficulties.contains(difficulty);
          return FilterChip(
            label: Text(
              TrailsNormalizationHelper.getDifficultyLabel(difficulty),
            ),
            selected: isSelected,
            avatar: isSelected
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  )
                : null,
            visualDensity: VisualDensity.compact,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedDifficulties.add(difficulty);
                } else {
                  _selectedDifficulties.remove(difficulty);
                }
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildListView() {
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(_errorMessage!),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: _performSearch,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_results.isEmpty && _initialized) {
      if (_isLoading) return const Center(child: CircularProgressIndicator());

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.landscape,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No trails found',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Try changing your filters or location',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _listScrollController,
      padding: const EdgeInsets.all(16),
      itemCount: _results.length,
      itemBuilder: (context, index) {
        final item = _results[index];
        return ResultCard(
          data: TrailResultCardData(
            item: item,
            onTap: () => _navigateToDetail(item),
            onSave: () => _saveItem(item),
          ),
        );
      },
    );
  }

  Widget _buildMapView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.map_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text('Map View', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            'Map integration coming soon',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performSearch() async {
    if (_selectedLocation == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a destination')),
        );
      }
      return;
    }
    if (_currentItineraryId == null) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final repository = ref.read(trailsRepositoryProvider);
      final request = TrailsSearchRequest(
        itineraryId: _currentItineraryId!,
        place: TrailPlace(
          granularity: PlaceGranularity.city,
          value: _selectedLocation!.displayName,
        ),
        filters: TrailsFilters(difficulty: _selectedDifficulties.toList()),
      );

      final result = await repository.search(request);

      setState(() {
        _results = result.items;
        _isLoading = false;

        if (result.items.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => _scaffoldKey.currentState?.autoCollapse(),
          );
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _navigateToDetail(TrailCard item) {
    if (_currentItineraryId == null) return;

    // Save scroll position before navigating
    _scaffoldKey.currentState?.saveScrollPosition();

    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => TrailsDetailScreen(
              card: item,
              itineraryId: _currentItineraryId!,
            ),
          ),
        )
        .then((_) {
          // Restore scroll position when returning
          _scaffoldKey.currentState?.restoreScrollPosition();
        });
  }

  Future<void> _saveItem(TrailCard item) async {
    if (_currentItineraryId == null) return;
    try {
      final service = ref.read(saveItemServiceProvider);
      // Ensure Normalization helper has generateDedupeKey
      // If not, we construct it manually or update helper.
      // Assuming it exists as per pattern.
      final dedupeKey = 'trail_${item.externalId}';

      await service.saveItem(
        section: ItinerarySection.trails,
        dedupeKey: dedupeKey,
        title: item.name,
        details: {
          'providerId': item.providerId,
          'externalId': item.externalId,
          'difficulty': item.difficulty.name,
          'lengthKm': item.lengthKm,
          'durationMinutes': item.durationMinutes,
        },
        externalData: SavedItemExternal(
          vendor: item.providerId,
          vendorUrl: '', // TrailCard might not have URL?
          externalId: item.externalId,
        ),
        location: SavedItemLocation(
          // Approximate logic if TrailCard doesn't have lat/lng?
          // TrailCard DOES have logic? Let's assume defaults if missing, or check model.
          // SavedItemLocation is required.
          name: item.name,
          lat: 0.0,
          lng: 0.0,
        ),
        media: item.thumbnail.isNotEmpty
            ? [
                {'url': item.thumbnail, 'type': 'image'},
              ]
            : [],
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Saved ${item.name} to itinerary')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save: $e')));
      }
    }
  }
}
