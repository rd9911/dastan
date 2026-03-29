import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/collab/domain/collab_models.dart';
import 'package:dastan/src/features/collab/data/collab_repository.dart';
import 'package:dastan/src/features/collab/application/permission_service.dart';

void main() {
  group('MockCollabRepository', () {
    late MockCollabRepository repo;

    setUp(() {
      repo = MockCollabRepository();
    });

    group('sendInvites', () {
      test('creates invites for all emails', () async {
        const request = InviteRequest(
          itineraryId: 'itin1',
          emails: ['a@test.com', 'b@test.com'],
          role: MemberRole.editor,
          message: 'Join us!',
        );

        final invites = await repo.sendInvites(request);

        expect(invites.length, 2);
        expect(invites[0].email, 'a@test.com');
        expect(invites[0].role, MemberRole.editor);
        expect(invites[0].status, InviteStatus.pending);
        expect(invites[0].message, 'Join us!');
      });

      test('logs activity event for each invite', () async {
        const request = InviteRequest(
          itineraryId: 'itin1',
          emails: ['a@test.com'],
          role: MemberRole.editor,
        );

        await repo.sendInvites(request);
        final events = await repo.getActivityEvents('itin1');

        expect(events.length, 1);
        expect(events[0].type, ActivityType.memberInvited);
      });
    });

    group('acceptInvite', () {
      test('adds member and updates invite status', () async {
        const request = InviteRequest(
          itineraryId: 'itin1',
          emails: ['new@test.com'],
          role: MemberRole.editor,
        );

        final invites = await repo.sendInvites(request);
        final accept = InviteAccept(inviteToken: invites[0].token);

        final member = await repo.acceptInvite(accept);

        expect(member.email, 'new@test.com');
        expect(member.role, MemberRole.editor);

        final members = await repo.getMembers('itin1');
        expect(members.length, 1);

        final pending = await repo.getPendingInvites('itin1');
        expect(pending, isEmpty);
      });

      test('logs memberJoined activity', () async {
        const request = InviteRequest(
          itineraryId: 'itin1',
          emails: ['new@test.com'],
          role: MemberRole.viewer,
        );

        final invites = await repo.sendInvites(request);
        await repo.acceptInvite(InviteAccept(inviteToken: invites[0].token));

        final events = await repo.getActivityEvents('itin1');
        expect(events.any((e) => e.type == ActivityType.memberJoined), true);
      });

      test('throws on invalid token', () async {
        expect(
          () => repo.acceptInvite(const InviteAccept(inviteToken: 'invalid')),
          throwsException,
        );
      });
    });

    group('changeRole', () {
      test('updates member role', () async {
        repo.addMember(
          'itin1',
          ItineraryMember(
            userId: 'user1',
            email: 'test@test.com',
            role: MemberRole.editor,
            joinedAt: DateTime.now(),
          ),
        );

        final updated = await repo.changeRole(
          'itin1',
          'user1',
          MemberRole.viewer,
        );

        expect(updated.role, MemberRole.viewer);

        final members = await repo.getMembers('itin1');
        expect(members[0].role, MemberRole.viewer);
      });

      test('logs roleChanged activity', () async {
        repo.addMember(
          'itin1',
          ItineraryMember(
            userId: 'user1',
            email: 'test@test.com',
            role: MemberRole.editor,
            joinedAt: DateTime.now(),
          ),
        );

        await repo.changeRole('itin1', 'user1', MemberRole.viewer);

        final events = await repo.getActivityEvents('itin1');
        final roleEvent = events.firstWhere(
          (e) => e.type == ActivityType.roleChanged,
        );
        expect(roleEvent.details?['oldRole'], 'editor');
        expect(roleEvent.details?['newRole'], 'viewer');
      });
    });

    group('revokeMember', () {
      test('removes member from itinerary', () async {
        repo.addMember(
          'itin1',
          ItineraryMember(
            userId: 'user1',
            email: 'test@test.com',
            role: MemberRole.editor,
            joinedAt: DateTime.now(),
          ),
        );

        await repo.revokeMember('itin1', 'user1');

        final members = await repo.getMembers('itin1');
        expect(members, isEmpty);
      });

      test('logs memberRemoved activity', () async {
        repo.addMember(
          'itin1',
          ItineraryMember(
            userId: 'user1',
            email: 'test@test.com',
            role: MemberRole.editor,
            joinedAt: DateTime.now(),
          ),
        );

        await repo.revokeMember('itin1', 'user1');

        final events = await repo.getActivityEvents('itin1');
        expect(events.any((e) => e.type == ActivityType.memberRemoved), true);
      });
    });

    group('checkPermission', () {
      test('returns allowed for valid action', () async {
        repo.addMember(
          'itin1',
          ItineraryMember(
            userId: 'user1',
            email: 'test@test.com',
            role: MemberRole.editor,
            joinedAt: DateTime.now(),
          ),
        );

        final result = await repo.checkPermission(
          const AclCheck(
            itineraryId: 'itin1',
            userId: 'user1',
            action: AclAction.write,
          ),
        );

        expect(result.allowed, true);
      });

      test('returns denied for insufficient permissions', () async {
        repo.addMember(
          'itin1',
          ItineraryMember(
            userId: 'user1',
            email: 'test@test.com',
            role: MemberRole.viewer,
            joinedAt: DateTime.now(),
          ),
        );

        final result = await repo.checkPermission(
          const AclCheck(
            itineraryId: 'itin1',
            userId: 'user1',
            action: AclAction.write,
          ),
        );

        expect(result.allowed, false);
        expect(result.reason, contains('Insufficient permissions'));
      });
    });
  });

  group('PermissionService', () {
    late MockCollabRepository repo;
    late PermissionService service;

    setUp(() {
      repo = MockCollabRepository();
      service = PermissionService(repo, 'current_user');
    });

    test('getCurrentUserRole returns correct role', () async {
      repo.addMember(
        'itin1',
        ItineraryMember(
          userId: 'current_user',
          email: 'me@test.com',
          role: MemberRole.editor,
          joinedAt: DateTime.now(),
        ),
      );

      final role = await service.getCurrentUserRole('itin1');
      expect(role, MemberRole.editor);
    });

    test('getCurrentUserRole returns null for non-member', () async {
      final role = await service.getCurrentUserRole('itin1');
      expect(role, isNull);
    });

    test('canEdit returns true for editor', () async {
      repo.addMember(
        'itin1',
        ItineraryMember(
          userId: 'current_user',
          email: 'me@test.com',
          role: MemberRole.editor,
          joinedAt: DateTime.now(),
        ),
      );

      expect(await service.canEdit('itin1'), true);
    });

    test('canEdit returns false for viewer', () async {
      repo.addMember(
        'itin1',
        ItineraryMember(
          userId: 'current_user',
          email: 'me@test.com',
          role: MemberRole.viewer,
          joinedAt: DateTime.now(),
        ),
      );

      expect(await service.canEdit('itin1'), false);
    });

    test('canInvite returns true only for owner', () async {
      repo.addMember(
        'itin1',
        ItineraryMember(
          userId: 'current_user',
          email: 'me@test.com',
          role: MemberRole.owner,
          joinedAt: DateTime.now(),
        ),
      );

      expect(await service.canInvite('itin1'), true);

      // Change to editor
      await repo.changeRole('itin1', 'current_user', MemberRole.editor);
      service = PermissionService(repo, 'current_user');
      expect(await service.canInvite('itin1'), false);
    });

    test('getAllowedActions returns correct list', () async {
      repo.addMember(
        'itin1',
        ItineraryMember(
          userId: 'current_user',
          email: 'me@test.com',
          role: MemberRole.viewer,
          joinedAt: DateTime.now(),
        ),
      );

      final actions = await service.getAllowedActions('itin1');
      expect(actions, [AclAction.read]);
    });
  });
}
