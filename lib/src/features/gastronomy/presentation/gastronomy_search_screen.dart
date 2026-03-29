import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/gastronomy/application/gastronomy_providers.dart';
import 'package:dastan/src/features/gastronomy/application/gastronomy_normalization_helper.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';
import 'package:dastan/src/features/gastronomy/presentation/gastronomy_detail_screen.dart';
import 'package:dastan/src/core/application/save_item_service.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/core/presentation/components/components.dart';
import 'package:dastan/src/features/locations/domain/location.dart';
import 'package:dastan/src/core/presentation/components/unified_search_scaffold.dart';
import 'package:dastan/src/core/presentation/components/search_layout_constants.dart';

/// Gastronomy search screen with unified design.
///
/// Features:
/// - Active Itinerary guard ensures context is set
/// - Unified Destination input
/// - Dietary filter chips (vegan, vegetarian, halal, kosher, gluten-free)
/// - Cuisine and price filters
/// - Toggle filters: Open now, kid-friendly, dog-friendly
/// - Two tabs: List (default) and Map
class GastronomySearchScreen extends ConsumerStatefulWidget {
  const GastronomySearchScreen({super.key});

  @override
  ConsumerState<GastronomySearchScreen> createState() =>
      _GastronomySearchScreenState();
}

class _GastronomySearchScreenState extends ConsumerState<GastronomySearchScreen>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<UnifiedSearchScaffoldState>();
  final _listScrollController = ScrollController();
  late TabController _tabController;

  // Search state
  Location? _selectedLocation;
  String? _currentItineraryId;
  final Set<DietaryOption> _selectedDietary = {};
  final Set<CuisineType> _selectedCuisines = {};
  PriceBand? _selectedPriceBand;
  bool _openNow = false;
  bool _kidFriendly = false;
  bool _dogFriendly = false;

  // Results state
  List<GastronomyResultCard> _results = [];
  bool _isLoading = false;
  String? _errorMessage;
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
      title: 'Restaurants & Cafés',
      restorationId: 'gastronomy_search',
      innerController: _listScrollController,
      onItineraryAvailable: (itinerary) {
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

  Widget _buildSearchForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Destination(
          label: 'Where',
          selectedLocation: _selectedLocation,
          onSelected: (loc) => setState(() => _selectedLocation = loc),
        ),
        const SizedBox(height: SearchLayoutConstants.sectionSpacing),
        _buildDietaryFilters(),
        const SizedBox(height: SearchLayoutConstants.innerSectionSpacing),
        _buildCuisineFilters(),
        const SizedBox(height: SearchLayoutConstants.innerSectionSpacing),
        _buildToggleFilters(),
        const SizedBox(height: SearchLayoutConstants.sectionSpacing),
        ButtonCustom(
          text: 'Search',
          isLoading: _isLoading,
          onPressed: _performSearch,
        ),
      ],
    );
  }

  Widget _buildDietaryFilters() {
    final options = DietaryOption.values;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final option = options[index];
          final isSelected = _selectedDietary.contains(option);

          return FilterChip(
            label: Text(GastronomyNormalizationHelper.formatDietary(option)),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedDietary.add(option);
                } else {
                  _selectedDietary.remove(option);
                }
              });
            },
            avatar: isSelected
                ? null
                : Icon(
                    _getDietaryIcon(option),
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            showCheckmark: false,
            visualDensity: VisualDensity.compact,
          );
        },
      ),
    );
  }

  Widget _buildCuisineFilters() {
    final popularCuisines = [
      CuisineType.italian,
      CuisineType.french,
      CuisineType.asian,
      CuisineType.mexican,
      CuisineType.indian,
      CuisineType.japanese,
      CuisineType.mediterranean,
      CuisineType.cafe,
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: popularCuisines.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final cuisine = popularCuisines[index];
          final isSelected = _selectedCuisines.contains(cuisine);

          return FilterChip(
            label: Text(GastronomyNormalizationHelper.formatCuisine(cuisine)),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedCuisines.add(cuisine);
                } else {
                  _selectedCuisines.remove(cuisine);
                }
              });
            },
            visualDensity: VisualDensity.compact,
          );
        },
      ),
    );
  }

  Widget _buildToggleFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildToggleChip('Open Now', _openNow, (v) {
            setState(() => _openNow = v);
          }),
          const SizedBox(width: 8),
          _buildToggleChip('Kid-Friendly', _kidFriendly, (v) {
            setState(() => _kidFriendly = v);
          }),
          const SizedBox(width: 8),
          _buildToggleChip('Dog-Friendly', _dogFriendly, (v) {
            setState(() => _dogFriendly = v);
          }),
          const SizedBox(width: 8),
          _buildPriceBandChips(),
        ],
      ),
    );
  }

  Widget _buildPriceBandChips() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: PriceBand.values.map((band) {
        return Padding(
          padding: const EdgeInsets.only(left: 4),
          child: ChoiceChip(
            label: Text(GastronomyNormalizationHelper.formatPriceTag(band)),
            selected: _selectedPriceBand == band,
            onSelected: (selected) {
              setState(() {
                _selectedPriceBand = selected ? band : null;
              });
            },
            visualDensity: VisualDensity.compact,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildToggleChip(String label, bool value, Function(bool) onChanged) {
    return FilterChip(
      label: Text(label),
      selected: value,
      onSelected: onChanged,
      visualDensity: VisualDensity.compact,
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

    if (_results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'Search for restaurants',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Find great places to eat',
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
          data: GastronomyResultCardData(
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a destination')),
      );
      return;
    }
    if (_currentItineraryId == null) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final repository = ref.read(gastronomyRepositoryProvider);
      final request = GastronomySearchRequest(
        itineraryId: _currentItineraryId!,
        place: GastronomyPlace(
          granularity: PlaceGranularity.city,
          value: _selectedLocation!.displayName,
        ),
        filters: GastronomyFilters(
          dietary: _selectedDietary.toList(),
          cuisine: _selectedCuisines.toList(),
          priceBand: _selectedPriceBand,
          openNow: _openNow ? true : null,
          kidFriendly: _kidFriendly ? true : null,
          dogFriendly: _dogFriendly ? true : null,
        ),
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

  void _navigateToDetail(GastronomyResultCard item) {
    if (_currentItineraryId == null) return;

    // Save scroll position before navigating
    _scaffoldKey.currentState?.saveScrollPosition();

    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => GastronomyDetailScreen(
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

  Future<void> _saveItem(GastronomyResultCard item) async {
    if (_currentItineraryId == null) return;

    try {
      final service = ref.read(saveItemServiceProvider);
      final dedupeKey = GastronomyNormalizationHelper.generateDedupeKey(
        itineraryId: _currentItineraryId!,
        item: item,
      );

      await service.saveItem(
        section: ItinerarySection.gastronomy,
        dedupeKey: dedupeKey,
        title: item.name,
        details: {
          'providerId': item.providerId,
          'externalId': item.externalId,
          'priceBand': item.priceBand.name,
          'location': item.location,
        },
        externalData: SavedItemExternal(
          vendor: item.providerId,
          vendorUrl: item.website,
          externalId: item.externalId,
        ),
        location: SavedItemLocation(
          name: item.location,
          lat: item.latitude,
          lng: item.longitude,
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

  IconData _getDietaryIcon(DietaryOption option) {
    switch (option) {
      case DietaryOption.vegan:
        return Icons.eco;
      case DietaryOption.vegetarian:
        return Icons.grass;
      case DietaryOption.halal:
        return Icons.verified;
      case DietaryOption.kosher:
        return Icons.stars;
      case DietaryOption.glutenFree:
        return Icons.no_food;
    }
  }
}
