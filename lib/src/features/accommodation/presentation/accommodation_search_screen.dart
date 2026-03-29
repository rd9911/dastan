import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../application/accommodation_search_controller.dart';
import '../domain/accommodation_result.dart';
import '../domain/property_item.dart';
import 'accommodation_detail_screen.dart';
import '../../../core/presentation/save_button.dart';
import '../../../core/domain/saved_item.dart';
import '../../../core/presentation/components/components.dart';
import '../../locations/domain/location.dart';
import '../../../core/domain/dedupe_strategy.dart';

/// Accommodation search screen with tabbed interface for different trip types.
class AccommodationSearchScreen extends ConsumerStatefulWidget {
  const AccommodationSearchScreen({super.key});
  @override
  ConsumerState<AccommodationSearchScreen> createState() =>
      _AccommodationSearchScreenState();
}

class _AccommodationSearchScreenState
    extends ConsumerState<AccommodationSearchScreen> {
  // Per-tab scroll controllers for auto-collapse
  final _singleTripScrollController = ScrollController();
  final _multiCityScrollController = ScrollController();
  // GlobalKeys for measuring form heights
  final _singleTripFormKey = GlobalKey();
  final _multiCityFormKey = GlobalKey();
  double _scrollOpacity = 0.0;
  bool _hasSearched = false;
  bool _shouldCollapseOnResults = false;
  int _currentTabIndex = 0;
  // Saved state for restoration
  double? _savedSingleTripOffset;
  double? _savedMultiCityOffset;
  // Form state for Single Trip
  Location? _location;
  DateTime? _checkIn;
  DateTime? _checkOut;
  String _selectedType = 'Any';
  FormValues? _guestFormValues;
  // Multi-city trips
  final List<_TripData> _trips = [_TripData()];
  @override
  void initState() {
    super.initState();
    // Listen to each tab's scroll controller for header opacity and arrow updates
    _singleTripScrollController.addListener(_handleTabScroll);
    _multiCityScrollController.addListener(_handleTabScroll);
  }

  void _handleTabScroll() {
    // Get the current tab's scroll controller
    final controller = _currentTabIndex == 0
        ? _singleTripScrollController
        : _multiCityScrollController;
    if (!controller.hasClients) return;
    final offset = controller.offset;
    // Fade in header between 100 and 200 scroll offset
    final opacity = ((offset - 100) / 100).clamp(0.0, 1.0);
    if (opacity != _scrollOpacity) {
      setState(() => _scrollOpacity = opacity);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _restoreScrollPosition();
  }

  @override
  void dispose() {
    _singleTripScrollController.dispose();
    _multiCityScrollController.dispose();
    super.dispose();
  }

  void saveScrollPosition() {
    if (_singleTripScrollController.hasClients) {
      _savedSingleTripOffset = _singleTripScrollController.offset;
    }
    if (_multiCityScrollController.hasClients) {
      _savedMultiCityOffset = _multiCityScrollController.offset;
    }
  }

  void _restoreScrollPosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_savedSingleTripOffset != null &&
          _singleTripScrollController.hasClients) {
        _singleTripScrollController.jumpTo(_savedSingleTripOffset!);
      }
      if (_savedMultiCityOffset != null &&
          _multiCityScrollController.hasClients) {
        _multiCityScrollController.jumpTo(_savedMultiCityOffset!);
      }
    });
  }

  // Accommodation modal config
  List<QuestionConfig> get _accommodationModalConfig => [
    QuestionConfig(
      text: 'Rooms',
      type: QuestionType.increment,
      options: [
        const OptionConfig(label: 'Rooms', defaultValue: 1, minValue: 1),
      ],
    ),
    QuestionConfig(
      text: 'Guests',
      type: QuestionType.increment,
      icon: Icons.person,
      options: [
        const OptionConfig(
          label: 'Adults',
          subtitle: '12+ years old',
          icon: Icons.person,
          defaultValue: 2,
        ),
        const OptionConfig(
          label: 'Children',
          subtitle: '2-11 years old',
          icon: Icons.child_care,
          defaultValue: 0,
        ),
        const OptionConfig(
          label: 'Infants',
          subtitle: 'Under 2 years old',
          icon: Icons.baby_changing_station,
          defaultValue: 0,
        ),
        const OptionConfig(label: 'Pets', icon: Icons.pets, defaultValue: 0),
      ],
    ),
    const QuestionConfig(
      text: 'Services',
      type: QuestionType.multipleChoice,
      options: ['Free Cancellation', 'Breakfast Included', '2 Beds'],
      defaultValue: <String>[],
    ),
  ];
  List<String> get _typeOptions => [
    'Hotel',
    'Hostel',
    'Apartment',
    'Resort',
    'Any',
  ];
  void _search() {
    if (_location == null || _checkIn == null || _checkOut == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }
    // Get guest counts from modal values
    final guestValues = _guestFormValues?.values[1] as Map<int, int>? ?? {0: 2};
    final ages = <int>[];
    for (final entry in guestValues.entries) {
      final age = entry.key == 0
          ? 30
          : (entry.key == 1 ? 8 : (entry.key == 2 ? 1 : 30));
      for (int i = 0; i < entry.value; i++) {
        ages.add(age);
      }
    }
    if (ages.isEmpty) ages.add(30);
    AccommodationType? type;
    if (_selectedType != 'Any') {
      type = AccommodationType.values.firstWhere(
        (t) => t.name.toLowerCase() == _selectedType.toLowerCase(),
        orElse: () => AccommodationType.hotel,
      );
    }
    ref
        .read(accommodationSearchControllerProvider.notifier)
        .search(
          location: _location!.displayName,
          checkIn: _checkIn!,
          checkOut: _checkOut!,
          type: type,
          travelerAges: ages,
        );
    setState(() {
      _hasSearched = true;
      _shouldCollapseOnResults = true;
    });
  }

  void _autoCollapseCurrentForm() {
    // Get the scroll controller and form key for the current tab
    final controller = _currentTabIndex == 0
        ? _singleTripScrollController
        : _multiCityScrollController;
    final formKey = _currentTabIndex == 0
        ? _singleTripFormKey
        : _multiCityFormKey;
    // Measure the form height dynamically
    double scrollTarget = 400; // fallback
    final renderBox = formKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      scrollTarget = renderBox.size.height;
    }
    // Scroll down to collapse the form
    if (controller.hasClients) {
      controller.animateTo(
        scrollTarget,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _toggleForm() {
    final controller = _currentTabIndex == 0
        ? _singleTripScrollController
        : _multiCityScrollController;
    final formKey = _currentTabIndex == 0
        ? _singleTripFormKey
        : _multiCityFormKey;
    if (!controller.hasClients) return;
    // Get form height dynamically
    double formHeight = 400;
    final renderBox = formKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      formHeight = renderBox.size.height;
    }
    // Toggle based on current scroll position
    if (controller.offset > formHeight * 0.3) {
      // Expand (scroll to top)
      controller.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      // Collapse (scroll past form)
      controller.animateTo(
        formHeight,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // Helper to check if form is collapsed
  bool get _isFormCollapsed {
    final controller = _currentTabIndex == 0
        ? _singleTripScrollController
        : _multiCityScrollController;
    final formKey = _currentTabIndex == 0
        ? _singleTripFormKey
        : _multiCityFormKey;
    if (!controller.hasClients) return false;
    double formHeight = 400;
    final renderBox = formKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      formHeight = renderBox.size.height;
    }
    return controller.offset > formHeight * 0.3;
  }

  // Get guest count from form values
  int _getGuestCount() {
    if (_guestFormValues == null) return 2;
    final guestValues = _guestFormValues!.values[1] as Map<int, int>?;
    if (guestValues == null) return 2;
    int count = 0;
    for (final v in guestValues.values) {
      count += v;
    }
    return count > 0 ? count : 2;
  }

  @override
  Widget build(BuildContext context) {
    // Listen for results and collapse form when they arrive
    ref.listen<AsyncValue<List<AccommodationResult>>>(
      accommodationSearchControllerProvider,
      (previous, next) {
        // When results arrive (transition from loading to data)
        if (_shouldCollapseOnResults &&
            next.hasValue &&
            next.value != null &&
            next.value!.isNotEmpty) {
          _shouldCollapseOnResults = false; // Reset flag
          // Use addPostFrameCallback to ensure widgets are built
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _autoCollapseCurrentForm();
          });
        }
      },
    );
    // Results are rendered in _buildResults method
    return Scaffold(
      body: NestedScrollView(
        key: const PageStorageKey('accommodation_search'),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 0,
            leading: const BackButton(color: Colors.black),
            backgroundColor: Colors.white,
            actions: [
              if (_hasSearched)
                IconButton(
                  icon: Icon(
                    _isFormCollapsed
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.black,
                  ),
                  onPressed: _toggleForm,
                ),
            ],
            title: Opacity(
              opacity: _scrollOpacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _location != null
                        ? _location!.name
                        : 'Accommodation Search',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (_checkIn != null && _checkOut != null)
                    Text(
                      '${DateFormat('MMM dd').format(_checkIn!)} - ${DateFormat('MMM dd').format(_checkOut!)} • ${_getGuestCount()} guests',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                ],
              ),
            ),
          ),
        ],
        body: Column(
          children: [
            Expanded(
              child: SwipeableTabs(
                initialIndex: _currentTabIndex,
                onTabChanged: (index) =>
                    setState(() => _currentTabIndex = index),
                tabs: [
                  TabConfig(
                    name: 'Single Trip',
                    content: _buildSingleTripForm(),
                  ),
                  TabConfig(name: 'Multi-City', content: _buildMultiCityForm()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleTripForm() {
    final resultsAsync = ref.watch(accommodationSearchControllerProvider);
    return CustomScrollView(
      controller: _singleTripScrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            key: _singleTripFormKey,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Destination(
                  label: 'Destination',
                  isRequired: true,
                  selectedLocation: _location,
                  onSelected: (loc) => setState(() => _location = loc),
                ),
                const SizedBox(height: 16),
                RoundDate(
                  departureLabel: 'Check-In',
                  returnLabel: 'Check-Out',
                  departureDate: _checkIn,
                  returnDate: _checkOut,
                  onDepartureSelected: (date) =>
                      setState(() => _checkIn = date),
                  onReturnSelected: (date) => setState(() => _checkOut = date),
                ),
                const SizedBox(height: 16),
                OptionsList<String>(
                  label: 'Type',
                  options: _typeOptions,
                  type: OptionsListType.multiple,
                  selectedValue: _selectedType,
                  onChanged: (val) =>
                      setState(() => _selectedType = val ?? 'Any'),
                ),
                const SizedBox(height: 16),
                ModalBottomSheetForm(
                  config: _accommodationModalConfig,
                  buttonText: '1 Room, 2 Guests',
                  onDone: (values) => setState(() => _guestFormValues = values),
                ),
                const SizedBox(height: 24),
                ButtonCustom(text: 'Search', onPressed: _search),
              ],
            ),
          ),
        ),
        _buildResults(resultsAsync),
      ],
    );
  }

  Widget _buildMultiCityForm() {
    return CustomScrollView(
      controller: _multiCityScrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            key: _multiCityFormKey,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  _trips.length,
                  (index) => _buildTripCard(index),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () => setState(() => _trips.add(_TripData())),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Another Trip'),
                ),
                const SizedBox(height: 16),
                ModalBottomSheetForm(
                  config: _accommodationModalConfig,
                  buttonText: '1 Room, 2 Guests',
                  onDone: (values) => setState(() => _guestFormValues = values),
                ),
                const SizedBox(height: 24),
                ButtonCustom(text: 'Search', onPressed: _search),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTripCard(int index) {
    final trip = _trips[index];
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trip ${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (_trips.length > 1)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => setState(() => _trips.removeAt(index)),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Destination(
              label: 'Destination',
              isRequired: true,
              selectedLocation: trip.location,
              onSelected: (loc) => setState(() => trip.location = loc),
            ),
            const SizedBox(height: 16),
            RoundDate(
              departureLabel: 'Check-In',
              returnLabel: 'Check-Out',
              departureDate: trip.checkIn,
              returnDate: trip.checkOut,
              onDepartureSelected: (date) =>
                  setState(() => trip.checkIn = date),
              onReturnSelected: (date) => setState(() => trip.checkOut = date),
            ),
            const SizedBox(height: 16),
            OptionsList<String>(
              label: 'Type',
              options: _typeOptions,
              selectedValue: trip.type,
              onChanged: (val) => setState(() => trip.type = val ?? 'Any'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults(AsyncValue<List<AccommodationResult>> resultsAsync) {
    return resultsAsync.when(
      data: (results) {
        if (results.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Search for accommodation options')),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => ResultCard(
              data: AccommodationResultCardData(
                result: results[i],
                onTap: () => _navigateToDetail(results[i]),
                trailing: SaveButton(
                  section: ItinerarySection.accommodation,
                  dedupeKey: DedupeStrategy.accommodation(
                    type: results[i].type.name,
                    name: results[i].name,
                    checkIn: results[i].checkIn,
                  ),
                  title: results[i].name,
                  details: {
                    'type': results[i].type.name,
                    'pricePerNight': results[i].pricePerNight,
                    'rating': results[i].rating,
                  },
                  externalData: null,
                  time: SavedItemTime(
                    start: results[i].checkIn,
                    end: results[i].checkOut,
                  ),
                  location: null,
                ),
              ),
            ),
            childCount: results.length,
          ),
        );
      },
      loading: () => const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text('Error: $e')),
      ),
    );
  }

  void _navigateToDetail(AccommodationResult result) {
    // Save scroll state before navigation
    saveScrollPosition();
    // Create a temporary PropertyItem for the detail screen
    final summary = PropertyItem(
      id: result.id,
      providerId: result.providerId,
      externalId: result.externalId,
      name: result.name,
      type: _mapType(result.type),
      location: result.location,
      latitude: 0.0, // Default until detailed fetch
      longitude: 0.0, // Default until detailed fetch
      starRating: result.rating,
      thumbnailUrl: result.imageUrl,
    );
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (_) => AccommodationDetailScreen(summary: summary),
          ),
        )
        .then((_) {
          // Restore scroll state after return
          _restoreScrollPosition();
        });
  }

  PropertyType _mapType(AccommodationType type) {
    switch (type) {
      case AccommodationType.hotel:
        return PropertyType.hotel;
      case AccommodationType.hostel:
        return PropertyType.hostel;
      case AccommodationType.apartment:
        return PropertyType.apartment;
      case AccommodationType.resort:
        return PropertyType.resort;
    }
  }
}

// Helper class for multi-city trip state
class _TripData {
  Location? location;
  DateTime? checkIn;
  DateTime? checkOut;
  String type = 'Any';
}
