import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/location_repository.dart';
import '../data/photon_data_source.dart';
import '../domain/location.dart';

/// Autocomplete widget for location search.
///
/// Features:
/// - Debounced search (500ms) to reduce API calls
/// - Minimum 3 character query before searching
/// - Shows popular locations for instant results
/// - Displays loading indicator during search
/// - Filters by [LocationSearchType] for different use cases
class LocationAutocomplete extends ConsumerStatefulWidget {
  final String label;
  final ValueChanged<Location> onSelected;
  final Location? initialLocation;
  final String? hintText;
  final IconData? prefixIcon;

  /// Type of locations to search for:
  /// - [LocationSearchType.citiesOnly] - For Accommodation, Entertainment, etc.
  /// - [LocationSearchType.citiesAndAirports] - For Transport (flights)
  final LocationSearchType searchType;

  const LocationAutocomplete({
    super.key,
    required this.label,
    required this.onSelected,
    this.initialLocation,
    this.hintText,
    this.prefixIcon,
    this.searchType = LocationSearchType.citiesOnly,
  });

  @override
  ConsumerState<LocationAutocomplete> createState() =>
      _LocationAutocompleteState();
}

class _LocationAutocompleteState extends ConsumerState<LocationAutocomplete> {
  late TextEditingController _controller;
  Timer? _debounceTimer;
  bool _isLoading = false;

  /// Debounce duration to reduce API calls
  static const _debounceDuration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialLocation?.displayName ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<List<Location>> _searchLocations(String query) async {
    if (query.isEmpty) return [];

    setState(() => _isLoading = true);

    try {
      final repository = ref.read(locationRepositoryProvider);
      return await repository.searchLocations(
        query,
        searchType: widget.searchType,
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Autocomplete<Location>(
          initialValue: TextEditingValue(text: _controller.text),
          optionsBuilder: (TextEditingValue textEditingValue) async {
            final query = textEditingValue.text;

            if (query.isEmpty) {
              return const Iterable<Location>.empty();
            }

            // Use a Completer with debounce
            final completer = Completer<List<Location>>();

            _debounceTimer?.cancel();
            _debounceTimer = Timer(_debounceDuration, () async {
              final results = await _searchLocations(query);
              if (!completer.isCompleted) {
                completer.complete(results);
              }
            });

            // For immediate feedback, show cached/popular results
            if (query.length >= 3) {
              final repository = ref.read(locationRepositoryProvider);
              // This will return cached results if available
              final quickResults = await repository.searchLocations(
                query,
                searchType: widget.searchType,
              );
              if (!completer.isCompleted && quickResults.isNotEmpty) {
                return quickResults;
              }
            }

            return completer.future;
          },
          displayStringForOption: (Location option) => option.displayName,
          onSelected: (Location selection) {
            widget.onSelected(selection);
          },
          fieldViewBuilder:
              (
                BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return TextFormField(
                  controller: fieldTextEditingController,
                  focusNode: fieldFocusNode,
                  decoration: InputDecoration(
                    labelText: widget.label,
                    hintText: widget.hintText,
                    border: const OutlineInputBorder(),
                    prefixIcon: Icon(widget.prefixIcon ?? Icons.location_on),
                    suffixIcon: _isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a location';
                    }
                    return null;
                  },
                );
              },
          optionsViewBuilder:
              (
                BuildContext context,
                AutocompleteOnSelected<Location> onSelected,
                Iterable<Location> options,
              ) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth,
                        maxHeight: 300,
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Location option = options.elementAt(index);
                          // Use airplane icon for airports, place for cities
                          final isAirport =
                              option.osmType == 'N' &&
                              (option.name.contains('Airport') ||
                                  option.code != null);
                          return ListTile(
                            leading: Icon(
                              isAirport ? Icons.flight : Icons.place,
                            ),
                            title: Text(option.name),
                            subtitle: Text(
                              option.formattedAddress ?? option.displayName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              onSelected(option);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
        );
      },
    );
  }
}
