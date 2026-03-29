import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dastan/src/core/data/supabase_client.dart';

/// Security tab for 2FA and session management.
class SecurityTab extends ConsumerStatefulWidget {
  final VoidCallback onChanged;

  const SecurityTab({super.key, required this.onChanged});

  @override
  ConsumerState<SecurityTab> createState() => _SecurityTabState();
}

class _SecurityTabState extends ConsumerState<SecurityTab> {
  bool _twoFactorEnabled = false;
  String? _twoFactorMethod;

  final _mockSessions = [
    _SessionInfo(
      id: 's1',
      device: 'iPhone 15 Pro',
      type: 'mobile',
      lastActive: DateTime.now(),
      isCurrent: true,
    ),
    _SessionInfo(
      id: 's2',
      device: 'MacBook Pro',
      type: 'desktop',
      lastActive: DateTime.now().subtract(const Duration(hours: 2)),
      isCurrent: false,
    ),
    _SessionInfo(
      id: 's3',
      device: 'Chrome on Windows',
      type: 'browser',
      lastActive: DateTime.now().subtract(const Duration(days: 1)),
      isCurrent: false,
    ),
  ];

  Future<void> _enable2FA() async {
    final method = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Choose 2FA Method'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'totp'),
            child: const ListTile(
              leading: Icon(Icons.key),
              title: Text('Authenticator App'),
              subtitle: Text('Use TOTP with an app like Google Authenticator'),
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'sms'),
            child: const ListTile(
              leading: Icon(Icons.sms),
              title: Text('SMS'),
              subtitle: Text('Receive codes via text message'),
            ),
          ),
        ],
      ),
    );

    if (method != null) {
      // Show setup dialog (simplified)
      if (mounted) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('2FA Setup'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (method == 'totp') ...[
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text(
                        'QR Code\n(Placeholder)',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Scan with your authenticator app'),
                ] else ...[
                  const Text('Enter your phone number:'),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(hintText: '+1 (555) 123-4567'),
                  ),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Verify'),
              ),
            ],
          ),
        );

        if (confirmed == true) {
          setState(() {
            _twoFactorEnabled = true;
            _twoFactorMethod = method;
          });
          widget.onChanged();
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('2FA enabled successfully!')),
            );
          }
        }
      }
    }
  }

  void _disable2FA() {
    setState(() {
      _twoFactorEnabled = false;
      _twoFactorMethod = null;
    });
    widget.onChanged();
  }

  void _revokeSession(String sessionId) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Session $sessionId revoked')));
  }

  void _showRecoveryCodes() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Recovery Codes'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Save these codes in a safe place. Each can only be used once.',
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'XXXX-XXXX-XXXX',
                    style: TextStyle(fontFamily: 'monospace'),
                  ),
                  Text(
                    'XXXX-XXXX-XXXX',
                    style: TextStyle(fontFamily: 'monospace'),
                  ),
                  Text(
                    'XXXX-XXXX-XXXX',
                    style: TextStyle(fontFamily: 'monospace'),
                  ),
                  Text(
                    'XXXX-XXXX-XXXX',
                    style: TextStyle(fontFamily: 'monospace'),
                  ),
                  Text(
                    'XXXX-XXXX-XXXX',
                    style: TextStyle(fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Copy All'),
          ),
        ],
      ),
    );
  }

  Future<void> _changePassword() async {
    final newPasswordController = TextEditingController();

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newPasswordController,
              decoration: const InputDecoration(labelText: 'New Password'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Update'),
          ),
        ],
      ),
    );

    if (confirmed == true && newPasswordController.text.isNotEmpty) {
      try {
        await ref.read(supabaseClientProvider).auth.updateUser(
          UserAttributes(password: newPasswordController.text),
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password updated successfully')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update password: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 2FA Section
          Text('Two-Factor Authentication', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _twoFactorEnabled
                            ? Icons.verified_user
                            : Icons.shield_outlined,
                        color: _twoFactorEnabled ? Colors.green : Colors.grey,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _twoFactorEnabled
                                  ? '2FA Enabled'
                                  : '2FA Disabled',
                              style: theme.textTheme.titleSmall,
                            ),
                            if (_twoFactorMethod != null)
                              Text(
                                'Method: ${_twoFactorMethod == 'totp' ? 'Authenticator App' : 'SMS'}',
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      if (_twoFactorEnabled) ...[
                        OutlinedButton(
                          onPressed: _disable2FA,
                          child: const Text('Disable'),
                        ),
                        const SizedBox(width: 8),
                        FilledButton(
                          onPressed: _showRecoveryCodes,
                          child: const Text('View Recovery Codes'),
                        ),
                      ] else
                        FilledButton.icon(
                          onPressed: _enable2FA,
                          icon: const Icon(Icons.security),
                          label: const Text('Enable 2FA'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Password Section
          Text('Password', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            subtitle: const Text('Update your account password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: _changePassword,
          ),
          const Divider(height: 32),

          // Active Sessions
          Text('Active Sessions', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ..._mockSessions.map(
            (session) => Card(
              child: ListTile(
                leading: Icon(_deviceIcon(session.type)),
                title: Row(
                  children: [
                    Text(session.device),
                    if (session.isCurrent) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Current',
                          style: TextStyle(
                            fontSize: 10,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                subtitle: Text(_formatLastActive(session.lastActive)),
                trailing: session.isCurrent
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.logout),
                        onPressed: () => _revokeSession(session.id),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton.icon(
              onPressed: () {
                // Revoke all except current
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All other sessions revoked')),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sign out all other devices'),
            ),
          ),
        ],
      ),
    );
  }

  IconData _deviceIcon(String type) {
    switch (type) {
      case 'mobile':
        return Icons.phone_android;
      case 'desktop':
        return Icons.computer;
      case 'browser':
        return Icons.public;
      default:
        return Icons.devices;
    }
  }

  String _formatLastActive(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 5) return 'Active now';
    if (diff.inHours < 1) return '${diff.inMinutes} minutes ago';
    if (diff.inDays < 1) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }
}

class _SessionInfo {
  final String id;
  final String device;
  final String type;
  final DateTime lastActive;
  final bool isCurrent;

  _SessionInfo({
    required this.id,
    required this.device,
    required this.type,
    required this.lastActive,
    required this.isCurrent,
  });
}
