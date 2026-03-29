import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';

/// Service for applying user settings defaults to various app surfaces.
class PrefillService {
  final Ref _ref;

  PrefillService(this._ref);

  /// Get default travelers for new itinerary creation.
  ({int adults, List<int> childAges}) getDefaultTravelers() {
    final preset = _ref
        .read(settingsStoreNotifierProvider)
        .state
        .defaultTravelerPreset;
    if (preset != null) {
      return (adults: preset.adults, childAges: preset.childAges);
    }
    return (adults: 2, childAges: []);
  }

  /// Get locale for the app.
  String getLocale() {
    return _ref.read(currentLocaleProvider);
  }

  /// Get currency for price display.
  String getCurrency() {
    return _ref.read(currentCurrencyProvider);
  }

  /// Get units preferences.
  UnitsPrefs getUnits() {
    return _ref.read(unitsPrefsProvider);
  }

  /// Get transport search defaults.
  TransportDefaults? getTransportDefaults() {
    return _ref.read(transportDefaultsProvider);
  }

  /// Get accommodation search defaults.
  AccommodationDefaults? getAccommodationDefaults() {
    return _ref.read(accommodationDefaultsProvider);
  }

  /// Get food/gastronomy search defaults.
  FoodDefaults? getFoodDefaults() {
    return _ref.read(foodDefaultsProvider);
  }

  /// Get trails search defaults.
  TrailDefaults? getTrailDefaults() {
    return _ref.read(trailDefaultsProvider);
  }

  /// Check if notification is allowed based on quiet hours.
  bool isNotificationAllowed({DateTime? at}) {
    final now = at ?? DateTime.now();
    return _ref
        .read(settingsStoreNotifierProvider)
        .state
        .isNotificationAllowed(now);
  }

  /// Check if trip-only mode is enabled.
  bool isTripOnlyModeEnabled() {
    return _ref
            .read(settingsStoreNotifierProvider)
            .state
            .notificationPrefs
            ?.tripOnlyMode ??
        false;
  }

  /// Check if a notification should be sent considering all settings.
  bool shouldSendNotification({
    required DateTime scheduledTime,
    DateTime? tripStart,
    DateTime? tripEnd,
  }) {
    // Check quiet hours
    if (!isNotificationAllowed(at: scheduledTime)) {
      return false;
    }

    // Check trip-only mode
    if (isTripOnlyModeEnabled() && tripStart != null && tripEnd != null) {
      if (scheduledTime.isBefore(tripStart) || scheduledTime.isAfter(tripEnd)) {
        return false;
      }
    }

    return true;
  }
}

/// Provider for the prefill service.
final prefillServiceProvider = Provider<PrefillService>((ref) {
  return PrefillService(ref);
});

/// Example extension for transport search to apply defaults.
extension TransportSearchPrefill on TransportDefaults {
  Map<String, dynamic> toFilterParams() {
    return {
      if (preferredModes.isNotEmpty) 'modes': preferredModes,
      if (directOnly) 'direct_only': true,
      if (cabinClass != 'economy') 'cabin_class': cabinClass,
    };
  }
}

/// Example extension for accommodation search to apply defaults.
extension AccommodationSearchPrefill on AccommodationDefaults {
  Map<String, dynamic> toFilterParams() {
    return {
      'min_review_score': minReviewScore,
      if (requiredAmenities.isNotEmpty) 'amenities': requiredAmenities,
      if (maxPricePerNight != null) 'max_price': maxPricePerNight,
    };
  }
}

/// Example extension for food search to apply defaults.
extension FoodSearchPrefill on FoodDefaults {
  Map<String, dynamic> toFilterParams() {
    return {
      if (dietaryPreferences.isNotEmpty) 'dietary': dietaryPreferences,
      if (cuisineTypes.isNotEmpty) 'cuisines': cuisineTypes,
      'min_rating': minRating,
    };
  }
}

/// Example extension for trails search to apply defaults.
extension TrailsSearchPrefill on TrailDefaults {
  Map<String, dynamic> toFilterParams() {
    return {
      if (difficulties.isNotEmpty) 'difficulties': difficulties,
      if (maxDurationMinutes != null) 'max_duration': maxDurationMinutes,
      if (maxDistanceKm != null) 'max_distance': maxDistanceKm,
    };
  }
}
