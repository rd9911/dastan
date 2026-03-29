import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dastan/src/features/collab/domain/collab_models.dart';
import 'package:dastan/src/features/collab/data/collab_repository.dart';

/// Supabase implementation of [CollabRepository].
class SupabaseCollabRepository implements CollabRepository {
  final SupabaseClient _client;

  SupabaseCollabRepository(this._client);

  @override
  Future<List<Invite>> sendInvites(InviteRequest request) async {
    final user = _client.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    final invites = <Invite>[];

    for (final email in request.emails) {
      // Create pending membership record (acts as invite)
      final response = await _client
          .from('itinerary_members')
          .insert({
            'itinerary_id': request.itineraryId,
            'user_id': null, // Will be set when user accepts
            'email': email,
            'role': request.role.name,
            'invited_by': user.id,
            'message': request.message,
            'status': 'pending',
          })
          .select()
          .single();

      invites.add(
        Invite(
          id: response['id'],
          itineraryId: request.itineraryId,
          email: email,
          role: request.role,
          token: response['id'], // Using ID as token for simplicity
          status: InviteStatus.pending,
          createdAt: DateTime.parse(response['invited_at']),
          invitedByUserId: user.id,
          message: request.message,
        ),
      );
    }

    return invites;
  }

  @override
  Future<ItineraryMember> acceptInvite(InviteAccept accept) async {
    final user = _client.auth.currentUser;
    if (user == null) throw Exception('Not authenticated');

    // Find the invite and update it
    final response = await _client
        .from('itinerary_members')
        .update({
          'user_id': user.id,
          'status': 'accepted',
          'accepted_at': DateTime.now().toIso8601String(),
        })
        .eq('id', accept.inviteToken)
        .eq('status', 'pending')
        .select()
        .single();

    return ItineraryMember(
      userId: user.id,
      email: response['email'] ?? user.email ?? '',
      role: _parseRole(response['role']),
      joinedAt: DateTime.parse(response['accepted_at']),
      displayName: user.userMetadata?['full_name'],
      avatarUrl: user.userMetadata?['avatar_url'],
    );
  }

  @override
  Future<List<ItineraryMember>> getMembers(String itineraryId) async {
    final response = await _client
        .from('itinerary_members')
        .select('*, profiles(*)')
        .eq('itinerary_id', itineraryId)
        .neq('status', 'pending');

    return (response as List).map((item) {
      final profile = item['profiles'] as Map<String, dynamic>?;
      return ItineraryMember(
        userId: item['user_id'],
        email: profile?['email'] ?? item['email'] ?? '',
        role: _parseRole(item['role']),
        joinedAt: DateTime.parse(item['accepted_at'] ?? item['invited_at']),
        displayName: profile?['display_name'],
        avatarUrl: profile?['avatar_url'],
      );
    }).toList();
  }

  @override
  Future<ItineraryMember> changeRole(
    String itineraryId,
    String userId,
    MemberRole newRole,
  ) async {
    final response = await _client
        .from('itinerary_members')
        .update({'role': newRole.name})
        .eq('itinerary_id', itineraryId)
        .eq('user_id', userId)
        .select('*, profiles(*)')
        .single();

    final profile = response['profiles'] as Map<String, dynamic>?;
    return ItineraryMember(
      userId: userId,
      email: profile?['email'] ?? '',
      role: newRole,
      joinedAt: DateTime.parse(
        response['accepted_at'] ?? response['invited_at'],
      ),
      displayName: profile?['display_name'],
      avatarUrl: profile?['avatar_url'],
    );
  }

  @override
  Future<void> revokeMember(String itineraryId, String userId) async {
    await _client
        .from('itinerary_members')
        .delete()
        .eq('itinerary_id', itineraryId)
        .eq('user_id', userId);
  }

  @override
  Future<Invite> resendInvite(String inviteId) async {
    final response = await _client
        .from('itinerary_members')
        .update({'invited_at': DateTime.now().toIso8601String()})
        .eq('id', inviteId)
        .eq('status', 'pending')
        .select()
        .single();

    return Invite(
      id: response['id'],
      itineraryId: response['itinerary_id'],
      email: response['email'],
      role: _parseRole(response['role']),
      token: response['id'],
      status: InviteStatus.pending,
      createdAt: DateTime.parse(response['invited_at']),
      invitedByUserId: response['invited_by'],
      message: response['message'],
    );
  }

  @override
  Future<List<Invite>> getPendingInvites(String itineraryId) async {
    final response = await _client
        .from('itinerary_members')
        .select()
        .eq('itinerary_id', itineraryId)
        .eq('status', 'pending');

    return (response as List)
        .map(
          (item) => Invite(
            id: item['id'],
            itineraryId: item['itinerary_id'],
            email: item['email'],
            role: _parseRole(item['role']),
            token: item['id'],
            status: InviteStatus.pending,
            createdAt: DateTime.parse(item['invited_at']),
            invitedByUserId: item['invited_by'],
            message: item['message'],
          ),
        )
        .toList();
  }

  @override
  Future<List<ActivityEvent>> getActivityEvents(
    String itineraryId, {
    int limit = 50,
  }) async {
    try {
      final response = await _client
          .from('activity_events')
          .select()
          .eq('itinerary_id', itineraryId)
          .order('created_at', ascending: false)
          .limit(limit);

      return (response as List).map((item) {
        return ActivityEvent(
          id: item['id'],
          itineraryId: item['itinerary_id'],
          type: _parseActivityType(item['type'] ?? item['action']),
          actorId: item['actor_id'],
          targetId: item['target_id'],
          details: item['details'],
          createdAt: DateTime.parse(item['created_at']),
        );
      }).toList();
    } catch (e) {
      // Return empty list gracefully if table doesn't exist yet
      return [];
    }
  }

  ActivityType _parseActivityType(String type) {
    try {
      return ActivityType.values.firstWhere((e) => e.name == type);
    } catch (_) {
      return ActivityType.planUpdated; // Default fallback
    }
  }

  @override
  Future<AclResult> checkPermission(AclCheck check) async {
    // Check locally using the PermissionChecker
    // First get the user's role
    try {
      final response = await _client
          .from('itinerary_members')
          .select('role')
          .eq('itinerary_id', check.itineraryId)
          .eq('user_id', check.userId)
          .maybeSingle();

      if (response == null) {
        return const AclResult(allowed: false, reason: 'Not a member');
      }

      final role = _parseRole(response['role']);
      final allowed = PermissionChecker.can(role, check.action);

      return AclResult(
        allowed: allowed,
        reason: allowed ? null : 'Insufficient permissions',
      );
    } catch (e) {
      return AclResult(
        allowed: false,
        reason: 'Error checking permissions: $e',
      );
    }
  }

  MemberRole _parseRole(String? role) {
    return MemberRole.values.firstWhere(
      (r) => r.name == role,
      orElse: () => MemberRole.viewer,
    );
  }
}
