import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';

/// Travelers tab for managing party presets.
class TravelersTab extends ConsumerStatefulWidget {
  final VoidCallback onChanged;

  const TravelersTab({super.key, required this.onChanged});

  @override
  ConsumerState<TravelersTab> createState() => _TravelersTabState();
}

class _TravelersTabState extends ConsumerState<TravelersTab> {
  List<TravelerPreset> _presets = [];

  @override
  void initState() {
    super.initState();
    _loadPresets();
  }

  void _loadPresets() {
    _presets = List.from(
      ref.read(settingsStoreNotifierProvider).state.travelerPresets,
    );
    setState(() {});
  }

  void _addPreset() {
    final newPreset = TravelerPreset(
      id: 'preset_${DateTime.now().millisecondsSinceEpoch}',
      name: 'New Preset',
      adults: 2,
    );
    setState(() => _presets.add(newPreset));
    widget.onChanged();
    _showEditDialog(newPreset, _presets.length - 1);
  }

  void _editPreset(int index) {
    _showEditDialog(_presets[index], index);
  }

  void _deletePreset(int index) {
    setState(() => _presets.removeAt(index));
    widget.onChanged();
  }

  void _setDefault(int index) {
    setState(() {
      _presets = _presets.asMap().entries.map((e) {
        return e.value.copyWith(isDefault: e.key == index);
      }).toList();
    });
    widget.onChanged();
  }

  Future<void> _showEditDialog(TravelerPreset preset, int index) async {
    final result = await showDialog<TravelerPreset>(
      context: context,
      builder: (context) => _PresetEditDialog(preset: preset),
    );
    if (result != null) {
      setState(() => _presets[index] = result);
      widget.onChanged();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: _presets.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.group_add, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'No traveler presets',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      const Text('Create presets for quick itinerary setup'),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _presets.length,
                  itemBuilder: (context, index) {
                    final preset = _presets[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: preset.isDefault
                              ? theme.colorScheme.primaryContainer
                              : theme.colorScheme.surfaceContainerHighest,
                          child: Icon(
                            Icons.group,
                            color: preset.isDefault
                                ? theme.colorScheme.primary
                                : Colors.grey,
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(preset.name),
                            if (preset.isDefault) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Default',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        subtitle: Text(_formatPartyDescription(preset)),
                        trailing: PopupMenuButton<String>(
                          onSelected: (action) {
                            switch (action) {
                              case 'edit':
                                _editPreset(index);
                              case 'default':
                                _setDefault(index);
                              case 'delete':
                                _deletePreset(index);
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem(
                              value: 'default',
                              child: Text('Set as Default'),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        onTap: () => _editPreset(index),
                      ),
                    );
                  },
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: _addPreset,
            icon: const Icon(Icons.add),
            label: const Text('Add Preset'),
          ),
        ),
      ],
    );
  }

  String _formatPartyDescription(TravelerPreset preset) {
    final parts = <String>[];
    parts.add('${preset.adults} adult${preset.adults == 1 ? '' : 's'}');
    if (preset.childAges.isNotEmpty) {
      parts.add(
        '${preset.childAges.length} child${preset.childAges.length == 1 ? '' : 'ren'}',
      );
    }
    return parts.join(', ');
  }
}

class _PresetEditDialog extends StatefulWidget {
  final TravelerPreset preset;

  const _PresetEditDialog({required this.preset});

  @override
  State<_PresetEditDialog> createState() => _PresetEditDialogState();
}

class _PresetEditDialogState extends State<_PresetEditDialog> {
  late TextEditingController _nameController;
  late int _adults;
  late List<int> _childAges;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.preset.name);
    _adults = widget.preset.adults;
    _childAges = List.from(widget.preset.childAges);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _addChild() {
    setState(() => _childAges.add(5));
  }

  void _removeChild(int index) {
    setState(() => _childAges.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Preset'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Preset Name'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Adults: '),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _adults > 1
                      ? () => setState(() => _adults--)
                      : null,
                ),
                Text('$_adults'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => _adults++),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Children'),
                TextButton.icon(
                  onPressed: _addChild,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Add'),
                ),
              ],
            ),
            ..._childAges.asMap().entries.map(
              (e) => Row(
                children: [
                  Text('Child ${e.key + 1} age: '),
                  DropdownButton<int>(
                    value: e.value,
                    items: List.generate(
                      18,
                      (i) => DropdownMenuItem(value: i, child: Text('$i')),
                    ),
                    onChanged: (v) {
                      if (v != null) {
                        setState(() => _childAges[e.key] = v);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    onPressed: () => _removeChild(e.key),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop(
              widget.preset.copyWith(
                name: _nameController.text,
                adults: _adults,
                childAges: _childAges,
              ),
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
