import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/admin/domain/admin_models.dart';
import 'package:dastan/src/features/admin/application/admin_policy_engine.dart';

void main() {
  group('AdminSession', () {
    test('JSON round-trip', () {
      final session = AdminSession(
        sessionId: 'sess_123',
        userId: 'admin_1',
        email: 'admin@example.com',
        role: AdminRole.billingAdmin,
        issuedAt: DateTime(2024, 1, 15, 10, 0),
        expiresAt: DateTime(2024, 1, 15, 18, 0),
        ipAddress: '192.168.1.1',
      );

      final json = session.toJson();
      final restored = AdminSession.fromJson(json);

      expect(restored.sessionId, 'sess_123');
      expect(restored.role, AdminRole.billingAdmin);
      expect(restored.email, 'admin@example.com');
    });

    test('isExpired returns true for past expiration', () {
      final expiredSession = AdminSession(
        sessionId: 'sess_123',
        userId: 'admin_1',
        email: 'admin@example.com',
        role: AdminRole.support,
        issuedAt: DateTime.now().subtract(const Duration(hours: 10)),
        expiresAt: DateTime.now().subtract(const Duration(hours: 1)),
      );

      expect(expiredSession.isExpired, true);
      expect(expiredSession.isValid, false);
    });

    test('isValid returns false when requiresReauth is true', () {
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

    test('timeRemaining calculates correctly', () {
      final session = AdminSession(
        sessionId: 'sess_123',
        userId: 'admin_1',
        email: 'admin@example.com',
        role: AdminRole.support,
        issuedAt: DateTime.now(),
        expiresAt: DateTime.now().add(const Duration(hours: 2)),
      );

      expect(session.timeRemaining.inMinutes, greaterThan(110));
      expect(session.timeRemaining.inMinutes, lessThanOrEqualTo(120));
    });
  });

  group('AdminRole', () {
    test('all roles serialize correctly', () {
      for (final role in AdminRole.values) {
        final session = AdminSession(
          sessionId: 'sess',
          userId: 'user',
          email: 'test@test.com',
          role: role,
          issuedAt: DateTime.now(),
          expiresAt: DateTime.now().add(const Duration(hours: 1)),
        );

        final json = session.toJson();
        final restored = AdminSession.fromJson(json);
        expect(restored.role, role);
      }
    });
  });

  group('AdminAction', () {
    test('JSON round-trip', () {
      final action = AdminAction(
        id: 'action_123',
        actorId: 'admin_1',
        actorEmail: 'admin@example.com',
        actorRole: AdminRole.billingAdmin,
        actionType: AdminActionType.refund,
        resource: 'invoice:INV-123',
        targetId: 'INV-123',
        targetType: 'invoice',
        reason: 'Customer requested refund',
        ticketUrl: 'https://zendesk.com/tickets/456',
        details: {'amount': 99.99, 'currency': 'USD'},
        createdAt: DateTime(2024, 1, 15, 14, 30),
      );

      final json = action.toJson();
      final restored = AdminAction.fromJson(json);

      expect(restored.id, 'action_123');
      expect(restored.actionType, AdminActionType.refund);
      expect(restored.reason, 'Customer requested refund');
      expect(restored.ticketUrl, contains('zendesk'));
      expect(restored.details?['amount'], 99.99);
    });

    test('all action types serialize correctly', () {
      for (final type in AdminActionType.values) {
        final action = AdminAction(
          id: 'action',
          actorId: 'admin',
          actorEmail: 'admin@test.com',
          actorRole: AdminRole.superAdmin,
          actionType: type,
          resource: 'test',
          reason: 'testing',
          createdAt: DateTime.now(),
        );

        final json = action.toJson();
        final restored = AdminAction.fromJson(json);
        expect(restored.actionType, type);
      }
    });
  });

  group('OverrideGrant', () {
    test('isActive returns true for valid grant', () {
      final grant = OverrideGrant(
        id: 'grant_1',
        userId: 'user_1',
        key: 'snapshots_limit',
        value: 10,
        reason: 'Support request',
        grantedBy: 'admin_1',
        createdAt: DateTime.now(),
        expiresAt: DateTime.now().add(const Duration(days: 7)),
      );

      expect(grant.isActive, true);
    });

    test('isActive returns false for expired grant', () {
      final grant = OverrideGrant(
        id: 'grant_1',
        userId: 'user_1',
        key: 'snapshots_limit',
        value: 10,
        reason: 'Support request',
        grantedBy: 'admin_1',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        expiresAt: DateTime.now().subtract(const Duration(days: 3)),
      );

      expect(grant.isActive, false);
    });

    test('isActive returns false for revoked grant', () {
      final grant = OverrideGrant(
        id: 'grant_1',
        userId: 'user_1',
        key: 'snapshots_limit',
        value: 10,
        reason: 'Support request',
        grantedBy: 'admin_1',
        createdAt: DateTime.now(),
        revokedAt: DateTime.now(),
        revokedBy: 'admin_2',
      );

      expect(grant.isActive, false);
    });
  });

  group('TakedownRequest', () {
    test('isPending returns true for new request', () {
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
      expect(request.isDenied, false);
    });

    test('isApproved returns true after approval', () {
      final request = TakedownRequest(
        id: 'td_1',
        targetType: 'snapshot',
        targetId: 'snap_123',
        reason: 'Copyright violation',
        requestedBy: 'admin_1',
        requestedAt: DateTime.now(),
        approvedBy: 'admin_2',
        approvedAt: DateTime.now(),
      );

      expect(request.isPending, false);
      expect(request.isApproved, true);
    });
  });

  group('AdminPolicyEngine', () {
    test('super_admin can do everything', () {
      for (final action in AdminActionType.values) {
        final decision = AdminPolicyEngine.can(AdminRole.superAdmin, action);
        expect(
          decision.allowed,
          true,
          reason: 'super_admin should be allowed for $action',
        );
      }
    });

    test('read_only cannot perform billing actions', () {
      final billingActions = [
        AdminActionType.refund,
        AdminActionType.partialRefund,
        AdminActionType.changePlan,
      ];

      for (final action in billingActions) {
        final decision = AdminPolicyEngine.can(AdminRole.readOnly, action);
        expect(
          decision.allowed,
          false,
          reason: 'read_only should not be allowed for $action',
        );
      }
    });

    test('support cannot perform billing actions', () {
      final decision = AdminPolicyEngine.can(
        AdminRole.support,
        AdminActionType.refund,
      );
      expect(decision.allowed, false);
      expect(decision.reason, contains('billing_admin'));
    });

    test('billing_admin can perform billing actions', () {
      final decision = AdminPolicyEngine.can(
        AdminRole.billingAdmin,
        AdminActionType.refund,
      );
      expect(decision.allowed, true);
      expect(decision.requiresJustification, true);
    });

    test('trust_safety can approve takedowns', () {
      final decision = AdminPolicyEngine.can(
        AdminRole.trustSafety,
        AdminActionType.approveTakedown,
      );
      expect(decision.allowed, true);
    });

    test('support cannot approve takedowns', () {
      final decision = AdminPolicyEngine.can(
        AdminRole.support,
        AdminActionType.approveTakedown,
      );
      expect(decision.allowed, false);
    });

    test('suspend account requires approval', () {
      final decision = AdminPolicyEngine.can(
        AdminRole.trustSafety,
        AdminActionType.suspendAccount,
      );
      expect(decision.allowed, true);
      expect(decision.requiresApproval, true);
      expect(decision.requiresJustification, true);
    });

    test('revealPii requires justification for non-super roles', () {
      for (final role in AdminRole.values) {
        if (role == AdminRole.readOnly || role == AdminRole.superAdmin) {
          continue;
        }
        final decision = AdminPolicyEngine.can(role, AdminActionType.revealPii);
        expect(decision.allowed, true);
        expect(
          decision.requiresJustification,
          true,
          reason: '$role should require justification for revealPii',
        );
      }
    });

    test('roleLevel hierarchy is correct', () {
      expect(AdminPolicyEngine.roleLevel(AdminRole.readOnly), 0);
      expect(AdminPolicyEngine.roleLevel(AdminRole.support), 1);
      expect(AdminPolicyEngine.roleLevel(AdminRole.billingAdmin), 2);
      expect(AdminPolicyEngine.roleLevel(AdminRole.trustSafety), 2);
      expect(AdminPolicyEngine.roleLevel(AdminRole.superAdmin), 3);
    });

    test('allowedActions returns correct list for each role', () {
      final readOnlyActions = AdminPolicyEngine.allowedActions(
        AdminRole.readOnly,
      );
      final supportActions = AdminPolicyEngine.allowedActions(
        AdminRole.support,
      );
      final superActions = AdminPolicyEngine.allowedActions(
        AdminRole.superAdmin,
      );

      expect(readOnlyActions.length, lessThan(supportActions.length));
      expect(supportActions.length, lessThan(superActions.length));
      expect(superActions, AdminActionType.values);
    });
  });
}
