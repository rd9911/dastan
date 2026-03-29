/// Telemetry events for admin console.
class AdminTelemetry {
  /// Log admin login.
  static Map<String, dynamic> adminLogin({required String role}) {
    return {
      'event': 'admin_login',
      'role': role,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log billing action.
  static Map<String, dynamic> billingAction({
    required String action,
    required String invoiceId,
    double? amount,
  }) {
    return {
      'event': 'admin_billing_action',
      'action': action,
      'invoice_id': invoiceId,
      'amount': amount,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log entitlement override.
  static Map<String, dynamic> entitlementOverride({
    required String userId,
    required String key,
    required String action, // 'grant', 'revoke'
  }) {
    return {
      'event': 'admin_entitlement_override',
      'user_id': userId,
      'key': key,
      'action': action,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log takedown action.
  static Map<String, dynamic> takedownAction({
    required String action, // 'request', 'approve', 'deny'
    required String targetType,
    required String targetId,
  }) {
    return {
      'event': 'admin_takedown_action',
      'action': action,
      'target_type': targetType,
      'target_id': targetId,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log PII reveal.
  static Map<String, dynamic> piiReveal({
    required String userId,
    required String field,
  }) {
    return {
      'event': 'admin_pii_reveal',
      'user_id': userId,
      'field': field,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log search action.
  static Map<String, dynamic> adminSearch({required int resultCount}) {
    return {
      'event': 'admin_search',
      'result_count': resultCount,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Log audit log export.
  static Map<String, dynamic> auditExport({required int entryCount}) {
    return {
      'event': 'admin_audit_export',
      'entry_count': entryCount,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
