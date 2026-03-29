import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';

/// Storage tab for managing offline bundles and cache.
class StorageTab extends ConsumerStatefulWidget {
  const StorageTab({super.key});

  @override
  ConsumerState<StorageTab> createState() => _StorageTabState();
}

class _StorageTabState extends ConsumerState<StorageTab> {
  // Mock data for offline bundles
  final _bundles = [
    StorageEntry(
      itineraryId: 'trip-paris',
      itineraryName: 'Paris Adventure',
      sizeBytes: 52428800, // 50 MB
      downloadedAt: DateTime.now().subtract(const Duration(days: 5)),
      lastSyncedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    StorageEntry(
      itineraryId: 'trip-tokyo',
      itineraryName: 'Tokyo Trip',
      sizeBytes: 78643200, // 75 MB
      downloadedAt: DateTime.now().subtract(const Duration(days: 10)),
      lastSyncedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  int _cacheSize = 125829120; // 120 MB

  void _refreshBundle(String itineraryId) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Refreshing $itineraryId...')));
  }

  void _deleteBundle(int index) {
    final bundle = _bundles[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Offline Bundle?'),
        content: Text(
          'This will remove the offline bundle for "${bundle.itineraryName}". '
          'You can download it again later.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => _bundles.removeAt(index));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Offline bundle removed')),
              );
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }

  void _clearCache() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cache?'),
        content: Text(
          'This will clear ${_formatBytes(_cacheSize)} of cached data. '
          'This may slow down initial loading of some content.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => _cacheSize = 0);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Cache cleared')));
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalBundleSize = _bundles.fold<int>(
      0,
      (sum, b) => sum + b.sizeBytes,
    );
    final totalSize = totalBundleSize + _cacheSize;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Storage Overview
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Storage Used', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StorageIndicator(
                        label: 'Offline',
                        size: totalBundleSize,
                        color: theme.colorScheme.primary,
                      ),
                      _StorageIndicator(
                        label: 'Cache',
                        size: _cacheSize,
                        color: theme.colorScheme.secondary,
                      ),
                      _StorageIndicator(
                        label: 'Total',
                        size: totalSize,
                        color: theme.colorScheme.tertiary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Offline Bundles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Offline Bundles', style: theme.textTheme.titleMedium),
              Text(
                '${_bundles.length} itineraries',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_bundles.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.cloud_off, size: 48, color: Colors.grey[400]),
                      const SizedBox(height: 12),
                      Text(
                        'No offline bundles',
                        style: theme.textTheme.titleSmall,
                      ),
                      const Text('Download itineraries for offline access'),
                    ],
                  ),
                ),
              ),
            )
          else
            ...List.generate(_bundles.length, (i) {
              final bundle = _bundles[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(
                      Icons.cloud_download,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  title: Text(bundle.itineraryName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_formatBytes(bundle.sizeBytes)} • Downloaded ${_formatDate(bundle.downloadedAt)}',
                      ),
                      if (bundle.lastSyncedAt != null)
                        Text(
                          'Last synced ${_formatDate(bundle.lastSyncedAt!)}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: PopupMenuButton<String>(
                    onSelected: (action) {
                      switch (action) {
                        case 'refresh':
                          _refreshBundle(bundle.itineraryId);
                        case 'delete':
                          _deleteBundle(i);
                      }
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'refresh', child: Text('Refresh')),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          'Remove',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          const SizedBox(height: 24),

          // Cache
          Text('Cache', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.cached),
              title: const Text('Cached Data'),
              subtitle: Text(_formatBytes(_cacheSize)),
              trailing: TextButton(
                onPressed: _cacheSize > 0 ? _clearCache : null,
                child: const Text('Clear'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  String _formatDate(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

class _StorageIndicator extends StatelessWidget {
  final String label;
  final int size;
  final Color color;

  const _StorageIndicator({
    required this.label,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.2),
            border: Border.all(color: color, width: 3),
          ),
          child: Center(
            child: Text(
              _formatSize(size),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 12,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  String _formatSize(int bytes) {
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toInt()} KB';
    return '${(bytes / (1024 * 1024)).toInt()} MB';
  }
}
