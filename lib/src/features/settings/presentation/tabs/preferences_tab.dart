import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';

/// Preferences tab for search defaults across verticals.
class PreferencesTab extends ConsumerStatefulWidget {
  final VoidCallback onChanged;

  const PreferencesTab({super.key, required this.onChanged});

  @override
  ConsumerState<PreferencesTab> createState() => _PreferencesTabState();
}

class _PreferencesTabState extends ConsumerState<PreferencesTab> {
  // Transport
  List<String> _transportModes = [];
  bool _directOnly = false;
  String _cabinClass = 'economy';

  // Accommodation
  double _minReviewScore = 3.5;
  List<String> _amenities = [];

  // Food
  List<String> _dietary = [];
  double _minFoodRating = 3.0;

  // Trails
  List<String> _difficulties = [];
  int? _maxDuration;

  static const _allTransportModes = ['train', 'bus', 'flight', 'ferry', 'car'];
  static const _allAmenities = [
    'wifi',
    'breakfast',
    'pool',
    'gym',
    'parking',
    'spa',
  ];
  static const _allDietary = [
    'vegan',
    'vegetarian',
    'halal',
    'kosher',
    'gluten-free',
  ];
  static const _allDifficulties = ['easy', 'moderate', 'hard'];
  static const _cabinClasses = [
    'economy',
    'premium_economy',
    'business',
    'first',
  ];

  @override
  void initState() {
    super.initState();
    _loadFromStore();
  }

  void _loadFromStore() {
    final defaults = ref
        .read(settingsStoreNotifierProvider)
        .state
        .searchDefaults;
    if (defaults != null) {
      _transportModes = List.from(defaults.transport?.preferredModes ?? []);
      _directOnly = defaults.transport?.directOnly ?? false;
      _cabinClass = defaults.transport?.cabinClass ?? 'economy';
      _minReviewScore = defaults.accommodation?.minReviewScore ?? 3.5;
      _amenities = List.from(defaults.accommodation?.requiredAmenities ?? []);
      _dietary = List.from(defaults.food?.dietaryPreferences ?? []);
      _minFoodRating = defaults.food?.minRating ?? 3.0;
      _difficulties = List.from(defaults.trails?.difficulties ?? []);
      _maxDuration = defaults.trails?.maxDurationMinutes;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Transport Section
          _SectionHeader(icon: Icons.directions_transit, title: 'Transport'),
          _ChipSelector(
            label: 'Preferred Modes',
            options: _allTransportModes,
            selected: _transportModes,
            onChanged: (v) {
              setState(() => _transportModes = v);
              widget.onChanged();
            },
          ),
          SwitchListTile(
            title: const Text('Direct connections only'),
            value: _directOnly,
            onChanged: (v) {
              setState(() => _directOnly = v);
              widget.onChanged();
            },
          ),
          DropdownButtonFormField<String>(
            initialValue: _cabinClass,
            decoration: const InputDecoration(labelText: 'Default Cabin Class'),
            items: _cabinClasses
                .map(
                  (c) => DropdownMenuItem(
                    value: c,
                    child: Text(_formatCabinClass(c)),
                  ),
                )
                .toList(),
            onChanged: (v) {
              if (v != null) {
                setState(() => _cabinClass = v);
                widget.onChanged();
              }
            },
          ),
          const SizedBox(height: 24),

          // Accommodation Section
          _SectionHeader(icon: Icons.hotel, title: 'Accommodation'),
          const Text('Minimum Review Score'),
          Slider(
            value: _minReviewScore,
            min: 1.0,
            max: 5.0,
            divisions: 8,
            label: _minReviewScore.toStringAsFixed(1),
            onChanged: (v) {
              setState(() => _minReviewScore = v);
              widget.onChanged();
            },
          ),
          _ChipSelector(
            label: 'Required Amenities',
            options: _allAmenities,
            selected: _amenities,
            onChanged: (v) {
              setState(() => _amenities = v);
              widget.onChanged();
            },
          ),
          const SizedBox(height: 24),

          // Food Section
          _SectionHeader(icon: Icons.restaurant, title: 'Gastronomy'),
          _ChipSelector(
            label: 'Dietary Preferences',
            options: _allDietary,
            selected: _dietary,
            onChanged: (v) {
              setState(() => _dietary = v);
              widget.onChanged();
            },
          ),
          const Text('Minimum Rating'),
          Slider(
            value: _minFoodRating,
            min: 1.0,
            max: 5.0,
            divisions: 8,
            label: _minFoodRating.toStringAsFixed(1),
            onChanged: (v) {
              setState(() => _minFoodRating = v);
              widget.onChanged();
            },
          ),
          const SizedBox(height: 24),

          // Trails Section
          _SectionHeader(icon: Icons.hiking, title: 'Trails'),
          _ChipSelector(
            label: 'Difficulties',
            options: _allDifficulties,
            selected: _difficulties,
            onChanged: (v) {
              setState(() => _difficulties = v);
              widget.onChanged();
            },
          ),
          DropdownButtonFormField<int?>(
            initialValue: _maxDuration,
            decoration: const InputDecoration(labelText: 'Max Duration'),
            items: const [
              DropdownMenuItem(value: null, child: Text('No limit')),
              DropdownMenuItem(value: 60, child: Text('1 hour')),
              DropdownMenuItem(value: 120, child: Text('2 hours')),
              DropdownMenuItem(value: 180, child: Text('3 hours')),
              DropdownMenuItem(value: 240, child: Text('4 hours')),
            ],
            onChanged: (v) {
              setState(() => _maxDuration = v);
              widget.onChanged();
            },
          ),

          const SizedBox(height: 24),
          Card(
            color: theme.colorScheme.surfaceContainerHighest,
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'These preferences will pre-fill search filters. You can override them per search.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatCabinClass(String c) {
    return c
        .split('_')
        .map((w) => w[0].toUpperCase() + w.substring(1))
        .join(' ');
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}

class _ChipSelector extends StatelessWidget {
  final String label;
  final List<String> options;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;

  const _ChipSelector({
    required this.label,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options
              .map(
                (o) => FilterChip(
                  label: Text(_formatLabel(o)),
                  selected: selected.contains(o),
                  onSelected: (s) {
                    final newList = List<String>.from(selected);
                    if (s) {
                      newList.add(o);
                    } else {
                      newList.remove(o);
                    }
                    onChanged(newList);
                  },
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  String _formatLabel(String s) {
    return s[0].toUpperCase() + s.substring(1).replaceAll('-', ' ');
  }
}
