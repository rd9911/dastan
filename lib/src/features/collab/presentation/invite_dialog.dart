import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/collab/domain/collab_models.dart';
import 'package:dastan/src/features/collab/application/collab_store.dart';

/// Dialog for inviting collaborators to an itinerary.
class InviteDialog extends ConsumerStatefulWidget {
  final String itineraryId;

  const InviteDialog({super.key, required this.itineraryId});

  static Future<bool?> show(BuildContext context, String itineraryId) {
    return showDialog<bool>(
      context: context,
      builder: (context) => InviteDialog(itineraryId: itineraryId),
    );
  }

  @override
  ConsumerState<InviteDialog> createState() => _InviteDialogState();
}

class _InviteDialogState extends ConsumerState<InviteDialog> {
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final List<String> _emails = [];
  MemberRole _selectedRole = MemberRole.editor;
  String? _emailError;
  bool _isSending = false;

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _addEmail() {
    final email = _emailController.text.trim().toLowerCase();

    if (email.isEmpty) return;

    if (!_isValidEmail(email)) {
      setState(() => _emailError = 'Invalid email address');
      return;
    }

    if (_emails.contains(email)) {
      setState(() => _emailError = 'Email already added');
      return;
    }

    setState(() {
      _emails.add(email);
      _emailController.clear();
      _emailError = null;
    });
  }

  void _removeEmail(String email) {
    setState(() => _emails.remove(email));
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<void> _sendInvites() async {
    if (_emails.isEmpty) return;

    setState(() => _isSending = true);

    final success = await ref
        .read(collabStoreNotifierProvider.notifier)
        .sendInvites(
          _emails,
          _selectedRole,
          message: _messageController.text.isEmpty
              ? null
              : _messageController.text,
        );

    setState(() => _isSending = false);

    if (success && mounted) {
      Navigator.of(context).pop(true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${_emails.length} invite(s) sent!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: const Text('Invite Collaborators'),
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email input
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  hintText: 'Enter email and press Add',
                  errorText: _emailError,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addEmail,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onSubmitted: (_) => _addEmail(),
              ),
              const SizedBox(height: 12),

              // Email chips
              if (_emails.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _emails
                      .map(
                        (email) => Chip(
                          avatar: CircleAvatar(
                            backgroundColor: theme.colorScheme.primaryContainer,
                            child: Text(email[0].toUpperCase()),
                          ),
                          label: Text(email),
                          onDeleted: () => _removeEmail(email),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
              ],

              // Role selector
              Text('Role', style: theme.textTheme.labelLarge),
              const SizedBox(height: 8),
              SegmentedButton<MemberRole>(
                segments: const [
                  ButtonSegment(
                    value: MemberRole.viewer,
                    label: Text('Viewer'),
                    icon: Icon(Icons.visibility),
                  ),
                  ButtonSegment(
                    value: MemberRole.editor,
                    label: Text('Editor'),
                    icon: Icon(Icons.edit),
                  ),
                ],
                selected: {_selectedRole},
                onSelectionChanged: (roles) {
                  setState(() => _selectedRole = roles.first);
                },
              ),
              const SizedBox(height: 8),
              Text(
                _selectedRole == MemberRole.viewer
                    ? 'Viewers can see all content but cannot make changes.'
                    : 'Editors can add, edit, and remove items.',
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Optional message
              TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message (optional)',
                  hintText: 'Add a personal message to the invite',
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton.icon(
          onPressed: _emails.isEmpty || _isSending ? null : _sendInvites,
          icon: _isSending
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.send),
          label: Text(_isSending ? 'Sending...' : 'Send Invites'),
        ),
      ],
    );
  }
}
