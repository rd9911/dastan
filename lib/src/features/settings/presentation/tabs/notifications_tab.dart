import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';

/// Notifications tab for managing notification preferences.
class NotificationsTab extends ConsumerStatefulWidget {
  final VoidCallback onChanged;

  const NotificationsTab({super.key, required this.onChanged});

  @override
  ConsumerState<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends ConsumerState<NotificationsTab> {
  // Channels
  bool _pushEnabled = true;
  bool _emailEnabled = true;

  // Categories
  bool _bookingUpdates = true;
  bool _saveSyncStatus = true;
  bool _plannerReminders = true;
  bool _leaveNow = true;

  // Quiet hours
  bool _quietHoursEnabled = false;
  int _quietStart = 22;
  int _quietEnd = 7;

  // Trip-only mode
  bool _tripOnlyMode = false;

  @override
  void initState() {
    super.initState();
    _loadFromStore();
  }

  void _loadFromStore() {
    final prefs = ref
        .read(settingsStoreNotifierProvider)
        .state
        .notificationPrefs;
    if (prefs != null) {
      _pushEnabled = prefs.channels.push;
      _emailEnabled = prefs.channels.email;
      _bookingUpdates = prefs.categories.bookingUpdates;
      _saveSyncStatus = prefs.categories.saveSyncStatus;
      _plannerReminders = prefs.categories.plannerReminders;
      _leaveNow = prefs.categories.leaveNow;
      _quietHoursEnabled = prefs.quietHours != null;
      if (prefs.quietHours != null) {
        _quietStart = prefs.quietHours!.startHour;
        _quietEnd = prefs.quietHours!.endHour;
      }
      _tripOnlyMode = prefs.tripOnlyMode;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Channels
          Text('Notification Channels', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_active),
            title: const Text('Push Notifications'),
            subtitle: const Text('Receive notifications on this device'),
            value: _pushEnabled,
            onChanged: (v) {
              setState(() => _pushEnabled = v);
              widget.onChanged();
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.email),
            title: const Text('Email Notifications'),
            subtitle: const Text('Receive updates via email'),
            value: _emailEnabled,
            onChanged: (v) {
              setState(() => _emailEnabled = v);
              widget.onChanged();
            },
          ),
          const Divider(height: 32),

          // Categories
          Text('Notification Categories', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Booking Updates'),
            subtitle: const Text('Changes to your reservations'),
            value: _bookingUpdates,
            onChanged: (v) {
              setState(() => _bookingUpdates = v);
              widget.onChanged();
            },
          ),
          SwitchListTile(
            title: const Text('Save/Sync Status'),
            subtitle: const Text('When items are saved or synced'),
            value: _saveSyncStatus,
            onChanged: (v) {
              setState(() => _saveSyncStatus = v);
              widget.onChanged();
            },
          ),
          SwitchListTile(
            title: const Text('Planner Reminders'),
            subtitle: const Text('Scheduled activity reminders'),
            value: _plannerReminders,
            onChanged: (v) {
              setState(() => _plannerReminders = v);
              widget.onChanged();
            },
          ),
          SwitchListTile(
            title: const Text('"Leave Now" Alerts'),
            subtitle: const Text('Time to depart based on commute'),
            value: _leaveNow,
            onChanged: (v) {
              setState(() => _leaveNow = v);
              widget.onChanged();
            },
          ),
          const Divider(height: 32),

          // Quiet Hours
          Text('Quiet Hours', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            secondary: const Icon(Icons.bedtime),
            title: const Text('Enable Quiet Hours'),
            subtitle: const Text('Silence notifications during set hours'),
            value: _quietHoursEnabled,
            onChanged: (v) {
              setState(() => _quietHoursEnabled = v);
              widget.onChanged();
            },
          ),
          if (_quietHoursEnabled) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      initialValue: _quietStart,
                      decoration: const InputDecoration(labelText: 'Start'),
                      items: List.generate(
                        24,
                        (i) => DropdownMenuItem(
                          value: i,
                          child: Text(_formatHour(i)),
                        ),
                      ),
                      onChanged: (v) {
                        if (v != null) {
                          setState(() => _quietStart = v);
                          widget.onChanged();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      initialValue: _quietEnd,
                      decoration: const InputDecoration(labelText: 'End'),
                      items: List.generate(
                        24,
                        (i) => DropdownMenuItem(
                          value: i,
                          child: Text(_formatHour(i)),
                        ),
                      ),
                      onChanged: (v) {
                        if (v != null) {
                          setState(() => _quietEnd = v);
                          widget.onChanged();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
          const Divider(height: 32),

          // Trip-Only Mode
          Text('Trip Mode', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            secondary: const Icon(Icons.flight_takeoff),
            title: const Text('Trip-Only Notifications'),
            subtitle: const Text('Only notify during active trip dates'),
            value: _tripOnlyMode,
            onChanged: (v) {
              setState(() => _tripOnlyMode = v);
              widget.onChanged();
            },
          ),
        ],
      ),
    );
  }

  String _formatHour(int hour) {
    if (hour == 0) return '12:00 AM';
    if (hour == 12) return '12:00 PM';
    if (hour < 12) return '$hour:00 AM';
    return '${hour - 12}:00 PM';
  }
}
