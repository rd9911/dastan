import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/admin/domain/admin_models.dart';

/// Repository for admin operations (mock implementation).
abstract class AdminRepository {
  /// Search across users, invoices, itineraries.
  Future<List<AdminSearchResult>> search(String query, {int limit = 20});

  /// Get user overview by ID.
  Future<UserOverview?> getUserOverview(
    String userId, {
    bool includePii = false,
  });

  /// Get billing invoices for a user.
  Future<List<Invoice>> getUserInvoices(String userId);

  /// Process a refund.
  Future<RefundResult> processRefund({
    required String invoiceId,
    required double amount,
    required String reason,
    required String ticketUrl,
  });

  /// Change user's plan.
  Future<PlanChangeResult> changePlan({
    required String userId,
    required String newPlanId,
    required bool immediate,
    required String reason,
  });

  /// Get override grants for a user.
  Future<List<OverrideGrant>> getUserOverrides(String userId);

  /// Create an override grant.
  Future<OverrideGrant> createOverride(OverrideGrant grant);

  /// Revoke an override grant.
  Future<void> revokeOverride(String grantId, String revokedBy);

  /// Get abuse signals queue.
  Future<List<AbuseSignal>> getAbuseQueue({AbuseSeverity? minSeverity});

  /// Create a takedown request.
  Future<TakedownRequest> createTakedownRequest(TakedownRequest request);

  /// Approve a takedown.
  Future<TakedownRequest> approveTakedown(String requestId, String approvedBy);
}

/// Mock implementation for development/testing.
class MockAdminRepository implements AdminRepository {
  final List<UserOverview> _users = [
    UserOverview(
      id: 'user_1',
      email: 'alice@example.com',
      name: 'Alice Smith',
      plan: 'pro',
      createdAt: DateTime(2023, 6, 15),
      itineraryCount: 12,
      savedItemCount: 145,
      lastActiveAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    UserOverview(
      id: 'user_2',
      email: 'bob@example.com',
      name: 'Bob Johnson',
      plan: 'free',
      createdAt: DateTime(2024, 1, 10),
      itineraryCount: 3,
      savedItemCount: 28,
      lastActiveAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  final List<Invoice> _invoices = [
    Invoice(
      id: 'INV-001',
      userId: 'user_1',
      amount: 99.99,
      currency: 'USD',
      status: InvoiceStatus.paid,
      createdAt: DateTime(2024, 1, 1),
      paidAt: DateTime(2024, 1, 1),
    ),
    Invoice(
      id: 'INV-002',
      userId: 'user_1',
      amount: 99.99,
      currency: 'USD',
      status: InvoiceStatus.pending,
      createdAt: DateTime(2024, 2, 1),
    ),
  ];

  @override
  Future<List<AdminSearchResult>> search(String query, {int limit = 20}) async {
    final lowercaseQuery = query.toLowerCase();
    final results = <AdminSearchResult>[];

    for (final user in _users) {
      if (user.email.toLowerCase().contains(lowercaseQuery) ||
          user.name.toLowerCase().contains(lowercaseQuery) ||
          user.id.contains(lowercaseQuery)) {
        results.add(
          AdminSearchResult(
            type: 'user',
            id: user.id,
            title: user.name,
            subtitle: user.email,
            metadata: {'plan': user.plan},
          ),
        );
      }
    }

    for (final invoice in _invoices) {
      if (invoice.id.toLowerCase().contains(lowercaseQuery)) {
        results.add(
          AdminSearchResult(
            type: 'invoice',
            id: invoice.id,
            title: invoice.id,
            subtitle: '\$${invoice.amount} - ${invoice.status.name}',
            metadata: {'userId': invoice.userId},
          ),
        );
      }
    }

    return results.take(limit).toList();
  }

  @override
  Future<UserOverview?> getUserOverview(
    String userId, {
    bool includePii = false,
  }) async {
    return _users.firstWhere(
      (u) => u.id == userId,
      orElse: () => throw Exception('User not found'),
    );
  }

  @override
  Future<List<Invoice>> getUserInvoices(String userId) async {
    return _invoices.where((i) => i.userId == userId).toList();
  }

  @override
  Future<RefundResult> processRefund({
    required String invoiceId,
    required double amount,
    required String reason,
    required String ticketUrl,
  }) async {
    return RefundResult(
      success: true,
      refundId: 'ref_${DateTime.now().millisecondsSinceEpoch}',
      amount: amount,
      invoiceId: invoiceId,
    );
  }

  @override
  Future<PlanChangeResult> changePlan({
    required String userId,
    required String newPlanId,
    required bool immediate,
    required String reason,
  }) async {
    return PlanChangeResult(
      success: true,
      userId: userId,
      oldPlan: 'free',
      newPlan: newPlanId,
      effectiveAt: immediate
          ? DateTime.now()
          : DateTime.now().add(const Duration(days: 30)),
    );
  }

  @override
  Future<List<OverrideGrant>> getUserOverrides(String userId) async {
    return []; // Empty for mock
  }

  @override
  Future<OverrideGrant> createOverride(OverrideGrant grant) async {
    return grant;
  }

  @override
  Future<void> revokeOverride(String grantId, String revokedBy) async {}

  @override
  Future<List<AbuseSignal>> getAbuseQueue({AbuseSeverity? minSeverity}) async {
    return [
      AbuseSignal(
        id: 'abuse_1',
        userId: 'user_suspicious',
        type: AbuseType.scraping,
        severity: AbuseSeverity.high,
        description: 'Unusual API request patterns detected',
        detectedAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ];
  }

  @override
  Future<TakedownRequest> createTakedownRequest(TakedownRequest request) async {
    return request;
  }

  @override
  Future<TakedownRequest> approveTakedown(
    String requestId,
    String approvedBy,
  ) async {
    return TakedownRequest(
      id: requestId,
      targetType: 'snapshot',
      targetId: 'snap_123',
      reason: 'Copyright violation',
      requestedBy: 'admin_1',
      requestedAt: DateTime.now().subtract(const Duration(hours: 1)),
      approvedBy: approvedBy,
      approvedAt: DateTime.now(),
    );
  }
}

/// Search result for admin universal search.
class AdminSearchResult {
  final String type;
  final String id;
  final String title;
  final String subtitle;
  final Map<String, dynamic>? metadata;

  AdminSearchResult({
    required this.type,
    required this.id,
    required this.title,
    required this.subtitle,
    this.metadata,
  });
}

/// User overview for admin view.
class UserOverview {
  final String id;
  final String email;
  final String name;
  final String plan;
  final DateTime createdAt;
  final int itineraryCount;
  final int savedItemCount;
  final DateTime? lastActiveAt;
  final bool isSuspended;
  final String? suspendedReason;

  UserOverview({
    required this.id,
    required this.email,
    required this.name,
    required this.plan,
    required this.createdAt,
    required this.itineraryCount,
    required this.savedItemCount,
    this.lastActiveAt,
    this.isSuspended = false,
    this.suspendedReason,
  });
}

/// Invoice model.
class Invoice {
  final String id;
  final String userId;
  final double amount;
  final String currency;
  final InvoiceStatus status;
  final DateTime createdAt;
  final DateTime? paidAt;
  final DateTime? refundedAt;

  Invoice({
    required this.id,
    required this.userId,
    required this.amount,
    required this.currency,
    required this.status,
    required this.createdAt,
    this.paidAt,
    this.refundedAt,
  });
}

enum InvoiceStatus { pending, paid, refunded, voided, failed }

/// Refund result.
class RefundResult {
  final bool success;
  final String? refundId;
  final double amount;
  final String invoiceId;
  final String? error;

  RefundResult({
    required this.success,
    this.refundId,
    required this.amount,
    required this.invoiceId,
    this.error,
  });
}

/// Plan change result.
class PlanChangeResult {
  final bool success;
  final String userId;
  final String oldPlan;
  final String newPlan;
  final DateTime effectiveAt;
  final String? error;

  PlanChangeResult({
    required this.success,
    required this.userId,
    required this.oldPlan,
    required this.newPlan,
    required this.effectiveAt,
    this.error,
  });
}

/// Provider for the admin repository.
final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return MockAdminRepository();
});
