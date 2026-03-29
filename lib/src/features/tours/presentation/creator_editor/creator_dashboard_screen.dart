import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Dashboard for tour creators. Lists their created tours and provides
/// a button to create a new one.
/// This screen is web-only, visible via /creator route.
class CreatorDashboardScreen extends ConsumerWidget {
  const CreatorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creator Dashboard'),
        actions: [
          FilledButton.icon(
            onPressed: () {
              context.push('/creator/new');
            },
            icon: const Icon(Icons.add),
            label: const Text('Create New Tour'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
        key: const Key('creator_dashboard'),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Text(
                'Your Tours',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.headphones_outlined,
                          size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No tours created yet',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Click "Create New Tour" to get started',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
