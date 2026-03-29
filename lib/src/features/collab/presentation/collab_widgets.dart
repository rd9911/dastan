import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/collab/domain/collab_models.dart';
import 'package:dastan/src/features/collab/application/collab_store.dart';

/// Activity feed showing events for an itinerary.
class ActivityFeed extends ConsumerWidget {
  final String itineraryId;

  const ActivityFeed({super.key, required this.itineraryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(collabStoreNotifierProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.activityEvents.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text('No activity yet'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () =>
          ref.read(collabStoreNotifierProvider.notifier).refreshActivity(),
      child: ListView.builder(
        itemCount: state.activityEvents.length,
        itemBuilder: (context, index) =>
            _ActivityEventTile(event: state.activityEvents[index]),
      ),
    );
  }
}

class _ActivityEventTile extends StatelessWidget {
  final ActivityEvent event;

  const _ActivityEventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _eventColor.withValues(alpha: 0.2),
        child: Icon(_eventIcon, color: _eventColor, size: 20),
      ),
      title: Text(_eventMessage),
      subtitle: Text(
        _formatTimestamp(event.createdAt),
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      dense: true,
    );
  }

  IconData get _eventIcon {
    switch (event.type) {
      case ActivityType.memberInvited:
        return Icons.mail_outline;
      case ActivityType.memberJoined:
        return Icons.person_add;
      case ActivityType.roleChanged:
        return Icons.admin_panel_settings;
      case ActivityType.memberRemoved:
        return Icons.person_remove;
      case ActivityType.itemAdded:
        return Icons.add_circle_outline;
      case ActivityType.itemRemoved:
        return Icons.remove_circle_outline;
      case ActivityType.itemUpdated:
        return Icons.edit;
      case ActivityType.planUpdated:
        return Icons.calendar_today;
    }
  }

  Color get _eventColor {
    switch (event.type) {
      case ActivityType.memberInvited:
      case ActivityType.memberJoined:
        return Colors.green;
      case ActivityType.memberRemoved:
        return Colors.red;
      case ActivityType.roleChanged:
        return Colors.orange;
      case ActivityType.itemAdded:
        return Colors.blue;
      case ActivityType.itemRemoved:
        return Colors.red;
      case ActivityType.itemUpdated:
      case ActivityType.planUpdated:
        return Colors.purple;
    }
  }

  String get _eventMessage {
    final actor = event.actorId; // Would resolve to display name
    final target = event.targetId ?? '';
    final details = event.details ?? {};

    switch (event.type) {
      case ActivityType.memberInvited:
        return '$actor invited $target as ${details['role'] ?? 'member'}';
      case ActivityType.memberJoined:
        return '$target joined the itinerary';
      case ActivityType.roleChanged:
        return '$actor changed $target\'s role to ${details['newRole'] ?? 'member'}';
      case ActivityType.memberRemoved:
        return '$actor removed $target';
      case ActivityType.itemAdded:
        return '$actor added an item';
      case ActivityType.itemRemoved:
        return '$actor removed an item';
      case ActivityType.itemUpdated:
        return '$actor updated an item';
      case ActivityType.planUpdated:
        return '$actor updated the plan';
    }
  }

  String _formatTimestamp(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${dt.month}/${dt.day}';
  }
}

/// Widget showing presence indicators for active collaborators.
class PresenceIndicators extends ConsumerWidget {
  final String itineraryId;
  final int maxAvatars;

  const PresenceIndicators({
    super.key,
    required this.itineraryId,
    this.maxAvatars = 3,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(collabStoreNotifierProvider);

    // Filter to members who were seen recently (within 5 minutes)
    final activeMembers = state.members.where((m) {
      if (m.lastSeenAt == null) return false;
      return DateTime.now().difference(m.lastSeenAt!).inMinutes < 5;
    }).toList();

    if (activeMembers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Stacked avatars
        SizedBox(
          width: 24.0 * activeMembers.take(maxAvatars).length + 8,
          height: 32,
          child: Stack(
            children: List.generate(activeMembers.take(maxAvatars).length, (
              index,
            ) {
              final member = activeMembers[index];
              return Positioned(
                left: index * 16.0,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: member.avatarUrl != null
                        ? NetworkImage(member.avatarUrl!)
                        : null,
                    child: member.avatarUrl == null
                        ? Text(
                            (member.displayName ?? member.email)[0]
                                .toUpperCase(),
                            style: const TextStyle(fontSize: 10),
                          )
                        : null,
                  ),
                ),
              );
            }),
          ),
        ),
        if (activeMembers.length > maxAvatars)
          Text(
            '+${activeMembers.length - maxAvatars}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
      ],
    );
  }
}

/// Conflict resolution banner for concurrent edits.
class ConflictBanner extends StatelessWidget {
  final String? conflictMessage;
  final VoidCallback onApplyMine;
  final VoidCallback onKeepTheirs;
  final VoidCallback? onViewDiff;

  const ConflictBanner({
    super.key,
    required this.conflictMessage,
    required this.onApplyMine,
    required this.onKeepTheirs,
    this.onViewDiff,
  });

  @override
  Widget build(BuildContext context) {
    if (conflictMessage == null) return const SizedBox.shrink();

    return MaterialBanner(
      backgroundColor: Colors.orange.shade50,
      leading: const Icon(Icons.warning_amber, color: Colors.orange),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Edit Conflict',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(conflictMessage!, style: const TextStyle(fontSize: 13)),
        ],
      ),
      actions: [
        if (onViewDiff != null)
          TextButton(onPressed: onViewDiff, child: const Text('View Diff')),
        TextButton(onPressed: onKeepTheirs, child: const Text('Keep Theirs')),
        FilledButton(onPressed: onApplyMine, child: const Text('Apply Mine')),
      ],
    );
  }
}
