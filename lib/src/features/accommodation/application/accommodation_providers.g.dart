// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the Drift database instance.

@ProviderFor(accommodationDatabase)
const accommodationDatabaseProvider = AccommodationDatabaseProvider._();

/// Provider for the Drift database instance.

final class AccommodationDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// Provider for the Drift database instance.
  const AccommodationDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accommodationDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accommodationDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return accommodationDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$accommodationDatabaseHash() =>
    r'f9d7177d7f9e7effc4ea27c3be138e2101a121c5';

/// Provider for the accommodation repository.
///
/// Returns a [CachingAccommodationRepository] wrapping a [MockAccommodationRepository].
/// Override this in tests to provide a different implementation.

@ProviderFor(accommodationRepository)
const accommodationRepositoryProvider = AccommodationRepositoryProvider._();

/// Provider for the accommodation repository.
///
/// Returns a [CachingAccommodationRepository] wrapping a [MockAccommodationRepository].
/// Override this in tests to provide a different implementation.

final class AccommodationRepositoryProvider
    extends
        $FunctionalProvider<
          AccommodationRepository,
          AccommodationRepository,
          AccommodationRepository
        >
    with $Provider<AccommodationRepository> {
  /// Provider for the accommodation repository.
  ///
  /// Returns a [CachingAccommodationRepository] wrapping a [MockAccommodationRepository].
  /// Override this in tests to provide a different implementation.
  const AccommodationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accommodationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accommodationRepositoryHash();

  @$internal
  @override
  $ProviderElement<AccommodationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AccommodationRepository create(Ref ref) {
    return accommodationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccommodationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccommodationRepository>(value),
    );
  }
}

String _$accommodationRepositoryHash() =>
    r'cec8284264a52194f5961597b6ca0014aee3a3e4';
