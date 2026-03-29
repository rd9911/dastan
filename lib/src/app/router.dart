import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/itineraries/presentation/itinerary_hub_screen.dart';
import '../features/itineraries/presentation/create_itinerary_screen.dart';
import '../features/itineraries/presentation/itinerary_overview_screen.dart';

import '../features/transport/presentation/transport_search_screen.dart';
import '../features/accommodation/presentation/accommodation_search_screen.dart';
import '../features/events/presentation/events_search_screen.dart';
import '../features/trails/presentation/trails_search_screen.dart';
import '../features/entertainment/presentation/entertainment_search_screen.dart';
import '../features/gastronomy/presentation/gastronomy_search_screen.dart';
import '../features/itinerary_map/presentation/itinerary_map_screen.dart';
import '../features/search/presentation/search_screen.dart';
import '../features/map/presentation/map_screen.dart';
import '../features/planner/presentation/planner_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/admin/presentation/admin_console_screen.dart';
import '../core/domain/itinerary.dart';
import '../features/tours/presentation/country_browse/country_browse_screen.dart';
import '../features/tours/presentation/city_tours/city_tours_screen.dart';
import '../features/tours/presentation/tour_detail/tour_detail_screen.dart';
import '../features/tours/presentation/guided_tour/guided_tour_screen.dart';
import '../features/tours/presentation/saved_tours/saved_tours_screen.dart';
import '../features/tours/presentation/saved_tours/saved_city_tours_screen.dart';
import '../features/tours/presentation/creator_editor/creator_dashboard_screen.dart';
import '../features/tours/presentation/creator_editor/tour_editor_screen.dart';
import '../features/auth/presentation/auth_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Itinerary Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const ItineraryHubScreen(),
                routes: [
                  GoRoute(
                    path: 'create-itinerary',
                    builder: (context, state) => CreateItineraryScreen(
                      itinerary: state.extra as Itinerary?,
                    ),
                  ),
                  GoRoute(
                    path: 'itinerary/:id',
                    builder: (context, state) =>
                        const ItineraryOverviewScreen(),
                    routes: [
                      GoRoute(
                        path: 'planner',
                        builder: (context, state) => const PlannerScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Search Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                builder: (context, state) => const SearchScreen(),
                routes: [
                  GoRoute(
                    path: 'transport',
                    builder: (context, state) => const TransportSearchScreen(),
                  ),
                  GoRoute(
                    path: 'accommodation',
                    builder: (context, state) =>
                        const AccommodationSearchScreen(),
                  ),
                  GoRoute(
                    path: 'events',
                    builder: (context, state) => const EventsSearchScreen(),
                  ),
                  GoRoute(
                    path: 'trails',
                    builder: (context, state) => const TrailsSearchScreen(),
                  ),
                  GoRoute(
                    path: 'map',
                    builder: (context, state) => const ItineraryMapScreen(),
                  ),
                  GoRoute(
                    path: 'entertainment',
                    builder: (context, state) =>
                        const EntertainmentSearchScreen(),
                  ),
                  GoRoute(
                    path: 'gastronomy',
                    builder: (context, state) => const GastronomySearchScreen(),
                  ),
                ],
              ),
            ],
          ),
          // Map Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/map',
                builder: (context, state) => const MapScreen(),
              ),
            ],
          ),
          // Tours Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/tours',
                name: 'countryBrowse',
                builder: (context, state) => const CountryBrowseScreen(),
                routes: [
                  GoRoute(
                    path: 'city/:cityId',
                    name: 'cityTours',
                    builder: (context, state) => CityToursScreen(
                      cityId: state.pathParameters['cityId']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'tour/:tourId',
                        name: 'tourDetail',
                        builder: (context, state) => TourDetailScreen(
                          tourId: state.pathParameters['tourId']!,
                        ),
                        routes: [
                          GoRoute(
                            path: 'play',
                            name: 'guidedTour',
                            builder: (context, state) => GuidedTourScreen(
                              tourId: state.pathParameters['tourId']!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'saved',
                    name: 'savedTours',
                    builder: (context, state) => const SavedToursScreen(),
                    routes: [
                      GoRoute(
                        path: ':cityId',
                        name: 'savedCityTours',
                        builder: (context, state) => SavedCityToursScreen(
                          cityId: state.pathParameters['cityId']!,
                        ),
                        routes: [
                          GoRoute(
                            path: 'tour/:tourId',
                            name: 'savedTourDetail',
                            builder: (context, state) => TourDetailScreen(
                              tourId: state.pathParameters['tourId']!,
                              isSaved: true,
                            ),
                            routes: [
                              GoRoute(
                                path: 'play',
                                name: 'savedGuidedTour',
                                builder: (context, state) => GuidedTourScreen(
                                  tourId: state.pathParameters['tourId']!,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Settings Tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      // Admin Console - Separate route (not in bottom nav)
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminConsoleScreen(),
      ),
      // Creator Editor - Web-only routes (not in bottom nav)
      GoRoute(
        path: '/creator',
        name: 'creatorDashboard',
        builder: (context, state) => const CreatorDashboardScreen(),
        routes: [
          GoRoute(
            path: 'new',
            name: 'creatorEditor',
            builder: (context, state) => const TourEditorScreen(),
          ),
          GoRoute(
            path: ':tourId/edit',
            name: 'creatorEditorEdit',
            builder: (context, state) => TourEditorScreen(
              tourId: state.pathParameters['tourId'],
            ),
          ),
        ],
      ),
      // Auth route
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );
}

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: 'Itinerary'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(
            icon: Icon(Icons.headphones_outlined),
            selectedIcon: Icon(Icons.headphones),
            label: 'Tours',
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
