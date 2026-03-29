import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';

/// Service for prefilling trails search.
class TrailsPrefillService {
  TrailPlace? getPrefilledPlace(Itinerary itinerary) {
    if (itinerary.destination != null) {
      return TrailPlace(
        granularity: PlaceGranularity.city,
        value: itinerary.destination!,
      );
    }
    return null;
  }
}
