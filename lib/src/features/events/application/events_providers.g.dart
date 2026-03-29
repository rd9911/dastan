// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the events database DAO.

@ProviderFor(eventsDatabase)
const eventsDatabaseProvider = EventsDatabaseProvider._();

/// Provider for the events database DAO.

final class EventsDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// Provider for the events database DAO.
  const EventsDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventsDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventsDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return eventsDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$eventsDatabaseHash() => r'0358202e4dc380037a0aea6beb810669c870b654';

/// Provider for the events repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.

@ProviderFor(eventsRepository)
const eventsRepositoryProvider = EventsRepositoryProvider._();

/// Provider for the events repository.
///
/// Returns a caching repository wrapping the mock implementation.
/// Integrates with the unified Search Platform.

final class EventsRepositoryProvider
    extends
        $FunctionalProvider<
          EventsRepository,
          EventsRepository,
          EventsRepository
        >
    with $Provider<EventsRepository> {
  /// Provider for the events repository.
  ///
  /// Returns a caching repository wrapping the mock implementation.
  /// Integrates with the unified Search Platform.
  const EventsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventsRepositoryHash();

  @$internal
  @override
  $ProviderElement<EventsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EventsRepository create(Ref ref) {
    return eventsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventsRepository>(value),
    );
  }
}

String _$eventsRepositoryHash() => r'80ce2fbf8e750515c8d87ca70663f796929aa9f3';

/// Provider for the events prefill service.

@ProviderFor(eventsPrefillService)
const eventsPrefillServiceProvider = EventsPrefillServiceProvider._();

/// Provider for the events prefill service.

final class EventsPrefillServiceProvider
    extends
        $FunctionalProvider<
          EventsPrefillService,
          EventsPrefillService,
          EventsPrefillService
        >
    with $Provider<EventsPrefillService> {
  /// Provider for the events prefill service.
  const EventsPrefillServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventsPrefillServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventsPrefillServiceHash();

  @$internal
  @override
  $ProviderElement<EventsPrefillService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EventsPrefillService create(Ref ref) {
    return eventsPrefillService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventsPrefillService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventsPrefillService>(value),
    );
  }
}

String _$eventsPrefillServiceHash() =>
    r'2d3f844926a7e6cd670cce78b974a8d80488fbda';

/// Provider for the calendar conflict service.

@ProviderFor(calendarConflictService)
const calendarConflictServiceProvider = CalendarConflictServiceProvider._();

/// Provider for the calendar conflict service.

final class CalendarConflictServiceProvider
    extends
        $FunctionalProvider<
          CalendarConflictService,
          CalendarConflictService,
          CalendarConflictService
        >
    with $Provider<CalendarConflictService> {
  /// Provider for the calendar conflict service.
  const CalendarConflictServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarConflictServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarConflictServiceHash();

  @$internal
  @override
  $ProviderElement<CalendarConflictService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CalendarConflictService create(Ref ref) {
    return calendarConflictService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CalendarConflictService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CalendarConflictService>(value),
    );
  }
}

String _$calendarConflictServiceHash() =>
    r'6bcd8c25dc836cb232a4074ec1fa4cdd2c75b580';
