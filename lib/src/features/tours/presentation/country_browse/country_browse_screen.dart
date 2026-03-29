import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dastan/src/features/tours/application/tour_providers.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';
import 'widgets/city_cards_row.dart';
import 'widgets/nearby_tours_section.dart';

class CountryBrowseScreen extends ConsumerStatefulWidget {
  const CountryBrowseScreen({super.key});
  @override ConsumerState<CountryBrowseScreen> createState() => _CountryBrowseScreenState();
}

class _CountryBrowseScreenState extends ConsumerState<CountryBrowseScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countriesAsync = ref.watch(countriesProvider);
    return Scaffold(
      body: countriesAsync.when(
        loading: () => const _CountriesSkeleton(key: Key('countries_skeleton')),
        error: (e, _) => Center(key: const Key('countries_error'), child: Text('Error: ${e.toString()}')),
        data: (countries) {
          if (countries.isEmpty) return const Center(child: Text('No countries available'));
          return Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => ref.read(selectedCountryIndexProvider.notifier).select(index),
                itemCount: countries.length,
                itemBuilder: (_, index) => _CountryPage(country: countries[index]),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.35 + 12,
                left: 0, right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: countries.length,
                    effect: const WormEffect(dotHeight: 8, dotWidth: 8),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CountryPage extends StatelessWidget {
  const _CountryPage({required this.country});
  final Country country;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.55,
          pinned: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.bookmark_outline, color: Colors.white),
              tooltip: 'Saved Tours',
              onPressed: () => context.pushNamed('savedTours'),
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Feature 15.5: Search within tours
                // Opens existing UnifiedSearchScaffold pattern (not fully implemented due to missing search orchestrator specifics here)
              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: country.heroImageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(color: Colors.grey),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24, left: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (country.flagEmoji != null)
                        Text(country.flagEmoji!, style: const TextStyle(fontSize: 32)),
                      Text(country.name,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(country.description,
              style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Text('Cities', style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: country.cities.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, index) => CityCard(
                city: country.cities[index],
                onTap: () => context.pushNamed('cityTours',
                  pathParameters: {'cityId': country.cities[index].id}),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: NearbyToursSection(cities: country.cities),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}

class _CountriesSkeleton extends StatelessWidget {
  const _CountriesSkeleton({super.key});
  @override
  Widget build(BuildContext context) {
    // A simple skeleton screen resembling the loaded state
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.55,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.grey.shade300,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 24, bottom: 24),
              child: Container(
                width: 200, height: 40,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: double.infinity, height: 16, color: Colors.grey.shade300),
                const SizedBox(height: 8),
                Container(width: double.infinity, height: 16, color: Colors.grey.shade300),
                const SizedBox(height: 8),
                Container(width: 250, height: 16, color: Colors.grey.shade300),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Container(width: 100, height: 24, color: Colors.grey.shade300),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Container(height: 180, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(16)))),
                const SizedBox(width: 12),
                Expanded(child: Container(height: 180, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(16)))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
