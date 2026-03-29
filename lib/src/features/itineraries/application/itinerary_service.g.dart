// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itineraryService)
const itineraryServiceProvider = ItineraryServiceProvider._();

final class ItineraryServiceProvider
    extends
        $FunctionalProvider<
          ItineraryService,
          ItineraryService,
          ItineraryService
        >
    with $Provider<ItineraryService> {
  const ItineraryServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itineraryServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itineraryServiceHash();

  @$internal
  @override
  $ProviderElement<ItineraryService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItineraryService create(Ref ref) {
    return itineraryService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItineraryService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItineraryService>(value),
    );
  }
}

String _$itineraryServiceHash() => r'536d4d691eaffba56cce9b76652d2b2b5f6d16dc';

@ProviderFor(itineraries)
const itinerariesProvider = ItinerariesProvider._();

final class ItinerariesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Itinerary>>,
          List<Itinerary>,
          Stream<List<Itinerary>>
        >
    with $FutureModifier<List<Itinerary>>, $StreamProvider<List<Itinerary>> {
  const ItinerariesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itinerariesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itinerariesHash();

  @$internal
  @override
  $StreamProviderElement<List<Itinerary>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Itinerary>> create(Ref ref) {
    return itineraries(ref);
  }
}

String _$itinerariesHash() => r'a2dbcaa936c972869db5c1e9731c60a5857a9290';
