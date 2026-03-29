// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_search_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transportSearchService)
const transportSearchServiceProvider = TransportSearchServiceProvider._();

final class TransportSearchServiceProvider
    extends
        $FunctionalProvider<
          TransportSearchService,
          TransportSearchService,
          TransportSearchService
        >
    with $Provider<TransportSearchService> {
  const TransportSearchServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transportSearchServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transportSearchServiceHash();

  @$internal
  @override
  $ProviderElement<TransportSearchService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransportSearchService create(Ref ref) {
    return transportSearchService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransportSearchService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransportSearchService>(value),
    );
  }
}

String _$transportSearchServiceHash() =>
    r'6432f70cabe6c307b8c6d077de361224925f82fe';
