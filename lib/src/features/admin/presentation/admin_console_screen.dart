import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/admin/domain/admin_models.dart';
import 'package:dastan/src/features/admin/application/admin_store.dart';
import 'package:dastan/src/features/admin/data/admin_repository.dart';

/// Main admin console screen with navigation.
class AdminConsoleScreen extends ConsumerStatefulWidget {
  const AdminConsoleScreen({super.key});

  @override
  ConsumerState<AdminConsoleScreen> createState() => _AdminConsoleScreenState();
}

class _AdminConsoleScreenState extends ConsumerState<AdminConsoleScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminStoreNotifierProvider);

    if (state.session == null || !state.session!.isValid) {
      return _AdminLoginScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Console'),
        actions: [
          Chip(
            avatar: const Icon(Icons.security, size: 16),
            label: Text(state.session!.role.name),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () =>
                ref.read(adminStoreNotifierProvider.notifier).logout(),
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) =>
                setState(() => _selectedIndex = index),
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.search),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text('Users'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.receipt),
                label: Text('Billing'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.tune),
                label: Text('Entitlements'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.folder),
                label: Text('Itineraries'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shield),
                label: Text('Trust & Safety'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.history),
                label: Text('Audit Log'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _buildContent(state)),
        ],
      ),
    );
  }

  Widget _buildContent(AdminState state) {
    switch (_selectedIndex) {
      case 0:
        return _AdminSearchTab();
      case 1:
        return state.selectedUser != null
            ? _UserOverviewTab(user: state.selectedUser!)
            : const Center(child: Text('Select a user from search'));
      case 2:
        return _BillingTab();
      case 3:
        return _EntitlementsTab();
      case 4:
        return _ItinerariesTab();
      case 5:
        return _TrustSafetyTab();
      case 6:
        return _AuditLogTab();
      default:
        return const Center(child: Text('Unknown tab'));
    }
  }
}

class _AdminLoginScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<_AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends ConsumerState<_AdminLoginScreen> {
  AdminRole _selectedRole = AdminRole.support;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.admin_panel_settings, size: 64),
                const SizedBox(height: 16),
                const Text('Admin Console', style: TextStyle(fontSize: 24)),
                const SizedBox(height: 24),
                DropdownButton<AdminRole>(
                  value: _selectedRole,
                  items: AdminRole.values
                      .map(
                        (role) => DropdownMenuItem(
                          value: role,
                          child: Text(role.name),
                        ),
                      )
                      .toList(),
                  onChanged: (role) => setState(() => _selectedRole = role!),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () {
                    ref
                        .read(adminStoreNotifierProvider.notifier)
                        .login(
                          AdminSession(
                            sessionId:
                                'sess_${DateTime.now().millisecondsSinceEpoch}',
                            userId: 'admin_demo',
                            email: 'admin@dastan.app',
                            role: _selectedRole,
                            issuedAt: DateTime.now(),
                            expiresAt: DateTime.now().add(
                              const Duration(hours: 8),
                            ),
                          ),
                        );
                  },
                  child: const Text('Login (Demo)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AdminSearchTab extends ConsumerStatefulWidget {
  @override
  ConsumerState<_AdminSearchTab> createState() => _AdminSearchTabState();
}

class _AdminSearchTabState extends ConsumerState<_AdminSearchTab> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminStoreNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search by email, user ID, invoice ID...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: state.isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : null,
            ),
            onChanged: (query) {
              ref.read(adminStoreNotifierProvider.notifier).search(query);
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: state.searchResults.length,
              itemBuilder: (context, index) {
                final result = state.searchResults[index];
                return ListTile(
                  leading: Icon(_iconForType(result.type)),
                  title: Text(result.title),
                  subtitle: Text(result.subtitle),
                  trailing: Chip(label: Text(result.type)),
                  onTap: () {
                    if (result.type == 'user') {
                      ref
                          .read(adminStoreNotifierProvider.notifier)
                          .selectUser(result.id);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'user':
        return Icons.person;
      case 'invoice':
        return Icons.receipt;
      case 'itinerary':
        return Icons.map;
      default:
        return Icons.help;
    }
  }
}

class _UserOverviewTab extends StatelessWidget {
  final UserOverview user;

  const _UserOverviewTab({required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: Text(user.name[0].toUpperCase()),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name, style: const TextStyle(fontSize: 20)),
                        Text(
                          user.email,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Chip(label: Text(user.plan.toUpperCase())),
                            const SizedBox(width: 8),
                            if (user.isSuspended)
                              const Chip(
                                label: Text('SUSPENDED'),
                                backgroundColor: Colors.red,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Itineraries',
                  value: user.itineraryCount.toString(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Saved Items',
                  value: user.savedItemCount.toString(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Member Since',
                  value: '${user.createdAt.month}/${user.createdAt.year}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(title, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// Placeholder tabs
class _BillingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Billing Tab'));
}

class _EntitlementsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Entitlements Tab'));
}

class _ItinerariesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Itineraries Tab'));
}

class _TrustSafetyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Trust & Safety Tab'));
}

class _AuditLogTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminStoreNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Actions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: state.recentActions.length,
              itemBuilder: (context, index) {
                final action = state.recentActions[index];
                return ListTile(
                  leading: Icon(_iconForAction(action.actionType)),
                  title: Text(action.actionType.name),
                  subtitle: Text('${action.actorEmail} • ${action.resource}'),
                  trailing: Text(
                    '${action.createdAt.hour}:${action.createdAt.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForAction(AdminActionType type) {
    switch (type) {
      case AdminActionType.login:
      case AdminActionType.logout:
        return Icons.login;
      case AdminActionType.viewUser:
        return Icons.visibility;
      case AdminActionType.refund:
        return Icons.money_off;
      case AdminActionType.changePlan:
        return Icons.swap_horiz;
      default:
        return Icons.history;
    }
  }
}
