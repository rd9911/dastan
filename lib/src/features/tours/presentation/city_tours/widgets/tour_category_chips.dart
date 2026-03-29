import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';

class TourCategoryChips extends ConsumerWidget {
  const TourCategoryChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(tourCategoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryFilterProvider);

    return SizedBox(
      height: 50,
      child: categoriesAsync.when(
        data: (categories) {
          if (categories.isEmpty) return const SizedBox.shrink();

          return ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: const Text('All'),
                  selected: selectedCategory == null,
                  onSelected: (_) {
                    ref.read(selectedCategoryFilterProvider.notifier).state = null;
                  },
                ),
              ),
              ...categories.map((cat) {
                final isSelected = selectedCategory == cat.id;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(cat.name),
                    selected: isSelected,
                    onSelected: (_) {
                      ref.read(selectedCategoryFilterProvider.notifier).state = cat.id;
                    },
                  ),
                );
              }),
            ],
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }
}
