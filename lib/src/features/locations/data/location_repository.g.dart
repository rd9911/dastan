// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the Photon data source.

@ProviderFor(photonDataSource)
const photonDataSourceProvider = PhotonDataSourceProvider._();

/// Provider for the Photon data source.

final class PhotonDataSourceProvider
    extends
        $FunctionalProvider<
          PhotonDataSource,
          PhotonDataSource,
          PhotonDataSource
        >
    with $Provider<PhotonDataSource> {
  /// Provider for the Photon data source.
  const PhotonDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'photonDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$photonDataSourceHash();

  @$internal
  @override
  $ProviderElement<PhotonDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PhotonDataSource create(Ref ref) {
    return photonDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PhotonDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PhotonDataSource>(value),
    );
  }
}

String _$photonDataSourceHash() => r'5897238aa89f27a42472b716e607094c922a9b8a';

/// Provider for the location cache.

@ProviderFor(locationCache)
const locationCacheProvider = LocationCacheProvider._();

/// Provider for the location cache.

final class LocationCacheProvider
    extends $FunctionalProvider<LocationCache, LocationCache, LocationCache>
    with $Provider<LocationCache> {
  /// Provider for the location cache.
  const LocationCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationCacheProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationCacheHash();

  @$internal
  @override
  $ProviderElement<LocationCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationCache create(Ref ref) {
    return locationCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationCache>(value),
    );
  }
}

String _$locationCacheHash() => r'c26633ff0e46812c229f60667476269dd3bbd39b';

/// Provider for the location repository.

@ProviderFor(locationRepository)
const locationRepositoryProvider = LocationRepositoryProvider._();

/// Provider for the location repository.

final class LocationRepositoryProvider
    extends
        $FunctionalProvider<
          LocationRepository,
          LocationRepository,
          LocationRepository
        >
    with $Provider<LocationRepository> {
  /// Provider for the location repository.
  const LocationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocationRepository create(Ref ref) {
    return locationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationRepository>(value),
    );
  }
}

String _$locationRepositoryHash() =>
    r'0f8b64affef90dfa83d7c6b9e25bd8c255524e3d';
