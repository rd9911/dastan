import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_models.freezed.dart';
part 'admin_models.g.dart';

/// Admin roles with hierarchical permissions.
enum AdminRole {
  readOnly, // Can view metadata only, no PII
  support, // Can search, view user data, use support tools
  billingAdmin, // Can perform billing actions (refunds, plan changes)
  trustSafety, // Can handle abuse, takedowns
  superAdmin, // Full access to all admin functions
}

/// Admin session containing authentication and authorization context.
@freezed
abstract class AdminSession with _$AdminSession {
  const AdminSession._();

  const factory AdminSession({
    required String sessionId,
    required String userId,
    required String email,
    required AdminRole role,
    required DateTime issuedAt,
    required DateTime expiresAt,
    String? ipAddress,
    String? deviceId,
    @Default(false) bool requiresReauth,
    Map<String, dynamic>? posture,
  }) = _AdminSession;

  factory AdminSession.fromJson(Map<String, dynamic> json) =>
      _$AdminSessionFromJson(json);

  /// Check if session is expired.
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Check if session is valid.
  bool get isValid => !isExpired && !requiresReauth;

  /// Time remaining until expiration.
  Duration get timeRemaining => expiresAt.difference(DateTime.now());
}

/// Admin action for audit log.
@freezed
abstract class AdminAction with _$AdminAction {
  const factory AdminAction({
    required String id,
    required String actorId,
    required String actorEmail,
    required AdminRole actorRole,
    required AdminActionType actionType,
    required String resource,
    String? targetId,
    String? targetType,
    required String reason,
    String? ticketUrl,
    Map<String, dynamic>? details,
    String? approvedBy,
    DateTime? approvedAt,
    required DateTime createdAt,
    String? previousHash, // For cryptographic chaining
    String? hash,
  }) = _AdminAction;

  factory AdminAction.fromJson(Map<String, dynamic> json) =>
      _$AdminActionFromJson(json);
}

/// Types of admin actions.
enum AdminActionType {
  // Session
  login,
  logout,
  sessionRefresh,

  // User actions
  viewUser,
  revealPii,
  updateUser,
  suspendUser,
  unsuspendUser,

  // Billing
  refund,
  partialRefund,
  voidInvoice,
  reissueInvoice,
  changePlan,
  applyCredit,

  // Entitlements
  grantOverride,
  revokeOverride,
  resetCounter,
  bumpQuota,

  // Itinerary
  transferOwnership,
  addCollaborator,
  removeCollaborator,
  rebuildIndex,
  clearSync,
  rollbackBundle,
  revokeSnapshot,

  // Trust & Safety
  rateLimitUser,
  blockDevice,
  blockIp,
  suspendScanner,
  suspendAccount,
  requestTakedown,
  approveTakedown,
  denyTakedown,

  // System
  exportData,
  configChange,
}

/// Policy decision result.
@freezed
abstract class PolicyDecision with _$PolicyDecision {
  const factory PolicyDecision({
    required bool allowed,
    String? reason,
    @Default(false) bool requiresApproval,
    @Default(false) bool requiresJustification,
    @Default(false) bool requiresIpAllowlist,
  }) = _PolicyDecision;

  factory PolicyDecision.fromJson(Map<String, dynamic> json) =>
      _$PolicyDecisionFromJson(json);
}

/// Idempotency key record.
@freezed
abstract class IdempotencyRecord with _$IdempotencyRecord {
  const factory IdempotencyRecord({
    required String key,
    required String actionType,
    required String result,
    required DateTime createdAt,
    required DateTime expiresAt,
    String? mutationId,
  }) = _IdempotencyRecord;

  factory IdempotencyRecord.fromJson(Map<String, dynamic> json) =>
      _$IdempotencyRecordFromJson(json);
}

/// Override grant for entitlements.
@freezed
abstract class OverrideGrant with _$OverrideGrant {
  const OverrideGrant._();

  const factory OverrideGrant({
    required String id,
    required String userId,
    required String key,
    required dynamic value,
    required String reason,
    required String grantedBy,
    required DateTime createdAt,
    DateTime? expiresAt,
    DateTime? revokedAt,
    String? revokedBy,
  }) = _OverrideGrant;

  factory OverrideGrant.fromJson(Map<String, dynamic> json) =>
      _$OverrideGrantFromJson(json);

  /// Check if override is active.
  bool get isActive {
    if (revokedAt != null) return false;
    if (expiresAt != null && DateTime.now().isAfter(expiresAt!)) return false;
    return true;
  }
}

/// Abuse signal for trust & safety queue.
@freezed
abstract class AbuseSignal with _$AbuseSignal {
  const factory AbuseSignal({
    required String id,
    required String userId,
    required AbuseType type,
    required AbuseSeverity severity,
    required String description,
    Map<String, dynamic>? evidence,
    required DateTime detectedAt,
    DateTime? reviewedAt,
    String? reviewedBy,
    AbuseResolution? resolution,
  }) = _AbuseSignal;

  factory AbuseSignal.fromJson(Map<String, dynamic> json) =>
      _$AbuseSignalFromJson(json);
}

enum AbuseType {
  scraping,
  spamInvites,
  suspiciousShares,
  fraudulent,
  harassment,
  other,
}

enum AbuseSeverity { low, medium, high, critical }

enum AbuseResolution { dismissed, rateLimit, blockDevice, blockIp, suspend }

/// Takedown request requiring two-person approval.
@freezed
abstract class TakedownRequest with _$TakedownRequest {
  const TakedownRequest._();

  const factory TakedownRequest({
    required String id,
    required String targetType, // snapshot, itinerary, user
    required String targetId,
    required String reason,
    required String requestedBy,
    required DateTime requestedAt,
    String? approvedBy,
    DateTime? approvedAt,
    String? deniedBy,
    DateTime? deniedAt,
    String? denyReason,
  }) = _TakedownRequest;

  factory TakedownRequest.fromJson(Map<String, dynamic> json) =>
      _$TakedownRequestFromJson(json);

  bool get isPending => approvedAt == null && deniedAt == null;
  bool get isApproved => approvedAt != null;
  bool get isDenied => deniedAt != null;
}
