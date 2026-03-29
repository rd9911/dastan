// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_item_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(saveItemService)
const saveItemServiceProvider = SaveItemServiceProvider._();

final class SaveItemServiceProvider
    extends
        $FunctionalProvider<SaveItemService, SaveItemService, SaveItemService>
    with $Provider<SaveItemService> {
  const SaveItemServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveItemServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveItemServiceHash();

  @$internal
  @override
  $ProviderElement<SaveItemService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveItemService create(Ref ref) {
    return saveItemService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveItemService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveItemService>(value),
    );
  }
}

String _$saveItemServiceHash() => r'9a55a935528a529adc1a15cd39a9e307d35126c8';

@ProviderFor(savedItems)
const savedItemsProvider = SavedItemsProvider._();

final class SavedItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SavedItem>>,
          List<SavedItem>,
          Stream<List<SavedItem>>
        >
    with $FutureModifier<List<SavedItem>>, $StreamProvider<List<SavedItem>> {
  const SavedItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedItemsHash();

  @$internal
  @override
  $StreamProviderElement<List<SavedItem>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SavedItem>> create(Ref ref) {
    return savedItems(ref);
  }
}

String _$savedItemsHash() => r'a5237431c54da1781eb7eebdc97a2049adcd3cd0';
