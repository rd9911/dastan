import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/transport_search_service.dart';
import '../domain/transport_result.dart';

part 'transport_search_controller.g.dart';

@riverpod
class TransportSearchController extends _$TransportSearchController {
  @override
  AsyncValue<List<TransportResult>> build(int tabIndex) {
    return const AsyncValue.data([]);
  }

  Future<void> search(TransportSearchRequest request) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final service = ref.read(transportSearchServiceProvider);

      if (request is SimpleTransportSearchRequest) {
        if (request.origin.isEmpty || request.destination.isEmpty) {
          // Return empty or throw? Original code returned early.
          // But if we are here, we probably want to return empty list or keep previous state?
          // Original code: if empty return.
          // But we already set loading.
          return [];
        }
        return await service.search(
          origin: request.origin,
          destination: request.destination,
          departDate: request.departDate,
          mode: request.mode,
          travelerAges: request.travelerAges,
          isRoundTrip: request.isRoundTrip,
          returnDate: request.returnDate,
        );
      } else if (request is MultiCityTransportSearchRequest) {
        return await service.searchMultiCity(
          legs: request.legs,
          mode: request.mode,
          travelerAges: request.travelerAges,
        );
      } else if (request is MeetUpTransportSearchRequest) {
        return await service.searchMeetUp(
          friends: request.friends,
          destination: request.destination,
          meetDate: request.meetDate,
          mode: request.mode,
        );
      }

      return [];
    });
  }

  void clearResults() {
    state = const AsyncValue.data([]);
  }
}

sealed class TransportSearchRequest {}

class SimpleTransportSearchRequest extends TransportSearchRequest {
  final String origin;
  final String destination;
  final DateTime departDate;
  final TransportMode mode;
  final List<int> travelerAges;
  final bool isRoundTrip;
  final DateTime? returnDate;

  SimpleTransportSearchRequest({
    required this.origin,
    required this.destination,
    required this.departDate,
    required this.mode,
    this.travelerAges = const [18],
    this.isRoundTrip = false,
    this.returnDate,
  });
}

class MultiCityTransportSearchRequest extends TransportSearchRequest {
  final List<Map<String, dynamic>> legs;
  final TransportMode mode;
  final List<int> travelerAges;

  MultiCityTransportSearchRequest({
    required this.legs,
    required this.mode,
    this.travelerAges = const [18],
  });
}

class MeetUpTransportSearchRequest extends TransportSearchRequest {
  final List<Map<String, dynamic>> friends;
  final String destination;
  final DateTime meetDate;
  final TransportMode mode;

  MeetUpTransportSearchRequest({
    required this.friends,
    required this.destination,
    required this.meetDate,
    required this.mode,
  });
}
