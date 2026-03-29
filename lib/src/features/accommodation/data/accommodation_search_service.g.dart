// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation_search_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(accommodationSearchService)
const accommodationSearchServiceProvider =
    AccommodationSearchServiceProvider._();

final class AccommodationSearchServiceProvider
    extends
        $FunctionalProvider<
          AccommodationSearchService,
          AccommodationSearchService,
          AccommodationSearchService
        >
    with $Provider<AccommodationSearchService> {
  const AccommodationSearchServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accommodationSearchServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accommodationSearchServiceHash();

  @$internal
  @override
  $ProviderElement<AccommodationSearchService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AccommodationSearchService create(Ref ref) {
    return accommodationSearchService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AccommodationSearchService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AccommodationSearchService>(value),
    );
  }
}

String _$accommodationSearchServiceHash() =>
    r'efe97438df8add7f290f2513d0b57b5fc75f9a6b';
