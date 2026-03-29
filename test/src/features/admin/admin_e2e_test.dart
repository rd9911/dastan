import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/admin/domain/admin_models.dart';
import 'package:dastan/src/features/admin/application/admin_policy_engine.dart';
import 'package:dastan/src/features/admin/application/admin_audit_service.dart';
import 'package:dastan/src/features/admin/data/admin_repository.dart';

/// E2E Acceptance Tests for Story 15: Admin Console
/// Tests AC1-AC8 as defined in the story specification.
void main() {
  group('Admin Console E2E: Acceptance Criteria', () {
    group('AC1: Role-gated access', () {
      test('support can search and use support tools', () {
        expect(
          AdminPolicyEngine.can(
            AdminRole.support,
            AdminActionType.viewUser,
          ).allowed,
          true,
        );
        expect(
          AdminPolicyEngine.can(
            AdminRole.support,
            AdminActionType.updateUser,
          ).allowed,
          true,
        );
      });

      test('support cannot refund', () {
        final decision = AdminPolicyEngine.can(
          AdminRole.support,
          AdminActionType.refund,
        );
        expect(decision.allowed, false);
        expect(decision.reason, contains('billing_admin'));
      });

      test('support cannot approve takedown', () {
        final decision = AdminPolicyEngine.can(
          AdminRole.support,
          AdminActionType.approveTakedown,
        );
        expect(decision.allowed, false);
      });
    });

    group('AC2: Billing audit', () {
      test(
        'partial refund emits audit with actor, amount, reason, ticket URL',
        () {
          final auditService = AdminAuditService();

          final action = auditService.appendAction(
            actorId: 'admin_1',
            actorEmail: 'admin@example.com',
            actorRole: AdminRole.billingAdmin,
            actionType: AdminActionType.partialRefund,
            resource: 'invoice:INV-123',
            targetId: 'INV-123',
            targetType: 'invoice',
            reason: 'Customer requested partial refund',
            ticketUrl: 'https://zendesk.com/tickets/789',
            details: {'amount': 50.0, 'originalAmount': 99.99},
          );

          expect(action.actorId, 'admin_1');
          expect(action.actorRole, AdminRole.billingAdmin);
          expect(action.actionType, AdminActionType.partialRefund);
          expect(action.reason, contains('partial refund'));
          expect(action.ticketUrl, contains('zendesk'));
          expect(action.details?['amount'], 50.0);
        },
      );
    });

    group('AC3: Override with expiry', () {
      test('grant with expiry is active before expiry', () {
        final grant = OverrideGrant(
          id: 'grant_1',
          userId: 'user_1',
          key: 'snapshots',
          value: 3,
          reason: '+3 snapshots until Monday',
          grantedBy: 'admin_1',
          createdAt: DateTime.now(),
          expiresAt: DateTime.now().add(const Duration(days: 3)),
        );

        expect(grant.isActive, true);
      });

      test('grant auto-reverts after expiry', () {
        final grant = OverrideGrant(
          id: 'grant_1',
          userId: 'user_1',
          key: 'snapshots',
          value: 3,
          reason: '+3 snapshots expired',
          grantedBy: 'admin_1',
          createdAt: DateTime.now().subtract(const Duration(days: 10)),
          expiresAt: DateTime.now().subtract(const Duration(days: 3)),
        );

        expect(grant.isActive, false);
      });
    });

    group('AC4: Owner transfer', () {
      test('transfer ownership records itinerary activity', () {
        final auditService = AdminAuditService();

        final action = auditService.appendAction(
          actorId: 'admin_1',
          actorEmail: 'admin@example.com',
          actorRole: AdminRole.support,
          actionType: AdminActionType.transferOwnership,
          resource: 'itinerary:itin_123',
          targetId: 'itin_123',
          targetType: 'itinerary',
          reason: 'User requested transfer to spouse',
          details: {'fromUser': 'user_A', 'toUser': 'user_B'},
        );

        expect(action.actionType, AdminActionType.transferOwnership);
        expect(action.details?['fromUser'], 'user_A');
        expect(action.details?['toUser'], 'user_B');
      });
    });

    group('AC5: Two-person takedown', () {
      test('takedown request requires approval', () {
        final request = TakedownRequest(
          id: 'td_1',
          targetType: 'snapshot',
          targetId: 'snap_123',
          reason: 'Copyright violation',
          requestedBy: 'admin_1',
          requestedAt: DateTime.now(),
        );

        expect(request.isPending, true);
        expect(request.isApproved, false);
      });

      test('takedown is executed after approval', () {
        final request = TakedownRequest(
          id: 'td_1',
          targetType: 'snapshot',
          targetId: 'snap_123',
          reason: 'Copyright violation',
          requestedBy: 'admin_1',
          requestedAt: DateTime.now().subtract(const Duration(hours: 1)),
          approvedBy: 'admin_2',
          approvedAt: DateTime.now(),
        );

        expect(request.isPending, false);
        expect(request.isApproved, true);
      });

      test('both request and approval are audited', () {
        final auditService = AdminAuditService();

        // Request
        auditService.appendAction(
          actorId: 'admin_1',
          actorEmail: 'admin1@example.com',
          actorRole: AdminRole.trustSafety,
          actionType: AdminActionType.requestTakedown,
          resource: 'snapshot:snap_123',
          targetId: 'snap_123',
          targetType: 'snapshot',
          reason: 'Copyright violation',
        );

        // Approval
        auditService.appendAction(
          actorId: 'admin_2',
          actorEmail: 'admin2@example.com',
          actorRole: AdminRole.trustSafety,
          actionType: AdminActionType.approveTakedown,
          resource: 'takedown:td_1',
          targetId: 'td_1',
          targetType: 'takedown',
          reason: 'Verified copyright claim',
          approvedBy: 'admin_2',
          approvedAt: DateTime.now(),
        );

        final log = auditService.getAuditLog();
        expect(log.length, 2);
        expect(
          log.any((a) => a.actionType == AdminActionType.requestTakedown),
          true,
        );
        expect(
          log.any((a) => a.actionType == AdminActionType.approveTakedown),
          true,
        );
      });
    });

    group('AC6: PII minimization', () {
      test('read_only sees metadata only', () {
        final decision = AdminPolicyEngine.can(
          AdminRole.readOnly,
          AdminActionType.viewUser,
          resource: 'metadata:count',
        );
        expect(decision.allowed, true);
      });

      test('read_only cannot reveal PII', () {
        final decision = AdminPolicyEngine.can(
          AdminRole.readOnly,
          AdminActionType.revealPii,
        );
        expect(decision.allowed, false);
      });

      test('elevation requires reason', () {
        final decision = AdminPolicyEngine.can(
          AdminRole.support,
          AdminActionType.revealPii,
        );
        expect(decision.allowed, true);
        expect(decision.requiresJustification, true);
      });
    });

    group('AC7: Idempotent mutations', () {
      test('retry with same key returns same mutation id', () async {
        final idempotencyService = IdempotencyService();

        final result1 = await idempotencyService.executeIdempotent(
          key: 'plan-change-user1-pro',
          actionType: 'changePlan',
          action: () async => 'success',
        );

        final result2 = await idempotencyService.executeIdempotent(
          key: 'plan-change-user1-pro',
          actionType: 'changePlan',
          action: () async => 'should-not-execute',
        );

        expect(result1.isNew, true);
        expect(result2.isNew, false);
        expect(result2.mutationId, result1.mutationId);
        expect(result2.result, result1.result);
      });
    });

    group('AC8: Session security', () {
      test('expired session is invalid', () {
        final session = AdminSession(
          sessionId: 'sess_123',
          userId: 'admin_1',
          email: 'admin@example.com',
          role: AdminRole.support,
          issuedAt: DateTime.now().subtract(const Duration(hours: 10)),
          expiresAt: DateTime.now().subtract(const Duration(hours: 1)),
        );

        expect(session.isExpired, true);
        expect(session.isValid, false);
      });

      test('session with requiresReauth is invalid', () {
        final session = AdminSession(
          sessionId: 'sess_123',
          userId: 'admin_1',
          email: 'admin@example.com',
          role: AdminRole.support,
          issuedAt: DateTime.now(),
          expiresAt: DateTime.now().add(const Duration(hours: 8)),
          requiresReauth: true,
        );

        expect(session.isExpired, false);
        expect(session.isValid, false);
      });
    });

    group('Audit chain integrity', () {
      test('audit chain is cryptographically linked', () {
        final auditService = AdminAuditService();

        auditService.appendAction(
          actorId: 'admin_1',
          actorEmail: 'admin@example.com',
          actorRole: AdminRole.superAdmin,
          actionType: AdminActionType.login,
          resource: 'admin_console',
          reason: 'Login',
        );

        auditService.appendAction(
          actorId: 'admin_1',
          actorEmail: 'admin@example.com',
          actorRole: AdminRole.superAdmin,
          actionType: AdminActionType.viewUser,
          resource: 'user:user_1',
          reason: 'Viewing user',
        );

        expect(auditService.verifyChain(), true);
      });
    });
  });

  group('AdminRepository', () {
    late MockAdminRepository repo;

    setUp(() {
      repo = MockAdminRepository();
    });

    test('search returns matching results', () async {
      final results = await repo.search('alice');
      expect(results.isNotEmpty, true);
      expect(results.any((r) => r.title.toLowerCase().contains('alice')), true);
    });

    test('getUserOverview returns user data', () async {
      final user = await repo.getUserOverview('user_1');
      expect(user, isNotNull);
      expect(user!.email, 'alice@example.com');
    });

    test('processRefund returns success', () async {
      final result = await repo.processRefund(
        invoiceId: 'INV-001',
        amount: 50.0,
        reason: 'Test refund',
        ticketUrl: 'https://test.com',
      );

      expect(result.success, true);
      expect(result.refundId, isNotNull);
    });
  });
}
