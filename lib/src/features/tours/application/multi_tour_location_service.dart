import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/features/tours/application/tour_audio_service.dart';

part 'multi_tour_location_service.g.dart';

/// Watches the user's location and detects when they arrive at the next
/// multi-tour stop, triggering a local notification.
@riverpod
class MultiTourLocationService extends _$MultiTourLocationService {
  StreamSubscription<Position>? _locationSub;

  @override
  FutureOr<void> build() {}

  /// Start watching location for a multi-tour.
  /// Only activates if the tour is of type [TourType.multi].
  void startTracking(TourDetail multiTour) {
    if (multiTour.summary.type != TourType.multi) return;

    final childTours = multiTour.childTours ?? [];
    if (childTours.isEmpty) return;

    _locationSub = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((position) {
      final currentChildIndex = ref
              .read(tourAudioServiceProvider)
              .value
              ?.currentChildTourIndex ??
          0;

      if (currentChildIndex >= childTours.length - 1) return;

      // Check if user is within the geofence of the NEXT stop
      final nextWaypointIndex = currentChildIndex + 1;
      if (nextWaypointIndex >= multiTour.waypoints.length) return;

      final nextWaypoint = multiTour.waypoints[nextWaypointIndex];

      final distanceToNext = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        nextWaypoint.latitude,
        nextWaypoint.longitude,
      );

      if (distanceToNext <= nextWaypoint.radiusMeters) {
        _onArriveAtNextStop(multiTour, nextWaypointIndex);
      }
    });
  }

  /// Called when user physically arrives at the next tour stop.
  void _onArriveAtNextStop(TourDetail multiTour, int childIndex) {
    _showArrivalNotification(multiTour, childIndex);
  }

  Future<void> _showArrivalNotification(
    TourDetail tour,
    int childIndex,
  ) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Initialize if needed
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initSettings);

    final childTours = tour.childTours ?? [];
    final nextTourName = childIndex < childTours.length
        ? childTours[childIndex].name
        : 'the next stop';

    await flutterLocalNotificationsPlugin.show(
      childIndex,
      'Next stop ready!',
      'You\'ve arrived at $nextTourName. Tap to continue.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'tour_stops',
          'Tour Stop Alerts',
          channelDescription: 'Notifications when you arrive at tour stops',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  /// Stop watching location. Call in dispose.
  void stopTracking() {
    _locationSub?.cancel();
    _locationSub = null;
  }
}
