import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/collab/domain/collab_models.dart';
import 'package:dastan/src/features/collab/application/collab_store.dart';
import 'package:dastan/src/features/collab/presentation/invite_dialog.dart';

/// Screen for managing collaborators on an itinerary.
class ManageAccessScreen extends ConsumerStatefulWidget {
  final String itineraryId;

  const ManageAccessScreen({super.key, required this.itineraryId});

  @override
  ConsumerState<ManageAccessScreen> createState() => _ManageAccessScreenState();
}

class _ManageAccessScreenState extends ConsumerState<ManageAccessScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize collab store - would get actual user ID from auth
    Future.microtask(() {
      ref
          .read(collabStoreNotifierProvider.notifier)
          .initialize(widget.itineraryId, 'current_user');
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(collabStoreNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Access'),
        actions: [
          if (state.canInvite)
            TextButton.icon(
              onPressed: () => _showInviteDialog(),
              icon: const Icon(Icons.person_add),
              label: const Text('Invite'),
            ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await ref
                    .read(collabStoreNotifierProvider.notifier)
                    .initialize(widget.itineraryId, 'current_user');
              },
              child: CustomScrollView(
                slivers: [
                  // Members section
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Members',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _MemberTile(
                        member: state.members[index],
                        canManage: state.canManageMembers,
                        onRoleChanged: (role) =>
                            _changeRole(state.members[index].userId, role),
                        onRevoke: () => _revokeMember(state.members[index]),
                      ),
                      childCount: state.members.length,
                    ),
                  ),

                  // Pending invites section
                  if (state.pendingInvites.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Pending Invites',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _InviteTile(
                          invite: state.pendingInvites[index],
                          onResend: () =>
                              _resendInvite(state.pendingInvites[index].id),
                        ),
                        childCount: state.pendingInvites.length,
                      ),
                    ),
                  ],

                  // Empty state
                  if (state.members.isEmpty && state.pendingInvites.isEmpty)
                    const SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.group_off, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No collaborators yet'),
                            Text('Invite others to collaborate on this trip'),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  void _showInviteDialog() {
    InviteDialog.show(context, widget.itineraryId);
  }

  Future<void> _changeRole(String userId, MemberRole newRole) async {
    await ref
        .read(collabStoreNotifierProvider.notifier)
        .changeMemberRole(userId, newRole);
  }

  Future<void> _revokeMember(ItineraryMember member) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Revoke Access?'),
        content: Text(
          '${member.displayName ?? member.email} will no longer have access to this itinerary.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Revoke'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref
          .read(collabStoreNotifierProvider.notifier)
          .revokeMember(member.userId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${member.displayName ?? member.email} removed'),
          ),
        );
      }
    }
  }

  Future<void> _resendInvite(String inviteId) async {
    await ref.read(collabStoreNotifierProvider.notifier).resendInvite(inviteId);
    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invite resent')));
    }
  }
}

class _MemberTile extends StatelessWidget {
  final ItineraryMember member;
  final bool canManage;
  final ValueChanged<MemberRole> onRoleChanged;
  final VoidCallback onRevoke;

  const _MemberTile({
    required this.member,
    required this.canManage,
    required this.onRoleChanged,
    required this.onRevoke,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: member.avatarUrl != null
            ? NetworkImage(member.avatarUrl!)
            : null,
        child: member.avatarUrl == null
            ? Text((member.displayName ?? member.email)[0].toUpperCase())
            : null,
      ),
      title: Row(
        children: [
          Text(member.displayName ?? member.email),
          if (member.role == MemberRole.owner) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Owner',
                style: TextStyle(
                  fontSize: 10,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (member.displayName != null) Text(member.email),
          if (member.lastSeenAt != null)
            Text(
              'Last seen ${_formatLastSeen(member.lastSeenAt!)}',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
        ],
      ),
      trailing: canManage && member.role != MemberRole.owner
          ? PopupMenuButton<String>(
              onSelected: (action) {
                switch (action) {
                  case 'viewer':
                    onRoleChanged(MemberRole.viewer);
                  case 'editor':
                    onRoleChanged(MemberRole.editor);
                  case 'revoke':
                    onRevoke();
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'viewer',
                  enabled: member.role != MemberRole.viewer,
                  child: ListTile(
                    leading: const Icon(Icons.visibility),
                    title: const Text('Viewer'),
                    trailing: member.role == MemberRole.viewer
                        ? const Icon(Icons.check)
                        : null,
                    dense: true,
                  ),
                ),
                PopupMenuItem(
                  value: 'editor',
                  enabled: member.role != MemberRole.editor,
                  child: ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Editor'),
                    trailing: member.role == MemberRole.editor
                        ? const Icon(Icons.check)
                        : null,
                    dense: true,
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem(
                  value: 'revoke',
                  child: ListTile(
                    leading: Icon(Icons.remove_circle, color: Colors.red),
                    title: Text('Remove', style: TextStyle(color: Colors.red)),
                    dense: true,
                  ),
                ),
              ],
            )
          : _RoleBadge(role: member.role),
    );
  }

  String _formatLastSeen(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 5) return 'just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

class _InviteTile extends StatelessWidget {
  final Invite invite;
  final VoidCallback onResend;

  const _InviteTile({required this.invite, required this.onResend});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: const Icon(Icons.mail_outline),
      ),
      title: Text(invite.email),
      subtitle: Text(
        'Invited as ${invite.role.name} • ${_formatDate(invite.createdAt)}',
      ),
      trailing: TextButton.icon(
        onPressed: onResend,
        icon: const Icon(Icons.send, size: 16),
        label: const Text('Resend'),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inDays < 1) return 'today';
    if (diff.inDays == 1) return 'yesterday';
    return '${diff.inDays}d ago';
  }
}

class _RoleBadge extends StatelessWidget {
  final MemberRole role;

  const _RoleBadge({required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _roleColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        role.name[0].toUpperCase() + role.name.substring(1),
        style: TextStyle(fontSize: 12, color: _roleColor),
      ),
    );
  }

  Color get _roleColor {
    switch (role) {
      case MemberRole.owner:
        return Colors.purple;
      case MemberRole.editor:
        return Colors.blue;
      case MemberRole.viewer:
        return Colors.grey;
    }
  }
}
