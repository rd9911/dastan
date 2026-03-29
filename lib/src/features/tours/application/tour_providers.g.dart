// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tourRemoteDataSource)
const tourRemoteDataSourceProvider = TourRemoteDataSourceProvider._();

final class TourRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          TourRemoteDataSource,
          TourRemoteDataSource,
          TourRemoteDataSource
        >
    with $Provider<TourRemoteDataSource> {
  const TourRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tourRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tourRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TourRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TourRemoteDataSource create(Ref ref) {
    return tourRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TourRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TourRemoteDataSource>(value),
    );
  }
}

String _$tourRemoteDataSourceHash() =>
    r'a40b56f221cadd003fef81290e6f1cdfb293ae74';

@ProviderFor(tourLocalDataSource)
const tourLocalDataSourceProvider = TourLocalDataSourceProvider._();

final class TourLocalDataSourceProvider
    extends
        $FunctionalProvider<
          TourLocalDataSource,
          TourLocalDataSource,
          TourLocalDataSource
        >
    with $Provider<TourLocalDataSource> {
  const TourLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tourLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tourLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<TourLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TourLocalDataSource create(Ref ref) {
    return tourLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TourLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TourLocalDataSource>(value),
    );
  }
}

String _$tourLocalDataSourceHash() =>
    r'8499723ea54d54492461731289e17405a5b5eef1';

@ProviderFor(tourRepository)
const tourRepositoryProvider = TourRepositoryProvider._();

final class TourRepositoryProvider
    extends $FunctionalProvider<TourRepository, TourRepository, TourRepository>
    with $Provider<TourRepository> {
  const TourRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tourRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tourRepositoryHash();

  @$internal
  @override
  $ProviderElement<TourRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TourRepository create(Ref ref) {
    return tourRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TourRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TourRepository>(value),
    );
  }
}

String _$tourRepositoryHash() => r'f6ac2356ca67b940eff28abdb86510fae762af83';

@ProviderFor(countries)
const countriesProvider = CountriesProvider._();

final class CountriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Country>>,
          List<Country>,
          FutureOr<List<Country>>
        >
    with $FutureModifier<List<Country>>, $FutureProvider<List<Country>> {
  const CountriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Country>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Country>> create(Ref ref) {
    return countries(ref);
  }
}

String _$countriesHash() => r'97eb7aee7db8522a460037bef090baa6067d1904';

@ProviderFor(SelectedCountryIndex)
const selectedCountryIndexProvider = SelectedCountryIndexProvider._();

final class SelectedCountryIndexProvider
    extends $NotifierProvider<SelectedCountryIndex, int> {
  const SelectedCountryIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCountryIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCountryIndexHash();

  @$internal
  @override
  SelectedCountryIndex create() => SelectedCountryIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$selectedCountryIndexHash() =>
    r'8fb07f98ecd3414dcd8c50133021685a4115a352';

abstract class _$SelectedCountryIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(toursForCity)
const toursForCityProvider = ToursForCityFamily._();

final class ToursForCityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TourSummary>>,
          List<TourSummary>,
          FutureOr<List<TourSummary>>
        >
    with
        $FutureModifier<List<TourSummary>>,
        $FutureProvider<List<TourSummary>> {
  const ToursForCityProvider._({
    required ToursForCityFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'toursForCityProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$toursForCityHash();

  @override
  String toString() {
    return r'toursForCityProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TourSummary>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TourSummary>> create(Ref ref) {
    final argument = this.argument as String;
    return toursForCity(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ToursForCityProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$toursForCityHash() => r'2dea07dc0aec1378a1f423012032b8d619b2e6f9';

final class ToursForCityFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TourSummary>>, String> {
  const ToursForCityFamily._()
    : super(
        retry: null,
        name: r'toursForCityProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ToursForCityProvider call(String cityId) =>
      ToursForCityProvider._(argument: cityId, from: this);

  @override
  String toString() => r'toursForCityProvider';
}

@ProviderFor(SelectedCategoryFilter)
const selectedCategoryFilterProvider = SelectedCategoryFilterProvider._();

final class SelectedCategoryFilterProvider
    extends $NotifierProvider<SelectedCategoryFilter, String?> {
  const SelectedCategoryFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryFilterHash();

  @$internal
  @override
  SelectedCategoryFilter create() => SelectedCategoryFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$selectedCategoryFilterHash() =>
    r'abc5c1bd4cc284b393c0aaed0a08e159b202f37e';

abstract class _$SelectedCategoryFilter extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(filteredToursForCity)
const filteredToursForCityProvider = FilteredToursForCityFamily._();

final class FilteredToursForCityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TourSummary>>,
          AsyncValue<List<TourSummary>>,
          AsyncValue<List<TourSummary>>
        >
    with $Provider<AsyncValue<List<TourSummary>>> {
  const FilteredToursForCityProvider._({
    required FilteredToursForCityFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'filteredToursForCityProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredToursForCityHash();

  @override
  String toString() {
    return r'filteredToursForCityProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<List<TourSummary>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<TourSummary>> create(Ref ref) {
    final argument = this.argument as String;
    return filteredToursForCity(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<TourSummary>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<TourSummary>>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredToursForCityProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredToursForCityHash() =>
    r'0cc4d8b3cfb71ba312bfbb1f83de5cdaa9a561ac';

final class FilteredToursForCityFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<List<TourSummary>>, String> {
  const FilteredToursForCityFamily._()
    : super(
        retry: null,
        name: r'filteredToursForCityProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredToursForCityProvider call(String cityId) =>
      FilteredToursForCityProvider._(argument: cityId, from: this);

  @override
  String toString() => r'filteredToursForCityProvider';
}

@ProviderFor(tourDetail)
const tourDetailProvider = TourDetailFamily._();

final class TourDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<TourDetail>,
          TourDetail,
          FutureOr<TourDetail>
        >
    with $FutureModifier<TourDetail>, $FutureProvider<TourDetail> {
  const TourDetailProvider._({
    required TourDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'tourDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tourDetailHash();

  @override
  String toString() {
    return r'tourDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TourDetail> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<TourDetail> create(Ref ref) {
    final argument = this.argument as String;
    return tourDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TourDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tourDetailHash() => r'3e7bfd58ead89be77d721e8cc11764d6969c0a3e';

final class TourDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TourDetail>, String> {
  const TourDetailFamily._()
    : super(
        retry: null,
        name: r'tourDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TourDetailProvider call(String tourId) =>
      TourDetailProvider._(argument: tourId, from: this);

  @override
  String toString() => r'tourDetailProvider';
}

@ProviderFor(savedTours)
const savedToursProvider = SavedToursProvider._();

final class SavedToursProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SavedTour>>,
          List<SavedTour>,
          FutureOr<List<SavedTour>>
        >
    with $FutureModifier<List<SavedTour>>, $FutureProvider<List<SavedTour>> {
  const SavedToursProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedToursProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedToursHash();

  @$internal
  @override
  $FutureProviderElement<List<SavedTour>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SavedTour>> create(Ref ref) {
    return savedTours(ref);
  }
}

String _$savedToursHash() => r'8875f23bf1004b54fb34e97036c41bbb0abe62d3';

@ProviderFor(savedTourClusters)
const savedTourClustersProvider = SavedTourClustersProvider._();

final class SavedTourClustersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SavedTourCluster>>,
          List<SavedTourCluster>,
          FutureOr<List<SavedTourCluster>>
        >
    with
        $FutureModifier<List<SavedTourCluster>>,
        $FutureProvider<List<SavedTourCluster>> {
  const SavedTourClustersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedTourClustersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedTourClustersHash();

  @$internal
  @override
  $FutureProviderElement<List<SavedTourCluster>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SavedTourCluster>> create(Ref ref) {
    return savedTourClusters(ref);
  }
}

String _$savedTourClustersHash() => r'7dc5babb3d40b1af502fb9d57b19140da0e0f52b';

@ProviderFor(isTourSaved)
const isTourSavedProvider = IsTourSavedFamily._();

final class IsTourSavedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const IsTourSavedProvider._({
    required IsTourSavedFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isTourSavedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isTourSavedHash();

  @override
  String toString() {
    return r'isTourSavedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return isTourSaved(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsTourSavedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isTourSavedHash() => r'e4167976c7764ea3cdc3b3b069218fa077b87c92';

final class IsTourSavedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  const IsTourSavedFamily._()
    : super(
        retry: null,
        name: r'isTourSavedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsTourSavedProvider call(String tourId) =>
      IsTourSavedProvider._(argument: tourId, from: this);

  @override
  String toString() => r'isTourSavedProvider';
}

@ProviderFor(tourPlaybackProgress)
const tourPlaybackProgressProvider = TourPlaybackProgressFamily._();

final class TourPlaybackProgressProvider
    extends
        $FunctionalProvider<
          AsyncValue<PlaybackProgress?>,
          PlaybackProgress?,
          FutureOr<PlaybackProgress?>
        >
    with
        $FutureModifier<PlaybackProgress?>,
        $FutureProvider<PlaybackProgress?> {
  const TourPlaybackProgressProvider._({
    required TourPlaybackProgressFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'tourPlaybackProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tourPlaybackProgressHash();

  @override
  String toString() {
    return r'tourPlaybackProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PlaybackProgress?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PlaybackProgress?> create(Ref ref) {
    final argument = this.argument as String;
    return tourPlaybackProgress(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TourPlaybackProgressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tourPlaybackProgressHash() =>
    r'65572ab608a56baa93b400273ac024ef6615ecca';

final class TourPlaybackProgressFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PlaybackProgress?>, String> {
  const TourPlaybackProgressFamily._()
    : super(
        retry: null,
        name: r'tourPlaybackProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TourPlaybackProgressProvider call(String tourId) =>
      TourPlaybackProgressProvider._(argument: tourId, from: this);

  @override
  String toString() => r'tourPlaybackProgressProvider';
}

@ProviderFor(tourCategories)
const tourCategoriesProvider = TourCategoriesProvider._();

final class TourCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TourCategory>>,
          List<TourCategory>,
          FutureOr<List<TourCategory>>
        >
    with
        $FutureModifier<List<TourCategory>>,
        $FutureProvider<List<TourCategory>> {
  const TourCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tourCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tourCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<TourCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TourCategory>> create(Ref ref) {
    return tourCategories(ref);
  }
}

String _$tourCategoriesHash() => r'db4a061ece7090c0a6b0b9267d119fa1d28929f3';

@ProviderFor(tourProgressService)
const tourProgressServiceProvider = TourProgressServiceProvider._();

final class TourProgressServiceProvider
    extends
        $FunctionalProvider<
          TourProgressService,
          TourProgressService,
          TourProgressService
        >
    with $Provider<TourProgressService> {
  const TourProgressServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tourProgressServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tourProgressServiceHash();

  @$internal
  @override
  $ProviderElement<TourProgressService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TourProgressService create(Ref ref) {
    return tourProgressService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TourProgressService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TourProgressService>(value),
    );
  }
}

String _$tourProgressServiceHash() =>
    r'8d43bc5cd4b26ede8abab6863829d8565f95c43f';

@ProviderFor(tourPurchaseService)
const tourPurchaseServiceProvider = TourPurchaseServiceProvider._();

final class TourPurchaseServiceProvider
    extends
        $FunctionalProvider<
          TourPurchaseService,
          TourPurchaseService,
          TourPurchaseService
        >
    with $Provider<TourPurchaseService> {
  const TourPurchaseServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tourPurchaseServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tourPurchaseServiceHash();

  @$internal
  @override
  $ProviderElement<TourPurchaseService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TourPurchaseService create(Ref ref) {
    return tourPurchaseService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TourPurchaseService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TourPurchaseService>(value),
    );
  }
}

String _$tourPurchaseServiceHash() =>
    r'74085d98ef5515d0b166a704dc2ea21c532bc32f';
