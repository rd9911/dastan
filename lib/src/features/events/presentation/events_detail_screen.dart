import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dastan/src/features/events/application/events_normalization_helper.dart';
import 'package:dastan/src/features/events/application/events_providers.dart';
import 'package:dastan/src/features/events/domain/events_models.dart';
import 'package:dastan/src/core/presentation/save_button.dart';
import 'package:dastan/src/core/domain/saved_item.dart';

/// Detail screen for an event.
///
/// Features:
/// - Photo carousel with swipeable images
/// - Event details (Title, Category, Date/Time, Price)
/// - Venue information with map placeholder
/// - Description (Short/Full)
/// - Ticket and Website actions
/// - Save button
class EventsDetailScreen extends ConsumerStatefulWidget {
  final EventCard card;
  final String itineraryId;

  const EventsDetailScreen({
    super.key,
    required this.card,
    required this.itineraryId,
  });

  @override
  ConsumerState<EventsDetailScreen> createState() => _EventsDetailScreenState();
}

class _EventsDetailScreenState extends ConsumerState<EventsDetailScreen> {
  EventDetail? _detail;
  bool _isLoading = true;
  String? _errorMessage;
  int _currentPhotoIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadDetail();
  }

  Future<void> _loadDetail() async {
    try {
      final repository = ref.read(eventsRepositoryProvider);
      final detail = await repository.getDetail(
        widget.card.providerId,
        widget.card.externalId,
      );

      if (mounted) {
        setState(() {
          _detail = detail;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(theme),
          if (_isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_errorMessage != null)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(_errorMessage!),
                    const SizedBox(height: 16),
                    FilledButton.tonal(
                      onPressed: _loadDetail,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            )
          else if (_detail != null) ...[
            _buildPhotoCarousel(theme),
            _buildContent(theme),
          ],
        ],
      ),
      bottomNavigationBar: _detail != null ? _buildBottomBar(theme) : null,
    );
  }

  Widget _buildAppBar(ThemeData theme) {
    return SliverAppBar(
      expandedHeight: 0,
      pinned: true,
      title: Text(widget.card.title),
      actions: [
        SaveButton(
          section: ItinerarySection.events,
          title: widget.card.title,
          details: {
            'providerId': widget.card.providerId,
            'externalId': widget.card.externalId,
            'start': widget.card.start.toIso8601String(),
            'end': widget.card.end?.toIso8601String(),
            'venue': widget.card.venue.name,
            'address': widget.card.venue.address,
            'category': widget.card.category.name,
          },
          dedupeKey: EventsNormalizationHelper.generateDedupeKey(
            itineraryId: widget.itineraryId,
            item: widget.card,
          ),
          externalData: SavedItemExternal(
            vendor: widget.card.providerId,
            vendorUrl: widget.card.website,
            externalId: widget.card.externalId,
          ),
          location: SavedItemLocation(
            name: widget.card.venue.name,
            lat: widget.card.venue.latitude,
            lng: widget.card.venue.longitude,
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoCarousel(ThemeData theme) {
    final photos = _detail?.photos ?? [widget.card.leadImage];
    if (photos.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: PageView.builder(
              itemCount: photos.length,
              onPageChanged: (index) {
                setState(() => _currentPhotoIndex = index);
              },
              itemBuilder: (context, index) {
                return Image.network(
                  photos[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.event,
                      size: 48,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                );
              },
            ),
          ),
          if (photos.length > 1)
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(photos.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPhotoIndex == index
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline.withValues(alpha: 0.5),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    final detail = _detail!;

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          // Title and Category
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      EventsNormalizationHelper.formatCategory(
                        detail.category,
                      ).toUpperCase(),
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (detail.isFree == true)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'FREE',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    )
                  else if (detail.price != null)
                    Text(
                      detail.price!,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(detail.title, style: theme.textTheme.headlineSmall),
            ],
          ),

          const SizedBox(height: 24),

          // Date and Venue
          _buildInfoRow(
            context,
            Icons.calendar_today,
            'Date & Time',
            EventsNormalizationHelper.formatEventDateTime(detail.start) +
                (detail.end != null
                    ? ' - ${EventsNormalizationHelper.formatEventTime(detail.end!)}'
                    : ''),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            context,
            Icons.location_on,
            'Venue',
            detail.venue.name,
            subtitle: detail.venue.address,
          ),

          const SizedBox(height: 24),

          // Description
          Text('About', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            detail.descriptionFull ??
                detail.descriptionShort ??
                'No description available.',
            style: theme.textTheme.bodyMedium,
          ),

          const SizedBox(height: 24),

          // Additional Info
          if (detail.organizer != null || detail.attendeeCount != null) ...[
            Row(
              children: [
                if (detail.organizer != null)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Organizer', style: theme.textTheme.labelSmall),
                        Text(
                          detail.organizer!,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                if (detail.attendeeCount != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Attendees', style: theme.textTheme.labelSmall),
                      Text(
                        '${detail.attendeeCount}+',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 24),
          ],

          // Map Placeholder
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.map, color: theme.colorScheme.outline),
                const SizedBox(height: 8),
                Text('Map view coming soon', style: theme.textTheme.bodySmall),
              ],
            ),
          ),

          const SizedBox(height: 80),
        ]),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    String? subtitle,
  }) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: theme.textTheme.bodyLarge),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(ThemeData theme) {
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
        child: Row(
          children: [
            if (_detail?.website != null)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _launchUrl(_detail!.website!),
                  icon: const Icon(Icons.language),
                  label: const Text('Website'),
                ),
              ),
            if (_detail?.website != null && _detail?.ticketUrl != null)
              const SizedBox(width: 12),
            if (_detail?.ticketUrl != null)
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => _launchUrl(_detail!.ticketUrl!),
                  icon: const Icon(Icons.confirmation_number_outlined),
                  label: const Text('Get Tickets'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final uri = Uri.tryParse(urlString);
    if (uri == null) return;

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    }
  }
}
