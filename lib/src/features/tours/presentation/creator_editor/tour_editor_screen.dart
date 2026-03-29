import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/presentation/creator_editor/widgets/guide_toolbar.dart';
import 'package:dastan/src/features/tours/presentation/guided_tour/widgets/guide_text_view.dart';
import 'package:dastan/src/features/tours/application/quill_guide_converter.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

/// Three-panel tour editor screen for web creators.
/// Left: Metadata panel | Center: Quill editor | Right: Live preview
class TourEditorScreen extends ConsumerStatefulWidget {
  final String? tourId;

  const TourEditorScreen({super.key, this.tourId});

  @override
  ConsumerState<TourEditorScreen> createState() => _TourEditorScreenState();
}

class _TourEditorScreenState extends ConsumerState<TourEditorScreen> {
  late QuillController _quillController;
  final _titleController = TextEditingController();
  final _taglineController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCityId;
  bool _isFree = false;
  double _priceUsd = 0.0;
  int _durationMinutes = 60;
  TourType _tourType = TourType.single;

  @override
  void initState() {
    super.initState();
    _quillController = QuillController.basic();
    if (widget.tourId != null) {
      _loadExistingTour();
    }
  }

  Future<void> _loadExistingTour() async {
    final tourId = widget.tourId;
    if (tourId == null) return;
    try {
      final detail = await ref.read(tourDetailProvider(tourId).future);
      setState(() {
        _titleController.text = detail.summary.name;
        _taglineController.text = detail.summary.tagline;
        _descriptionController.text = detail.fullDescription;
        _selectedCityId = detail.summary.cityId;
        _isFree = detail.summary.priceUsd == 0;
        _priceUsd = detail.summary.priceUsd;
        _durationMinutes = detail.summary.durationMinutes;
      });
      // Optionally populate quill editor if content is present
    } catch (e) {
      debugPrint('Failed to load tour: $e');
    }
  }

  @override
  void dispose() {
    _quillController.dispose();
    _titleController.dispose();
    _taglineController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tourId == null ? 'Create Tour' : 'Edit Tour'),
        actions: [
          OutlinedButton.icon(
            onPressed: _saveDraft,
            icon: const Icon(Icons.save_outlined),
            label: const Text('Save Draft'),
          ),
          const SizedBox(width: 8),
          FilledButton.icon(
            onPressed: _onPublish,
            icon: const Icon(Icons.publish),
            label: const Text('Publish'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          // ── Left: Metadata panel ──
          SizedBox(
            width: 280,
            child: ref.watch(countriesProvider).when(
              data: (countries) {
                final allCities = countries.expand((c) => c.cities).toList();
                return _MetadataPanel(
                  titleController: _titleController,
                  taglineController: _taglineController,
                  descriptionController: _descriptionController,
                  selectedCityId: _selectedCityId,
                  isFree: _isFree,
                  priceUsd: _priceUsd,
                  durationMinutes: _durationMinutes,
                  tourType: _tourType,
                  availableCities: allCities,
                  onCityChanged: (id) => setState(() => _selectedCityId = id),
                  onFreeChanged: (v) => setState(() => _isFree = v),
                  onPriceChanged: (v) => setState(() => _priceUsd = v),
                  onDurationChanged: (v) => setState(() => _durationMinutes = v),
                  onTypeChanged: (v) => setState(() => _tourType = v),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => const Center(child: Text('Error loading cities')),
            ),
          ),
          const VerticalDivider(width: 1),
          // ── Center: Quill editor ──
          Expanded(
            flex: 3,
            child: Column(
              children: [
                GuideToolbar(controller: _quillController),
                const Divider(height: 1),
                Expanded(
                  child: QuillEditor.basic(
                    configurations: QuillEditorConfigurations(
                      controller: _quillController,
                      padding: const EdgeInsets.all(24),
                      autoFocus: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          // ── Right: Live preview ──
          SizedBox(
            width: 320,
            child: _LivePreviewPanel(quillController: _quillController),
          ),
        ],
      ),
    );
  }

  Future<void> _saveDraft() async {
    final client = ref.read(supabaseClientProvider);
    try {
      final doc = _quillController.document.toDelta().toJson();
      final data = {
        if (widget.tourId != null) 'id': widget.tourId,
        'title': _titleController.text,
        'tagline': _taglineController.text,
        'description': _descriptionController.text,
        'city_id': _selectedCityId,
        'is_published': false,
        'price_usd': _isFree ? 0 : _priceUsd,
        'duration_minutes': _durationMinutes,
        'tour_type': _tourType.name,
        'content_delta': doc,
      };
      await client.from('tours').upsert(data);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Draft saved')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Draft failed: $e')),
        );
      }
    }
  }

  void _onPublish() {
    showDialog(
      context: context,
      builder: (_) => _PublishConfirmDialog(
        onConfirm: () async {
          Navigator.of(context).pop();
          if (widget.tourId == null) return;
          try {
            await ref.read(supabaseClientProvider)
                .from('tours')
                .upsert({'id': widget.tourId, 'is_published': true});
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tour published!')),
              );
            }
          } catch (e) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Publish failed: $e')),
              );
            }
          }
        },
      ),
    );
  }
}

// ─── Metadata Panel ───
class _MetadataPanel extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController taglineController;
  final TextEditingController descriptionController;
  final String? selectedCityId;
  final bool isFree;
  final double priceUsd;
  final int durationMinutes;
  final TourType tourType;
  final List<City> availableCities;
  final ValueChanged<String?> onCityChanged;
  final ValueChanged<bool> onFreeChanged;
  final ValueChanged<double> onPriceChanged;
  final ValueChanged<int> onDurationChanged;
  final ValueChanged<TourType> onTypeChanged;

  const _MetadataPanel({
    required this.titleController,
    required this.taglineController,
    required this.descriptionController,
    required this.selectedCityId,
    required this.isFree,
    required this.priceUsd,
    required this.durationMinutes,
    required this.tourType,
    required this.availableCities,
    required this.onCityChanged,
    required this.onFreeChanged,
    required this.onPriceChanged,
    required this.onDurationChanged,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Tour Metadata',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: taglineController,
            decoration: const InputDecoration(
              labelText: 'Tagline (3-4 words)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: descriptionController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Full Description',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          // Tour Type
          SegmentedButton<TourType>(
            segments: const [
              ButtonSegment(value: TourType.single, label: Text('Single')),
              ButtonSegment(value: TourType.multi, label: Text('Multi')),
            ],
            selected: {tourType},
            onSelectionChanged: (set) => onTypeChanged(set.first),
          ),
          const SizedBox(height: 16),
          // Duration
          Row(
            children: [
              const Text('Duration (min):'),
              const SizedBox(width: 8),
              Expanded(
                child: Slider(
                  value: durationMinutes.toDouble(),
                  min: 15,
                  max: 300,
                  divisions: 19,
                  label: '$durationMinutes min',
                  onChanged: (v) => onDurationChanged(v.toInt()),
                ),
              ),
              Text('$durationMinutes'),
            ],
          ),
          const SizedBox(height: 12),
          // Price
          SwitchListTile(
            title: const Text('Free Tour'),
            value: isFree,
            onChanged: onFreeChanged,
            contentPadding: EdgeInsets.zero,
          ),
          if (!isFree) ...[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Price (USD)',
                border: OutlineInputBorder(),
                prefixText: '\$',
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) =>
                  onPriceChanged(double.tryParse(v) ?? 0),
            ),
          ],
          const SizedBox(height: 16),
          // Main image upload
          OutlinedButton.icon(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles(type: FileType.image);
              if (result != null && result.files.isNotEmpty) {
                // TODO: Upload image to user-avatars bucket via StorageService
                // (In production, replace with real storage upload logic)
                debugPrint('Uploading ${result.files.first.name} to tour-images...');
              }
            },
            icon: const Icon(Icons.image),
            label: const Text('Upload Main Image'),
          ),
          const SizedBox(height: 16),
          // City selector
          DropdownButtonFormField<String>(
            value: selectedCityId,
            decoration: const InputDecoration(
              labelText: 'City',
              border: OutlineInputBorder(),
            ),
            items: availableCities.map((city) {
              return DropdownMenuItem(
                value: city.id,
                child: Text(city.name),
              );
            }).toList(),
            onChanged: onCityChanged,
          ),
        ],
      ),
    );
  }
}

// ─── Live Preview Panel ───
class _LivePreviewPanel extends StatelessWidget {
  final QuillController quillController;

  const _LivePreviewPanel({required this.quillController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Text(
            'Live Preview',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListenableBuilder(
            listenable: quillController,
            builder: (context, _) {
              final guideContent = QuillGuideConverter.fromQuillDelta(
                quillController.document.toDelta().toJson(),
                'preview',
              );
              if (guideContent.sections.isEmpty) {
                return const Center(
                  child: Text(
                    'Start typing to see a live preview',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
              return ListView(
                padding: const EdgeInsets.all(16),
                children: guideContent.sections
                    .map((s) => GuideSectionView(
                          section: s,
                          isRead: false,
                          isCurrent: true,
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ─── Publish Confirm Dialog ───
class _PublishConfirmDialog extends StatefulWidget {
  final VoidCallback onConfirm;

  const _PublishConfirmDialog({required this.onConfirm});

  @override
  State<_PublishConfirmDialog> createState() => _PublishConfirmDialogState();
}

class _PublishConfirmDialogState extends State<_PublishConfirmDialog> {
  bool _generateAudio = true;
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Publish Tour'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Are you sure you want to publish this tour?'),
          const SizedBox(height: 12),
          const Text(
            'Once published, it will be visible to all users.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          CheckboxListTile(
            title: const Text('Generate AI Audio Guide'),
            subtitle: const Text('Automatically synthesize voice narration.'),
            value: _generateAudio,
            onChanged: (v) => setState(() => _generateAudio = v ?? false),
            contentPadding: EdgeInsets.zero,
          ),
          if (_generateAudio)
            DropdownButtonFormField<String>(
              value: _selectedLanguage,
              decoration: const InputDecoration(
                labelText: 'Primary Language',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'es', child: Text('Spanish')),
                DropdownMenuItem(value: 'fr', child: Text('French')),
                DropdownMenuItem(value: 'de', child: Text('German')),
              ],
              onChanged: (v) => setState(() => _selectedLanguage = v ?? 'en'),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: widget.onConfirm,
          child: const Text('Publish'),
        ),
      ],
    );
  }
}
