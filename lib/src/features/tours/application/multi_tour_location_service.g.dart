// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_tour_location_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Watches the user's location and detects when they arrive at the next
/// multi-tour stop, triggering a local notification.

@ProviderFor(MultiTourLocationService)
const multiTourLocationServiceProvider = MultiTourLocationServiceProvider._();

/// Watches the user's location and detects when they arrive at the next
/// multi-tour stop, triggering a local notification.
final class MultiTourLocationServiceProvider
    extends $AsyncNotifierProvider<MultiTourLocationService, void> {
  /// Watches the user's location and detects when they arrive at the next
  /// multi-tour stop, triggering a local notification.
  const MultiTourLocationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'multiTourLocationServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$multiTourLocationServiceHash();

  @$internal
  @override
  MultiTourLocationService create() => MultiTourLocationService();
}

String _$multiTourLocationServiceHash() =>
    r'b9631c11d63e5ce156d0a7a0f69025e1f147e43c';

/// Watches the user's location and detects when they arrive at the next
/// multi-tour stop, triggering a local notification.

abstract class _$MultiTourLocationService extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
