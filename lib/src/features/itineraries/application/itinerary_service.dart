import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../../core/domain/itinerary.dart';
import '../data/itinerary_repository.dart';

part 'itinerary_service.g.dart';

class ItineraryService {
  final ItineraryRepository _repository;
  final _uuid = const Uuid();

  ItineraryService(this._repository);

  Future<Itinerary> createItinerary({
    required String title,
    String? destination,
    DateTime? startDate,
    DateTime? endDate,
    int travelers = 1,
  }) async {
    final itinerary = Itinerary(
      id: _uuid.v4(),
      title: title,
      destination: destination,
      startDate: startDate,
      endDate: endDate,
      travelers: travelers,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _repository.createItinerary(itinerary);
    return itinerary;
  }

  Future<List<Itinerary>> getAllItineraries() {
    return _repository.getAllItineraries();
  }

  Stream<List<Itinerary>> watchAllItineraries() {
    return _repository.watchAllItineraries();
  }

  Future<void> deleteItinerary(String id) {
    return _repository.deleteItinerary(id);
  }

  Future<void> updateItinerary(Itinerary itinerary) {
    return _repository.updateItinerary(itinerary);
  }

  Future<Itinerary?> getItinerary(String id) {
    return _repository.getItinerary(id);
  }
}

@riverpod
ItineraryService itineraryService(Ref ref) {
  final repository = ref.watch(itineraryRepositoryProvider);
  return ItineraryService(repository);
}

@riverpod
Stream<List<Itinerary>> itineraries(Ref ref) {
  return ref.watch(itineraryServiceProvider).watchAllItineraries();
}
