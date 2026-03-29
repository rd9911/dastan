import 'dart:async';

import 'package:dastan/src/core/domain/itinerary.dart';
import 'package:dastan/src/features/itineraries/presentation/active_itinerary_controller.dart';
import 'package:dastan/src/features/planner/application/day_plan_store.dart';
import 'package:dastan/src/features/planner/data/planner_repository.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dastan/src/core/data/saved_item_repository.dart';
import 'package:dastan/src/core/domain/saved_item.dart';
import 'package:dastan/src/features/planner/application/eta_service.dart';

void main() {
  late MockPlannerRepository mockRepository;
  late MockSavedItemRepository mockSavedItemRepository;
  late MockEtaService mockEtaService;
  late ProviderContainer container;

  final testDate = DateTime(2023, 10, 27);
  final testItinerary = Itinerary(
    id: 'itinerary_1',
    title: 'Test Itinerary',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  setUp(() {
    mockRepository = MockPlannerRepository();
    mockSavedItemRepository = MockSavedItemRepository();
    mockEtaService = MockEtaService();

    container = ProviderContainer(
      overrides: [
        plannerRepositoryProvider.overrideWithValue(mockRepository),
        activeItineraryControllerProvider.overrideWith(
          () => _MockActiveItineraryController(testItinerary),
        ),
        savedItemRepositoryProvider.overrideWithValue(mockSavedItemRepository),
        etaServiceProvider.overrideWith(() => mockEtaService),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('build should watch repository for active itinerary and date', () async {
    final dayPlan = DayPlan(
      itineraryId: testItinerary.id,
      date: testDate,
      entries: [],
    );

    when(
      mockRepository.watchDayPlan(testItinerary.id, testDate),
    ).thenAnswer((_) => Stream.value(dayPlan));

    // Keep provider alive
    final sub = container.listen(dayPlanStoreProvider(testDate), (_, __) {});

    expectLater(
      container.read(dayPlanStoreProvider(testDate).future),
      completion(dayPlan),
    ).whenComplete(() => sub.close());
  });

  test('addEntry should create new plan if none exists', () async {
    // Setup: repository returns null for get/watch
    when(
      mockRepository.watchDayPlan(testItinerary.id, testDate),
    ).thenAnswer((_) => Stream.value(null));

    // We need to wait for the future to complete to ensure the build method has run?
    // Actually addEntry calls `await future`.

    final entry = DayPlanEntry(
      id: 'entry_1',
      title: 'New Entry',
      type: PlanEntryType.fixed,
    );

    // Keep provider alive
    final sub = container.listen(dayPlanStoreProvider(testDate), (_, __) {});

    await container
        .read(dayPlanStoreProvider(testDate).notifier)
        .addEntry(testDate, entry);

    sub.close();

    verify(
      mockRepository.saveDayPlan(
        argThat(
          predicate<DayPlan>(
            (plan) =>
                plan.itineraryId == testItinerary.id &&
                plan.date == testDate &&
                plan.entries.length == 1 &&
                plan.entries.first == entry,
          ),
        ),
      ),
    ).called(1);
  });

  test('addEntry should append to existing plan', () async {
    final existingEntry = DayPlanEntry(
      id: 'existing',
      title: 'Existing',
      type: PlanEntryType.flex,
    );
    final existingPlan = DayPlan(
      itineraryId: testItinerary.id,
      date: testDate,
      entries: [existingEntry],
    );

    when(
      mockRepository.watchDayPlan(testItinerary.id, testDate),
    ).thenAnswer((_) => Stream.value(existingPlan));

    final newEntry = DayPlanEntry(
      id: 'new',
      title: 'New',
      type: PlanEntryType.flex,
    );

    // Keep provider alive
    final sub = container.listen(dayPlanStoreProvider(testDate), (_, __) {});

    await container
        .read(dayPlanStoreProvider(testDate).notifier)
        .addEntry(testDate, newEntry);

    sub.close();

    verify(
      mockRepository.saveDayPlan(
        argThat(
          predicate<DayPlan>(
            (plan) =>
                plan.entries.length == 2 &&
                plan.entries.last.id == newEntry.id &&
                plan.entries.last.title == newEntry.title,
          ),
        ),
      ),
    ).called(1);
  });

  test('reorderEntries should update order in plan', () async {
    final entry1 = DayPlanEntry(id: '1', title: '1', type: PlanEntryType.fixed);
    final entry2 = DayPlanEntry(id: '2', title: '2', type: PlanEntryType.fixed);
    final initialPlan = DayPlan(
      itineraryId: testItinerary.id,
      date: testDate,
      entries: [entry1, entry2],
    );

    when(
      mockRepository.watchDayPlan(testItinerary.id, testDate),
    ).thenAnswer((_) => Stream.value(initialPlan));

    // Keep provider alive
    final sub = container.listen(dayPlanStoreProvider(testDate), (_, __) {});

    // Reorder 0 to 1 (move first item to end)
    await container
        .read(dayPlanStoreProvider(testDate).notifier)
        .reorderEntries(
          0,
          2,
        ); // ListView sends newIndex as 2 when moving to end

    sub.close();

    verify(
      mockRepository.saveDayPlan(
        argThat(
          predicate<DayPlan>(
            (plan) =>
                plan.entries.length == 2 &&
                plan.entries[0].id == entry2.id &&
                plan.entries[1].id == entry1.id,
          ),
        ),
      ),
    ).called(1);
  });

  test('should propagate time for flex items', () async {
    // Initial: Fixed item 9:00 - 10:00
    final fixedEntry = DayPlanEntry(
      id: 'fixed',
      title: 'Fixed',
      type: PlanEntryType.fixed,
      startTime: DateTime(2023, 10, 27, 9, 0),
      durationMinutes: 60, // Ends 10:00
    );

    final initialPlan = DayPlan(
      itineraryId: testItinerary.id,
      date: testDate,
      entries: [fixedEntry],
    );

    when(
      mockRepository.watchDayPlan(testItinerary.id, testDate),
    ).thenAnswer((_) => Stream.value(initialPlan));

    // Entry 2: Flex item (should start at 10:00 + commute)
    final flexEntry = DayPlanEntry(
      id: 'flex',
      title: 'Flex',
      type: PlanEntryType.flex,
      durationMinutes: 90,
    );

    final sub = container.listen(dayPlanStoreProvider(testDate), (_, __) {});

    await container
        .read(dayPlanStoreProvider(testDate).notifier)
        .addEntry(testDate, flexEntry);

    sub.close();

    verify(
      mockRepository.saveDayPlan(
        argThat(
          predicate<DayPlan>((plan) {
            if (plan.entries.length != 2) return false;
            final flex = plan.entries[1];
            // Expect start at 10:00 (Fixed end) + 0 commute (mock default)
            // Fixed start: 9:00, duration 60 -> End 10:00.
            // Flex start should be 10:00.
            final expectedStart = DateTime(2023, 10, 27, 10, 0);
            return flex.startTime == expectedStart &&
                flex.endTime == expectedStart.add(const Duration(minutes: 90));
          }),
        ),
      ),
    ).called(1);
  });
}

class _MockActiveItineraryController extends ActiveItineraryController {
  final Itinerary? _value;
  _MockActiveItineraryController(this._value);

  @override
  Future<Itinerary?> build() => Future.value(_value);
}

// Manual mocks
class MockPlannerRepository extends Mock implements PlannerRepository {
  @override
  Stream<DayPlan?> watchDayPlan(String? itineraryId, DateTime? date) {
    return super.noSuchMethod(
          Invocation.method(#watchDayPlan, [itineraryId, date]),
          returnValue: Stream<DayPlan?>.empty(),
          returnValueForMissingStub: Stream<DayPlan?>.empty(),
        )
        as Stream<DayPlan?>;
  }

  @override
  Future<void> saveDayPlan(DayPlan? plan) {
    return super.noSuchMethod(
          Invocation.method(#saveDayPlan, [plan]),
          returnValue: Future.value(),
          returnValueForMissingStub: Future.value(),
        )
        as Future<void>;
  }
}

class MockSavedItemRepository extends Mock implements SavedItemRepository {
  @override
  Future<SavedItem?> getSavedItem(String? id) {
    return super.noSuchMethod(
          Invocation.method(#getSavedItem, [id]),
          returnValue: Future<SavedItem?>.value(),
          returnValueForMissingStub: Future<SavedItem?>.value(),
        )
        as Future<SavedItem?>;
  }
}

// For class-based provider override
class MockEtaService extends EtaService {
  Future<Duration?>? _returnValue; // Hacky way to control mock return

  @override
  Future<Duration?> getTravelTime(
    SavedItemLocation from,
    SavedItemLocation to,
  ) async {
    return _returnValue;
  }
}
