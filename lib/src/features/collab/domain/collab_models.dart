import 'package:freezed_annotation/freezed_annotation.dart';

part 'collab_models.freezed.dart';
part 'collab_models.g.dart';

/// Role for an itinerary member.
enum MemberRole { owner, editor, viewer }

/// Represents a member of an itinerary with their role and activity timestamps.
@freezed
abstract class ItineraryMember with _$ItineraryMember {
  const factory ItineraryMember({
    required String userId,
    required String email,
    required MemberRole role,
    required DateTime joinedAt,
    DateTime? lastSeenAt,
    String? displayName,
    String? avatarUrl,
  }) = _ItineraryMember;

  factory ItineraryMember.fromJson(Map<String, dynamic> json) =>
      _$ItineraryMemberFromJson(json);
}

/// Request to invite users to an itinerary.
@freezed
abstract class InviteRequest with _$InviteRequest {
  const factory InviteRequest({
    required String itineraryId,
    required List<String> emails,
    required MemberRole role,
    String? message,
  }) = _InviteRequest;

  factory InviteRequest.fromJson(Map<String, dynamic> json) =>
      _$InviteRequestFromJson(json);
}

/// Request to accept an invite.
@freezed
abstract class InviteAccept with _$InviteAccept {
  const factory InviteAccept({required String inviteToken}) = _InviteAccept;

  factory InviteAccept.fromJson(Map<String, dynamic> json) =>
      _$InviteAcceptFromJson(json);
}

/// An invite record with token and status.
@freezed
abstract class Invite with _$Invite {
  const factory Invite({
    required String id,
    required String itineraryId,
    required String email,
    required MemberRole role,
    required String token,
    required InviteStatus status,
    required DateTime createdAt,
    DateTime? acceptedAt,
    String? invitedByUserId,
    String? message,
  }) = _Invite;

  factory Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);
}

enum InviteStatus { pending, accepted, expired, revoked }

/// ACL check request/response for permission validation.
@freezed
abstract class AclCheck with _$AclCheck {
  const factory AclCheck({
    required String itineraryId,
    required String userId,
    required AclAction action,
  }) = _AclCheck;

  factory AclCheck.fromJson(Map<String, dynamic> json) =>
      _$AclCheckFromJson(json);
}

/// Available actions for ACL checks.
enum AclAction { read, write, manage, uploadPhoto }

/// Activity event for audit trail.
@freezed
abstract class ActivityEvent with _$ActivityEvent {
  const factory ActivityEvent({
    required String id,
    required String itineraryId,
    required ActivityType type,
    required String actorId,
    String? targetId,
    Map<String, dynamic>? details,
    required DateTime createdAt,
  }) = _ActivityEvent;

  factory ActivityEvent.fromJson(Map<String, dynamic> json) =>
      _$ActivityEventFromJson(json);
}

/// Types of activity events for the audit trail.
enum ActivityType {
  memberInvited,
  memberJoined,
  roleChanged,
  memberRemoved,
  itemAdded,
  itemRemoved,
  itemUpdated,
  planUpdated,
}

/// Permission result from an ACL check.
@freezed
abstract class AclResult with _$AclResult {
  const factory AclResult({required bool allowed, String? reason}) = _AclResult;

  factory AclResult.fromJson(Map<String, dynamic> json) =>
      _$AclResultFromJson(json);
}

/// Client-side permission checker that mirrors server RBAC.
class PermissionChecker {
  /// Check if a role can perform an action.
  static bool can(MemberRole role, AclAction action) {
    switch (role) {
      case MemberRole.owner:
        return true; // Owner can do everything
      case MemberRole.editor:
        return action !=
            AclAction.manage; // Editor can read, write, upload photos
      case MemberRole.viewer:
        return action == AclAction.read; // Viewer can only read
    }
  }

  /// Get all allowed actions for a role.
  static List<AclAction> allowedActions(MemberRole role) {
    return AclAction.values.where((a) => can(role, a)).toList();
  }

  /// Check if a role can invite others.
  static bool canInvite(MemberRole role) => role == MemberRole.owner;

  /// Check if a role can change another member's role.
  static bool canChangeRole(MemberRole role) => role == MemberRole.owner;

  /// Check if a role can revoke a member.
  static bool canRevoke(MemberRole role) => role == MemberRole.owner;

  /// Check if a role can upload photos.
  static bool canUploadPhoto(MemberRole role) =>
      can(role, AclAction.uploadPhoto);

  /// Check if a role can edit items.
  static bool canEdit(MemberRole role) => can(role, AclAction.write);
}
