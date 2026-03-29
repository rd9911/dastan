// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accommodation_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AccommodationSearchController)
const accommodationSearchControllerProvider =
    AccommodationSearchControllerProvider._();

final class AccommodationSearchControllerProvider
    extends
        $NotifierProvider<
          AccommodationSearchController,
          AsyncValue<List<AccommodationResult>>
        > {
  const AccommodationSearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accommodationSearchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accommodationSearchControllerHash();

  @$internal
  @override
  AccommodationSearchController create() => AccommodationSearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<AccommodationResult>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<List<AccommodationResult>>>(value),
    );
  }
}

String _$accommodationSearchControllerHash() =>
    r'3582cd5d88c7df1010481df2452a2a16ce46b7d7';

abstract class _$AccommodationSearchController
    extends $Notifier<AsyncValue<List<AccommodationResult>>> {
  AsyncValue<List<AccommodationResult>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<AccommodationResult>>,
              AsyncValue<List<AccommodationResult>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<AccommodationResult>>,
                AsyncValue<List<AccommodationResult>>
              >,
              AsyncValue<List<AccommodationResult>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
