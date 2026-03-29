import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';
import 'package:dastan/src/features/settings/presentation/tabs/profile_tab.dart';
import 'package:dastan/src/features/settings/presentation/tabs/travelers_tab.dart';
import 'package:dastan/src/features/settings/presentation/tabs/preferences_tab.dart';
import 'package:dastan/src/features/settings/presentation/tabs/notifications_tab.dart';
import 'package:dastan/src/features/settings/presentation/tabs/privacy_tab.dart';
import 'package:dastan/src/features/settings/presentation/tabs/security_tab.dart';
import 'package:dastan/src/features/settings/presentation/tabs/storage_tab.dart';

import 'package:dastan/src/core/data/supabase_auth_service.dart';

/// Provider to check if current user has admin access.
final isAdminProvider = Provider<bool>((ref) {
  final user = ref.watch(supabaseAuthServiceProvider.notifier).currentUser;
  final role = user?.userMetadata?['role'] as String?;
  return role == 'admin' || role == 'superadmin';
});

/// Main settings screen with tabbed navigation.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _hasChanges = false;

  static const _tabs = [
    Tab(icon: Icon(Icons.person), text: 'Profile'),
    Tab(icon: Icon(Icons.group), text: 'Travelers'),
    Tab(icon: Icon(Icons.tune), text: 'Preferences'),
    Tab(icon: Icon(Icons.notifications), text: 'Notifications'),
    Tab(icon: Icon(Icons.privacy_tip), text: 'Privacy'),
    Tab(icon: Icon(Icons.security), text: 'Security'),
    Tab(icon: Icon(Icons.storage), text: 'Storage'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _markChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  Future<void> _saveAll() async {
    // Each tab handles its own save via the store
    setState(() => _hasChanges = false);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Settings saved')));
  }

  void _resetAll() {
    // Reload settings from store
    final userId = ref.read(settingsStoreNotifierProvider).state.currentUserId;
    if (userId != null) {
      ref.read(settingsStoreNotifierProvider).loadSettings(userId);
    }
    setState(() => _hasChanges = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAdmin = ref.watch(isAdminProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          if (isAdmin)
            IconButton(
              icon: const Icon(Icons.admin_panel_settings),
              tooltip: 'Admin Console',
              onPressed: () => context.push('/admin'),
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabs,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProfileTab(onChanged: _markChanged),
                TravelersTab(onChanged: _markChanged),
                PreferencesTab(onChanged: _markChanged),
                NotificationsTab(onChanged: _markChanged),
                PrivacyTab(onChanged: _markChanged),
                SecurityTab(onChanged: _markChanged),
                const StorageTab(),
              ],
            ),
          ),
          // Sticky save/reset bar
          if (_hasChanges)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _resetAll,
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: _saveAll,
                      child: const Text('Save Changes'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
