import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dastan/src/features/itineraries/presentation/active_itinerary_controller.dart';
import 'package:dastan/src/core/domain/itinerary.dart';

/// A guard widget that ensures an Active Itinerary exists before showing content.
///
/// If no active itinerary exists, shows a blocking UI prompting the user to
/// select or create one. Once an itinerary is active, builds the child with
/// the itinerary context.
class ActiveItineraryGuard extends ConsumerWidget {
  /// Builder that receives the active itinerary when available.
  final Widget Function(BuildContext context, Itinerary itinerary) builder;

  /// Optional title for the guard screen.
  final String? title;

  /// Optional message explaining why an itinerary is required.
  final String? message;

  const ActiveItineraryGuard({
    super.key,
    required this.builder,
    this.title,
    this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeItineraryAsync = ref.watch(activeItineraryControllerProvider);

    return activeItineraryAsync.when(
      data: (itinerary) {
        if (itinerary == null) {
          return _NoActiveItineraryScreen(title: title, message: message);
        }
        return builder(context, itinerary);
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.invalidate(activeItineraryControllerProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoActiveItineraryScreen extends StatelessWidget {
  final String? title;
  final String? message;

  const _NoActiveItineraryScreen({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title ?? 'Active Itinerary Required')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.travel_explore, size: 80, color: Colors.grey),
              const SizedBox(height: 24),
              Text(
                message ?? 'Please select or create an itinerary to continue.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/'),
                  icon: const Icon(Icons.list_alt),
                  label: const Text('Select Itinerary'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => context.push('/create-itinerary'),
                  icon: const Icon(Icons.add),
                  label: const Text('Create New Itinerary'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
