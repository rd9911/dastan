// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_plan_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(plannerRepository)
const plannerRepositoryProvider = PlannerRepositoryProvider._();

final class PlannerRepositoryProvider
    extends
        $FunctionalProvider<
          PlannerRepository,
          PlannerRepository,
          PlannerRepository
        >
    with $Provider<PlannerRepository> {
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

@ProviderFor(DayPlanStore)
const dayPlanStoreProvider = DayPlanStoreFamily._();

final class DayPlanStoreProvider
    extends $StreamNotifierProvider<DayPlanStore, DayPlan?> {
  const DayPlanStoreProvider._({
    required DayPlanStoreFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'dayPlanStoreProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dayPlanStoreHash();

  @override
  String toString() {
    return r'dayPlanStoreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DayPlanStore create() => DayPlanStore();

  @override
  bool operator ==(Object other) {
    return other is DayPlanStoreProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dayPlanStoreHash() => r'20c20127822872cc06021d8db2c37859e334f711';

final class DayPlanStoreFamily extends $Family
    with
        $ClassFamilyOverride<
          DayPlanStore,
          AsyncValue<DayPlan?>,
          DayPlan?,
          Stream<DayPlan?>,
          DateTime
        > {
  const DayPlanStoreFamily._()
    : super(
        retry: null,
        name: r'dayPlanStoreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DayPlanStoreProvider call(DateTime date) =>
      DayPlanStoreProvider._(argument: date, from: this);

  @override
  String toString() => r'dayPlanStoreProvider';
}

abstract class _$DayPlanStore extends $StreamNotifier<DayPlan?> {
  late final _$args = ref.$arg as DateTime;
  DateTime get date => _$args;

  Stream<DayPlan?> build(DateTime date);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<DayPlan?>, DayPlan?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DayPlan?>, DayPlan?>,
              AsyncValue<DayPlan?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
