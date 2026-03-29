import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/itinerary_service.dart';
import 'active_itinerary_controller.dart';

import '../../../core/domain/itinerary.dart';

class CreateItineraryScreen extends ConsumerStatefulWidget {
  final Itinerary? itinerary;
  const CreateItineraryScreen({super.key, this.itinerary});

  @override
  ConsumerState<CreateItineraryScreen> createState() =>
      _CreateItineraryScreenState();
}

class _CreateItineraryScreenState extends ConsumerState<CreateItineraryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _destinationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.itinerary != null) {
      _titleController.text = widget.itinerary!.title;
      _destinationController.text = widget.itinerary!.destination ?? '';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    if (_formKey.currentState!.validate()) {
      final service = ref.read(itineraryServiceProvider);
      Itinerary itinerary;
      if (widget.itinerary != null) {
        itinerary = widget.itinerary!.copyWith(
          title: _titleController.text,
          destination: _destinationController.text.isEmpty
              ? widget.itinerary!.destination
              : _destinationController.text,
        );
        await service.updateItinerary(itinerary);
      } else {
        itinerary = await service.createItinerary(
          title: _titleController.text,
          destination: _destinationController.text.isEmpty
              ? null
              : _destinationController.text,
        );
      }

      if (mounted) {
        await ref
            .read(activeItineraryControllerProvider.notifier)
            .setActiveItinerary(itinerary);
        // If editing, we just pop. If creating, we assumed we go to details.
        // But if we are editing, we are likely pushed from details, so pop is correct.
        // However, existing logic was: context.go('/itinerary/${itinerary.id}');
        if (mounted) {
          if (widget.itinerary != null) {
            context.pop();
          } else {
            context.go('/itinerary/${itinerary.id}');
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.itinerary != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Itinerary' : 'Create Itinerary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title *'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _destinationController,
                decoration: const InputDecoration(labelText: 'Destination'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _create,
                child: Text(isEditing ? 'Save Changes' : 'Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
