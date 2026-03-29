import 'package:freezed_annotation/freezed_annotation.dart';

part 'vertical.g.dart';

/// Unified vertical/section enum for all features.
///
/// This enum represents the 6 main feature verticals in the app.
/// Used for:
/// - Search queries (which vertical to search)
/// - Saved items (which section the item belongs to)
/// - Itinerary organization
/// - Map layer toggling
@JsonEnum(alwaysCreate: true)
enum FeatureVertical {
  transport,
  accommodation,
  entertainment,
  gastronomy,
  events,
  trails;

  /// Display name for UI
  String get displayName {
    switch (this) {
      case FeatureVertical.transport:
        return 'Transport';
      case FeatureVertical.accommodation:
        return 'Accommodation';
      case FeatureVertical.entertainment:
        return 'Entertainment';
      case FeatureVertical.gastronomy:
        return 'Gastronomy';
      case FeatureVertical.events:
        return 'Events';
      case FeatureVertical.trails:
        return 'Trails';
    }
  }

  /// Icon for UI
  String get iconName {
    switch (this) {
      case FeatureVertical.transport:
        return 'flight';
      case FeatureVertical.accommodation:
        return 'hotel';
      case FeatureVertical.entertainment:
        return 'attractions';
      case FeatureVertical.gastronomy:
        return 'restaurant';
      case FeatureVertical.events:
        return 'event';
      case FeatureVertical.trails:
        return 'hiking';
    }
  }
}

/// Backward compatibility alias for saved items.
/// @Deprecated('Use FeatureVertical instead')
typedef ItinerarySection = FeatureVertical;

/// Backward compatibility alias for search operations.
/// @Deprecated('Use FeatureVertical instead')
typedef SearchVertical = FeatureVertical;
