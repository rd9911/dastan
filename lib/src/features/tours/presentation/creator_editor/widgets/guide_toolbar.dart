import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/core/data/supabase_client.dart';

/// Custom Quill toolbar with guide-specific block insertion buttons.
/// Extends the standard toolbar with: Highlight, Image, Fact, Location, Year Badge.
class GuideToolbar extends ConsumerWidget {
  final QuillController controller;

  const GuideToolbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      key: const Key('guide_toolbar'),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          // Standard formatting
          QuillToolbarHistoryButton(controller: controller, isUndo: true),
          QuillToolbarHistoryButton(controller: controller, isUndo: false),
          const VerticalDivider(width: 16),
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.bold,
          ),
          QuillToolbarToggleStyleButton(
            controller: controller,
            attribute: Attribute.italic,
          ),
          const VerticalDivider(width: 16),
          // Header styles
          QuillToolbarSelectHeaderStyleDropdownButton(
            controller: controller,
          ),
          const VerticalDivider(width: 16),
          // Custom guide-specific buttons
          _CustomToolbarButton(
            icon: Icons.format_quote,
            tooltip: 'Highlight / Pull Quote',
            onPressed: () => _insertHighlight(context),
          ),
          _CustomToolbarButton(
            icon: Icons.image,
            tooltip: 'Insert Image',
            onPressed: () => _insertImage(context, ref),
          ),
          _CustomToolbarButton(
            icon: Icons.info_outline,
            tooltip: 'Fact Chip',
            onPressed: () => _insertFact(context),
          ),
          _CustomToolbarButton(
            icon: Icons.location_on_outlined,
            tooltip: 'Location Tag',
            onPressed: () => _insertLocation(context),
          ),
          _CustomToolbarButton(
            icon: Icons.calendar_today,
            tooltip: 'Year Badge',
            onPressed: () => _insertYearBadge(context),
          ),
        ],
      ),
    );
  }

  void _insertHighlight(BuildContext context) {
    // Insert a blockquote-style highlight using Quill's block attribute
    controller.formatSelection(Attribute.blockQuote);
  }

  Future<void> _insertImage(BuildContext context, WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null || result.files.isEmpty) return;

    final fileBytes = result.files.first.bytes;
    final fileName = result.files.first.name;
    String imageUrl = 'placeholder://$fileName';

    if (fileBytes != null) {
      try {
        final client = ref.read(supabaseClientProvider);
        final storagePath = 'editor/${DateTime.now().millisecondsSinceEpoch}_$fileName';
        await client.storage.from('tour-images').uploadBinary(storagePath, fileBytes);
        imageUrl = client.storage.from('tour-images').getPublicUrl(storagePath);
      } catch (e) {
        debugPrint('Failed to upload editor image: $e');
      }
    }

    controller.replaceText(
      controller.selection.baseOffset,
      0,
      BlockEmbed.image(imageUrl),
      null,
    );
  }

  void _insertFact(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _FactDialog(
        onInsert: (label, value) {
          // Insert as plain text with special formatting
          final text = '📌 $label: $value\n';
          controller.replaceText(
            controller.selection.baseOffset,
            0,
            text,
            null,
          );
        },
      ),
    );
  }

  void _insertLocation(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _LocationDialog(
        onInsert: (address) {
          final text = '📍 $address\n';
          controller.replaceText(
            controller.selection.baseOffset,
            0,
            text,
            null,
          );
        },
      ),
    );
  }

  void _insertYearBadge(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _YearBadgeDialog(
        onInsert: (label) {
          final text = '🏷️ $label\n';
          controller.replaceText(
            controller.selection.baseOffset,
            0,
            text,
            null,
          );
        },
      ),
    );
  }
}

class _CustomToolbarButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _CustomToolbarButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: Icon(icon, size: 20),
        onPressed: onPressed,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}

class _FactDialog extends StatelessWidget {
  final void Function(String label, String value) onInsert;
  final _labelController = TextEditingController();
  final _valueController = TextEditingController();

  _FactDialog({required this.onInsert});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Insert Fact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _labelController,
            decoration: const InputDecoration(
              labelText: 'Label (e.g. "Founded")',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _valueController,
            decoration: const InputDecoration(
              labelText: 'Value (e.g. "1492")',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            onInsert(_labelController.text, _valueController.text);
            Navigator.of(context).pop();
          },
          child: const Text('Insert'),
        ),
      ],
    );
  }
}

class _LocationDialog extends StatelessWidget {
  final void Function(String address) onInsert;
  final _addressController = TextEditingController();

  _LocationDialog({required this.onInsert});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Insert Location'),
      content: TextField(
        controller: _addressController,
        decoration: const InputDecoration(
          labelText: 'Address',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            onInsert(_addressController.text);
            Navigator.of(context).pop();
          },
          child: const Text('Insert'),
        ),
      ],
    );
  }
}

class _YearBadgeDialog extends StatelessWidget {
  final void Function(String label) onInsert;
  final _labelController = TextEditingController();

  _YearBadgeDialog({required this.onInsert});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Insert Year Badge'),
      content: TextField(
        controller: _labelController,
        decoration: const InputDecoration(
          labelText: 'Label (e.g. "Built in 1492")',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            onInsert(_labelController.text);
            Navigator.of(context).pop();
          },
          child: const Text('Insert'),
        ),
      ],
    );
  }
}
