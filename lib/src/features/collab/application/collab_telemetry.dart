/// Telemetry events for collaboration feature.
class CollabTelemetry {
  /// Log when an invite is sent.
  static Map<String, dynamic> inviteSent({
    required int count,
    required String role,
  }) {
    return {
      'event': 'invite_sent',
      'count': count,
      'role': role,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log when an invite is accepted.
  static Map<String, dynamic> inviteAccepted({required String role}) {
    return {
      'event': 'invite_accepted',
      'role': role,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log when a role is changed.
  static Map<String, dynamic> roleChanged({
    required String oldRole,
    required String newRole,
  }) {
    return {
      'event': 'role_changed',
      'old_role': oldRole,
      'new_role': newRole,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log when a member is removed.
  static Map<String, dynamic> memberRemoved() {
    return {
      'event': 'member_removed',
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log presence state changes.
  static Map<String, dynamic> presenceOnline({required int memberCount}) {
    return {
      'event': 'presence_online',
      'member_count': memberCount,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log when a conflict is raised.
  static Map<String, dynamic> conflictRaised({required String itemType}) {
    return {
      'event': 'conflict_raised',
      'item_type': itemType,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log when a conflict is resolved.
  static Map<String, dynamic> conflictResolved({
    required String resolution, // 'apply_mine', 'keep_theirs'
  }) {
    return {
      'event': 'conflict_resolved',
      'resolution': resolution,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log activity feed viewed.
  static Map<String, dynamic> activityFeedViewed({required int eventCount}) {
    return {
      'event': 'activity_feed_viewed',
      'event_count': eventCount,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
