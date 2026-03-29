import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/locations/domain/location.dart';
import 'package:dastan/src/features/locations/presentation/location_autocomplete.dart';

/// A single location picker component wrapping LocationAutocomplete.
class Destination extends ConsumerWidget {
  /// The label to display. Defaults to "Destination".
  final String label;

  /// Whether this field is required.
  final bool isRequired;

  /// The currently selected location.
  final Location? selectedLocation;

  /// Callback when a location is selected.
  final ValueChanged<Location?> onSelected;

  const Destination({
    super.key,
    this.label = 'Destination',
    this.isRequired = true,
    this.selectedLocation,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayLabel = isRequired ? '$label *' : label;

    return LocationAutocomplete(
      label: displayLabel,
      onSelected: onSelected,
      initialLocation: selectedLocation,
    );
  }
}
