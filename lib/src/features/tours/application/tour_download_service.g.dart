// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_download_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TourDownloadService)
const tourDownloadServiceProvider = TourDownloadServiceProvider._();

final class TourDownloadServiceProvider
    extends $AsyncNotifierProvider<TourDownloadService, void> {
  const TourDownloadServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tourDownloadServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tourDownloadServiceHash();

  @$internal
  @override
  TourDownloadService create() => TourDownloadService();
}

String _$tourDownloadServiceHash() =>
    r'ec301f9112581222a3541d96c542acb71984805c';

abstract class _$TourDownloadService extends $AsyncNotifier<void> {
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

@ProviderFor(isTourDownloaded)
const isTourDownloadedProvider = IsTourDownloadedFamily._();

final class IsTourDownloadedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const IsTourDownloadedProvider._({
    required IsTourDownloadedFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'isTourDownloadedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isTourDownloadedHash();

  @override
  String toString() {
    return r'isTourDownloadedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as (String, String);
    return isTourDownloaded(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is IsTourDownloadedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isTourDownloadedHash() => r'5c983d72e7ab246567860222cbcfef2321d9b051';

final class IsTourDownloadedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, (String, String)> {
  const IsTourDownloadedFamily._()
    : super(
        retry: null,
        name: r'isTourDownloadedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsTourDownloadedProvider call(String tourId, String languageCode) =>
      IsTourDownloadedProvider._(argument: (tourId, languageCode), from: this);

  @override
  String toString() => r'isTourDownloadedProvider';
}
