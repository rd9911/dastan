import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/planner/domain/planner_models.dart';
import 'package:dastan/src/features/planner/application/reminder_service.dart';

void main() {
  late ReminderService service;

  setUp(() {
    service = ReminderService();
  });

  group('scheduleEntryReminder', () {
    test('schedules reminder for fixed entry', () async {
      final entry = DayPlanEntry(
        id: 'e1',
        title: 'Meeting',
        type: PlanEntryType.fixed,
        startTime: DateTime.now().add(const Duration(hours: 2)),
        durationMinutes: 60,
      );

      final reminderId = await service.scheduleEntryReminder(
        entry: entry,
        beforeStart: const Duration(minutes: 30),
      );

      expect(reminderId, isNotNull);
      expect(service.getScheduledReminders().length, 1);
    });

    test('returns null for flex entry', () async {
      final entry = DayPlanEntry(
        id: 'e1',
        title: 'Flexible activity',
        type: PlanEntryType.flex,
        startTime: DateTime.now().add(const Duration(hours: 2)),
        durationMinutes: 60,
      );

      final reminderId = await service.scheduleEntryReminder(
        entry: entry,
        beforeStart: const Duration(minutes: 30),
      );

      expect(reminderId, isNull);
    });

    test('returns null for past entry', () async {
      final entry = DayPlanEntry(
        id: 'e1',
        title: 'Past meeting',
        type: PlanEntryType.fixed,
        startTime: DateTime.now().subtract(const Duration(hours: 2)),
        durationMinutes: 60,
      );

      final reminderId = await service.scheduleEntryReminder(
        entry: entry,
        beforeStart: const Duration(minutes: 30),
      );

      expect(reminderId, isNull);
    });
  });

  group('scheduleLeaveNowReminder', () {
    test('schedules leave now reminder with buffer', () async {
      final entry = DayPlanEntry(
        id: 'e1',
        title: 'Appointment',
        type: PlanEntryType.fixed,
        startTime: DateTime.now().add(const Duration(hours: 2)),
        durationMinutes: 60,
        commuteDurationMinutes: 30,
      );

      final reminderId = await service.scheduleLeaveNowReminder(
        entry: entry,
        bufferMinutes: 10,
      );

      expect(reminderId, isNotNull);
      final reminder = service.getScheduledReminders().first;
      expect(reminder.isLeaveNow, true);
    });
  });

  group('cancelReminder', () {
    test('removes scheduled reminder', () async {
      final entry = DayPlanEntry(
        id: 'e1',
        title: 'Meeting',
        type: PlanEntryType.fixed,
        startTime: DateTime.now().add(const Duration(hours: 2)),
        durationMinutes: 60,
      );

      final reminderId = await service.scheduleEntryReminder(
        entry: entry,
        beforeStart: const Duration(minutes: 30),
      );

      expect(service.getScheduledReminders().length, 1);

      await service.cancelReminder(reminderId!);

      expect(service.getScheduledReminders().isEmpty, true);
    });
  });
}
