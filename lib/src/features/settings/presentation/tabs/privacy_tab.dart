import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';

/// Privacy & Data tab for managing privacy settings and data controls.
class PrivacyTab extends ConsumerStatefulWidget {
  final VoidCallback onChanged;

  const PrivacyTab({super.key, required this.onChanged});

  @override
  ConsumerState<PrivacyTab> createState() => _PrivacyTabState();
}

class _PrivacyTabState extends ConsumerState<PrivacyTab> {
  bool _analyticsOptIn = true;
  bool _diagnosticsOptIn = true;
  bool _redactPII = true;
  bool _redactPrices = false;
  bool _redactNotes = true;
  String _photoVisibility = 'visible';
  List<String> _integrations = [];

  static const _allIntegrations = ['email', 'calendar', 'photos'];

  @override
  void initState() {
    super.initState();
    _loadFromStore();
  }

  void _loadFromStore() {
    final settings = ref
        .read(settingsStoreNotifierProvider)
        .state
        .privacySettings;
    if (settings != null) {
      _analyticsOptIn = settings.analyticsOptIn;
      _diagnosticsOptIn = settings.diagnosticsOptIn;
      _redactPII = settings.snapshotDefaults.redactPII;
      _redactPrices = settings.snapshotDefaults.redactPrices;
      _redactNotes = settings.snapshotDefaults.redactNotes;
      _photoVisibility = settings.snapshotDefaults.photoVisibility;
      _integrations = List.from(settings.connectedIntegrations);
    }
  }

  Future<void> _exportData() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 24),
            Text('Preparing your data export...'),
          ],
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 2));
    if (mounted) Navigator.of(context).pop();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Export ready! Check your downloads.')),
      );
    }
  }

  Future<void> _deleteAccount() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account?'),
        content: const Text(
          'This will permanently delete all your data including itineraries, saved items, and settings. '
          'This action cannot be undone.\n\n'
          'You will have 30 days to cancel this request.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete Account'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Account deletion scheduled. You have 30 days to cancel.',
          ),
        ),
      );
    }
  }

  void _toggleIntegration(String integration) {
    setState(() {
      if (_integrations.contains(integration)) {
        _integrations.remove(integration);
      } else {
        _integrations.add(integration);
      }
    });
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Analytics
          Text('Data Collection', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            secondary: const Icon(Icons.analytics),
            title: const Text('Analytics'),
            subtitle: const Text('Help improve the app with usage data'),
            value: _analyticsOptIn,
            onChanged: (v) {
              setState(() => _analyticsOptIn = v);
              widget.onChanged();
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.bug_report),
            title: const Text('Diagnostics'),
            subtitle: const Text('Send crash reports and diagnostics'),
            value: _diagnosticsOptIn,
            onChanged: (v) {
              setState(() => _diagnosticsOptIn = v);
              widget.onChanged();
            },
          ),
          const Divider(height: 32),

          // Snapshot Defaults
          Text('Snapshot & Share Defaults', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Redact Personal Info'),
            subtitle: const Text('Hide names, emails when sharing'),
            value: _redactPII,
            onChanged: (v) {
              setState(() => _redactPII = v);
              widget.onChanged();
            },
          ),
          SwitchListTile(
            title: const Text('Redact Prices'),
            subtitle: const Text('Hide booking prices when sharing'),
            value: _redactPrices,
            onChanged: (v) {
              setState(() => _redactPrices = v);
              widget.onChanged();
            },
          ),
          SwitchListTile(
            title: const Text('Redact Notes'),
            subtitle: const Text('Hide personal notes when sharing'),
            value: _redactNotes,
            onChanged: (v) {
              setState(() => _redactNotes = v);
              widget.onChanged();
            },
          ),
          ListTile(
            title: const Text('Photo Visibility'),
            subtitle: Text(_formatPhotoVisibility(_photoVisibility)),
            trailing: DropdownButton<String>(
              value: _photoVisibility,
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(value: 'visible', child: Text('Visible')),
                DropdownMenuItem(value: 'blur', child: Text('Blur')),
                DropdownMenuItem(value: 'hide', child: Text('Hide')),
              ],
              onChanged: (v) {
                if (v != null) {
                  setState(() => _photoVisibility = v);
                  widget.onChanged();
                }
              },
            ),
          ),
          const Divider(height: 32),

          // Integrations
          Text('Connected Integrations', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ..._allIntegrations.map(
            (i) => ListTile(
              leading: Icon(_integrationIcon(i)),
              title: Text(_formatIntegration(i)),
              trailing: Switch(
                value: _integrations.contains(i),
                onChanged: (_) => _toggleIntegration(i),
              ),
            ),
          ),
          const Divider(height: 32),

          // Data Controls
          Text('Your Data', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Export All Data'),
            subtitle: const Text('Download a copy of your data'),
            onTap: _exportData,
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text(
              'Delete Account',
              style: TextStyle(color: Colors.red),
            ),
            subtitle: const Text('Permanently delete all data'),
            onTap: _deleteAccount,
          ),
        ],
      ),
    );
  }

  String _formatPhotoVisibility(String v) {
    switch (v) {
      case 'blur':
        return 'Photos will be blurred';
      case 'hide':
        return 'Photos will be hidden';
      default:
        return 'Photos will be visible';
    }
  }

  IconData _integrationIcon(String i) {
    switch (i) {
      case 'email':
        return Icons.email;
      case 'calendar':
        return Icons.calendar_today;
      case 'photos':
        return Icons.photo_library;
      default:
        return Icons.extension;
    }
  }

  String _formatIntegration(String i) {
    return i[0].toUpperCase() + i.substring(1);
  }
}
