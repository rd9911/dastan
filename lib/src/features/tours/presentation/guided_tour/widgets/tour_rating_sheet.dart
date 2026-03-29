import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/supabase_auth_service.dart';

class TourRatingSheet extends ConsumerStatefulWidget {
  final String tourId;
  const TourRatingSheet({super.key, required this.tourId});

  @override
  ConsumerState<TourRatingSheet> createState() => _TourRatingSheetState();

  static Future<void> show(BuildContext context, String tourId) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: TourRatingSheet(tourId: tourId),
      ),
    );
  }
}

class _TourRatingSheetState extends ConsumerState<TourRatingSheet> {
  int _rating = 0;
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('How was your tour?', style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                iconSize: 40,
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () => setState(() => _rating = index + 1),
              );
            }),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _reviewController,
            decoration: const InputDecoration(
              labelText: 'Write a review (optional)',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              if (_rating == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a rating')),
                );
                return;
              }
              
              final userId = ref.read(supabaseAuthServiceProvider.notifier).currentUser?.id;
              if (userId == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please log in to submit a rating')),
                );
                return;
              }

              try {
                // Upsert rating in tour_ratings table (handles both insert and update if user already rated)
                await ref.read(supabaseClientProvider).from('tour_ratings').upsert({
                  'tour_id': widget.tourId,
                  'user_id': userId,
                  'rating': _rating,
                  'review_text': _reviewController.text.isNotEmpty ? _reviewController.text : null,
                  'created_at': DateTime.now().toIso8601String(),
                });
                
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Thank you for your review!')),
                  );
                  Navigator.of(context).pop();
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to submit rating: $e')),
                  );
                }
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
