import 'package:dastan/src/features/planner/domain/planner_models.dart';

/// Service for scheduling local reminders for day plan entries.
class ReminderService {
  /// Schedules a reminder for a fixed entry.
  /// Returns a reminder ID for later cancellation.
  Future<String?> scheduleEntryReminder({
    required DayPlanEntry entry,
    required Duration beforeStart,
  }) async {
    if (entry.startTime == null) return null;
    if (entry.type != PlanEntryType.fixed) {
      return null; // Only fixed entries get reminders
    }

    final reminderTime = entry.startTime!.subtract(beforeStart);
    if (reminderTime.isBefore(DateTime.now())) return null; // Already passed

    // Stub: In production, use flutter_local_notifications
    // await FlutterLocalNotificationsPlugin().zonedSchedule(...)

    final reminderId = 'reminder_${entry.id}_${beforeStart.inMinutes}';

    // Store scheduled reminder for tracking
    _scheduledReminders[reminderId] = ScheduledReminder(
      id: reminderId,
      entryId: entry.id,
      entryTitle: entry.title,
      scheduledTime: reminderTime,
    );

    return reminderId;
  }

  /// Schedules a "leave now" reminder based on commute duration.
  Future<String?> scheduleLeaveNowReminder({
    required DayPlanEntry entry,
    required int bufferMinutes,
  }) async {
    if (entry.startTime == null) return null;

    final commuteDuration = entry.commuteDurationMinutes ?? 0;
    final totalLeadTime = commuteDuration + bufferMinutes;

    final leaveTime = entry.startTime!.subtract(
      Duration(minutes: totalLeadTime),
    );
    if (leaveTime.isBefore(DateTime.now())) return null;

    final reminderId = 'leave_now_${entry.id}';

    _scheduledReminders[reminderId] = ScheduledReminder(
      id: reminderId,
      entryId: entry.id,
      entryTitle: 'Leave now for: ${entry.title}',
      scheduledTime: leaveTime,
      isLeaveNow: true,
    );

    return reminderId;
  }

  /// Cancels a scheduled reminder.
  Future<void> cancelReminder(String reminderId) async {
    _scheduledReminders.remove(reminderId);
    // Stub: In production, call FlutterLocalNotificationsPlugin().cancel(id)
  }

  /// Cancels all reminders for an entry.
  Future<void> cancelAllForEntry(String entryId) async {
    final toRemove = _scheduledReminders.keys
        .where((k) => k.contains(entryId))
        .toList();
    for (final key in toRemove) {
      _scheduledReminders.remove(key);
    }
  }

  /// Gets all scheduled reminders.
  List<ScheduledReminder> getScheduledReminders() {
    return _scheduledReminders.values.toList();
  }

  // In-memory storage for stub implementation
  final Map<String, ScheduledReminder> _scheduledReminders = {};
}

class ScheduledReminder {
  final String id;
  final String entryId;
  final String entryTitle;
  final DateTime scheduledTime;
  final bool isLeaveNow;

  const ScheduledReminder({
    required this.id,
    required this.entryId,
    required this.entryTitle,
    required this.scheduledTime,
    this.isLeaveNow = false,
  });
}
