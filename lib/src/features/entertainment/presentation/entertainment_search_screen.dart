import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/entertainment/application/entertainment_providers.dart';
import 'package:dastan/src/features/entertainment/application/entertainment_normalization_helper.dart';
import 'package:dastan/src/features/entertainment/domain/entertainment_models.dart';
import 'package:dastan/src/features/entertainment/presentation/entertainment_detail_screen.dart';
import 'package:dastan/src/core/application/save_item_service.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/core/presentation/components/components.dart';
import 'package:dastan/src/features/locations/domain/location.dart';
import 'package:dastan/src/core/presentation/components/unified_search_scaffold.dart';
import 'package:dastan/src/core/presentation/components/search_layout_constants.dart';

/// Entertainment search screen with unified design.
///
/// Features:
/// - Active Itinerary guard ensures context is set
/// - Unified Destination input
/// - Tag filter chips (museum, garden, landmark, etc.)
/// - Toggle filters: Open now, Free entry, Kid-friendly
/// - Two tabs: List (default) and Map
class EntertainmentSearchScreen extends ConsumerStatefulWidget {
  const EntertainmentSearchScreen({super.key});
  @override
  ConsumerState<EntertainmentSearchScreen> createState() =>
      _EntertainmentSearchScreenState();
}

class _EntertainmentSearchScreenState
    extends ConsumerState<EntertainmentSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _scaffoldKey = GlobalKey<UnifiedSearchScaffoldState>();
  final _listScrollController = ScrollController();
  // Search state
  Location? _selectedLocation;
  String? _currentItineraryId;
  final Set<EntertainmentTag> _selectedTags = {};
  bool _openNow = false;
  bool _freeEntry = false;
  bool _kidFriendly = false;
  // Results state
  List<EntertainmentResultCard> _results = [];
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
      title: 'Entertainment',
      restorationId: 'entertainment_search',
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
        _buildTagFilters(),
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

  Widget _buildTagFilters() {
    final tags = [
      EntertainmentTag.museum,
      EntertainmentTag.landmark,
      EntertainmentTag.garden,
      EntertainmentTag.park,
      EntertainmentTag.historicSite,
      EntertainmentTag.artGallery,
      EntertainmentTag.architecture,
      EntertainmentTag.viewpoint,
    ];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final tag = tags[index];
          final isSelected = _selectedTags.contains(tag);
          return FilterChip(
            label: Text(EntertainmentNormalizationHelper.formatTag(tag)),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedTags.add(tag);
                } else {
                  _selectedTags.remove(tag);
                }
              });
            },
            avatar: isSelected
                ? null
                : Icon(
                    _getTagIcon(tag),
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            showCheckmark: false, // Cleaner look
            visualDensity: VisualDensity.compact,
          );
        },
      ),
    );
  }

  Widget _buildToggleFilters() {
    return Row(
      children: [
        _buildToggleChip('Open Now', _openNow, (v) {
          setState(() => _openNow = v);
        }),
        const SizedBox(width: 8),
        _buildToggleChip('Free Entry', _freeEntry, (v) {
          setState(() => _freeEntry = v);
        }),
        const SizedBox(width: 8),
        _buildToggleChip('Kid-Friendly', _kidFriendly, (v) {
          setState(() => _kidFriendly = v);
        }),
      ],
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
      // Show empty state only if not loading and has searched?
      // Or initial state?
      // For now, simple empty placeholder
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.attractions,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'Search for attractions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Discover museums, landmarks, parks and more',
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
          data: EntertainmentResultCardData(
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
      final repository = ref.read(entertainmentRepositoryProvider);
      final request = EntertainmentSearchRequest(
        itineraryId: _currentItineraryId!,
        place: EntertainmentPlace(
          granularity: PlaceGranularity.city,
          value: _selectedLocation!.displayName, // Use full name preferably
        ),
        tags: _selectedTags.toList(),
        filters: EntertainmentFilters(
          openNow: _openNow ? true : null,
          freeEntry: _freeEntry ? true : null,
          kidFriendly: _kidFriendly ? true : null,
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

  void _navigateToDetail(EntertainmentResultCard item) {
    if (_currentItineraryId == null) return;
    // Save scroll position before navigating
    _scaffoldKey.currentState?.saveScrollPosition();
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => EntertainmentDetailScreen(
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

  Future<void> _saveItem(EntertainmentResultCard item) async {
    if (_currentItineraryId == null) return;
    try {
      final service = ref.read(saveItemServiceProvider);
      final dedupeKey = EntertainmentNormalizationHelper.generateDedupeKey(
        itineraryId: _currentItineraryId!,
        item: item,
      );
      await service.saveItem(
        section: ItinerarySection.entertainment,
        dedupeKey: dedupeKey,
        title: item.name,
        details: {
          'providerId': item.providerId,
          'externalId': item.externalId,
          'tag': item.tag.name,
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

  IconData _getTagIcon(EntertainmentTag tag) {
    switch (tag) {
      case EntertainmentTag.museum:
        return Icons.museum;
      case EntertainmentTag.garden:
        return Icons.local_florist;
      case EntertainmentTag.landmark:
        return Icons.place;
      case EntertainmentTag.architecture:
        return Icons.architecture;
      case EntertainmentTag.viewpoint:
        return Icons.panorama;
      case EntertainmentTag.park:
        return Icons.park;
      case EntertainmentTag.historicSite:
        return Icons.castle;
      case EntertainmentTag.artGallery:
        return Icons.palette;
      case EntertainmentTag.theater:
        return Icons.theater_comedy;
      case EntertainmentTag.zoo:
        return Icons.pets;
      case EntertainmentTag.aquarium:
        return Icons.water;
      case EntertainmentTag.themePark:
        return Icons.attractions;
      case EntertainmentTag.beach:
        return Icons.beach_access;
      case EntertainmentTag.natureReserve:
        return Icons.forest;
      case EntertainmentTag.monument:
        return Icons.account_balance;
    }
  }
}
