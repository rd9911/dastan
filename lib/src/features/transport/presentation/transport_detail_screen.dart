import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../domain/transport_item.dart';
import '../domain/transport_search_request.dart';

/// Detail screen for a transport option (flight, train, etc.)
class TransportDetailScreen extends StatelessWidget {
  final TransportItem item;

  const TransportDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${item.segments.first.origin} → ${item.segments.last.destination}',
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSummaryCard(context, item),
                const SizedBox(height: 24),
                Text('Itinerary', style: theme.textTheme.titleMedium),
                const SizedBox(height: 16),
                _buildItinerary(context, item),
                const SizedBox(height: 24),
                if (item.providers.isNotEmpty) ...[
                  Text('Carriers', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  _buildProviders(context, item.providers),
                ],
                const SizedBox(height: 80),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context, item),
    );
  }

  Widget _buildSummaryCard(BuildContext context, TransportItem item) {
    final theme = Theme.of(context);
    final currencyFormatter = NumberFormat.currency(
      symbol: item.price.currency,
      decimalDigits: 0,
    );
    final timeFormat = DateFormat('HH:mm');
    final dateFormat = DateFormat('EEE, MMM d');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      timeFormat.format(item.departure),
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      item.segments.first.origin,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          _formatDuration(item.totalDuration),
                          style: theme.textTheme.bodySmall,
                        ),
                        const Divider(),
                        if (item.segments.length > 1)
                          Text(
                            '${item.segments.length - 1} stop(s)',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.error,
                            ),
                          )
                        else
                          Text(
                            'Direct',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.green,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      timeFormat.format(item.arrival),
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      item.segments.last.destination,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateFormat.format(item.departure),
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  currencyFormatter.format(item.price.amount),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItinerary(BuildContext context, TransportItem item) {
    final segments = item.segments;
    return Column(
      children: List.generate(segments.length, (index) {
        final segment = segments[index];
        final isLast = index == segments.length - 1;
        // Layover calculation
        Duration? layover;
        if (!isLast) {
          layover = segments[index + 1].departure.difference(segment.arrival);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSegment(context, segment),
            if (layover != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.access_time, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        'Layover in ${segment.destination}: ${_formatDuration(layover)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildSegment(BuildContext context, TransportSegment segment) {
    final theme = Theme.of(context);
    final timeFormat = DateFormat('HH:mm');
    final dateFormat = DateFormat('EEE, d MMM');

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline line
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: theme.colorScheme.surfaceContainerHighest,
                ),
              ),
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Departure
                Row(
                  children: [
                    Text(
                      timeFormat.format(segment.departure),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(segment.origin, style: theme.textTheme.titleMedium),
                    const Spacer(),
                    Text(
                      dateFormat.format(segment.departure),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Flight/Train info
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(_getModeIcon(segment.mode), size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              segment.carrier,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${segment.transportIdentifier} • ${_formatDuration(segment.duration)}',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Arrival
                Row(
                  children: [
                    Text(
                      timeFormat.format(segment.arrival),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      segment.destination,
                      style: theme.textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Text(
                      dateFormat.format(segment.arrival),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProviders(
    BuildContext context,
    List<TransportProvider> providers,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: providers.map((provider) {
        return Chip(
          avatar: provider.logoUrl != null
              ? CircleAvatar(backgroundImage: NetworkImage(provider.logoUrl!))
              : null,
          label: Text(provider.name),
        );
      }).toList(),
    );
  }

  Widget _buildBottomBar(BuildContext context, TransportItem item) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: FilledButton.icon(
          onPressed: () => _openBookingUrl(item.bookingUrl),
          icon: const Icon(Icons.open_in_new),
          label: const Text('Book Now'),
        ),
      ),
    );
  }

  Future<void> _openBookingUrl(String? url) async {
    if (url == null) return;
    final uri = Uri.tryParse(url);
    if (uri == null) return;

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  String _formatDuration(Duration duration) {
    final h = duration.inHours;
    final m = duration.inMinutes.remainder(60);
    return '${h}h ${m}m';
  }

  IconData _getModeIcon(TransportMode mode) {
    switch (mode) {
      case TransportMode.flight:
        return Icons.flight;
      case TransportMode.train:
        return Icons.train;
      case TransportMode.bus:
        return Icons.directions_bus;
      case TransportMode.any:
        return Icons.directions;
    }
  }
}
