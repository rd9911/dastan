import 'package:flutter/material.dart';
import 'package:dastan/src/features/planner/domain/conflict_models.dart';

/// Bottom sheet UI for displaying and fixing conflicts.
class ConflictFixSheet extends StatelessWidget {
  final List<Conflict> conflicts;
  final void Function(ConflictSuggestion suggestion) onApplyFix;

  const ConflictFixSheet({
    super.key,
    required this.conflicts,
    required this.onApplyFix,
  });

  @override
  Widget build(BuildContext context) {
    if (conflicts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                '${conflicts.length} Conflict${conflicts.length > 1 ? 's' : ''} Detected',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...conflicts.map(
            (c) => _ConflictCard(conflict: c, onApplyFix: onApplyFix),
          ),
        ],
      ),
    );
  }
}

class _ConflictCard extends StatelessWidget {
  final Conflict conflict;
  final void Function(ConflictSuggestion suggestion) onApplyFix;

  const _ConflictCard({required this.conflict, required this.onApplyFix});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildTypeIcon(conflict.type),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    conflict.message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            if (conflict.suggestions.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Text(
                'Quick Fixes:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: conflict.suggestions
                    .map(
                      (s) => ActionChip(
                        label: Text(s.label),
                        onPressed: () => onApplyFix(s),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTypeIcon(ConflictType type) {
    switch (type) {
      case ConflictType.overlap:
        return const Icon(Icons.layers, color: Colors.red, size: 20);
      case ConflictType.tightTransfer:
        return const Icon(Icons.timer_off, color: Colors.orange, size: 20);
      case ConflictType.closed:
        return const Icon(Icons.lock, color: Colors.grey, size: 20);
      case ConflictType.outsideItinerary:
        return const Icon(Icons.date_range, color: Colors.purple, size: 20);
      case ConflictType.durationExceeded:
        return const Icon(Icons.schedule, color: Colors.blue, size: 20);
    }
  }
}
