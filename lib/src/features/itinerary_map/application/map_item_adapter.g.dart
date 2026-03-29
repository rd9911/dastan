// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_item_adapter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapItemAdapter)
const mapItemAdapterProvider = MapItemAdapterProvider._();

final class MapItemAdapterProvider
    extends $FunctionalProvider<MapItemAdapter, MapItemAdapter, MapItemAdapter>
    with $Provider<MapItemAdapter> {
  const MapItemAdapterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapItemAdapterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapItemAdapterHash();

  @$internal
  @override
  $ProviderElement<MapItemAdapter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapItemAdapter create(Ref ref) {
    return mapItemAdapter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapItemAdapter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapItemAdapter>(value),
    );
  }
}

String _$mapItemAdapterHash() => r'7d0c387c81a0d4db639c7195ad8e6244a4ce8f02';
