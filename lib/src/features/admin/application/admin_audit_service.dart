import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/admin/domain/admin_models.dart';

/// Service for managing the immutable admin audit log.
class AdminAuditService {
  final List<AdminAction> _auditLog = [];
  String? _lastHash;

  /// Append an action to the audit log with cryptographic chaining.
  AdminAction appendAction({
    required String actorId,
    required String actorEmail,
    required AdminRole actorRole,
    required AdminActionType actionType,
    required String resource,
    required String reason,
    String? targetId,
    String? targetType,
    String? ticketUrl,
    Map<String, dynamic>? details,
    String? approvedBy,
    DateTime? approvedAt,
  }) {
    final id = 'action_${DateTime.now().millisecondsSinceEpoch}';
    final createdAt = DateTime.now();

    // Create hash for cryptographic chaining
    final hashInput =
        '$id|$actorId|$actionType|$resource|$createdAt|$_lastHash';
    final hash = sha256.convert(utf8.encode(hashInput)).toString();

    final action = AdminAction(
      id: id,
      actorId: actorId,
      actorEmail: actorEmail,
      actorRole: actorRole,
      actionType: actionType,
      resource: resource,
      targetId: targetId,
      targetType: targetType,
      reason: reason,
      ticketUrl: ticketUrl,
      details: details,
      approvedBy: approvedBy,
      approvedAt: approvedAt,
      createdAt: createdAt,
      previousHash: _lastHash,
      hash: hash,
    );

    _auditLog.insert(0, action);
    _lastHash = hash;

    return action;
  }

  /// Get audit log entries with optional filters.
  List<AdminAction> getAuditLog({
    String? actorId,
    AdminActionType? actionType,
    String? targetId,
    DateTime? from,
    DateTime? to,
    int limit = 50,
  }) {
    var filtered = _auditLog.where((a) {
      if (actorId != null && a.actorId != actorId) return false;
      if (actionType != null && a.actionType != actionType) return false;
      if (targetId != null && a.targetId != targetId) return false;
      if (from != null && a.createdAt.isBefore(from)) return false;
      if (to != null && a.createdAt.isAfter(to)) return false;
      return true;
    });

    return filtered.take(limit).toList();
  }

  /// Verify the integrity of the audit chain.
  bool verifyChain() {
    if (_auditLog.isEmpty) return true;

    String? expectedPrevHash;
    for (var i = _auditLog.length - 1; i >= 0; i--) {
      final action = _auditLog[i];
      if (action.previousHash != expectedPrevHash) return false;
      expectedPrevHash = action.hash;
    }
    return true;
  }

  /// Export audit log as CSV.
  String exportCsv({DateTime? from, DateTime? to}) {
    final entries = getAuditLog(from: from, to: to, limit: 10000);
    final buffer = StringBuffer();
    buffer.writeln(
      'id,actorId,actorEmail,actorRole,actionType,resource,targetId,reason,ticketUrl,createdAt',
    );

    for (final action in entries) {
      buffer.writeln(
        [
          action.id,
          action.actorId,
          action.actorEmail,
          action.actorRole.name,
          action.actionType.name,
          action.resource,
          action.targetId ?? '',
          '"${action.reason.replaceAll('"', '""')}"',
          action.ticketUrl ?? '',
          action.createdAt.toIso8601String(),
        ].join(','),
      );
    }

    return buffer.toString();
  }
}

/// Service for managing idempotent mutations.
class IdempotencyService {
  final Map<String, IdempotencyRecord> _records = {};
  static const _dedupeWindow = Duration(hours: 24);

  /// Execute an action idempotently.
  /// Returns the existing result if the key was already used.
  Future<IdempotencyResult> executeIdempotent({
    required String key,
    required String actionType,
    required Future<String> Function() action,
  }) async {
    // Check for existing record
    final existing = _records[key];
    if (existing != null && DateTime.now().isBefore(existing.expiresAt)) {
      return IdempotencyResult(
        isNew: false,
        result: existing.result,
        mutationId: existing.mutationId,
      );
    }

    // Execute action
    final result = await action();
    final mutationId = 'mut_${DateTime.now().millisecondsSinceEpoch}';

    // Store record
    _records[key] = IdempotencyRecord(
      key: key,
      actionType: actionType,
      result: result,
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(_dedupeWindow),
      mutationId: mutationId,
    );

    return IdempotencyResult(
      isNew: true,
      result: result,
      mutationId: mutationId,
    );
  }

  /// Check if a key exists and is valid.
  bool hasValidKey(String key) {
    final record = _records[key];
    return record != null && DateTime.now().isBefore(record.expiresAt);
  }

  /// Get an existing record by key.
  IdempotencyRecord? getRecord(String key) {
    final record = _records[key];
    if (record != null && DateTime.now().isBefore(record.expiresAt)) {
      return record;
    }
    return null;
  }

  /// Clean up expired records.
  void cleanupExpired() {
    final now = DateTime.now();
    _records.removeWhere((_, record) => now.isAfter(record.expiresAt));
  }
}

/// Result of an idempotent operation.
class IdempotencyResult {
  final bool isNew;
  final String result;
  final String? mutationId;

  IdempotencyResult({
    required this.isNew,
    required this.result,
    this.mutationId,
  });
}

/// Provider for the audit service.
final adminAuditServiceProvider = Provider<AdminAuditService>((ref) {
  return AdminAuditService();
});

/// Provider for the idempotency service.
final idempotencyServiceProvider = Provider<IdempotencyService>((ref) {
  return IdempotencyService();
});
