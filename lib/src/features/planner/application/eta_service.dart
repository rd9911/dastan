import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

part 'eta_service.g.dart';

@riverpod
class EtaService extends _$EtaService {
  @override
  void build() {}

  /// Calculates the estimated travel time between two locations.
  /// Returns null if estimation is not possible.
  Future<Duration?> getTravelTime(
    SavedItemLocation from,
    SavedItemLocation to,
  ) async {
    // For MVP/Mock, we return a simple distance-based or random duration.
    // In a real app, this would call Google Routes API or OSRM.

    // Simulating some network latency
    await Future.delayed(const Duration(milliseconds: 50));

    // Simple mock logic: 15 minutes + 1 minute per 0.01 degree diff approx (very rough)
    final latDiff = (from.lat - to.lat).abs();
    final lngDiff = (from.lng - to.lng).abs();
    final diffSum = latDiff + lngDiff;

    // If very close, assume walking 5 mins
    if (diffSum < 0.001) return const Duration(minutes: 5);

    // Otherwise, 15 mins base + variable
    final minutes = 15 + (diffSum * 100).round();
    return Duration(minutes: minutes);
  }
}
