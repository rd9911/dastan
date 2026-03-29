import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/collab/domain/collab_models.dart';
import 'package:dastan/src/features/collab/data/collab_repository.dart';
import 'package:dastan/src/features/collab/application/collab_providers.dart';

/// Service for managing permissions and access control.
class PermissionService {
  final CollabRepository _repo;
  final String _currentUserId;

  PermissionService(this._repo, this._currentUserId);

  /// Get the current user's role in an itinerary.
  Future<MemberRole?> getCurrentUserRole(String itineraryId) async {
    final members = await _repo.getMembers(itineraryId);
    final member = members.firstWhere(
      (m) => m.userId == _currentUserId,
      orElse: () => ItineraryMember(
        userId: '',
        email: '',
        role: MemberRole.viewer,
        joinedAt: DateTime.now(),
      ),
    );
    return member.userId.isEmpty ? null : member.role;
  }

  /// Check if current user can perform an action.
  Future<bool> canPerform(String itineraryId, AclAction action) async {
    final role = await getCurrentUserRole(itineraryId);
    if (role == null) return false;
    return PermissionChecker.can(role, action);
  }

  /// Check if current user can invite others.
  Future<bool> canInvite(String itineraryId) async {
    final role = await getCurrentUserRole(itineraryId);
    if (role == null) return false;
    return PermissionChecker.canInvite(role);
  }

  /// Check if current user can manage members (change roles, revoke).
  Future<bool> canManageMembers(String itineraryId) async {
    final role = await getCurrentUserRole(itineraryId);
    if (role == null) return false;
    return role == MemberRole.owner;
  }

  /// Check if current user can edit items.
  Future<bool> canEdit(String itineraryId) async {
    return canPerform(itineraryId, AclAction.write);
  }

  /// Check if current user can upload photos.
  Future<bool> canUploadPhoto(String itineraryId) async {
    return canPerform(itineraryId, AclAction.uploadPhoto);
  }

  /// Get list of actions current user can perform.
  Future<List<AclAction>> getAllowedActions(String itineraryId) async {
    final role = await getCurrentUserRole(itineraryId);
    if (role == null) return [];
    return PermissionChecker.allowedActions(role);
  }
}

/// Provider for the permission service.
final permissionServiceProvider = Provider.family<PermissionService, String>((
  ref,
  userId,
) {
  final repo = ref.watch(collabRepositoryProvider);
  return PermissionService(repo, userId);
});
