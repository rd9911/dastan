import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/itineraries/application/itinerary_service.dart';
import 'package:dastan/src/features/itineraries/data/itinerary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockItineraryRepository extends Mock implements ItineraryRepository {}

class FakeItinerary extends Fake implements Itinerary {}

void main() {
  late ItineraryService service;
  late MockItineraryRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeItinerary());
  });

  setUp(() {
    repository = MockItineraryRepository();
    service = ItineraryService(repository);
  });

  final testItinerary = Itinerary(
    id: '1',
    title: 'Test Trip',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  test('createItinerary calls repository', () async {
    when(() => repository.createItinerary(any())).thenAnswer((_) async {});

    await service.createItinerary(
      title: 'Test Trip',
      destination: 'Paris',
      startDate: DateTime(2023, 1, 1),
      endDate: DateTime(2023, 1, 10),
      travelers: 2,
    );

    verify(
      () => repository.createItinerary(any(that: isA<Itinerary>())),
    ).called(1);
  });

  test('getAllItineraries returns list from repository', () async {
    when(
      () => repository.getAllItineraries(),
    ).thenAnswer((_) async => [testItinerary]);

    final result = await service.getAllItineraries();

    expect(result, [testItinerary]);
    verify(() => repository.getAllItineraries()).called(1);
  });

  test('deleteItinerary calls repository', () async {
    when(() => repository.deleteItinerary('1')).thenAnswer((_) async {});

    await service.deleteItinerary('1');

    verify(() => repository.deleteItinerary('1')).called(1);
  });
}
