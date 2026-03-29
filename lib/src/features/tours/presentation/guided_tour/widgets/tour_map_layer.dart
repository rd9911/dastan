import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/application/tour_audio_service.dart';

/// Displays the tour route on a full-screen map with waypoint markers and polyline.
class TourMapLayer extends ConsumerWidget {
  final TourDetail detail;
  final DraggableScrollableController sheetController;

  const TourMapLayer({
    super.key,
    required this.detail,
    required this.sheetController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waypoints = detail.waypoints;
    if (waypoints.isEmpty) {
      return const Center(
        key: Key('tour_map_empty'),
        child: Text('No waypoints available'),
      );
    }

    final currentSection =
        ref.watch(tourAudioServiceProvider).value?.currentSection ?? 0;

    return FlutterMap(
      key: const Key('tour_map'),
      options: MapOptions(
        initialCenter: LatLng(
          waypoints.first.latitude,
          waypoints.first.longitude,
        ),
        initialZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.dastan.app',
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: waypoints
                  .map((w) => LatLng(w.latitude, w.longitude))
                  .toList(),
              strokeWidth: 4,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
        MarkerLayer(
          markers: waypoints.asMap().entries.map((entry) {
            final i = entry.key;
            final wp = entry.value;
            final isPast = i < currentSection;
            final isCurrent = i == currentSection;
            return Marker(
              point: LatLng(wp.latitude, wp.longitude),
              width: 36,
              height: 36,
              child: _WaypointMarker(
                index: i + 1,
                label: wp.label,
                isPast: isPast,
                isCurrent: isCurrent,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _WaypointMarker extends StatelessWidget {
  final int index;
  final String? label;
  final bool isPast;
  final bool isCurrent;

  const _WaypointMarker({
    required this.index,
    this.label,
    required this.isPast,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor;
    if (isCurrent) {
      bgColor = Theme.of(context).colorScheme.primary;
    } else if (isPast) {
      bgColor = Theme.of(context).colorScheme.outline;
    } else {
      bgColor = Theme.of(context).colorScheme.surfaceContainerHighest;
    }

    final Color fgColor;
    if (isCurrent || isPast) {
      fgColor = Theme.of(context).colorScheme.onPrimary;
    } else {
      fgColor = Theme.of(context).colorScheme.onSurface;
    }

    return Tooltip(
      message: label ?? 'Stop $index',
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: isCurrent
              ? Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 3,
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
              color: fgColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
