// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collab_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItineraryMember _$ItineraryMemberFromJson(Map<String, dynamic> json) =>
    _ItineraryMember(
      userId: json['userId'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$MemberRoleEnumMap, json['role']),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      lastSeenAt: json['lastSeenAt'] == null
          ? null
          : DateTime.parse(json['lastSeenAt'] as String),
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$ItineraryMemberToJson(_ItineraryMember instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'role': _$MemberRoleEnumMap[instance.role]!,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
    };

const _$MemberRoleEnumMap = {
  MemberRole.owner: 'owner',
  MemberRole.editor: 'editor',
  MemberRole.viewer: 'viewer',
};

_InviteRequest _$InviteRequestFromJson(Map<String, dynamic> json) =>
    _InviteRequest(
      itineraryId: json['itineraryId'] as String,
      emails: (json['emails'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      role: $enumDecode(_$MemberRoleEnumMap, json['role']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$InviteRequestToJson(_InviteRequest instance) =>
    <String, dynamic>{
      'itineraryId': instance.itineraryId,
      'emails': instance.emails,
      'role': _$MemberRoleEnumMap[instance.role]!,
      'message': instance.message,
    };

_InviteAccept _$InviteAcceptFromJson(Map<String, dynamic> json) =>
    _InviteAccept(inviteToken: json['inviteToken'] as String);

Map<String, dynamic> _$InviteAcceptToJson(_InviteAccept instance) =>
    <String, dynamic>{'inviteToken': instance.inviteToken};

_Invite _$InviteFromJson(Map<String, dynamic> json) => _Invite(
  id: json['id'] as String,
  itineraryId: json['itineraryId'] as String,
  email: json['email'] as String,
  role: $enumDecode(_$MemberRoleEnumMap, json['role']),
  token: json['token'] as String,
  status: $enumDecode(_$InviteStatusEnumMap, json['status']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  acceptedAt: json['acceptedAt'] == null
      ? null
      : DateTime.parse(json['acceptedAt'] as String),
  invitedByUserId: json['invitedByUserId'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$InviteToJson(_Invite instance) => <String, dynamic>{
  'id': instance.id,
  'itineraryId': instance.itineraryId,
  'email': instance.email,
  'role': _$MemberRoleEnumMap[instance.role]!,
  'token': instance.token,
  'status': _$InviteStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'acceptedAt': instance.acceptedAt?.toIso8601String(),
  'invitedByUserId': instance.invitedByUserId,
  'message': instance.message,
};

const _$InviteStatusEnumMap = {
  InviteStatus.pending: 'pending',
  InviteStatus.accepted: 'accepted',
  InviteStatus.expired: 'expired',
  InviteStatus.revoked: 'revoked',
};

_AclCheck _$AclCheckFromJson(Map<String, dynamic> json) => _AclCheck(
  itineraryId: json['itineraryId'] as String,
  userId: json['userId'] as String,
  action: $enumDecode(_$AclActionEnumMap, json['action']),
);

Map<String, dynamic> _$AclCheckToJson(_AclCheck instance) => <String, dynamic>{
  'itineraryId': instance.itineraryId,
  'userId': instance.userId,
  'action': _$AclActionEnumMap[instance.action]!,
};

const _$AclActionEnumMap = {
  AclAction.read: 'read',
  AclAction.write: 'write',
  AclAction.manage: 'manage',
  AclAction.uploadPhoto: 'uploadPhoto',
};

_ActivityEvent _$ActivityEventFromJson(Map<String, dynamic> json) =>
    _ActivityEvent(
      id: json['id'] as String,
      itineraryId: json['itineraryId'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      actorId: json['actorId'] as String,
      targetId: json['targetId'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ActivityEventToJson(_ActivityEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itineraryId': instance.itineraryId,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'actorId': instance.actorId,
      'targetId': instance.targetId,
      'details': instance.details,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$ActivityTypeEnumMap = {
  ActivityType.memberInvited: 'memberInvited',
  ActivityType.memberJoined: 'memberJoined',
  ActivityType.roleChanged: 'roleChanged',
  ActivityType.memberRemoved: 'memberRemoved',
  ActivityType.itemAdded: 'itemAdded',
  ActivityType.itemRemoved: 'itemRemoved',
  ActivityType.itemUpdated: 'itemUpdated',
  ActivityType.planUpdated: 'planUpdated',
};

_AclResult _$AclResultFromJson(Map<String, dynamic> json) => _AclResult(
  allowed: json['allowed'] as bool,
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$AclResultToJson(_AclResult instance) =>
    <String, dynamic>{'allowed': instance.allowed, 'reason': instance.reason};
