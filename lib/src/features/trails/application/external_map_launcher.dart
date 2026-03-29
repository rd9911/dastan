import 'package:url_launcher/url_launcher.dart';

/// Utility to launch external map apps with coordinates.
class ExternalMapLauncher {
  /// Opens the location in an external map app (Google Maps, Apple Maps, etc).
  static Future<void> launchMap({
    required double lat,
    required double lng,
    String? name,
  }) async {
    // Universal geo URI scheme
    // geo:lat,lng?q=lat,lng(Label)
    final uriString = name != null
        ? 'geo:$lat,$lng?q=$lat,$lng($name)'
        : 'geo:$lat,$lng';

    final uri = Uri.parse(uriString);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Fallback to Google Maps web
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
      await launchUrl(
        Uri.parse(googleMapsUrl),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  /// Opens directions to the location.
  static Future<void> launchDirections({
    required double lat,
    required double lng,
  }) async {
    final googleMapsUrl =
        'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
    await launchUrl(
      Uri.parse(googleMapsUrl),
      mode: LaunchMode.externalApplication,
    );
  }
}
