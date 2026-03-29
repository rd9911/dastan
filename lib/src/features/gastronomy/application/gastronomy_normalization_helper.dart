import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dastan/src/features/gastronomy/domain/gastronomy_models.dart';

/// Helper for gastronomy data normalization and key generation.
///
/// Following Riverpod architecture - pure functions in application layer.
class GastronomyNormalizationHelper {
  /// Generates a deterministic dedupe key for a gastronomy item.
  ///
  /// Format: `gastronomy-{itineraryId}-{name}-{address}-{website}`
  /// Used for SavedItem deduplication within an itinerary.
  static String generateDedupeKey({
    required String itineraryId,
    required GastronomyResultCard item,
  }) {
    final normalizedName = item.name.toLowerCase();
    final normalizedAddress = item.address?.toLowerCase() ?? '';
    final website = item.website ?? '';

    final parts = [
      'gastronomy',
      itineraryId,
      normalizedName,
      normalizedAddress,
      website,
    ].where((part) => part.isNotEmpty).join('-');

    return parts;
  }

  /// Generates a deterministic dedupe key from full detail.
  static String generateDedupeKeyFromDetail({
    required String itineraryId,
    required GastronomyPlaceDetail detail,
  }) {
    final normalizedName = detail.name.toLowerCase();
    final normalizedAddress = detail.address?.toLowerCase() ?? '';
    final website = detail.website ?? '';

    final parts = [
      'gastronomy',
      itineraryId,
      normalizedName,
      normalizedAddress,
      website,
    ].where((part) => part.isNotEmpty).join('-');

    return parts;
  }

  /// Generates a SHA-256 cache key from search request.
  ///
  /// Includes place, filters, and sort for cache differentiation.
  static String generateSearchCacheKey(GastronomySearchRequest request) {
    final components = <String>[
      request.itineraryId,
      request.place.granularity.name,
      request.place.value.toLowerCase(),
      request.sort.name,
    ];

    // Add filter components
    if (request.filters != null) {
      final filters = request.filters!;

      if (filters.dietary.isNotEmpty) {
        final sortedDietary = List<String>.from(
          filters.dietary.map((d) => d.name),
        )..sort();
        components.add('dietary:${sortedDietary.join(',')}');
      }

      if (filters.cuisine.isNotEmpty) {
        final sortedCuisine = List<String>.from(
          filters.cuisine.map((c) => c.name),
        )..sort();
        components.add('cuisine:${sortedCuisine.join(',')}');
      }

      if (filters.priceBand != null) {
        components.add('price:${filters.priceBand!.name}');
      }

      if (filters.minRating != null) {
        components.add('rating:${filters.minRating}');
      }

      if (filters.openNow == true) {
        components.add('openNow');
      }

      if (filters.kidFriendly == true) {
        components.add('kidFriendly');
      }

      if (filters.dogFriendly == true) {
        components.add('dogFriendly');
      }

      if (filters.noiseLevel != null) {
        components.add('noise:${filters.noiseLevel!.name}');
      }
    }

    final combined = components.join('|');
    final bytes = utf8.encode(combined);
    final digest = sha256.convert(bytes);

    return digest.toString();
  }

  /// Formats price band as dollar signs.
  static String formatPriceTag(PriceBand priceBand) {
    switch (priceBand) {
      case PriceBand.budget:
        return r'$';
      case PriceBand.moderate:
        return r'$$';
      case PriceBand.upscale:
        return r'$$$';
      case PriceBand.fine:
        return r'$$$$';
    }
  }

  /// Formats dietary option for display.
  static String formatDietary(DietaryOption dietary) {
    switch (dietary) {
      case DietaryOption.vegan:
        return 'Vegan';
      case DietaryOption.vegetarian:
        return 'Vegetarian';
      case DietaryOption.halal:
        return 'Halal';
      case DietaryOption.kosher:
        return 'Kosher';
      case DietaryOption.glutenFree:
        return 'Gluten-Free';
    }
  }

  /// Formats cuisine type for display.
  static String formatCuisine(CuisineType cuisine) {
    switch (cuisine) {
      case CuisineType.italian:
        return 'Italian';
      case CuisineType.french:
        return 'French';
      case CuisineType.asian:
        return 'Asian';
      case CuisineType.mexican:
        return 'Mexican';
      case CuisineType.indian:
        return 'Indian';
      case CuisineType.japanese:
        return 'Japanese';
      case CuisineType.chinese:
        return 'Chinese';
      case CuisineType.thai:
        return 'Thai';
      case CuisineType.mediterranean:
        return 'Mediterranean';
      case CuisineType.american:
        return 'American';
      case CuisineType.spanish:
        return 'Spanish';
      case CuisineType.greek:
        return 'Greek';
      case CuisineType.turkish:
        return 'Turkish';
      case CuisineType.vietnamese:
        return 'Vietnamese';
      case CuisineType.korean:
        return 'Korean';
      case CuisineType.middleEastern:
        return 'Middle Eastern';
      case CuisineType.african:
        return 'African';
      case CuisineType.caribbean:
        return 'Caribbean';
      case CuisineType.brazilian:
        return 'Brazilian';
      case CuisineType.peruvian:
        return 'Peruvian';
      case CuisineType.fusion:
        return 'Fusion';
      case CuisineType.seafood:
        return 'Seafood';
      case CuisineType.steakhouse:
        return 'Steakhouse';
      case CuisineType.vegetarian:
        return 'Vegetarian';
      case CuisineType.vegan:
        return 'Vegan';
      case CuisineType.cafe:
        return 'Café';
      case CuisineType.bakery:
        return 'Bakery';
      case CuisineType.dessert:
        return 'Dessert';
      case CuisineType.bar:
        return 'Bar';
      case CuisineType.other:
        return 'Other';
    }
  }

  /// Formats noise level for display.
  static String formatNoiseLevel(NoiseLevel noise) {
    switch (noise) {
      case NoiseLevel.quiet:
        return 'Quiet';
      case NoiseLevel.moderate:
        return 'Moderate';
      case NoiseLevel.lively:
        return 'Lively';
    }
  }

  /// Formats distance for display.
  static String formatDistance(int? meters) {
    if (meters == null) return 'Unknown';

    if (meters < 1000) {
      return '${meters}m';
    } else {
      final km = meters / 1000;
      return '${km.toStringAsFixed(1)}km';
    }
  }
}
