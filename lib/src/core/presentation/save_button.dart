import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/save_item_service.dart';
import '../domain/saved_item.dart';

/// A reusable Save/Unsave button widget that can be added to search results
class SaveButton extends ConsumerStatefulWidget {
  final ItinerarySection section;
  final String dedupeKey;
  final String title;
  final Map<String, dynamic> details;
  final SavedItemExternal? externalData;
  final SavedItemTime? time;
  final SavedItemLocation? location;
  final List<Map<String, dynamic>> media;
  final IconData savedIcon;
  final IconData unsavedIcon;

  const SaveButton({
    super.key,
    required this.section,
    required this.dedupeKey,
    required this.title,
    required this.details,
    this.externalData,
    this.time,
    this.location,
    this.media = const [],
    this.savedIcon = Icons.bookmark,
    this.unsavedIcon = Icons.bookmark_border,
  });

  @override
  ConsumerState<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends ConsumerState<SaveButton> {
  bool? _isSaved;

  @override
  void initState() {
    super.initState();
    _checkIfSaved();
  }

  Future<void> _checkIfSaved() async {
    final isSaved = await ref
        .read(saveItemServiceProvider)
        .isItemSaved(widget.dedupeKey);
    if (mounted) {
      setState(() {
        _isSaved = isSaved;
      });
    }
  }

  Future<void> _toggleSave() async {
    final service = ref.read(saveItemServiceProvider);

    if (_isSaved == true) {
      // Find and delete the saved item
      final items = await service.getSavedItems();
      final item = items.firstWhere(
        (item) => item.dedupeKey == widget.dedupeKey,
      );
      await service.unsaveItem(item.id);
      if (mounted) {
        setState(() {
          _isSaved = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item removed from itinerary')),
        );
      }
    } else {
      // Save the item
      await service.saveItem(
        section: widget.section,
        dedupeKey: widget.dedupeKey,
        title: widget.title,
        details: widget.details,
        externalData: widget.externalData,
        time: widget.time,
        location: widget.location,
        media: widget.media,
      );
      if (mounted) {
        setState(() {
          _isSaved = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item saved to itinerary')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSaved == null) {
      return const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return IconButton(
      icon: Icon(_isSaved! ? widget.savedIcon : widget.unsavedIcon),
      color: _isSaved! ? Colors.amber : Colors.grey,
      onPressed: _toggleSave,
      tooltip: _isSaved! ? 'Remove from itinerary' : 'Save to itinerary',
    );
  }
}
