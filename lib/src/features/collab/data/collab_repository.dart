import 'package:dastan/src/features/collab/domain/collab_models.dart';

/// Repository for collaboration operations (invites, members, activity).
abstract class CollabRepository {
  /// Send invites to users.
  Future<List<Invite>> sendInvites(InviteRequest request);

  /// Accept an invite.
  Future<ItineraryMember> acceptInvite(InviteAccept accept);

  /// Get members of an itinerary.
  Future<List<ItineraryMember>> getMembers(String itineraryId);

  /// Change a member's role.
  Future<ItineraryMember> changeRole(
    String itineraryId,
    String userId,
    MemberRole newRole,
  );

  /// Revoke a member's access.
  Future<void> revokeMember(String itineraryId, String userId);

  /// Resend an invite.
  Future<Invite> resendInvite(String inviteId);

  /// Get pending invites for an itinerary.
  Future<List<Invite>> getPendingInvites(String itineraryId);

  /// Get activity events for an itinerary.
  Future<List<ActivityEvent>> getActivityEvents(
    String itineraryId, {
    int limit = 50,
  });

  /// Check if current user has permission for an action.
  Future<AclResult> checkPermission(AclCheck check);
}

/// Mock implementation for development/testing.
class MockCollabRepository implements CollabRepository {
  final Map<String, List<ItineraryMember>> _members = {};
  final Map<String, List<Invite>> _invites = {};
  final Map<String, List<ActivityEvent>> _events = {};

  @override
  Future<List<Invite>> sendInvites(InviteRequest request) async {
    final invites = request.emails
        .map(
          (email) => Invite(
            id: 'inv_${DateTime.now().millisecondsSinceEpoch}_${email.hashCode}',
            itineraryId: request.itineraryId,
            email: email,
            role: request.role,
            token: 'tok_${email.hashCode.toRadixString(16)}',
            status: InviteStatus.pending,
            createdAt: DateTime.now(),
            message: request.message,
          ),
        )
        .toList();

    _invites.putIfAbsent(request.itineraryId, () => []).addAll(invites);

    // Log activity
    for (final invite in invites) {
      _logActivity(
        request.itineraryId,
        ActivityType.memberInvited,
        targetId: invite.email,
        details: {'role': request.role.name},
      );
    }

    return invites;
  }

  @override
  Future<ItineraryMember> acceptInvite(InviteAccept accept) async {
    // Find invite by token
    for (final inviteList in _invites.values) {
      final invite = inviteList.firstWhere(
        (i) =>
            i.token == accept.inviteToken && i.status == InviteStatus.pending,
        orElse: () => throw Exception('Invalid or expired invite token'),
      );

      final member = ItineraryMember(
        userId: 'user_${invite.email.hashCode}',
        email: invite.email,
        role: invite.role,
        joinedAt: DateTime.now(),
      );

      _members.putIfAbsent(invite.itineraryId, () => []).add(member);

      // Update invite status
      final index = inviteList.indexOf(invite);
      inviteList[index] = invite.copyWith(
        status: InviteStatus.accepted,
        acceptedAt: DateTime.now(),
      );

      // Log activity
      _logActivity(
        invite.itineraryId,
        ActivityType.memberJoined,
        targetId: member.userId,
      );

      return member;
    }

    throw Exception('Invalid invite token');
  }

  @override
  Future<List<ItineraryMember>> getMembers(String itineraryId) async {
    return _members[itineraryId] ?? [];
  }

  @override
  Future<ItineraryMember> changeRole(
    String itineraryId,
    String userId,
    MemberRole newRole,
  ) async {
    final members = _members[itineraryId] ?? [];
    final index = members.indexWhere((m) => m.userId == userId);
    if (index == -1) throw Exception('Member not found');

    final oldRole = members[index].role;
    final updated = members[index].copyWith(role: newRole);
    members[index] = updated;

    _logActivity(
      itineraryId,
      ActivityType.roleChanged,
      targetId: userId,
      details: {'oldRole': oldRole.name, 'newRole': newRole.name},
    );

    return updated;
  }

  @override
  Future<void> revokeMember(String itineraryId, String userId) async {
    final members = _members[itineraryId] ?? [];
    members.removeWhere((m) => m.userId == userId);

    _logActivity(itineraryId, ActivityType.memberRemoved, targetId: userId);
  }

  @override
  Future<Invite> resendInvite(String inviteId) async {
    for (final inviteList in _invites.values) {
      final index = inviteList.indexWhere((i) => i.id == inviteId);
      if (index != -1) {
        final updated = inviteList[index].copyWith(
          token: 'tok_resend_${DateTime.now().millisecondsSinceEpoch}',
          createdAt: DateTime.now(),
        );
        inviteList[index] = updated;
        return updated;
      }
    }
    throw Exception('Invite not found');
  }

  @override
  Future<List<Invite>> getPendingInvites(String itineraryId) async {
    return (_invites[itineraryId] ?? [])
        .where((i) => i.status == InviteStatus.pending)
        .toList();
  }

  @override
  Future<List<ActivityEvent>> getActivityEvents(
    String itineraryId, {
    int limit = 50,
  }) async {
    final events = _events[itineraryId] ?? [];
    return events.take(limit).toList();
  }

  @override
  Future<AclResult> checkPermission(AclCheck check) async {
    final members = _members[check.itineraryId] ?? [];
    final member = members.firstWhere(
      (m) => m.userId == check.userId,
      orElse: () => ItineraryMember(
        userId: check.userId,
        email: '',
        role: MemberRole.viewer,
        joinedAt: DateTime.now(),
      ),
    );

    final allowed = PermissionChecker.can(member.role, check.action);
    return AclResult(
      allowed: allowed,
      reason: allowed
          ? null
          : 'Insufficient permissions for ${check.action.name}',
    );
  }

  void _logActivity(
    String itineraryId,
    ActivityType type, {
    String? targetId,
    Map<String, dynamic>? details,
  }) {
    final event = ActivityEvent(
      id: 'evt_${DateTime.now().millisecondsSinceEpoch}',
      itineraryId: itineraryId,
      type: type,
      actorId: 'current_user', // Would be actual user ID
      targetId: targetId,
      details: details,
      createdAt: DateTime.now(),
    );
    _events.putIfAbsent(itineraryId, () => []).insert(0, event);
  }

  /// Helper for testing: add a member directly
  void addMember(String itineraryId, ItineraryMember member) {
    _members.putIfAbsent(itineraryId, () => []).add(member);
  }
}
