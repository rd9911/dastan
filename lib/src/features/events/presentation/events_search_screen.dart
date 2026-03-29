import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/events/application/events_providers.dart';
import 'package:dastan/src/features/events/application/events_normalization_helper.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';
import 'package:dastan/src/features/events/presentation/events_detail_screen.dart';
import 'package:dastan/src/core/application/save_item_service.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/core/presentation/components/components.dart';
import 'package:dastan/src/features/locations/domain/location.dart';
import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/core/presentation/components/unified_search_scaffold.dart';
import 'package:dastan/src/core/presentation/components/search_layout_constants.dart';

/// Events search screen with unified design.
///
/// Features:
/// - Active Itinerary guard ensures context is set
/// - Unified Destination input
/// - RoundDate picker for date range
/// - Category filter chips
/// - Toggle filters: Free, Family-friendly, etc.
/// - Two tabs: List (default) and Map
class EventsSearchScreen extends ConsumerStatefulWidget {
  const EventsSearchScreen({super.key});

  @override
  ConsumerState<EventsSearchScreen> createState() => _EventsSearchScreenState();
}

class _EventsSearchScreenState extends ConsumerState<EventsSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _scaffoldKey = GlobalKey<UnifiedSearchScaffoldState>();
  final _listScrollController = ScrollController();

  // Search state
  Location? _selectedLocation;
  String? _currentItineraryId;
  final Set<EventCategory> _selectedCategories = {};

  // Date and feature filters
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isFree = false;
  bool _isFamilyFriendly = false;
  bool _today = false;
  bool _thisWeekend = false;

  // Results state
  List<EventCard> _results = [];
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
      title: 'Events & Activities',
      restorationId: 'events_search',
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
    // Basic prefill
    // Prefill dates from itinerary
    if (itinerary.startDate != null) {
      _startDate = itinerary.startDate;
    }
    if (itinerary.endDate != null) {
      _endDate = itinerary.endDate;
    }

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
        const SizedBox(height: SearchLayoutConstants.sectionSpacing),
        RoundDate(
          departureLabel: 'From',
          returnLabel: 'Until',
          departureDate: _startDate,
          returnDate: _endDate,
          onDepartureSelected: (date) => setState(() {
            _startDate = date;
            if (_endDate != null && _endDate!.isBefore(date)) {
              _endDate = date.add(const Duration(days: 1));
            }
          }),
          onReturnSelected: (date) => setState(() => _endDate = date),
        ),
        const SizedBox(height: SearchLayoutConstants.sectionSpacing),
        _buildCategoryFilters(),
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

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: EventCategory.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = EventCategory.values[index];
          final isSelected = _selectedCategories.contains(category);
          return FilterChip(
            label: Text(EventsNormalizationHelper.formatCategory(category)),
            selected: isSelected,
            avatar: isSelected
                ? null
                : Icon(
                    _getDataIcon(category),
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            showCheckmark: false,
            visualDensity: VisualDensity.compact,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedCategories.add(category);
                } else {
                  _selectedCategories.remove(category);
                }
              });
            },
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
          _buildToggleChip('Free', _isFree, (v) {
            setState(() => _isFree = v);
          }),
          const SizedBox(width: 8),
          _buildToggleChip('Family-friendly', _isFamilyFriendly, (v) {
            setState(() => _isFamilyFriendly = v);
          }),
          const SizedBox(width: 8),
          _buildToggleChip('Today', _today, (v) {
            setState(() {
              _today = v;
              if (v) _thisWeekend = false;
            });
          }),
          const SizedBox(width: 8),
          _buildToggleChip('This Weekend', _thisWeekend, (v) {
            setState(() {
              _thisWeekend = v;
              if (v) _today = false;
            });
          }),
        ],
      ),
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

  IconData _getDataIcon(EventCategory category) {
    switch (category) {
      case EventCategory.concert:
        return Icons.music_note;
      case EventCategory.theatre:
        return Icons.theater_comedy;
      case EventCategory.sports:
        return Icons.sports;
      case EventCategory.festival:
        return Icons.celebration;
      case EventCategory.exhibition:
        return Icons.museum;
      case EventCategory.conference:
        return Icons.groups;
      default:
        return Icons.event;
    }
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
      // Only show empty state if we have tried searching or implicitly initialized
      // Actually with auto-search on init, we might show "loading" or "empty" quickly.
      if (_isLoading) return const Center(child: CircularProgressIndicator());

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No events found',
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
          data: EventResultCardData(
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
      final repository = ref.read(eventsRepositoryProvider);

      // Determine date window
      EventDateWindow? dateWindow;
      if (_startDate != null) {
        // If only start date is selected, assume a window or single day?
        // Using provided end date or default to +1 day/same day logic if repository requires range?
        // Canonical model `EventDateWindow` typically expects start/end.
        dateWindow = EventDateWindow(
          start: _startDate!,
          end: _endDate ?? _startDate!.add(const Duration(days: 1)),
        );
      }

      final request = EventsSearchRequest(
        itineraryId: _currentItineraryId!,
        place: EventPlace(
          granularity: PlaceGranularity.city,
          value: _selectedLocation!.displayName,
        ),
        dateWindow: dateWindow,
        filters: EventsFilters(
          categories: _selectedCategories.toList(),
          duringMyDates: false,
          // We handle specific dates manually via dateWindow now,
          // so `duringMyDates` flag might be redundant or used differently.
          // Passing false to rely on explicit dateWindow.
          free: _isFree,
          familyFriendly: _isFamilyFriendly,
          today: _today,
          thisWeekend: _thisWeekend,
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

  void _navigateToDetail(EventCard item) {
    if (_currentItineraryId == null) return;

    // Save scroll position before navigating
    _scaffoldKey.currentState?.saveScrollPosition();

    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => EventsDetailScreen(
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

  Future<void> _saveItem(EventCard item) async {
    if (_currentItineraryId == null) return;

    try {
      final service = ref.read(saveItemServiceProvider);
      // Normalized Dedupe helper? Assuming EventsNormalizationHelper has it.
      final dedupeKey = EventsNormalizationHelper.generateDedupeKey(
        itineraryId: _currentItineraryId!,
        item: item,
      );

      await service.saveItem(
        section: ItinerarySection.events,
        dedupeKey: dedupeKey,
        title: item.title,
        details: {
          'providerId': item.providerId,
          'externalId': item.externalId,
          'category': item.category.name,
          'location': item.venue.name,
          'start': item.start.toIso8601String(),
          'end': item.end?.toIso8601String(),
        },
        externalData: SavedItemExternal(
          vendor: item.providerId,
          vendorUrl: item.website,
          externalId: item.externalId,
        ),
        location: SavedItemLocation(
          name: item.venue.name,
          lat: item.venue.latitude,
          lng: item.venue.longitude,
        ),
        media: item.leadImage.isNotEmpty
            ? [
                {'url': item.leadImage, 'type': 'image'},
              ]
            : [],
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Saved ${item.title} to itinerary')),
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
