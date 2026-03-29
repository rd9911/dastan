import 'package:dastan/src/features/planner/application/eta_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/planner/domain/autobuild_models.dart';
import 'package:dastan/src/features/planner/application/autobuild_service.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

void main() {
  group('AutoBuildService', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer(
        overrides: [etaServiceProvider.overrideWith(() => MockEtaService())],
      );
    });

    tearDown(() => container.dispose());

    test('generateRequestHash should produce consistent hashes', () {
      final service = container.read(autoBuildServiceProvider.notifier);

      final date = DateTime(2023, 10, 27);
      final item1 = SavedItem(
        id: '1',
        title: 'A',
        itineraryId: '',
        section: ItinerarySection.accommodation,
        details: {},
        externalData: null,
        time: null,
        location: null,
        dedupeKey: '',
        sync: const SavedItemSync(status: SyncStatus.synced),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final req1 = AutoBuildRequest(
        itineraryId: 'it1',
        date: date,
        candidates: [item1],
        preferences: const AutoBuildPreferences(
          startTime: TimeOfDay(hour: 9, minute: 0),
        ),
      );

      final req2 = AutoBuildRequest(
        itineraryId: 'it1',
        date: date,
        candidates: [item1],
        preferences: const AutoBuildPreferences(
          startTime: TimeOfDay(hour: 9, minute: 0),
        ),
      );

      expect(
        service.generateRequestHash(req1),
        equals(service.generateRequestHash(req2)),
      );
    });

    test('generateRequestHash should change if preferences change', () {
      final service = container.read(autoBuildServiceProvider.notifier);
      final date = DateTime(2023, 10, 27);
      final item1 = SavedItem(
        id: '1',
        title: 'A',
        itineraryId: '',
        section: ItinerarySection.accommodation,
        details: {},
        externalData: null,
        time: null,
        location: null,
        dedupeKey: '',
        sync: const SavedItemSync(status: SyncStatus.synced),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final req1 = AutoBuildRequest(
        itineraryId: 'it1',
        date: date,
        candidates: [item1],
        preferences: const AutoBuildPreferences(
          startTime: TimeOfDay(hour: 9, minute: 0),
        ),
      );

      final req2 = req1.copyWith(
        preferences: const AutoBuildPreferences(
          startTime: TimeOfDay(hour: 10, minute: 0),
        ),
      );

      expect(
        service.generateRequestHash(req1),
        isNot(equals(service.generateRequestHash(req2))),
      );
    });

    test(
      'generatePlan should place fixed items at correct time and flex items around them',
      () async {
        final service = container.read(autoBuildServiceProvider.notifier);

        final date = DateTime(2023, 10, 27);

        // Fixed: Transport 11:00 - 12:00
        final fixedItem = SavedItem(
          id: 'fixed1',
          title: 'Train',
          itineraryId: '',
          section: ItinerarySection.transport,
          details: {},
          externalData: null,
          time: SavedItemTime(
            start: DateTime(2023, 10, 27, 11, 0),
            end: DateTime(2023, 10, 27, 12, 0),
          ),
          location: null,
          dedupeKey: '',
          sync: const SavedItemSync(status: SyncStatus.synced),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // Flex: Museum (60m default)
        final flexItem1 = SavedItem(
          id: 'flex1',
          title: 'Museum',
          itineraryId: '',
          section: ItinerarySection
              .events, // events is 120m base in our simplified logic?
          details: {},
          externalData: null,
          time: null,
          location: null,
          dedupeKey: '',
          sync: const SavedItemSync(status: SyncStatus.synced),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        final request = AutoBuildRequest(
          itineraryId: 'it1',
          date: date,
          candidates: [fixedItem, flexItem1],
          preferences: const AutoBuildPreferences(
            startTime: TimeOfDay(hour: 8, minute: 0),
          ), // Start at 8 AM
        );

        // Setup Mock EtaService?
        // The service calls ref.read(etaServiceProvider.notifier).
        // We need to override it.

        final plan = await service.generatePlan(request);

        expect(plan.entries.length, 2);

        // Check Fixed Item (should be 2nd if flex fits before, or 1st if not)
        // Start 8:00. Fixed starts 10:00. Gap 120m.
        // Flex item (Events) base duration is 120m.
        // 8:00 + 120m = 10:00. Fits exactly!

        final entry1 = plan.entries[0];
        final entry2 = plan.entries[1];

        // Expect Flex first
        expect(entry1.title, equals('Museum'));
        expect(entry1.startTime, equals(DateTime(2023, 10, 27, 8, 0)));
        expect(
          entry1.endTime,
          equals(DateTime(2023, 10, 27, 10, 0)),
        ); // 120 mins duration

        // Expect Fixed second
        expect(entry2.title, equals('Train'));
        expect(entry2.startTime, equals(DateTime(2023, 10, 27, 11, 0)));
      },
    );
  });
}

// Mock EtaService needed?
// The real implementation uses minimal eta logic inside generatePlan for now?
// Ah, it calls: ref.read(etaServiceProvider.notifier);
// We need to provide a mock.

class MockEtaService extends EtaService {
  @override
  Future<Duration?> getTravelTime(
    SavedItemLocation from,
    SavedItemLocation to,
  ) async {
    return const Duration(minutes: 0);
  }
}
