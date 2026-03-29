// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collab_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the collab repository using Supabase backend.

@ProviderFor(collabRepository)
const collabRepositoryProvider = CollabRepositoryProvider._();

/// Provider for the collab repository using Supabase backend.

final class CollabRepositoryProvider
    extends
        $FunctionalProvider<
          CollabRepository,
          CollabRepository,
          CollabRepository
        >
    with $Provider<CollabRepository> {
  /// Provider for the collab repository using Supabase backend.
  const CollabRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collabRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collabRepositoryHash();

  @$internal
  @override
  $ProviderElement<CollabRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CollabRepository create(Ref ref) {
    return collabRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CollabRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CollabRepository>(value),
    );
  }
}

String _$collabRepositoryHash() => r'6328d92503fde63ca23cb8d8db16425e009daee9';
