import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/data/shared_preferences_provider.dart';
import '../../itineraries/data/itinerary_repository.dart';
import '../../../core/domain/itinerary.dart';

part 'active_itinerary_controller.g.dart';

@Riverpod(keepAlive: true)
@Riverpod(keepAlive: true)
class ActiveItineraryController extends _$ActiveItineraryController {
  static const _activeItineraryIdKey = 'active_itinerary_id';

  @override
  Future<Itinerary?> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    final itineraryId = prefs.getString(_activeItineraryIdKey);

    if (itineraryId == null) {
      return null;
    }

    final repository = ref.watch(itineraryRepositoryProvider);
    final itinerary = await repository.getItinerary(itineraryId);

    // If itinerary was not found (e.g. deleted), clear the preference
    if (itinerary == null) {
      await prefs.remove(_activeItineraryIdKey);
    }

    return itinerary;
  }

  Future<void> setActiveItinerary(Itinerary? itinerary) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);

    if (itinerary == null) {
      await prefs.remove(_activeItineraryIdKey);
    } else {
      await prefs.setString(_activeItineraryIdKey, itinerary.id);
    }

    state = AsyncData(itinerary);
  }
}
