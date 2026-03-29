import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/collab/domain/collab_models.dart';

void main() {
  group('ItineraryMember', () {
    test('JSON round-trip', () {
      final member = ItineraryMember(
        userId: 'user1',
        email: 'alice@example.com',
        role: MemberRole.editor,
        joinedAt: DateTime(2024, 1, 15),
        lastSeenAt: DateTime(2024, 1, 20),
        displayName: 'Alice',
      );

      final json = member.toJson();
      final restored = ItineraryMember.fromJson(json);

      expect(restored.userId, member.userId);
      expect(restored.email, member.email);
      expect(restored.role, member.role);
      expect(restored.displayName, 'Alice');
    });

    test('defaults work correctly', () {
      final member = ItineraryMember(
        userId: 'user1',
        email: 'test@test.com',
        role: MemberRole.viewer,
        joinedAt: DateTime.now(),
      );

      expect(member.lastSeenAt, isNull);
      expect(member.displayName, isNull);
      expect(member.avatarUrl, isNull);
    });
  });

  group('InviteRequest', () {
    test('JSON round-trip', () {
      const request = InviteRequest(
        itineraryId: 'itin1',
        emails: ['bob@example.com', 'carol@example.com'],
        role: MemberRole.editor,
        message: 'Join my trip!',
      );

      final json = request.toJson();
      final restored = InviteRequest.fromJson(json);

      expect(restored.itineraryId, 'itin1');
      expect(restored.emails.length, 2);
      expect(restored.role, MemberRole.editor);
      expect(restored.message, 'Join my trip!');
    });

    test('without optional message', () {
      const request = InviteRequest(
        itineraryId: 'itin1',
        emails: ['test@test.com'],
        role: MemberRole.viewer,
      );

      expect(request.message, isNull);
    });
  });

  group('InviteAccept', () {
    test('JSON round-trip', () {
      const accept = InviteAccept(inviteToken: 'abc123xyz');

      final json = accept.toJson();
      final restored = InviteAccept.fromJson(json);

      expect(restored.inviteToken, 'abc123xyz');
    });
  });

  group('AclCheck', () {
    test('JSON round-trip', () {
      const check = AclCheck(
        itineraryId: 'itin1',
        userId: 'user1',
        action: AclAction.write,
      );

      final json = check.toJson();
      final restored = AclCheck.fromJson(json);

      expect(restored.itineraryId, 'itin1');
      expect(restored.userId, 'user1');
      expect(restored.action, AclAction.write);
    });

    test('all actions serialize correctly', () {
      for (final action in AclAction.values) {
        final check = AclCheck(
          itineraryId: 'itin1',
          userId: 'user1',
          action: action,
        );

        final json = check.toJson();
        final restored = AclCheck.fromJson(json);
        expect(restored.action, action);
      }
    });
  });

  group('ActivityEvent', () {
    test('JSON round-trip', () {
      final event = ActivityEvent(
        id: 'evt1',
        itineraryId: 'itin1',
        type: ActivityType.memberJoined,
        actorId: 'user1',
        targetId: 'user2',
        details: {'role': 'editor'},
        createdAt: DateTime(2024, 1, 15, 10, 30),
      );

      final json = event.toJson();
      final restored = ActivityEvent.fromJson(json);

      expect(restored.id, 'evt1');
      expect(restored.type, ActivityType.memberJoined);
      expect(restored.actorId, 'user1');
      expect(restored.targetId, 'user2');
      expect(restored.details?['role'], 'editor');
    });

    test('all activity types serialize correctly', () {
      for (final type in ActivityType.values) {
        final event = ActivityEvent(
          id: 'evt1',
          itineraryId: 'itin1',
          type: type,
          actorId: 'user1',
          createdAt: DateTime.now(),
        );

        final json = event.toJson();
        final restored = ActivityEvent.fromJson(json);
        expect(restored.type, type);
      }
    });
  });

  group('PermissionChecker', () {
    test('owner can do everything', () {
      expect(PermissionChecker.can(MemberRole.owner, AclAction.read), true);
      expect(PermissionChecker.can(MemberRole.owner, AclAction.write), true);
      expect(PermissionChecker.can(MemberRole.owner, AclAction.manage), true);
      expect(
        PermissionChecker.can(MemberRole.owner, AclAction.uploadPhoto),
        true,
      );
      expect(PermissionChecker.canInvite(MemberRole.owner), true);
      expect(PermissionChecker.canChangeRole(MemberRole.owner), true);
      expect(PermissionChecker.canRevoke(MemberRole.owner), true);
    });

    test('editor can read, write, upload but not manage', () {
      expect(PermissionChecker.can(MemberRole.editor, AclAction.read), true);
      expect(PermissionChecker.can(MemberRole.editor, AclAction.write), true);
      expect(PermissionChecker.can(MemberRole.editor, AclAction.manage), false);
      expect(
        PermissionChecker.can(MemberRole.editor, AclAction.uploadPhoto),
        true,
      );
      expect(PermissionChecker.canInvite(MemberRole.editor), false);
      expect(PermissionChecker.canChangeRole(MemberRole.editor), false);
      expect(PermissionChecker.canRevoke(MemberRole.editor), false);
    });

    test('viewer can only read', () {
      expect(PermissionChecker.can(MemberRole.viewer, AclAction.read), true);
      expect(PermissionChecker.can(MemberRole.viewer, AclAction.write), false);
      expect(PermissionChecker.can(MemberRole.viewer, AclAction.manage), false);
      expect(
        PermissionChecker.can(MemberRole.viewer, AclAction.uploadPhoto),
        false,
      );
      expect(PermissionChecker.canInvite(MemberRole.viewer), false);
      expect(PermissionChecker.canChangeRole(MemberRole.viewer), false);
      expect(PermissionChecker.canRevoke(MemberRole.viewer), false);
    });

    test('allowedActions returns correct list per role', () {
      final ownerActions = PermissionChecker.allowedActions(MemberRole.owner);
      expect(ownerActions, AclAction.values);

      final editorActions = PermissionChecker.allowedActions(MemberRole.editor);
      expect(editorActions, contains(AclAction.read));
      expect(editorActions, contains(AclAction.write));
      expect(editorActions, contains(AclAction.uploadPhoto));
      expect(editorActions, isNot(contains(AclAction.manage)));

      final viewerActions = PermissionChecker.allowedActions(MemberRole.viewer);
      expect(viewerActions, [AclAction.read]);
    });
  });
}
