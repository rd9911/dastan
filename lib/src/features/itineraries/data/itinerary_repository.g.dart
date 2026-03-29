// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itineraryRepository)
const itineraryRepositoryProvider = ItineraryRepositoryProvider._();

final class ItineraryRepositoryProvider
    extends
        $FunctionalProvider<
          ItineraryRepository,
          ItineraryRepository,
          ItineraryRepository
        >
    with $Provider<ItineraryRepository> {
  const ItineraryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itineraryRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itineraryRepositoryHash();

  @$internal
  @override
  $ProviderElement<ItineraryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ItineraryRepository create(Ref ref) {
    return itineraryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItineraryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItineraryRepository>(value),
    );
  }
}

String _$itineraryRepositoryHash() =>
    r'74cd59c21cf03e548af1289f00854b47c67a3563';
