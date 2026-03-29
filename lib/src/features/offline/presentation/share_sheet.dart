import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/offline/application/share_service.dart';
import 'package:dastan/src/features/offline/domain/share_models.dart';

final shareServiceProvider = Provider((ref) => ShareService());

class ShareSheet extends ConsumerStatefulWidget {
  final String itineraryId;
  final int version;

  const ShareSheet({
    super.key,
    required this.itineraryId,
    required this.version,
  });

  @override
  ConsumerState<ShareSheet> createState() => _ShareSheetState();
}

class _ShareSheetState extends ConsumerState<ShareSheet> {
  bool _reduceLocationPrecision = false;
  bool _excludeNotes = true;
  bool _excludePricing = false;
  int? _expiryDays = 7;

  bool _generating = false;
  ShareLink? _generatedLink;

  Future<void> _generateLink() async {
    setState(() => _generating = true);

    final service = ref.read(shareServiceProvider);
    final config = ShareConfig(
      reduceLocationPrecision: _reduceLocationPrecision,
      excludeNotes: _excludeNotes,
      excludePricing: _excludePricing,
      expiryDays: _expiryDays,
    );

    final link = await service.createShareLink(
      itineraryId: widget.itineraryId,
      version: widget.version,
      config: config,
    );

    setState(() {
      _generating = false;
      _generatedLink = link;
    });
  }

  void _copyLink() {
    if (_generatedLink != null) {
      Clipboard.setData(ClipboardData(text: _generatedLink!.url));
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Link copied to clipboard')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Share Itinerary',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          if (_generatedLink != null) _buildLinkView() else _buildConfigView(),
        ],
      ),
    );
  }

  Widget _buildConfigView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Privacy Settings',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          title: const Text('Reduce location precision'),
          subtitle: const Text('Share only city-level locations'),
          value: _reduceLocationPrecision,
          onChanged: (v) => setState(() => _reduceLocationPrecision = v),
        ),
        SwitchListTile(
          title: const Text('Exclude notes'),
          subtitle: const Text('Hide personal notes'),
          value: _excludeNotes,
          onChanged: (v) => setState(() => _excludeNotes = v),
        ),
        SwitchListTile(
          title: const Text('Exclude pricing'),
          subtitle: const Text('Hide cost information'),
          value: _excludePricing,
          onChanged: (v) => setState(() => _excludePricing = v),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<int?>(
          initialValue: _expiryDays,
          decoration: const InputDecoration(labelText: 'Link expires after'),
          items: const [
            DropdownMenuItem(value: null, child: Text('Never')),
            DropdownMenuItem(value: 1, child: Text('1 day')),
            DropdownMenuItem(value: 7, child: Text('7 days')),
            DropdownMenuItem(value: 30, child: Text('30 days')),
          ],
          onChanged: (v) => setState(() => _expiryDays = v),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _generating ? null : _generateLink,
          child: _generating
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Generate Share Link'),
        ),
      ],
    );
  }

  Widget _buildLinkView() {
    return Column(
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 48),
        const SizedBox(height: 16),
        Text(_generatedLink!.url, textAlign: TextAlign.center),
        if (_generatedLink!.expiresAt != null) ...[
          const SizedBox(height: 8),
          Text(
            'Expires: ${_generatedLink!.expiresAt!.toLocal()}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: _copyLink,
              icon: const Icon(Icons.copy),
              label: const Text('Copy Link'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ],
        ),
      ],
    );
  }
}
