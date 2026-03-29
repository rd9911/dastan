// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminSession _$AdminSessionFromJson(Map<String, dynamic> json) =>
    _AdminSession(
      sessionId: json['sessionId'] as String,
      userId: json['userId'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$AdminRoleEnumMap, json['role']),
      issuedAt: DateTime.parse(json['issuedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      ipAddress: json['ipAddress'] as String?,
      deviceId: json['deviceId'] as String?,
      requiresReauth: json['requiresReauth'] as bool? ?? false,
      posture: json['posture'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AdminSessionToJson(_AdminSession instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'userId': instance.userId,
      'email': instance.email,
      'role': _$AdminRoleEnumMap[instance.role]!,
      'issuedAt': instance.issuedAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'ipAddress': instance.ipAddress,
      'deviceId': instance.deviceId,
      'requiresReauth': instance.requiresReauth,
      'posture': instance.posture,
    };

const _$AdminRoleEnumMap = {
  AdminRole.readOnly: 'readOnly',
  AdminRole.support: 'support',
  AdminRole.billingAdmin: 'billingAdmin',
  AdminRole.trustSafety: 'trustSafety',
  AdminRole.superAdmin: 'superAdmin',
};

_AdminAction _$AdminActionFromJson(Map<String, dynamic> json) => _AdminAction(
  id: json['id'] as String,
  actorId: json['actorId'] as String,
  actorEmail: json['actorEmail'] as String,
  actorRole: $enumDecode(_$AdminRoleEnumMap, json['actorRole']),
  actionType: $enumDecode(_$AdminActionTypeEnumMap, json['actionType']),
  resource: json['resource'] as String,
  targetId: json['targetId'] as String?,
  targetType: json['targetType'] as String?,
  reason: json['reason'] as String,
  ticketUrl: json['ticketUrl'] as String?,
  details: json['details'] as Map<String, dynamic>?,
  approvedBy: json['approvedBy'] as String?,
  approvedAt: json['approvedAt'] == null
      ? null
      : DateTime.parse(json['approvedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  previousHash: json['previousHash'] as String?,
  hash: json['hash'] as String?,
);

Map<String, dynamic> _$AdminActionToJson(_AdminAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actorId': instance.actorId,
      'actorEmail': instance.actorEmail,
      'actorRole': _$AdminRoleEnumMap[instance.actorRole]!,
      'actionType': _$AdminActionTypeEnumMap[instance.actionType]!,
      'resource': instance.resource,
      'targetId': instance.targetId,
      'targetType': instance.targetType,
      'reason': instance.reason,
      'ticketUrl': instance.ticketUrl,
      'details': instance.details,
      'approvedBy': instance.approvedBy,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'previousHash': instance.previousHash,
      'hash': instance.hash,
    };

const _$AdminActionTypeEnumMap = {
  AdminActionType.login: 'login',
  AdminActionType.logout: 'logout',
  AdminActionType.sessionRefresh: 'sessionRefresh',
  AdminActionType.viewUser: 'viewUser',
  AdminActionType.revealPii: 'revealPii',
  AdminActionType.updateUser: 'updateUser',
  AdminActionType.suspendUser: 'suspendUser',
  AdminActionType.unsuspendUser: 'unsuspendUser',
  AdminActionType.refund: 'refund',
  AdminActionType.partialRefund: 'partialRefund',
  AdminActionType.voidInvoice: 'voidInvoice',
  AdminActionType.reissueInvoice: 'reissueInvoice',
  AdminActionType.changePlan: 'changePlan',
  AdminActionType.applyCredit: 'applyCredit',
  AdminActionType.grantOverride: 'grantOverride',
  AdminActionType.revokeOverride: 'revokeOverride',
  AdminActionType.resetCounter: 'resetCounter',
  AdminActionType.bumpQuota: 'bumpQuota',
  AdminActionType.transferOwnership: 'transferOwnership',
  AdminActionType.addCollaborator: 'addCollaborator',
  AdminActionType.removeCollaborator: 'removeCollaborator',
  AdminActionType.rebuildIndex: 'rebuildIndex',
  AdminActionType.clearSync: 'clearSync',
  AdminActionType.rollbackBundle: 'rollbackBundle',
  AdminActionType.revokeSnapshot: 'revokeSnapshot',
  AdminActionType.rateLimitUser: 'rateLimitUser',
  AdminActionType.blockDevice: 'blockDevice',
  AdminActionType.blockIp: 'blockIp',
  AdminActionType.suspendScanner: 'suspendScanner',
  AdminActionType.suspendAccount: 'suspendAccount',
  AdminActionType.requestTakedown: 'requestTakedown',
  AdminActionType.approveTakedown: 'approveTakedown',
  AdminActionType.denyTakedown: 'denyTakedown',
  AdminActionType.exportData: 'exportData',
  AdminActionType.configChange: 'configChange',
};

_PolicyDecision _$PolicyDecisionFromJson(Map<String, dynamic> json) =>
    _PolicyDecision(
      allowed: json['allowed'] as bool,
      reason: json['reason'] as String?,
      requiresApproval: json['requiresApproval'] as bool? ?? false,
      requiresJustification: json['requiresJustification'] as bool? ?? false,
      requiresIpAllowlist: json['requiresIpAllowlist'] as bool? ?? false,
    );

Map<String, dynamic> _$PolicyDecisionToJson(_PolicyDecision instance) =>
    <String, dynamic>{
      'allowed': instance.allowed,
      'reason': instance.reason,
      'requiresApproval': instance.requiresApproval,
      'requiresJustification': instance.requiresJustification,
      'requiresIpAllowlist': instance.requiresIpAllowlist,
    };

_IdempotencyRecord _$IdempotencyRecordFromJson(Map<String, dynamic> json) =>
    _IdempotencyRecord(
      key: json['key'] as String,
      actionType: json['actionType'] as String,
      result: json['result'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      mutationId: json['mutationId'] as String?,
    );

Map<String, dynamic> _$IdempotencyRecordToJson(_IdempotencyRecord instance) =>
    <String, dynamic>{
      'key': instance.key,
      'actionType': instance.actionType,
      'result': instance.result,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'mutationId': instance.mutationId,
    };

_OverrideGrant _$OverrideGrantFromJson(Map<String, dynamic> json) =>
    _OverrideGrant(
      id: json['id'] as String,
      userId: json['userId'] as String,
      key: json['key'] as String,
      value: json['value'],
      reason: json['reason'] as String,
      grantedBy: json['grantedBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      revokedAt: json['revokedAt'] == null
          ? null
          : DateTime.parse(json['revokedAt'] as String),
      revokedBy: json['revokedBy'] as String?,
    );

Map<String, dynamic> _$OverrideGrantToJson(_OverrideGrant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'key': instance.key,
      'value': instance.value,
      'reason': instance.reason,
      'grantedBy': instance.grantedBy,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'revokedAt': instance.revokedAt?.toIso8601String(),
      'revokedBy': instance.revokedBy,
    };

_AbuseSignal _$AbuseSignalFromJson(Map<String, dynamic> json) => _AbuseSignal(
  id: json['id'] as String,
  userId: json['userId'] as String,
  type: $enumDecode(_$AbuseTypeEnumMap, json['type']),
  severity: $enumDecode(_$AbuseSeverityEnumMap, json['severity']),
  description: json['description'] as String,
  evidence: json['evidence'] as Map<String, dynamic>?,
  detectedAt: DateTime.parse(json['detectedAt'] as String),
  reviewedAt: json['reviewedAt'] == null
      ? null
      : DateTime.parse(json['reviewedAt'] as String),
  reviewedBy: json['reviewedBy'] as String?,
  resolution: $enumDecodeNullable(_$AbuseResolutionEnumMap, json['resolution']),
);

Map<String, dynamic> _$AbuseSignalToJson(_AbuseSignal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$AbuseTypeEnumMap[instance.type]!,
      'severity': _$AbuseSeverityEnumMap[instance.severity]!,
      'description': instance.description,
      'evidence': instance.evidence,
      'detectedAt': instance.detectedAt.toIso8601String(),
      'reviewedAt': instance.reviewedAt?.toIso8601String(),
      'reviewedBy': instance.reviewedBy,
      'resolution': _$AbuseResolutionEnumMap[instance.resolution],
    };

const _$AbuseTypeEnumMap = {
  AbuseType.scraping: 'scraping',
  AbuseType.spamInvites: 'spamInvites',
  AbuseType.suspiciousShares: 'suspiciousShares',
  AbuseType.fraudulent: 'fraudulent',
  AbuseType.harassment: 'harassment',
  AbuseType.other: 'other',
};

const _$AbuseSeverityEnumMap = {
  AbuseSeverity.low: 'low',
  AbuseSeverity.medium: 'medium',
  AbuseSeverity.high: 'high',
  AbuseSeverity.critical: 'critical',
};

const _$AbuseResolutionEnumMap = {
  AbuseResolution.dismissed: 'dismissed',
  AbuseResolution.rateLimit: 'rateLimit',
  AbuseResolution.blockDevice: 'blockDevice',
  AbuseResolution.blockIp: 'blockIp',
  AbuseResolution.suspend: 'suspend',
};

_TakedownRequest _$TakedownRequestFromJson(Map<String, dynamic> json) =>
    _TakedownRequest(
      id: json['id'] as String,
      targetType: json['targetType'] as String,
      targetId: json['targetId'] as String,
      reason: json['reason'] as String,
      requestedBy: json['requestedBy'] as String,
      requestedAt: DateTime.parse(json['requestedAt'] as String),
      approvedBy: json['approvedBy'] as String?,
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      deniedBy: json['deniedBy'] as String?,
      deniedAt: json['deniedAt'] == null
          ? null
          : DateTime.parse(json['deniedAt'] as String),
      denyReason: json['denyReason'] as String?,
    );

Map<String, dynamic> _$TakedownRequestToJson(_TakedownRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetType': instance.targetType,
      'targetId': instance.targetId,
      'reason': instance.reason,
      'requestedBy': instance.requestedBy,
      'requestedAt': instance.requestedAt.toIso8601String(),
      'approvedBy': instance.approvedBy,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'deniedBy': instance.deniedBy,
      'deniedAt': instance.deniedAt?.toIso8601String(),
      'denyReason': instance.denyReason,
    };
