import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/accommodation_search_service.dart';
import '../domain/accommodation_result.dart';

part 'accommodation_search_controller.g.dart';

@riverpod
class AccommodationSearchController extends _$AccommodationSearchController {
  @override
  AsyncValue<List<AccommodationResult>> build() {
    return const AsyncValue.data([]);
  }

  Future<void> search({
    required String location,
    required DateTime checkIn,
    required DateTime checkOut,
    AccommodationType? type,
    List<int> travelerAges = const [18],
  }) async {
    if (location.isEmpty) return;

    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final service = ref.read(accommodationSearchServiceProvider);
      return await service.search(
        location: location,
        checkIn: checkIn,
        checkOut: checkOut,
        type: type,
        travelerAges: travelerAges,
      );
    });
  }
}
