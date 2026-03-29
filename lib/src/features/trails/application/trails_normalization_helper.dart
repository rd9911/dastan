import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:dastan/src/features/trails/domain/trails_models.dart';

/// Helper for trails data normalization and key generation.
class TrailsNormalizationHelper {
  /// Generates a deterministic dedupe key for saved items.
  ///
  /// Format: `trails-{itineraryId}-{name}-{duration}-{difficulty}-{website}`
  static String generateDedupeKey({
    required String itineraryId,
    required TrailCard item,
  }) {
    final parts = [
      'trails',
      itineraryId,
      item.name.toLowerCase().trim(),
      item.durationMinutes.toString(),
      item.difficulty.name,
      item.website ?? '',
    ].where((p) => p.isNotEmpty).join('-');
    return parts;
  }

  /// Generates a dedupe key from full detail.
  static String generateDedupeKeyFromDetail({
    required String itineraryId,
    required TrailDetail detail,
  }) {
    final parts = [
      'trails',
      itineraryId,
      detail.name.toLowerCase().trim(),
      detail.durationMinutes.toString(),
      detail.difficulty.name,
      detail.externalUrl ?? '',
    ].where((p) => p.isNotEmpty).join('-');
    return parts;
  }

  /// Generates a SHA-256 cache key for search requests.
  static String generateSearchCacheKey(TrailsSearchRequest request) {
    final components = <String>[
      request.itineraryId,
      request.place.granularity.name,
      request.place.value.toLowerCase(),
      request.sort.name,
    ];

    if (request.filters != null) {
      final f = request.filters!;
      if (f.difficulty.isNotEmpty) {
        final sorted = f.difficulty.map((d) => d.name).toList()..sort();
        components.add('diff:${sorted.join(',')}');
      }
      if (f.lengthMaxKm != null) components.add('len:${f.lengthMaxKm}');
      if (f.loopOnly == true) components.add('loop');
    }

    final combined = components.join('|');
    return sha256.convert(utf8.encode(combined)).toString();
  }

  /// Normalizes difficulty string to enum.
  static TrailDifficulty normalizeDifficulty(String? raw) {
    if (raw == null) return TrailDifficulty.moderate;
    final lower = raw.toLowerCase().trim();
    if (lower.contains('easy') || lower.contains('simple')) {
      return TrailDifficulty.easy;
    }
    if (lower.contains('hard') ||
        lower.contains('diffic') ||
        lower.contains('strenuous')) {
      return TrailDifficulty.hard;
    }
    return TrailDifficulty.moderate;
  }

  /// Formats duration in "Xh Ym" format.
  static String formatDuration(int minutes) {
    if (minutes < 60) return '${minutes}m';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (m == 0) return '${h}h';
    return '${h}h ${m}m';
  }

  /// Formats distance.
  static String formatDistance(double km) {
    return '${km.toStringAsFixed(1)} km';
  }

  /// Gets localized label for difficulty.
  static String getDifficultyLabel(TrailDifficulty difficulty) {
    switch (difficulty) {
      case TrailDifficulty.easy:
        return 'Easy';
      case TrailDifficulty.moderate:
        return 'Moderate';
      case TrailDifficulty.hard:
        return 'Hard';
    }
  }

  /// Gets color for difficulty.
  static Color getDifficultyColor(TrailDifficulty difficulty) {
    switch (difficulty) {
      case TrailDifficulty.easy:
        return Colors.green;
      case TrailDifficulty.moderate:
        return Colors.orange;
      case TrailDifficulty.hard:
        return Colors.red;
    }
  }
}
