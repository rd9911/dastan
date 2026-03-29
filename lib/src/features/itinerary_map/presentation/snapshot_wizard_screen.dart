import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/itinerary_map/domain/map_models.dart';

class SnapshotWizardScreen extends ConsumerStatefulWidget {
  final MapState mapState;

  const SnapshotWizardScreen({super.key, required this.mapState});

  @override
  ConsumerState<SnapshotWizardScreen> createState() =>
      _SnapshotWizardScreenState();
}

class _SnapshotWizardScreenState extends ConsumerState<SnapshotWizardScreen> {
  int _currentStep = 0;
  MapTheme _selectedTheme = MapTheme.standard;
  final Set<String> _selectedHighlights = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Share Snapshot')),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep++);
          } else {
            _generateSnapshot();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          } else {
            Navigator.of(context).pop();
          }
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                FilledButton(
                  onPressed: details.onStepContinue,
                  child: Text(_currentStep == 2 ? 'Share' : 'Next'),
                ),
                if (_currentStep > 0) ...[
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('Back'),
                  ),
                ],
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Theme'),
            content: _buildThemeStep(),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Highlights'),
            content: _buildHighlightsStep(),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Preview'),
            content: _buildPreviewStep(),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeStep() {
    return Column(
      children: MapTheme.values.map((theme) {
        final isSelected = _selectedTheme == theme;
        return ListTile(
          title: Text(theme.name.toUpperCase()),
          leading: Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: isSelected ? Theme.of(context).colorScheme.primary : null,
          ),
          onTap: () => setState(() => _selectedTheme = theme),
        );
      }).toList(),
    );
  }

  Widget _buildHighlightsStep() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: widget.mapState.items.length,
        itemBuilder: (context, index) {
          final item = widget.mapState.items[index];
          final isSelected = _selectedHighlights.contains(item.id);
          return CheckboxListTile(
            title: Text(item.title),
            subtitle: Text(item.type.name),
            value: isSelected,
            onChanged: (v) {
              setState(() {
                if (v == true) {
                  if (_selectedHighlights.length < 5) {
                    _selectedHighlights.add(item.id);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Max 5 highlights')),
                    );
                  }
                } else {
                  _selectedHighlights.remove(item.id);
                }
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildPreviewStep() {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: _selectedTheme == MapTheme.dark
                ? Colors.grey[900]
                : Colors.blue[50],
            child: const Center(
              child: Icon(Icons.map, size: 64, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('${_selectedHighlights.length} items highlighted'),
      ],
    );
  }

  void _generateSnapshot() {
    // Determine bounds, etc.
    // Call snapshotService.generate(...)
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Generating snapshot...')));
    // Simulate
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) Navigator.of(context).pop();
    });
  }
}
