import '../domain/location.dart';
import 'photon_dto.dart';

/// Mapper to convert Photon DTOs to domain Location models.
class LocationMapper {
  const LocationMapper();

  /// Maps a Photon feature to a domain Location.
  Location fromPhotonFeature(PhotonFeature feature) {
    final props = feature.properties;
    final coords = feature.geometry.coordinates;

    // Photon coordinates are [longitude, latitude]
    final lng = coords.isNotEmpty ? coords[0] : null;
    final lat = coords.length > 1 ? coords[1] : null;

    // Build formatted address from available components
    final addressParts = <String>[];
    if (props.street != null) {
      if (props.houseNumber != null) {
        addressParts.add('${props.street} ${props.houseNumber}');
      } else {
        addressParts.add(props.street!);
      }
    }
    if (props.city != null) addressParts.add(props.city!);
    if (props.state != null) addressParts.add(props.state!);
    if (props.postcode != null) addressParts.add(props.postcode!);
    if (props.country != null) addressParts.add(props.country!);

    // Generate unique ID from OSM type and ID
    final id = props.osmType != null && props.osmId != null
        ? '${props.osmType}${props.osmId}'
        : '${lat}_$lng';

    return Location(
      id: id,
      name: props.name ?? props.city ?? props.street ?? 'Unknown',
      country: props.country ?? '',
      state: props.state,
      city: props.city,
      lat: lat,
      lng: lng,
      formattedAddress: addressParts.isNotEmpty
          ? addressParts.join(', ')
          : null,
      osmType: props.osmType,
      osmId: props.osmId,
    );
  }

  /// Maps a list of Photon features to domain Locations.
  List<Location> fromPhotonResponse(PhotonResponse response) {
    return response.features.map(fromPhotonFeature).toList();
  }
}
