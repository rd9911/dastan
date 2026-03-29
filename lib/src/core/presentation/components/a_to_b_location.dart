import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/locations/domain/location.dart';
import 'package:dastan/src/core/presentation/components/destination.dart';

/// A component with Origin and Destination location pickers.
/// Validates that origin and destination are not the same.
class AToBLocation extends ConsumerStatefulWidget {
  /// The currently selected origin location.
  final Location? origin;

  /// The currently selected destination location.
  final Location? destination;

  /// Callback when origin is selected.
  final ValueChanged<Location?> onOriginSelected;

  /// Callback when destination is selected.
  final ValueChanged<Location?> onDestinationSelected;

  /// Label for origin field. Defaults to "Origin".
  final String originLabel;

  /// Label for destination field. Defaults to "Destination".
  final String destinationLabel;

  const AToBLocation({
    super.key,
    this.origin,
    this.destination,
    required this.onOriginSelected,
    required this.onDestinationSelected,
    this.originLabel = 'Origin',
    this.destinationLabel = 'Destination',
  });

  @override
  ConsumerState<AToBLocation> createState() => _AToBLocationState();
}

class _AToBLocationState extends ConsumerState<AToBLocation> {
  String? _errorMessage;

  void _validateLocations(Location? origin, Location? destination) {
    if (origin != null && destination != null && origin.id == destination.id) {
      setState(() {
        _errorMessage = 'Origin and destination cannot be the same';
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Destination(
          label: widget.originLabel,
          isRequired: true,
          selectedLocation: widget.origin,
          onSelected: (location) {
            widget.onOriginSelected(location);
            _validateLocations(location, widget.destination);
          },
        ),
        const SizedBox(height: 16),
        Destination(
          label: widget.destinationLabel,
          isRequired: true,
          selectedLocation: widget.destination,
          onSelected: (location) {
            widget.onDestinationSelected(location);
            _validateLocations(widget.origin, location);
          },
        ),
        if (_errorMessage != null) ...[
          const SizedBox(height: 8),
          Text(
            _errorMessage!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
