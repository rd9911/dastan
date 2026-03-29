import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../application/transport_search_controller.dart';
import '../domain/transport_result.dart';
import '../domain/transport_item.dart';
import '../domain/transport_search_request.dart' as request;
import 'transport_detail_screen.dart';
import '../../../core/presentation/save_button.dart';
import '../../../core/domain/saved_item.dart';
import '../../../core/presentation/components/components.dart';
import '../../locations/domain/location.dart';
import '../../../core/domain/dedupe_strategy.dart';

/// Transport search screen with tabbed interface for different trip types.
class TransportSearchScreen extends ConsumerStatefulWidget {
  const TransportSearchScreen({super.key});
  @override
  ConsumerState<TransportSearchScreen> createState() =>
      _TransportSearchScreenState();
}

class _TransportSearchScreenState extends ConsumerState<TransportSearchScreen> {
  // Per-tab scroll controllers for auto-collapse
  final _oneWayScrollController = ScrollController();
  final _roundTripScrollController = ScrollController();
  final _multiCityScrollController = ScrollController();
  final _meetUpScrollController = ScrollController();
  // GlobalKeys for measuring form heights
  final _oneWayFormKey = GlobalKey();
  final _roundTripFormKey = GlobalKey();
  final _multiCityFormKey = GlobalKey();
  final _meetUpFormKey = GlobalKey();
  double _scrollOpacity = 0.0;
  bool _hasSearched = false;
  bool _shouldCollapseOnResults = false;
  int _currentTabIndex = 0;
  // Saved state for restoration
  double? _savedOneWayOffset;
  double? _savedRoundTripOffset;
  double? _savedMultiCityOffset;
  double? _savedMeetUpOffset;
  // Form state for One Way / Round Trip
  Location? _origin;
  Location? _destination;
  DateTime? _departDate;
  DateTime? _returnDate;
  String _selectedMode = 'Flight';
  FormValues? _passengerFormValues;
  // Multi-city legs
  final List<_LegData> _legs = [_LegData()];
  // Meet up friends
  final List<_FriendData> _friends = [_FriendData()];
  @override
  void initState() {
    super.initState();
    // Listen to each tab's scroll controller for header opacity and arrow updates
    _oneWayScrollController.addListener(_handleTabScroll);
    _roundTripScrollController.addListener(_handleTabScroll);
    _multiCityScrollController.addListener(_handleTabScroll);
    _meetUpScrollController.addListener(_handleTabScroll);
  }

  void _handleTabScroll() {
    // Get the current tab's scroll controller
    ScrollController controller;
    switch (_currentTabIndex) {
      case 0:
        controller = _oneWayScrollController;
        break;
      case 1:
        controller = _roundTripScrollController;
        break;
      case 2:
        controller = _multiCityScrollController;
        break;
      case 3:
        controller = _meetUpScrollController;
        break;
      default:
        return;
    }
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
    _oneWayScrollController.dispose();
    _roundTripScrollController.dispose();
    _multiCityScrollController.dispose();
    _meetUpScrollController.dispose();
    super.dispose();
  }

  void saveScrollPosition() {
    if (_oneWayScrollController.hasClients) {
      _savedOneWayOffset = _oneWayScrollController.offset;
    }
    if (_roundTripScrollController.hasClients) {
      _savedRoundTripOffset = _roundTripScrollController.offset;
    }
    if (_multiCityScrollController.hasClients) {
      _savedMultiCityOffset = _multiCityScrollController.offset;
    }
    if (_meetUpScrollController.hasClients) {
      _savedMeetUpOffset = _meetUpScrollController.offset;
    }
  }

  void _restoreScrollPosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_savedOneWayOffset != null && _oneWayScrollController.hasClients) {
        _oneWayScrollController.jumpTo(_savedOneWayOffset!);
      }
      if (_savedRoundTripOffset != null &&
          _roundTripScrollController.hasClients) {
        _roundTripScrollController.jumpTo(_savedRoundTripOffset!);
      }
      if (_savedMultiCityOffset != null &&
          _multiCityScrollController.hasClients) {
        _multiCityScrollController.jumpTo(_savedMultiCityOffset!);
      }
      if (_savedMeetUpOffset != null && _meetUpScrollController.hasClients) {
        _meetUpScrollController.jumpTo(_savedMeetUpOffset!);
      }
    });
  }

  // Transport modal config
  List<QuestionConfig> get _transportModalConfig => [
    const QuestionConfig(
      text: 'Stops',
      type: QuestionType.singleChoice,
      options: ['Direct Flights Only', '1 Stop or Direct Flights', 'Any Stops'],
      defaultValue: 'Any Stops',
    ),
    QuestionConfig(
      text: 'Passengers',
      type: QuestionType.increment,
      icon: Icons.person,
      options: [
        const OptionConfig(
          label: 'Adults',
          subtitle: '12+ years old',
          icon: Icons.person,
          defaultValue: 1,
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
      ],
    ),
    QuestionConfig(
      text: 'Baggage',
      type: QuestionType.increment,
      icon: Icons.luggage,
      options: [
        const OptionConfig(
          label: 'Cabin Baggage',
          icon: Icons.work,
          defaultValue: 0,
        ),
        const OptionConfig(
          label: 'Checked Baggage',
          icon: Icons.luggage,
          defaultValue: 0,
        ),
      ],
    ),
    const QuestionConfig(
      text: 'Cabin Class',
      type: QuestionType.singleChoice,
      options: ['Economy', 'Premium Economy', 'Business', 'First'],
      defaultValue: 'Economy',
    ),
  ];
  List<String> get _modeOptions => ['Flight', 'Train', 'Bus', 'Any'];
  void _search() {
    // Get passenger counts from modal values
    final passengerValues =
        _passengerFormValues?.values[1] as Map<int, int>? ?? {0: 1};
    final ages = <int>[];
    for (final entry in passengerValues.entries) {
      // Adult = 25, Child = 8, Infant = 1 (example ages)
      final age = entry.key == 0 ? 25 : (entry.key == 1 ? 8 : 1);
      for (int i = 0; i < entry.value; i++) {
        ages.add(age);
      }
    }
    if (ages.isEmpty) ages.add(25);
    TransportSearchRequest? request;
    if (_currentTabIndex == 0 || _currentTabIndex == 1) {
      // One Way or Round Trip
      if (_origin == null || _destination == null || _departDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all required fields')),
        );
        return;
      }
      final mode = TransportMode.values.firstWhere(
        (m) => m.name.toLowerCase() == _selectedMode.toLowerCase(),
        orElse: () => TransportMode.flight,
      );
      request = SimpleTransportSearchRequest(
        origin: _origin!.displayName,
        destination: _destination!.displayName,
        departDate: _departDate!,
        mode: mode,
        travelerAges: ages,
        isRoundTrip: _currentTabIndex == 1,
        returnDate: _returnDate,
      );
    } else if (_currentTabIndex == 2) {
      // Multi-City
      // Validate: Need at least one leg? All legs must be valid?
      // "Please fill in all required fields" error mentioned by user.
      // We should check if ALL legs have origin, dest, date.
      if (_legs.isEmpty) return;
      final legsData = <Map<String, dynamic>>[];
      for (final leg in _legs) {
        if (leg.origin == null ||
            leg.destination == null ||
            leg.departDate == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please complete all leg details')),
          );
          return;
        }
        legsData.add({
          'origin': leg.origin!.displayName,
          'destination': leg.destination!.displayName,
          'date': leg.departDate!,
        });
      }
      // Assume first leg mode applies or generic? The form has mode per leg.
      // But service interface might expect one mode or list. Request object allows mode per leg?
      // Request model I made has `mode`.
      // Let's use the first leg's mode for now or update Controller to loop modes.
      // For simplicity/mock, using the first leg's mode or generic flight.
      final modeStr = _legs.first.mode;
      final mode = TransportMode.values.firstWhere(
        (m) => m.name.toLowerCase() == modeStr.toLowerCase(),
        orElse: () => TransportMode.flight,
      );
      request = MultiCityTransportSearchRequest(
        legs: legsData,
        mode: mode,
        travelerAges: ages,
      );
    } else if (_currentTabIndex == 3) {
      // Meet Up
      // Validate: destination, date, friends list
      if (_destination == null || _departDate == null || _friends.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill location and date')),
        );
        return;
      }
      final friendsData = <Map<String, dynamic>>[];
      for (final friend in _friends) {
        if (friend.origin == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select origin for all friends'),
            ),
          );
          return;
        }
        friendsData.add({'origin': friend.origin!.displayName});
      }
      request = MeetUpTransportSearchRequest(
        friends: friendsData,
        destination: _destination!.displayName,
        meetDate: _departDate!,
        mode: TransportMode
            .flight, // Default or pick from UI? MeetUp form has mode per friend
      );
    }
    if (request != null) {
      ref
          .read(transportSearchControllerProvider(_currentTabIndex).notifier)
          .search(request);
      setState(() {
        _hasSearched = true;
        _shouldCollapseOnResults = true;
      });
    }
  }

  void _autoCollapseCurrentForm() {
    // Get the scroll controller and form key for the current tab
    ScrollController controller;
    GlobalKey formKey;
    switch (_currentTabIndex) {
      case 0:
        controller = _oneWayScrollController;
        formKey = _oneWayFormKey;
        break;
      case 1:
        controller = _roundTripScrollController;
        formKey = _roundTripFormKey;
        break;
      case 2:
        controller = _multiCityScrollController;
        formKey = _multiCityFormKey;
        break;
      case 3:
        controller = _meetUpScrollController;
        formKey = _meetUpFormKey;
        break;
      default:
        return;
    }
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

  @override
  Widget build(BuildContext context) {
    // Listen for results and collapse form when they arrive
    // Listen for results and collapse form when they arrive
    ref.listen<AsyncValue<List<TransportResult>>>(
      transportSearchControllerProvider(_currentTabIndex),
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
    // Results are rendered in each tab's _buildResults method
    return Scaffold(
      body: NestedScrollView(
        key: const PageStorageKey('transport_search'),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            floating: false,
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
                    _origin != null && _destination != null
                        ? '${_origin!.name} → ${_destination!.name}'
                        : 'Transport Search',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (_departDate != null)
                    Text(
                      '${DateFormat('MMM dd').format(_departDate!)}${_returnDate != null ? ' - ${DateFormat('MMM dd').format(_returnDate!)}' : ''} • ${_getTravelerCount()} travelers',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                ],
              ),
            ),
          ),
        ],
        body: Column(
          children: [
            // Tabs and form
            Expanded(
              child: SwipeableTabs(
                initialIndex: _currentTabIndex,
                onTabChanged: (index) =>
                    setState(() => _currentTabIndex = index),
                tabs: [
                  TabConfig(name: 'One Way', content: _buildOneWayForm()),
                  TabConfig(name: 'Round Trip', content: _buildRoundTripForm()),
                  TabConfig(name: 'Multi-City', content: _buildMultiCityForm()),
                  TabConfig(name: 'Meet Up', content: _buildMeetUpForm()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleForm() {
    // Get the current tab's scroll controller and form key
    ScrollController controller;
    GlobalKey formKey;
    switch (_currentTabIndex) {
      case 0:
        controller = _oneWayScrollController;
        formKey = _oneWayFormKey;
        break;
      case 1:
        controller = _roundTripScrollController;
        formKey = _roundTripFormKey;
        break;
      case 2:
        controller = _multiCityScrollController;
        formKey = _multiCityFormKey;
        break;
      case 3:
        controller = _meetUpScrollController;
        formKey = _meetUpFormKey;
        break;
      default:
        return;
    }
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
    ScrollController controller;
    GlobalKey formKey;
    switch (_currentTabIndex) {
      case 0:
        controller = _oneWayScrollController;
        formKey = _oneWayFormKey;
        break;
      case 1:
        controller = _roundTripScrollController;
        formKey = _roundTripFormKey;
        break;
      case 2:
        controller = _multiCityScrollController;
        formKey = _multiCityFormKey;
        break;
      case 3:
        controller = _meetUpScrollController;
        formKey = _meetUpFormKey;
        break;
      default:
        return false;
    }
    if (!controller.hasClients) return false;
    double formHeight = 400;
    final renderBox = formKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      formHeight = renderBox.size.height;
    }
    return controller.offset > formHeight * 0.3;
  }

  // Get traveler count from passenger form values
  int _getTravelerCount() {
    if (_passengerFormValues == null) return 1;
    final passengerValues = _passengerFormValues!.values[1] as Map<int, int>?;
    if (passengerValues == null) return 1;
    int count = 0;
    for (final v in passengerValues.values) {
      count += v;
    }
    return count > 0 ? count : 1;
  }

  Widget _buildOneWayForm() {
    final resultsAsync = ref.watch(transportSearchControllerProvider(0));
    return CustomScrollView(
      controller: _oneWayScrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            key: _oneWayFormKey,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AToBLocation(
                  origin: _origin,
                  destination: _destination,
                  onOriginSelected: (loc) => setState(() => _origin = loc),
                  onDestinationSelected: (loc) =>
                      setState(() => _destination = loc),
                ),
                const SizedBox(height: 16),
                DateCustom(
                  label: 'Departure',
                  isRequired: true,
                  selectedDate: _departDate,
                  onSelected: (date) => setState(() => _departDate = date),
                ),
                const SizedBox(height: 16),
                OptionsList<String>(
                  label: 'Mode',
                  options: _modeOptions,
                  selectedValue: _selectedMode,
                  onChanged: (val) =>
                      setState(() => _selectedMode = val ?? 'Flight'),
                ),
                const SizedBox(height: 16),
                ModalBottomSheetForm(
                  config: _transportModalConfig,
                  buttonText: '1 Adult, Economy',
                  onDone: (values) =>
                      setState(() => _passengerFormValues = values),
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

  Widget _buildRoundTripForm() {
    final resultsAsync = ref.watch(transportSearchControllerProvider(1));
    return CustomScrollView(
      controller: _roundTripScrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            key: _roundTripFormKey,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AToBLocation(
                  origin: _origin,
                  destination: _destination,
                  onOriginSelected: (loc) => setState(() => _origin = loc),
                  onDestinationSelected: (loc) =>
                      setState(() => _destination = loc),
                ),
                const SizedBox(height: 16),
                RoundDate(
                  departureDate: _departDate,
                  returnDate: _returnDate,
                  onDepartureSelected: (date) =>
                      setState(() => _departDate = date),
                  onReturnSelected: (date) =>
                      setState(() => _returnDate = date),
                ),
                const SizedBox(height: 16),
                OptionsList<String>(
                  label: 'Mode',
                  options: _modeOptions,
                  selectedValue: _selectedMode,
                  onChanged: (val) =>
                      setState(() => _selectedMode = val ?? 'Flight'),
                ),
                const SizedBox(height: 16),
                ModalBottomSheetForm(
                  config: _transportModalConfig,
                  buttonText: '1 Adult, Economy',
                  onDone: (values) =>
                      setState(() => _passengerFormValues = values),
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
    final resultsAsync = ref.watch(transportSearchControllerProvider(2));
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
                ...List.generate(_legs.length, (index) => _buildLegCard(index)),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () => setState(() => _legs.add(_LegData())),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Another Leg'),
                ),
                const SizedBox(height: 16),
                ModalBottomSheetForm(
                  config: _transportModalConfig,
                  buttonText: '1 Adult, Economy',
                  onDone: (values) =>
                      setState(() => _passengerFormValues = values),
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

  Widget _buildLegCard(int index) {
    final leg = _legs[index];
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
                  'Leg ${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (_legs.length > 1)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => setState(() => _legs.removeAt(index)),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            AToBLocation(
              origin: leg.origin,
              destination: leg.destination,
              onOriginSelected: (loc) => setState(() => leg.origin = loc),
              onDestinationSelected: (loc) =>
                  setState(() => leg.destination = loc),
            ),
            const SizedBox(height: 16),
            DateCustom(
              label: 'Departure',
              isRequired: true,
              selectedDate: leg.departDate,
              onSelected: (date) => setState(() => leg.departDate = date),
            ),
            const SizedBox(height: 16),
            OptionsList<String>(
              label: 'Mode',
              options: _modeOptions,
              selectedValue: leg.mode,
              onChanged: (val) => setState(() => leg.mode = val ?? 'Flight'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetUpForm() {
    final resultsAsync = ref.watch(transportSearchControllerProvider(3));
    return CustomScrollView(
      controller: _meetUpScrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            key: _meetUpFormKey,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Common destination
                Destination(
                  label: 'Meet Up Location',
                  isRequired: true,
                  selectedLocation: _destination,
                  onSelected: (loc) => setState(() => _destination = loc),
                ),
                const SizedBox(height: 16),
                DateCustom(
                  label: 'Date',
                  isRequired: true,
                  selectedDate: _departDate,
                  onSelected: (date) => setState(() => _departDate = date),
                ),
                const SizedBox(height: 16),
                ...List.generate(
                  _friends.length,
                  (index) => _buildFriendCard(index),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () => setState(() => _friends.add(_FriendData())),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Another Friend'),
                ),
                const SizedBox(height: 16),
                ModalBottomSheetForm(
                  config: _transportModalConfig,
                  buttonText: '1 Adult, Economy',
                  onDone: (values) =>
                      setState(() => _passengerFormValues = values),
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

  Widget _buildFriendCard(int index) {
    final friend = _friends[index];
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
                  'Friend ${index + 1}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (_friends.length > 1)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => setState(() => _friends.removeAt(index)),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Destination(
              label: 'Origin',
              isRequired: true,
              selectedLocation: friend.origin,
              onSelected: (loc) => setState(() => friend.origin = loc),
            ),
            const SizedBox(height: 16),
            OptionsList<String>(
              label: 'Mode',
              options: _modeOptions,
              selectedValue: friend.mode,
              onChanged: (val) => setState(() => friend.mode = val ?? 'Flight'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults(AsyncValue<List<TransportResult>> resultsAsync) {
    return resultsAsync.when(
      data: (results) {
        if (results.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Search for transport options')),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => ResultCard(
              data: TransportResultCardData(
                result: results[i],
                onTap: () => _navigateToDetail(results[i]),
                trailing: SaveButton(
                  section: ItinerarySection.transport,
                  dedupeKey: DedupeStrategy.transport(
                    mode: results[i].mode.name,
                    origin: results[i].origin,
                    destination: results[i].destination,
                    departAt: results[i].departAt,
                    vendor: results[i].vendor,
                  ),
                  title:
                      '${results[i].mode.name.toUpperCase()} to ${results[i].destination}',
                  details: {
                    'origin': results[i].origin,
                    'destination': results[i].destination,
                    'mode': results[i].mode.name,
                    'durationMinutes': results[i].durationMinutes,
                  },
                  externalData: SavedItemExternal(
                    vendor: results[i].vendor ?? 'Unknown',
                    vendorUrl: null,
                    externalId: null,
                  ),
                  time: SavedItemTime(
                    start: results[i].departAt,
                    end: results[i].arriveAt,
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

  void _navigateToDetail(TransportResult result) {
    saveScrollPosition();
    final item = TransportItem(
      id: result.id,
      providers: [
        if (result.vendor != null)
          TransportProvider(name: result.vendor!, logoUrl: null, code: null),
      ],
      segments: [
        TransportSegment(
          origin: result.originAirportCode ?? result.origin,
          destination: result.destinationAirportCode ?? result.destination,
          departure: result.departAt,
          arrival: result.arriveAt,
          duration: Duration(minutes: result.durationMinutes),
          carrier: result.vendor ?? 'Unknown',
          transportIdentifier: '',
          mode: _mapMode(result.mode),
        ),
      ],
      price: Price(amount: result.priceAmount, currency: result.currency),
      totalDuration: Duration(minutes: result.durationMinutes),
      departure: result.departAt,
      arrival: result.arriveAt,
      mode: _mapMode(result.mode),
      bookingUrl: result.vendorUrl,
    );
    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (_) => TransportDetailScreen(item: item)),
        )
        .then((_) {
          _restoreScrollPosition();
        });
  }

  request.TransportMode _mapMode(TransportMode mode) {
    switch (mode) {
      case TransportMode.flight:
        return request.TransportMode.flight;
      case TransportMode.train:
        return request.TransportMode.train;
      case TransportMode.bus:
        return request.TransportMode.bus;
    }
  }
}

// Helper classes for multi-city and meet-up state
class _LegData {
  Location? origin;
  Location? destination;
  DateTime? departDate;
  String mode = 'Flight';
}

class _FriendData {
  Location? origin;
  String mode = 'Flight';
}
