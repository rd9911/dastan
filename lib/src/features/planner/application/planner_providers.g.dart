// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planner_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the local planner repository (Drift-based).

@ProviderFor(plannerRepository)
const plannerRepositoryProvider = PlannerRepositoryProvider._();

/// Provider for the local planner repository (Drift-based).

final class PlannerRepositoryProvider
    extends
        $FunctionalProvider<
          PlannerRepository,
          PlannerRepository,
          PlannerRepository
        >
    with $Provider<PlannerRepository> {
  /// Provider for the local planner repository (Drift-based).
  const PlannerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'plannerRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$plannerRepositoryHash();

  @$internal
  @override
  $ProviderElement<PlannerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlannerRepository create(Ref ref) {
    return plannerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlannerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlannerRepository>(value),
    );
  }
}

String _$plannerRepositoryHash() => r'263a15e77966e99a27c18379521a481b752164e1';

/// Provider for the Supabase day plan sync service.

@ProviderFor(supabaseDayPlanService)
const supabaseDayPlanServiceProvider = SupabaseDayPlanServiceProvider._();

/// Provider for the Supabase day plan sync service.

final class SupabaseDayPlanServiceProvider
    extends
        $FunctionalProvider<
          SupabaseDayPlanService,
          SupabaseDayPlanService,
          SupabaseDayPlanService
        >
    with $Provider<SupabaseDayPlanService> {
  /// Provider for the Supabase day plan sync service.
  const SupabaseDayPlanServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseDayPlanServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseDayPlanServiceHash();

  @$internal
  @override
  $ProviderElement<SupabaseDayPlanService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseDayPlanService create(Ref ref) {
    return supabaseDayPlanService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseDayPlanService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseDayPlanService>(value),
    );
  }
}

String _$supabaseDayPlanServiceHash() =>
    r'c08feb8864b35c66f328c66bd52a021396c15b71';
