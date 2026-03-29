import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';
import 'package:dastan/src/core/data/supabase_client.dart';
import 'package:dastan/src/core/data/database_provider.dart';
import 'package:dastan/src/features/tours/data/tour_remote_data_source.dart';
import 'package:dastan/src/features/tours/data/tour_local_data_source.dart';
import 'package:dastan/src/features/tours/data/tour_repository.dart';
import 'package:dastan/src/features/tours/application/tour_services.dart';
import 'package:dastan/src/core/data/supabase_auth_service.dart';

part 'tour_providers.g.dart';

@riverpod
TourRemoteDataSource tourRemoteDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return TourRemoteDataSource(client);
}

@riverpod
TourLocalDataSource tourLocalDataSource(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return TourLocalDataSource(db);
}

@riverpod
TourRepository tourRepository(Ref ref) {
  final remote = ref.watch(tourRemoteDataSourceProvider);
  final local = ref.watch(tourLocalDataSourceProvider);
  return TourRepository(remote, local);
}

// ─── DATA PROVIDERS ───

@riverpod
Future<List<Country>> countries(Ref ref) async {
  return ref.watch(tourRepositoryProvider).getCountries();
}

@riverpod
class SelectedCountryIndex extends _$SelectedCountryIndex {
  @override int build() => 0;
  void select(int index) => state = index;
  void next(int total) { if (state < total - 1) state++; }
  void prev() { if (state > 0) state--; }
}

@riverpod
Future<List<TourSummary>> toursForCity(Ref ref, String cityId) async {
  return ref.watch(tourRepositoryProvider).getToursByCity(cityId);
}

@riverpod
class SelectedCategoryFilter extends _$SelectedCategoryFilter {
  @override String? build() => null;   // null = show all
  void select(String? categoryId) => state = categoryId;
}

@riverpod
AsyncValue<List<TourSummary>> filteredToursForCity(Ref ref, String cityId) {
  final tours = ref.watch(toursForCityProvider(cityId));
  final selectedCategory = ref.watch(selectedCategoryFilterProvider);
  return tours.whenData((list) {
    if (selectedCategory == null) return list;
    return list.where((t) => t.categories.any((c) => c.id == selectedCategory)).toList();
  });
}

@riverpod
Future<TourDetail> tourDetail(Ref ref, String tourId) async {
  return ref.watch(tourRepositoryProvider).getTourDetail(tourId);
}

// ─── SAVED TOURS PROVIDERS ───

@riverpod
Future<List<SavedTour>> savedTours(Ref ref) async {
  final authState = ref.watch(supabaseAuthServiceProvider);
  final userId = authState.value?.session?.user.id;
  if (userId == null) return [];
  return ref.watch(tourRepositoryProvider).getSavedTours(userId);
}

@riverpod
Future<List<SavedTourCluster>> savedTourClusters(Ref ref) async {
  final tours = await ref.watch(savedToursProvider.future);
  return _clusterByCityAndSort(tours);
}

List<SavedTourCluster> _clusterByCityAndSort(List<SavedTour> tours) {
  final Map<String, List<SavedTour>> grouped = {};
  for (final t in tours) {
    if (t.tourSummary != null) {
      final cityId = t.tourSummary!.cityId;
      grouped.putIfAbsent(cityId, () => []).add(t);
    }
  }
  // Sort each group by lastOpenedAt desc
  final clusters = grouped.entries.map((e) {
    final sorted = e.value
      ..sort((a, b) => (b.lastOpenedAt ?? b.savedAt).compareTo(a.lastOpenedAt ?? a.savedAt));
    if (sorted.first.tourSummary == null) return null;
    return SavedTourCluster(
      city: City(
        id: e.key,
        countryId: '',
        name: sorted.first.tourSummary!.cityId, // Just setting cityId as name for now unless we look up cities
        description: '',
        heroImageUrl: '',
        sortOrder: 0,
      ),
      tours: sorted,
      mostRecentOpenedAt: sorted.first.lastOpenedAt ?? sorted.first.savedAt,
    );
  }).whereType<SavedTourCluster>().toList();
  clusters.sort((a, b) => b.mostRecentOpenedAt.compareTo(a.mostRecentOpenedAt));
  return clusters;
}

@riverpod
Future<bool> isTourSaved(Ref ref, String tourId) async {
  try {
    final saved = await ref.watch(savedToursProvider.future);
    return saved.any((t) => t.tourId == tourId);
  } catch (_) {
    return false;
  }
}

// ─── PLAYBACK PROGRESS PROVIDERS ───

@riverpod
Future<PlaybackProgress?> tourPlaybackProgress(Ref ref, String tourId) async {
  final authState = ref.watch(supabaseAuthServiceProvider);
  final userId = authState.value?.session?.user.id;
  if (userId == null) return null;
  return ref.watch(tourRepositoryProvider).getPlaybackProgress(userId, tourId);
}

// ─── CATEGORIES PROVIDER ───
@riverpod
Future<List<TourCategory>> tourCategories(Ref ref) async {
  // A mock list or a repository call here
  return [];
}

// ─── TOUR PROGRESS SERVICE PROVIDER ───
@riverpod
TourProgressService tourProgressService(Ref ref) {
  return TourProgressService(ref.watch(tourRepositoryProvider));
}

@riverpod
TourPurchaseService tourPurchaseService(Ref ref) {
  return TourPurchaseService(ref.watch(tourRepositoryProvider));
}
