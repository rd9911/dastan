import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/core/data/database_provider.dart';

/// Service for managing offline sync queue
class SyncQueueService {
  final AppDatabase _db;

  SyncQueueService(this._db);

  /// Adds an operation to the sync queue
  Future<void> enqueue({
    required String operation,
    required Map<String, dynamic> payload,
  }) async {
    await _db
        .into(_db.syncQueue)
        .insert(
          SyncQueueCompanion.insert(
            operation: operation,
            payload: jsonEncode(payload),
            createdAt: DateTime.now(),
          ),
        );
  }

  /// Gets all pending operations
  Future<List<SyncQueueData>> getPending() async {
    return (_db.select(_db.syncQueue)
          ..where((t) => t.status.equals('pending'))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .get();
  }

  /// Marks an operation as completed
  Future<void> markCompleted(int id) async {
    await (_db.update(_db.syncQueue)..where((t) => t.id.equals(id))).write(
      const SyncQueueCompanion(status: Value('synced')),
    );
  }

  /// Marks an operation as failed
  Future<void> markFailed(int id) async {
    await (_db.update(_db.syncQueue)..where((t) => t.id.equals(id))).write(
      const SyncQueueCompanion(status: Value('error')),
    );
  }

  /// Removes completed operations older than 24 hours
  Future<void> cleanup() async {
    final cutoff = DateTime.now().subtract(const Duration(hours: 24));
    await (_db.delete(_db.syncQueue)
          ..where((t) => t.status.equals('synced'))
          ..where((t) => t.createdAt.isSmallerThanValue(cutoff)))
        .go();
  }

  /// Checks if device is online
  Future<bool> isOnline() async {
    final result = await Connectivity().checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  /// Processes the sync queue
  Future<void> processQueue({
    required Future<void> Function(
      String operation,
      Map<String, dynamic> payload,
    )
    handler,
  }) async {
    if (!await isOnline()) return;

    final pending = await getPending();
    for (final item in pending) {
      try {
        final payload = jsonDecode(item.payload) as Map<String, dynamic>;
        await handler(item.operation, payload);
        await markCompleted(item.id);
      } catch (e) {
        await markFailed(item.id);
      }
    }
  }
}

/// Provider for SyncQueueService
final syncQueueServiceProvider = Provider<SyncQueueService>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SyncQueueService(db);
});
