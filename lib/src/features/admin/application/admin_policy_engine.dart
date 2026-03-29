import 'package:dastan/src/features/admin/domain/admin_models.dart';

/// Policy engine for admin access control.
/// Implements OPA-style policy decisions for admin actions.
class AdminPolicyEngine {
  /// Check if a role can perform an action on a resource.
  static PolicyDecision can(
    AdminRole role,
    AdminActionType action, {
    String? resource,
  }) {
    // Super admin can do everything
    if (role == AdminRole.superAdmin) {
      return const PolicyDecision(allowed: true);
    }

    // Check action-specific policies
    switch (action) {
      // Read-only actions - available to all roles
      case AdminActionType.login:
      case AdminActionType.logout:
      case AdminActionType.sessionRefresh:
        return const PolicyDecision(allowed: true);

      case AdminActionType.viewUser:
        return PolicyDecision(
          allowed: role != AdminRole.readOnly || _isMetadataOnly(resource),
          requiresJustification: role == AdminRole.support,
        );

      case AdminActionType.revealPii:
        return PolicyDecision(
          allowed: role != AdminRole.readOnly,
          requiresJustification: true,
        );

      // Billing actions - billing admin only
      case AdminActionType.refund:
      case AdminActionType.partialRefund:
      case AdminActionType.voidInvoice:
      case AdminActionType.reissueInvoice:
      case AdminActionType.changePlan:
      case AdminActionType.applyCredit:
        return PolicyDecision(
          allowed: role == AdminRole.billingAdmin,
          requiresJustification: true,
          reason: role != AdminRole.billingAdmin
              ? 'Billing actions require billing_admin role'
              : null,
        );

      // Entitlement actions - billing admin or super admin
      case AdminActionType.grantOverride:
      case AdminActionType.revokeOverride:
      case AdminActionType.resetCounter:
      case AdminActionType.bumpQuota:
        return PolicyDecision(
          allowed:
              role == AdminRole.billingAdmin || role == AdminRole.superAdmin,
          requiresJustification: true,
        );

      // Itinerary operations - support and above
      case AdminActionType.transferOwnership:
        return PolicyDecision(
          allowed:
              role == AdminRole.support ||
              role == AdminRole.billingAdmin ||
              role == AdminRole.trustSafety,
          requiresJustification: true,
        );

      case AdminActionType.addCollaborator:
      case AdminActionType.removeCollaborator:
      case AdminActionType.rebuildIndex:
      case AdminActionType.clearSync:
      case AdminActionType.rollbackBundle:
        return PolicyDecision(
          allowed:
              role == AdminRole.support ||
              role == AdminRole.billingAdmin ||
              role == AdminRole.trustSafety,
        );

      case AdminActionType.revokeSnapshot:
        return PolicyDecision(
          allowed: role == AdminRole.trustSafety,
          requiresApproval: true,
        );

      // Trust & Safety actions
      case AdminActionType.rateLimitUser:
      case AdminActionType.blockDevice:
      case AdminActionType.blockIp:
        return PolicyDecision(
          allowed: role == AdminRole.trustSafety || role == AdminRole.support,
          requiresJustification: true,
        );

      case AdminActionType.suspendScanner:
      case AdminActionType.suspendAccount:
        return PolicyDecision(
          allowed: role == AdminRole.trustSafety,
          requiresJustification: true,
          requiresApproval: true,
        );

      case AdminActionType.requestTakedown:
        return PolicyDecision(
          allowed: role == AdminRole.trustSafety || role == AdminRole.support,
          requiresJustification: true,
        );

      case AdminActionType.approveTakedown:
      case AdminActionType.denyTakedown:
        return PolicyDecision(allowed: role == AdminRole.trustSafety);

      // System actions
      case AdminActionType.exportData:
        return PolicyDecision(
          allowed: role != AdminRole.readOnly,
          requiresJustification: true,
        );

      case AdminActionType.configChange:
        return const PolicyDecision(
          allowed: false,
          reason: 'Config changes require super_admin role',
        );

      // User update actions
      case AdminActionType.updateUser:
      case AdminActionType.suspendUser:
      case AdminActionType.unsuspendUser:
        return PolicyDecision(
          allowed: role == AdminRole.support || role == AdminRole.trustSafety,
          requiresJustification: true,
        );
    }
  }

  /// Check if resource is metadata only (for read-only role).
  static bool _isMetadataOnly(String? resource) {
    if (resource == null) return false;
    return resource.startsWith('metadata:') || resource.startsWith('counts:');
  }

  /// Get all allowed actions for a role.
  static List<AdminActionType> allowedActions(AdminRole role) {
    return AdminActionType.values
        .where((action) => can(role, action).allowed)
        .toList();
  }

  /// Check if action requires justification.
  static bool requiresJustification(AdminActionType action) {
    return can(AdminRole.superAdmin, action).requiresJustification;
  }

  /// Check if action requires two-person approval.
  static bool requiresApproval(AdminActionType action) {
    return can(AdminRole.superAdmin, action).requiresApproval;
  }

  /// Get role hierarchy level (higher = more permissions).
  static int roleLevel(AdminRole role) {
    switch (role) {
      case AdminRole.readOnly:
        return 0;
      case AdminRole.support:
        return 1;
      case AdminRole.billingAdmin:
        return 2;
      case AdminRole.trustSafety:
        return 2;
      case AdminRole.superAdmin:
        return 3;
    }
  }

  /// Check if role A can act on behalf of role B.
  static bool canActOnRole(AdminRole actor, AdminRole target) {
    return roleLevel(actor) >= roleLevel(target);
  }
}

/// Sensitive actions that require IP allowlist check.
const sensitiveActions = [
  AdminActionType.refund,
  AdminActionType.suspendAccount,
  AdminActionType.configChange,
  AdminActionType.approveTakedown,
];

/// Actions that should be rate-limited more aggressively.
const rateLimitedActions = [
  AdminActionType.refund,
  AdminActionType.partialRefund,
  AdminActionType.changePlan,
  AdminActionType.suspendAccount,
  AdminActionType.exportData,
];
