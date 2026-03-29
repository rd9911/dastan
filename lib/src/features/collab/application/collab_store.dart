import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/collab/domain/collab_models.dart';
import 'package:dastan/src/features/collab/data/collab_repository.dart';
import 'package:dastan/src/features/collab/application/collab_providers.dart';

/// State for the collaboration store.
class CollabState {
  final List<ItineraryMember> members;
  final List<Invite> pendingInvites;
  final List<ActivityEvent> activityEvents;
  final bool isLoading;
  final String? error;
  final MemberRole? currentUserRole;

  const CollabState({
    this.members = const [],
    this.pendingInvites = const [],
    this.activityEvents = const [],
    this.isLoading = false,
    this.error,
    this.currentUserRole,
  });

  CollabState copyWith({
    List<ItineraryMember>? members,
    List<Invite>? pendingInvites,
    List<ActivityEvent>? activityEvents,
    bool? isLoading,
    String? error,
    MemberRole? currentUserRole,
  }) {
    return CollabState(
      members: members ?? this.members,
      pendingInvites: pendingInvites ?? this.pendingInvites,
      activityEvents: activityEvents ?? this.activityEvents,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentUserRole: currentUserRole ?? this.currentUserRole,
    );
  }

  /// Check if current user can perform an action.
  bool can(AclAction action) {
    if (currentUserRole == null) return false;
    return PermissionChecker.can(currentUserRole!, action);
  }

  /// Check if current user can invite others.
  bool get canInvite => currentUserRole == MemberRole.owner;

  /// Check if current user can manage members.
  bool get canManageMembers => currentUserRole == MemberRole.owner;
}

/// Notifier for collaboration state.
class CollabStoreNotifier extends Notifier<CollabState> {
  late CollabRepository _repo;
  String? _itineraryId;

  @override
  CollabState build() {
    _repo = ref.watch(collabRepositoryProvider);
    return const CollabState();
  }

  /// Initialize store for an itinerary.
  Future<void> initialize(String itineraryId, String currentUserId) async {
    _itineraryId = itineraryId;
    state = state.copyWith(isLoading: true);

    try {
      final members = await _repo.getMembers(itineraryId);
      final invites = await _repo.getPendingInvites(itineraryId);
      final events = await _repo.getActivityEvents(itineraryId);

      final currentMember = members.firstWhere(
        (m) => m.userId == currentUserId,
        orElse: () => ItineraryMember(
          userId: '',
          email: '',
          role: MemberRole.viewer,
          joinedAt: DateTime.now(),
        ),
      );

      state = state.copyWith(
        members: members,
        pendingInvites: invites,
        activityEvents: events,
        isLoading: false,
        currentUserRole: currentMember.userId.isNotEmpty
            ? currentMember.role
            : null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Send invites to users.
  Future<bool> sendInvites(
    List<String> emails,
    MemberRole role, {
    String? message,
  }) async {
    if (_itineraryId == null) return false;

    try {
      final request = InviteRequest(
        itineraryId: _itineraryId!,
        emails: emails,
        role: role,
        message: message,
      );

      final invites = await _repo.sendInvites(request);
      state = state.copyWith(
        pendingInvites: [...state.pendingInvites, ...invites],
      );
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }

  /// Change a member's role.
  Future<bool> changeMemberRole(String userId, MemberRole newRole) async {
    if (_itineraryId == null) return false;

    try {
      final updated = await _repo.changeRole(_itineraryId!, userId, newRole);
      state = state.copyWith(
        members: state.members
            .map((m) => m.userId == userId ? updated : m)
            .toList(),
      );
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }

  /// Revoke a member's access.
  Future<bool> revokeMember(String userId) async {
    if (_itineraryId == null) return false;

    try {
      await _repo.revokeMember(_itineraryId!, userId);
      state = state.copyWith(
        members: state.members.where((m) => m.userId != userId).toList(),
      );
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }

  /// Resend an invite.
  Future<bool> resendInvite(String inviteId) async {
    try {
      final updated = await _repo.resendInvite(inviteId);
      state = state.copyWith(
        pendingInvites: state.pendingInvites
            .map((i) => i.id == inviteId ? updated : i)
            .toList(),
      );
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }

  /// Refresh activity events.
  Future<void> refreshActivity() async {
    if (_itineraryId == null) return;

    try {
      final events = await _repo.getActivityEvents(_itineraryId!);
      state = state.copyWith(activityEvents: events);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Clear error.
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for the collab store.
final collabStoreNotifierProvider =
    NotifierProvider<CollabStoreNotifier, CollabState>(CollabStoreNotifier.new);
