// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entertainment_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntertainmentPlace {

/// Place granularity (city, region, poi, etc.)
 PlaceGranularity get granularity;/// Place value (e.g., "Paris, France" or "Eiffel Tower")
 String get value;/// Optional latitude for POI granularity.
 double? get latitude;/// Optional longitude for POI granularity.
 double? get longitude;
/// Create a copy of EntertainmentPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntertainmentPlaceCopyWith<EntertainmentPlace> get copyWith => _$EntertainmentPlaceCopyWithImpl<EntertainmentPlace>(this as EntertainmentPlace, _$identity);

  /// Serializes this EntertainmentPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntertainmentPlace&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.value, value) || other.value == value)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,value,latitude,longitude);

@override
String toString() {
  return 'EntertainmentPlace(granularity: $granularity, value: $value, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $EntertainmentPlaceCopyWith<$Res>  {
  factory $EntertainmentPlaceCopyWith(EntertainmentPlace value, $Res Function(EntertainmentPlace) _then) = _$EntertainmentPlaceCopyWithImpl;
@useResult
$Res call({
 PlaceGranularity granularity, String value, double? latitude, double? longitude
});




}
/// @nodoc
class _$EntertainmentPlaceCopyWithImpl<$Res>
    implements $EntertainmentPlaceCopyWith<$Res> {
  _$EntertainmentPlaceCopyWithImpl(this._self, this._then);

  final EntertainmentPlace _self;
  final $Res Function(EntertainmentPlace) _then;

/// Create a copy of EntertainmentPlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? granularity = null,Object? value = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as PlaceGranularity,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [EntertainmentPlace].
extension EntertainmentPlacePatterns on EntertainmentPlace {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntertainmentPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntertainmentPlace() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntertainmentPlace value)  $default,){
final _that = this;
switch (_that) {
case _EntertainmentPlace():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntertainmentPlace value)?  $default,){
final _that = this;
switch (_that) {
case _EntertainmentPlace() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlaceGranularity granularity,  String value,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntertainmentPlace() when $default != null:
return $default(_that.granularity,_that.value,_that.latitude,_that.longitude);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlaceGranularity granularity,  String value,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _EntertainmentPlace():
return $default(_that.granularity,_that.value,_that.latitude,_that.longitude);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlaceGranularity granularity,  String value,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _EntertainmentPlace() when $default != null:
return $default(_that.granularity,_that.value,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntertainmentPlace implements EntertainmentPlace {
  const _EntertainmentPlace({required this.granularity, required this.value, this.latitude, this.longitude});
  factory _EntertainmentPlace.fromJson(Map<String, dynamic> json) => _$EntertainmentPlaceFromJson(json);

/// Place granularity (city, region, poi, etc.)
@override final  PlaceGranularity granularity;
/// Place value (e.g., "Paris, France" or "Eiffel Tower")
@override final  String value;
/// Optional latitude for POI granularity.
@override final  double? latitude;
/// Optional longitude for POI granularity.
@override final  double? longitude;

/// Create a copy of EntertainmentPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntertainmentPlaceCopyWith<_EntertainmentPlace> get copyWith => __$EntertainmentPlaceCopyWithImpl<_EntertainmentPlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntertainmentPlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntertainmentPlace&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.value, value) || other.value == value)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,value,latitude,longitude);

@override
String toString() {
  return 'EntertainmentPlace(granularity: $granularity, value: $value, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$EntertainmentPlaceCopyWith<$Res> implements $EntertainmentPlaceCopyWith<$Res> {
  factory _$EntertainmentPlaceCopyWith(_EntertainmentPlace value, $Res Function(_EntertainmentPlace) _then) = __$EntertainmentPlaceCopyWithImpl;
@override @useResult
$Res call({
 PlaceGranularity granularity, String value, double? latitude, double? longitude
});




}
/// @nodoc
class __$EntertainmentPlaceCopyWithImpl<$Res>
    implements _$EntertainmentPlaceCopyWith<$Res> {
  __$EntertainmentPlaceCopyWithImpl(this._self, this._then);

  final _EntertainmentPlace _self;
  final $Res Function(_EntertainmentPlace) _then;

/// Create a copy of EntertainmentPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? granularity = null,Object? value = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_EntertainmentPlace(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as PlaceGranularity,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$DateTimeRange {

 DateTime get start; DateTime get end;
/// Create a copy of DateTimeRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DateTimeRangeCopyWith<DateTimeRange> get copyWith => _$DateTimeRangeCopyWithImpl<DateTimeRange>(this as DateTimeRange, _$identity);

  /// Serializes this DateTimeRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DateTimeRange&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'DateTimeRange(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $DateTimeRangeCopyWith<$Res>  {
  factory $DateTimeRangeCopyWith(DateTimeRange value, $Res Function(DateTimeRange) _then) = _$DateTimeRangeCopyWithImpl;
@useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class _$DateTimeRangeCopyWithImpl<$Res>
    implements $DateTimeRangeCopyWith<$Res> {
  _$DateTimeRangeCopyWithImpl(this._self, this._then);

  final DateTimeRange _self;
  final $Res Function(DateTimeRange) _then;

/// Create a copy of DateTimeRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DateTimeRange].
extension DateTimeRangePatterns on DateTimeRange {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DateTimeRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DateTimeRange() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DateTimeRange value)  $default,){
final _that = this;
switch (_that) {
case _DateTimeRange():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DateTimeRange value)?  $default,){
final _that = this;
switch (_that) {
case _DateTimeRange() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DateTimeRange() when $default != null:
return $default(_that.start,_that.end);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime start,  DateTime end)  $default,) {final _that = this;
switch (_that) {
case _DateTimeRange():
return $default(_that.start,_that.end);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime start,  DateTime end)?  $default,) {final _that = this;
switch (_that) {
case _DateTimeRange() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DateTimeRange implements DateTimeRange {
  const _DateTimeRange({required this.start, required this.end});
  factory _DateTimeRange.fromJson(Map<String, dynamic> json) => _$DateTimeRangeFromJson(json);

@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of DateTimeRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DateTimeRangeCopyWith<_DateTimeRange> get copyWith => __$DateTimeRangeCopyWithImpl<_DateTimeRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DateTimeRangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DateTimeRange&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'DateTimeRange(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$DateTimeRangeCopyWith<$Res> implements $DateTimeRangeCopyWith<$Res> {
  factory _$DateTimeRangeCopyWith(_DateTimeRange value, $Res Function(_DateTimeRange) _then) = __$DateTimeRangeCopyWithImpl;
@override @useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class __$DateTimeRangeCopyWithImpl<$Res>
    implements _$DateTimeRangeCopyWith<$Res> {
  __$DateTimeRangeCopyWithImpl(this._self, this._then);

  final _DateTimeRange _self;
  final $Res Function(_DateTimeRange) _then;

/// Create a copy of DateTimeRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_DateTimeRange(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$EntertainmentFilters {

/// Show only currently open venues.
 bool? get openNow;/// Show only free-entry venues.
 bool? get freeEntry;/// Show only kid-friendly venues.
 bool? get kidFriendly;/// Show only accessible venues.
 bool? get accessible;/// Minimum rating filter.
 double? get minRating;/// Maximum distance from center in meters.
 int? get maxDistance;
/// Create a copy of EntertainmentFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntertainmentFiltersCopyWith<EntertainmentFilters> get copyWith => _$EntertainmentFiltersCopyWithImpl<EntertainmentFilters>(this as EntertainmentFilters, _$identity);

  /// Serializes this EntertainmentFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntertainmentFilters&&(identical(other.openNow, openNow) || other.openNow == openNow)&&(identical(other.freeEntry, freeEntry) || other.freeEntry == freeEntry)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.accessible, accessible) || other.accessible == accessible)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.maxDistance, maxDistance) || other.maxDistance == maxDistance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,openNow,freeEntry,kidFriendly,accessible,minRating,maxDistance);

@override
String toString() {
  return 'EntertainmentFilters(openNow: $openNow, freeEntry: $freeEntry, kidFriendly: $kidFriendly, accessible: $accessible, minRating: $minRating, maxDistance: $maxDistance)';
}


}

/// @nodoc
abstract mixin class $EntertainmentFiltersCopyWith<$Res>  {
  factory $EntertainmentFiltersCopyWith(EntertainmentFilters value, $Res Function(EntertainmentFilters) _then) = _$EntertainmentFiltersCopyWithImpl;
@useResult
$Res call({
 bool? openNow, bool? freeEntry, bool? kidFriendly, bool? accessible, double? minRating, int? maxDistance
});




}
/// @nodoc
class _$EntertainmentFiltersCopyWithImpl<$Res>
    implements $EntertainmentFiltersCopyWith<$Res> {
  _$EntertainmentFiltersCopyWithImpl(this._self, this._then);

  final EntertainmentFilters _self;
  final $Res Function(EntertainmentFilters) _then;

/// Create a copy of EntertainmentFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? openNow = freezed,Object? freeEntry = freezed,Object? kidFriendly = freezed,Object? accessible = freezed,Object? minRating = freezed,Object? maxDistance = freezed,}) {
  return _then(_self.copyWith(
openNow: freezed == openNow ? _self.openNow : openNow // ignore: cast_nullable_to_non_nullable
as bool?,freeEntry: freezed == freeEntry ? _self.freeEntry : freeEntry // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,accessible: freezed == accessible ? _self.accessible : accessible // ignore: cast_nullable_to_non_nullable
as bool?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double?,maxDistance: freezed == maxDistance ? _self.maxDistance : maxDistance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [EntertainmentFilters].
extension EntertainmentFiltersPatterns on EntertainmentFilters {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntertainmentFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntertainmentFilters() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntertainmentFilters value)  $default,){
final _that = this;
switch (_that) {
case _EntertainmentFilters():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntertainmentFilters value)?  $default,){
final _that = this;
switch (_that) {
case _EntertainmentFilters() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? openNow,  bool? freeEntry,  bool? kidFriendly,  bool? accessible,  double? minRating,  int? maxDistance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntertainmentFilters() when $default != null:
return $default(_that.openNow,_that.freeEntry,_that.kidFriendly,_that.accessible,_that.minRating,_that.maxDistance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? openNow,  bool? freeEntry,  bool? kidFriendly,  bool? accessible,  double? minRating,  int? maxDistance)  $default,) {final _that = this;
switch (_that) {
case _EntertainmentFilters():
return $default(_that.openNow,_that.freeEntry,_that.kidFriendly,_that.accessible,_that.minRating,_that.maxDistance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? openNow,  bool? freeEntry,  bool? kidFriendly,  bool? accessible,  double? minRating,  int? maxDistance)?  $default,) {final _that = this;
switch (_that) {
case _EntertainmentFilters() when $default != null:
return $default(_that.openNow,_that.freeEntry,_that.kidFriendly,_that.accessible,_that.minRating,_that.maxDistance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntertainmentFilters implements EntertainmentFilters {
  const _EntertainmentFilters({this.openNow, this.freeEntry, this.kidFriendly, this.accessible, this.minRating, this.maxDistance});
  factory _EntertainmentFilters.fromJson(Map<String, dynamic> json) => _$EntertainmentFiltersFromJson(json);

/// Show only currently open venues.
@override final  bool? openNow;
/// Show only free-entry venues.
@override final  bool? freeEntry;
/// Show only kid-friendly venues.
@override final  bool? kidFriendly;
/// Show only accessible venues.
@override final  bool? accessible;
/// Minimum rating filter.
@override final  double? minRating;
/// Maximum distance from center in meters.
@override final  int? maxDistance;

/// Create a copy of EntertainmentFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntertainmentFiltersCopyWith<_EntertainmentFilters> get copyWith => __$EntertainmentFiltersCopyWithImpl<_EntertainmentFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntertainmentFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntertainmentFilters&&(identical(other.openNow, openNow) || other.openNow == openNow)&&(identical(other.freeEntry, freeEntry) || other.freeEntry == freeEntry)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.accessible, accessible) || other.accessible == accessible)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.maxDistance, maxDistance) || other.maxDistance == maxDistance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,openNow,freeEntry,kidFriendly,accessible,minRating,maxDistance);

@override
String toString() {
  return 'EntertainmentFilters(openNow: $openNow, freeEntry: $freeEntry, kidFriendly: $kidFriendly, accessible: $accessible, minRating: $minRating, maxDistance: $maxDistance)';
}


}

/// @nodoc
abstract mixin class _$EntertainmentFiltersCopyWith<$Res> implements $EntertainmentFiltersCopyWith<$Res> {
  factory _$EntertainmentFiltersCopyWith(_EntertainmentFilters value, $Res Function(_EntertainmentFilters) _then) = __$EntertainmentFiltersCopyWithImpl;
@override @useResult
$Res call({
 bool? openNow, bool? freeEntry, bool? kidFriendly, bool? accessible, double? minRating, int? maxDistance
});




}
/// @nodoc
class __$EntertainmentFiltersCopyWithImpl<$Res>
    implements _$EntertainmentFiltersCopyWith<$Res> {
  __$EntertainmentFiltersCopyWithImpl(this._self, this._then);

  final _EntertainmentFilters _self;
  final $Res Function(_EntertainmentFilters) _then;

/// Create a copy of EntertainmentFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? openNow = freezed,Object? freeEntry = freezed,Object? kidFriendly = freezed,Object? accessible = freezed,Object? minRating = freezed,Object? maxDistance = freezed,}) {
  return _then(_EntertainmentFilters(
openNow: freezed == openNow ? _self.openNow : openNow // ignore: cast_nullable_to_non_nullable
as bool?,freeEntry: freezed == freeEntry ? _self.freeEntry : freeEntry // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,accessible: freezed == accessible ? _self.accessible : accessible // ignore: cast_nullable_to_non_nullable
as bool?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double?,maxDistance: freezed == maxDistance ? _self.maxDistance : maxDistance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$EntertainmentSearchRequest {

/// Active itinerary ID - required for context binding.
 String get itineraryId;/// Place to search (city, region, or specific POI).
 EntertainmentPlace get place;/// Optional date range for the visit.
 DateTimeRange? get dateRange;/// Tag filters to include (empty = all tags).
 List<EntertainmentTag> get tags;/// Optional filters.
 EntertainmentFilters? get filters;/// Sort preference.
 EntertainmentSort get sort;
/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntertainmentSearchRequestCopyWith<EntertainmentSearchRequest> get copyWith => _$EntertainmentSearchRequestCopyWithImpl<EntertainmentSearchRequest>(this as EntertainmentSearchRequest, _$identity);

  /// Serializes this EntertainmentSearchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntertainmentSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,dateRange,const DeepCollectionEquality().hash(tags),filters,sort);

@override
String toString() {
  return 'EntertainmentSearchRequest(itineraryId: $itineraryId, place: $place, dateRange: $dateRange, tags: $tags, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $EntertainmentSearchRequestCopyWith<$Res>  {
  factory $EntertainmentSearchRequestCopyWith(EntertainmentSearchRequest value, $Res Function(EntertainmentSearchRequest) _then) = _$EntertainmentSearchRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, EntertainmentPlace place, DateTimeRange? dateRange, List<EntertainmentTag> tags, EntertainmentFilters? filters, EntertainmentSort sort
});


$EntertainmentPlaceCopyWith<$Res> get place;$DateTimeRangeCopyWith<$Res>? get dateRange;$EntertainmentFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class _$EntertainmentSearchRequestCopyWithImpl<$Res>
    implements $EntertainmentSearchRequestCopyWith<$Res> {
  _$EntertainmentSearchRequestCopyWithImpl(this._self, this._then);

  final EntertainmentSearchRequest _self;
  final $Res Function(EntertainmentSearchRequest) _then;

/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? place = null,Object? dateRange = freezed,Object? tags = null,Object? filters = freezed,Object? sort = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as EntertainmentPlace,dateRange: freezed == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<EntertainmentTag>,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as EntertainmentFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as EntertainmentSort,
  ));
}
/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntertainmentPlaceCopyWith<$Res> get place {
  
  return $EntertainmentPlaceCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateTimeRangeCopyWith<$Res>? get dateRange {
    if (_self.dateRange == null) {
    return null;
  }

  return $DateTimeRangeCopyWith<$Res>(_self.dateRange!, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntertainmentFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $EntertainmentFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// Adds pattern-matching-related methods to [EntertainmentSearchRequest].
extension EntertainmentSearchRequestPatterns on EntertainmentSearchRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntertainmentSearchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntertainmentSearchRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntertainmentSearchRequest value)  $default,){
final _that = this;
switch (_that) {
case _EntertainmentSearchRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntertainmentSearchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EntertainmentSearchRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  EntertainmentPlace place,  DateTimeRange? dateRange,  List<EntertainmentTag> tags,  EntertainmentFilters? filters,  EntertainmentSort sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntertainmentSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.dateRange,_that.tags,_that.filters,_that.sort);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  EntertainmentPlace place,  DateTimeRange? dateRange,  List<EntertainmentTag> tags,  EntertainmentFilters? filters,  EntertainmentSort sort)  $default,) {final _that = this;
switch (_that) {
case _EntertainmentSearchRequest():
return $default(_that.itineraryId,_that.place,_that.dateRange,_that.tags,_that.filters,_that.sort);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  EntertainmentPlace place,  DateTimeRange? dateRange,  List<EntertainmentTag> tags,  EntertainmentFilters? filters,  EntertainmentSort sort)?  $default,) {final _that = this;
switch (_that) {
case _EntertainmentSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.dateRange,_that.tags,_that.filters,_that.sort);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntertainmentSearchRequest implements EntertainmentSearchRequest {
  const _EntertainmentSearchRequest({required this.itineraryId, required this.place, this.dateRange, final  List<EntertainmentTag> tags = const [], this.filters, this.sort = EntertainmentSort.recommended}): _tags = tags;
  factory _EntertainmentSearchRequest.fromJson(Map<String, dynamic> json) => _$EntertainmentSearchRequestFromJson(json);

/// Active itinerary ID - required for context binding.
@override final  String itineraryId;
/// Place to search (city, region, or specific POI).
@override final  EntertainmentPlace place;
/// Optional date range for the visit.
@override final  DateTimeRange? dateRange;
/// Tag filters to include (empty = all tags).
 final  List<EntertainmentTag> _tags;
/// Tag filters to include (empty = all tags).
@override@JsonKey() List<EntertainmentTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

/// Optional filters.
@override final  EntertainmentFilters? filters;
/// Sort preference.
@override@JsonKey() final  EntertainmentSort sort;

/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntertainmentSearchRequestCopyWith<_EntertainmentSearchRequest> get copyWith => __$EntertainmentSearchRequestCopyWithImpl<_EntertainmentSearchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntertainmentSearchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntertainmentSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,dateRange,const DeepCollectionEquality().hash(_tags),filters,sort);

@override
String toString() {
  return 'EntertainmentSearchRequest(itineraryId: $itineraryId, place: $place, dateRange: $dateRange, tags: $tags, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$EntertainmentSearchRequestCopyWith<$Res> implements $EntertainmentSearchRequestCopyWith<$Res> {
  factory _$EntertainmentSearchRequestCopyWith(_EntertainmentSearchRequest value, $Res Function(_EntertainmentSearchRequest) _then) = __$EntertainmentSearchRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, EntertainmentPlace place, DateTimeRange? dateRange, List<EntertainmentTag> tags, EntertainmentFilters? filters, EntertainmentSort sort
});


@override $EntertainmentPlaceCopyWith<$Res> get place;@override $DateTimeRangeCopyWith<$Res>? get dateRange;@override $EntertainmentFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class __$EntertainmentSearchRequestCopyWithImpl<$Res>
    implements _$EntertainmentSearchRequestCopyWith<$Res> {
  __$EntertainmentSearchRequestCopyWithImpl(this._self, this._then);

  final _EntertainmentSearchRequest _self;
  final $Res Function(_EntertainmentSearchRequest) _then;

/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? place = null,Object? dateRange = freezed,Object? tags = null,Object? filters = freezed,Object? sort = null,}) {
  return _then(_EntertainmentSearchRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as EntertainmentPlace,dateRange: freezed == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<EntertainmentTag>,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as EntertainmentFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as EntertainmentSort,
  ));
}

/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntertainmentPlaceCopyWith<$Res> get place {
  
  return $EntertainmentPlaceCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DateTimeRangeCopyWith<$Res>? get dateRange {
    if (_self.dateRange == null) {
    return null;
  }

  return $DateTimeRangeCopyWith<$Res>(_self.dateRange!, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}/// Create a copy of EntertainmentSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntertainmentFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $EntertainmentFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// @nodoc
mixin _$EntertainmentResultCard {

/// Internal unique ID.
 String get id;/// Provider ID (google, tripadvisor, foursquare, etc.).
 String get providerId;/// External ID from the provider.
 String get externalId;/// Name of the entertainment venue.
 String get name;/// Thumbnail image URL.
 String get thumbnail;/// Primary entertainment tag.
 EntertainmentTag get tag;/// Location description.
 String get location;/// Latitude coordinate.
 double get latitude;/// Longitude coordinate.
 double get longitude;/// Optional rating (0-5).
 double? get rating;/// Optional review count.
 int? get reviewCount;/// Distance from search center in meters.
 int? get distance;/// Website URL for vendor handoff.
 String? get website;/// List of all applicable tags.
 List<EntertainmentTag> get allTags;/// Whether venue is currently open.
 bool? get isOpen;/// Short description preview.
 String? get shortDescription;
/// Create a copy of EntertainmentResultCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntertainmentResultCardCopyWith<EntertainmentResultCard> get copyWith => _$EntertainmentResultCardCopyWithImpl<EntertainmentResultCard>(this as EntertainmentResultCard, _$identity);

  /// Serializes this EntertainmentResultCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntertainmentResultCard&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.website, website) || other.website == website)&&const DeepCollectionEquality().equals(other.allTags, allTags)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,name,thumbnail,tag,location,latitude,longitude,rating,reviewCount,distance,website,const DeepCollectionEquality().hash(allTags),isOpen,shortDescription);

@override
String toString() {
  return 'EntertainmentResultCard(id: $id, providerId: $providerId, externalId: $externalId, name: $name, thumbnail: $thumbnail, tag: $tag, location: $location, latitude: $latitude, longitude: $longitude, rating: $rating, reviewCount: $reviewCount, distance: $distance, website: $website, allTags: $allTags, isOpen: $isOpen, shortDescription: $shortDescription)';
}


}

/// @nodoc
abstract mixin class $EntertainmentResultCardCopyWith<$Res>  {
  factory $EntertainmentResultCardCopyWith(EntertainmentResultCard value, $Res Function(EntertainmentResultCard) _then) = _$EntertainmentResultCardCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String name, String thumbnail, EntertainmentTag tag, String location, double latitude, double longitude, double? rating, int? reviewCount, int? distance, String? website, List<EntertainmentTag> allTags, bool? isOpen, String? shortDescription
});




}
/// @nodoc
class _$EntertainmentResultCardCopyWithImpl<$Res>
    implements $EntertainmentResultCardCopyWith<$Res> {
  _$EntertainmentResultCardCopyWithImpl(this._self, this._then);

  final EntertainmentResultCard _self;
  final $Res Function(EntertainmentResultCard) _then;

/// Create a copy of EntertainmentResultCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? thumbnail = null,Object? tag = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? rating = freezed,Object? reviewCount = freezed,Object? distance = freezed,Object? website = freezed,Object? allTags = null,Object? isOpen = freezed,Object? shortDescription = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as EntertainmentTag,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,allTags: null == allTags ? _self.allTags : allTags // ignore: cast_nullable_to_non_nullable
as List<EntertainmentTag>,isOpen: freezed == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EntertainmentResultCard].
extension EntertainmentResultCardPatterns on EntertainmentResultCard {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntertainmentResultCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntertainmentResultCard() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntertainmentResultCard value)  $default,){
final _that = this;
switch (_that) {
case _EntertainmentResultCard():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntertainmentResultCard value)?  $default,){
final _that = this;
switch (_that) {
case _EntertainmentResultCard() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  EntertainmentTag tag,  String location,  double latitude,  double longitude,  double? rating,  int? reviewCount,  int? distance,  String? website,  List<EntertainmentTag> allTags,  bool? isOpen,  String? shortDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntertainmentResultCard() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.tag,_that.location,_that.latitude,_that.longitude,_that.rating,_that.reviewCount,_that.distance,_that.website,_that.allTags,_that.isOpen,_that.shortDescription);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  EntertainmentTag tag,  String location,  double latitude,  double longitude,  double? rating,  int? reviewCount,  int? distance,  String? website,  List<EntertainmentTag> allTags,  bool? isOpen,  String? shortDescription)  $default,) {final _that = this;
switch (_that) {
case _EntertainmentResultCard():
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.tag,_that.location,_that.latitude,_that.longitude,_that.rating,_that.reviewCount,_that.distance,_that.website,_that.allTags,_that.isOpen,_that.shortDescription);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  EntertainmentTag tag,  String location,  double latitude,  double longitude,  double? rating,  int? reviewCount,  int? distance,  String? website,  List<EntertainmentTag> allTags,  bool? isOpen,  String? shortDescription)?  $default,) {final _that = this;
switch (_that) {
case _EntertainmentResultCard() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.tag,_that.location,_that.latitude,_that.longitude,_that.rating,_that.reviewCount,_that.distance,_that.website,_that.allTags,_that.isOpen,_that.shortDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntertainmentResultCard implements EntertainmentResultCard {
  const _EntertainmentResultCard({required this.id, required this.providerId, required this.externalId, required this.name, required this.thumbnail, required this.tag, required this.location, required this.latitude, required this.longitude, this.rating, this.reviewCount, this.distance, this.website, final  List<EntertainmentTag> allTags = const [], this.isOpen, this.shortDescription}): _allTags = allTags;
  factory _EntertainmentResultCard.fromJson(Map<String, dynamic> json) => _$EntertainmentResultCardFromJson(json);

/// Internal unique ID.
@override final  String id;
/// Provider ID (google, tripadvisor, foursquare, etc.).
@override final  String providerId;
/// External ID from the provider.
@override final  String externalId;
/// Name of the entertainment venue.
@override final  String name;
/// Thumbnail image URL.
@override final  String thumbnail;
/// Primary entertainment tag.
@override final  EntertainmentTag tag;
/// Location description.
@override final  String location;
/// Latitude coordinate.
@override final  double latitude;
/// Longitude coordinate.
@override final  double longitude;
/// Optional rating (0-5).
@override final  double? rating;
/// Optional review count.
@override final  int? reviewCount;
/// Distance from search center in meters.
@override final  int? distance;
/// Website URL for vendor handoff.
@override final  String? website;
/// List of all applicable tags.
 final  List<EntertainmentTag> _allTags;
/// List of all applicable tags.
@override@JsonKey() List<EntertainmentTag> get allTags {
  if (_allTags is EqualUnmodifiableListView) return _allTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTags);
}

/// Whether venue is currently open.
@override final  bool? isOpen;
/// Short description preview.
@override final  String? shortDescription;

/// Create a copy of EntertainmentResultCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntertainmentResultCardCopyWith<_EntertainmentResultCard> get copyWith => __$EntertainmentResultCardCopyWithImpl<_EntertainmentResultCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntertainmentResultCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntertainmentResultCard&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.website, website) || other.website == website)&&const DeepCollectionEquality().equals(other._allTags, _allTags)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,name,thumbnail,tag,location,latitude,longitude,rating,reviewCount,distance,website,const DeepCollectionEquality().hash(_allTags),isOpen,shortDescription);

@override
String toString() {
  return 'EntertainmentResultCard(id: $id, providerId: $providerId, externalId: $externalId, name: $name, thumbnail: $thumbnail, tag: $tag, location: $location, latitude: $latitude, longitude: $longitude, rating: $rating, reviewCount: $reviewCount, distance: $distance, website: $website, allTags: $allTags, isOpen: $isOpen, shortDescription: $shortDescription)';
}


}

/// @nodoc
abstract mixin class _$EntertainmentResultCardCopyWith<$Res> implements $EntertainmentResultCardCopyWith<$Res> {
  factory _$EntertainmentResultCardCopyWith(_EntertainmentResultCard value, $Res Function(_EntertainmentResultCard) _then) = __$EntertainmentResultCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String name, String thumbnail, EntertainmentTag tag, String location, double latitude, double longitude, double? rating, int? reviewCount, int? distance, String? website, List<EntertainmentTag> allTags, bool? isOpen, String? shortDescription
});




}
/// @nodoc
class __$EntertainmentResultCardCopyWithImpl<$Res>
    implements _$EntertainmentResultCardCopyWith<$Res> {
  __$EntertainmentResultCardCopyWithImpl(this._self, this._then);

  final _EntertainmentResultCard _self;
  final $Res Function(_EntertainmentResultCard) _then;

/// Create a copy of EntertainmentResultCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? thumbnail = null,Object? tag = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? rating = freezed,Object? reviewCount = freezed,Object? distance = freezed,Object? website = freezed,Object? allTags = null,Object? isOpen = freezed,Object? shortDescription = freezed,}) {
  return _then(_EntertainmentResultCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as EntertainmentTag,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,allTags: null == allTags ? _self._allTags : allTags // ignore: cast_nullable_to_non_nullable
as List<EntertainmentTag>,isOpen: freezed == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OpeningHours {

 String? get monday; String? get tuesday; String? get wednesday; String? get thursday; String? get friday; String? get saturday; String? get sunday;
/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpeningHoursCopyWith<OpeningHours> get copyWith => _$OpeningHoursCopyWithImpl<OpeningHours>(this as OpeningHours, _$identity);

  /// Serializes this OpeningHours to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpeningHours&&(identical(other.monday, monday) || other.monday == monday)&&(identical(other.tuesday, tuesday) || other.tuesday == tuesday)&&(identical(other.wednesday, wednesday) || other.wednesday == wednesday)&&(identical(other.thursday, thursday) || other.thursday == thursday)&&(identical(other.friday, friday) || other.friday == friday)&&(identical(other.saturday, saturday) || other.saturday == saturday)&&(identical(other.sunday, sunday) || other.sunday == sunday));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monday,tuesday,wednesday,thursday,friday,saturday,sunday);

@override
String toString() {
  return 'OpeningHours(monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday)';
}


}

/// @nodoc
abstract mixin class $OpeningHoursCopyWith<$Res>  {
  factory $OpeningHoursCopyWith(OpeningHours value, $Res Function(OpeningHours) _then) = _$OpeningHoursCopyWithImpl;
@useResult
$Res call({
 String? monday, String? tuesday, String? wednesday, String? thursday, String? friday, String? saturday, String? sunday
});




}
/// @nodoc
class _$OpeningHoursCopyWithImpl<$Res>
    implements $OpeningHoursCopyWith<$Res> {
  _$OpeningHoursCopyWithImpl(this._self, this._then);

  final OpeningHours _self;
  final $Res Function(OpeningHours) _then;

/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? monday = freezed,Object? tuesday = freezed,Object? wednesday = freezed,Object? thursday = freezed,Object? friday = freezed,Object? saturday = freezed,Object? sunday = freezed,}) {
  return _then(_self.copyWith(
monday: freezed == monday ? _self.monday : monday // ignore: cast_nullable_to_non_nullable
as String?,tuesday: freezed == tuesday ? _self.tuesday : tuesday // ignore: cast_nullable_to_non_nullable
as String?,wednesday: freezed == wednesday ? _self.wednesday : wednesday // ignore: cast_nullable_to_non_nullable
as String?,thursday: freezed == thursday ? _self.thursday : thursday // ignore: cast_nullable_to_non_nullable
as String?,friday: freezed == friday ? _self.friday : friday // ignore: cast_nullable_to_non_nullable
as String?,saturday: freezed == saturday ? _self.saturday : saturday // ignore: cast_nullable_to_non_nullable
as String?,sunday: freezed == sunday ? _self.sunday : sunday // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OpeningHours].
extension OpeningHoursPatterns on OpeningHours {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpeningHours value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpeningHours value)  $default,){
final _that = this;
switch (_that) {
case _OpeningHours():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpeningHours value)?  $default,){
final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? monday,  String? tuesday,  String? wednesday,  String? thursday,  String? friday,  String? saturday,  String? sunday)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that.monday,_that.tuesday,_that.wednesday,_that.thursday,_that.friday,_that.saturday,_that.sunday);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? monday,  String? tuesday,  String? wednesday,  String? thursday,  String? friday,  String? saturday,  String? sunday)  $default,) {final _that = this;
switch (_that) {
case _OpeningHours():
return $default(_that.monday,_that.tuesday,_that.wednesday,_that.thursday,_that.friday,_that.saturday,_that.sunday);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? monday,  String? tuesday,  String? wednesday,  String? thursday,  String? friday,  String? saturday,  String? sunday)?  $default,) {final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that.monday,_that.tuesday,_that.wednesday,_that.thursday,_that.friday,_that.saturday,_that.sunday);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpeningHours implements OpeningHours {
  const _OpeningHours({this.monday, this.tuesday, this.wednesday, this.thursday, this.friday, this.saturday, this.sunday});
  factory _OpeningHours.fromJson(Map<String, dynamic> json) => _$OpeningHoursFromJson(json);

@override final  String? monday;
@override final  String? tuesday;
@override final  String? wednesday;
@override final  String? thursday;
@override final  String? friday;
@override final  String? saturday;
@override final  String? sunday;

/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpeningHoursCopyWith<_OpeningHours> get copyWith => __$OpeningHoursCopyWithImpl<_OpeningHours>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpeningHoursToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpeningHours&&(identical(other.monday, monday) || other.monday == monday)&&(identical(other.tuesday, tuesday) || other.tuesday == tuesday)&&(identical(other.wednesday, wednesday) || other.wednesday == wednesday)&&(identical(other.thursday, thursday) || other.thursday == thursday)&&(identical(other.friday, friday) || other.friday == friday)&&(identical(other.saturday, saturday) || other.saturday == saturday)&&(identical(other.sunday, sunday) || other.sunday == sunday));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monday,tuesday,wednesday,thursday,friday,saturday,sunday);

@override
String toString() {
  return 'OpeningHours(monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday)';
}


}

/// @nodoc
abstract mixin class _$OpeningHoursCopyWith<$Res> implements $OpeningHoursCopyWith<$Res> {
  factory _$OpeningHoursCopyWith(_OpeningHours value, $Res Function(_OpeningHours) _then) = __$OpeningHoursCopyWithImpl;
@override @useResult
$Res call({
 String? monday, String? tuesday, String? wednesday, String? thursday, String? friday, String? saturday, String? sunday
});




}
/// @nodoc
class __$OpeningHoursCopyWithImpl<$Res>
    implements _$OpeningHoursCopyWith<$Res> {
  __$OpeningHoursCopyWithImpl(this._self, this._then);

  final _OpeningHours _self;
  final $Res Function(_OpeningHours) _then;

/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monday = freezed,Object? tuesday = freezed,Object? wednesday = freezed,Object? thursday = freezed,Object? friday = freezed,Object? saturday = freezed,Object? sunday = freezed,}) {
  return _then(_OpeningHours(
monday: freezed == monday ? _self.monday : monday // ignore: cast_nullable_to_non_nullable
as String?,tuesday: freezed == tuesday ? _self.tuesday : tuesday // ignore: cast_nullable_to_non_nullable
as String?,wednesday: freezed == wednesday ? _self.wednesday : wednesday // ignore: cast_nullable_to_non_nullable
as String?,thursday: freezed == thursday ? _self.thursday : thursday // ignore: cast_nullable_to_non_nullable
as String?,friday: freezed == friday ? _self.friday : friday // ignore: cast_nullable_to_non_nullable
as String?,saturday: freezed == saturday ? _self.saturday : saturday // ignore: cast_nullable_to_non_nullable
as String?,sunday: freezed == sunday ? _self.sunday : sunday // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EntertainmentPlaceDetail {

/// Internal unique ID.
 String get id;/// Provider ID.
 String get providerId;/// External ID from the provider.
 String get externalId;/// Name of the venue.
 String get name;/// Primary entertainment tag.
 EntertainmentTag get tag;/// Location description.
 String get location;/// Latitude coordinate.
 double get latitude;/// Longitude coordinate.
 double get longitude;/// Full description.
 String? get description;/// Short description for previews.
 String? get shortDescription;/// Photo URLs.
 List<String> get photos;/// Opening hours.
 OpeningHours? get openingHours;/// Rating (0-5).
 double? get rating;/// Review count.
 int? get reviewCount;/// Website URL.
 String? get website;/// Phone number.
 String? get phone;/// Address.
 String? get address;/// Price level (1-4, 1=cheap, 4=expensive).
 int? get priceLevel;/// Whether entry is free.
 bool get isFree;/// Whether venue is kid-friendly.
 bool get isKidFriendly;/// Whether venue is accessible.
 bool get isAccessible;/// Distance from center in meters.
 int? get distanceFromCenter;/// All applicable tags.
 List<EntertainmentTag> get allTags;/// Editorial summary.
 String? get editorialSummary;
/// Create a copy of EntertainmentPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntertainmentPlaceDetailCopyWith<EntertainmentPlaceDetail> get copyWith => _$EntertainmentPlaceDetailCopyWithImpl<EntertainmentPlaceDetail>(this as EntertainmentPlaceDetail, _$identity);

  /// Serializes this EntertainmentPlaceDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntertainmentPlaceDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.openingHours, openingHours) || other.openingHours == openingHours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.website, website) || other.website == website)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.priceLevel, priceLevel) || other.priceLevel == priceLevel)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.isKidFriendly, isKidFriendly) || other.isKidFriendly == isKidFriendly)&&(identical(other.isAccessible, isAccessible) || other.isAccessible == isAccessible)&&(identical(other.distanceFromCenter, distanceFromCenter) || other.distanceFromCenter == distanceFromCenter)&&const DeepCollectionEquality().equals(other.allTags, allTags)&&(identical(other.editorialSummary, editorialSummary) || other.editorialSummary == editorialSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,providerId,externalId,name,tag,location,latitude,longitude,description,shortDescription,const DeepCollectionEquality().hash(photos),openingHours,rating,reviewCount,website,phone,address,priceLevel,isFree,isKidFriendly,isAccessible,distanceFromCenter,const DeepCollectionEquality().hash(allTags),editorialSummary]);

@override
String toString() {
  return 'EntertainmentPlaceDetail(id: $id, providerId: $providerId, externalId: $externalId, name: $name, tag: $tag, location: $location, latitude: $latitude, longitude: $longitude, description: $description, shortDescription: $shortDescription, photos: $photos, openingHours: $openingHours, rating: $rating, reviewCount: $reviewCount, website: $website, phone: $phone, address: $address, priceLevel: $priceLevel, isFree: $isFree, isKidFriendly: $isKidFriendly, isAccessible: $isAccessible, distanceFromCenter: $distanceFromCenter, allTags: $allTags, editorialSummary: $editorialSummary)';
}


}

/// @nodoc
abstract mixin class $EntertainmentPlaceDetailCopyWith<$Res>  {
  factory $EntertainmentPlaceDetailCopyWith(EntertainmentPlaceDetail value, $Res Function(EntertainmentPlaceDetail) _then) = _$EntertainmentPlaceDetailCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String name, EntertainmentTag tag, String location, double latitude, double longitude, String? description, String? shortDescription, List<String> photos, OpeningHours? openingHours, double? rating, int? reviewCount, String? website, String? phone, String? address, int? priceLevel, bool isFree, bool isKidFriendly, bool isAccessible, int? distanceFromCenter, List<EntertainmentTag> allTags, String? editorialSummary
});


$OpeningHoursCopyWith<$Res>? get openingHours;

}
/// @nodoc
class _$EntertainmentPlaceDetailCopyWithImpl<$Res>
    implements $EntertainmentPlaceDetailCopyWith<$Res> {
  _$EntertainmentPlaceDetailCopyWithImpl(this._self, this._then);

  final EntertainmentPlaceDetail _self;
  final $Res Function(EntertainmentPlaceDetail) _then;

/// Create a copy of EntertainmentPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? tag = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? description = freezed,Object? shortDescription = freezed,Object? photos = null,Object? openingHours = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? website = freezed,Object? phone = freezed,Object? address = freezed,Object? priceLevel = freezed,Object? isFree = null,Object? isKidFriendly = null,Object? isAccessible = null,Object? distanceFromCenter = freezed,Object? allTags = null,Object? editorialSummary = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as EntertainmentTag,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,openingHours: freezed == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as OpeningHours?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,priceLevel: freezed == priceLevel ? _self.priceLevel : priceLevel // ignore: cast_nullable_to_non_nullable
as int?,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,isKidFriendly: null == isKidFriendly ? _self.isKidFriendly : isKidFriendly // ignore: cast_nullable_to_non_nullable
as bool,isAccessible: null == isAccessible ? _self.isAccessible : isAccessible // ignore: cast_nullable_to_non_nullable
as bool,distanceFromCenter: freezed == distanceFromCenter ? _self.distanceFromCenter : distanceFromCenter // ignore: cast_nullable_to_non_nullable
as int?,allTags: null == allTags ? _self.allTags : allTags // ignore: cast_nullable_to_non_nullable
as List<EntertainmentTag>,editorialSummary: freezed == editorialSummary ? _self.editorialSummary : editorialSummary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EntertainmentPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpeningHoursCopyWith<$Res>? get openingHours {
    if (_self.openingHours == null) {
    return null;
  }

  return $OpeningHoursCopyWith<$Res>(_self.openingHours!, (value) {
    return _then(_self.copyWith(openingHours: value));
  });
}
}


/// Adds pattern-matching-related methods to [EntertainmentPlaceDetail].
extension EntertainmentPlaceDetailPatterns on EntertainmentPlaceDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntertainmentPlaceDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntertainmentPlaceDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntertainmentPlaceDetail value)  $default,){
final _that = this;
switch (_that) {
case _EntertainmentPlaceDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntertainmentPlaceDetail value)?  $default,){
final _that = this;
switch (_that) {
case _EntertainmentPlaceDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  EntertainmentTag tag,  String location,  double latitude,  double longitude,  String? description,  String? shortDescription,  List<String> photos,  OpeningHours? openingHours,  double? rating,  int? reviewCount,  String? website,  String? phone,  String? address,  int? priceLevel,  bool isFree,  bool isKidFriendly,  bool isAccessible,  int? distanceFromCenter,  List<EntertainmentTag> allTags,  String? editorialSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntertainmentPlaceDetail() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.tag,_that.location,_that.latitude,_that.longitude,_that.description,_that.shortDescription,_that.photos,_that.openingHours,_that.rating,_that.reviewCount,_that.website,_that.phone,_that.address,_that.priceLevel,_that.isFree,_that.isKidFriendly,_that.isAccessible,_that.distanceFromCenter,_that.allTags,_that.editorialSummary);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  EntertainmentTag tag,  String location,  double latitude,  double longitude,  String? description,  String? shortDescription,  List<String> photos,  OpeningHours? openingHours,  double? rating,  int? reviewCount,  String? website,  String? phone,  String? address,  int? priceLevel,  bool isFree,  bool isKidFriendly,  bool isAccessible,  int? distanceFromCenter,  List<EntertainmentTag> allTags,  String? editorialSummary)  $default,) {final _that = this;
switch (_that) {
case _EntertainmentPlaceDetail():
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.tag,_that.location,_that.latitude,_that.longitude,_that.description,_that.shortDescription,_that.photos,_that.openingHours,_that.rating,_that.reviewCount,_that.website,_that.phone,_that.address,_that.priceLevel,_that.isFree,_that.isKidFriendly,_that.isAccessible,_that.distanceFromCenter,_that.allTags,_that.editorialSummary);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String name,  EntertainmentTag tag,  String location,  double latitude,  double longitude,  String? description,  String? shortDescription,  List<String> photos,  OpeningHours? openingHours,  double? rating,  int? reviewCount,  String? website,  String? phone,  String? address,  int? priceLevel,  bool isFree,  bool isKidFriendly,  bool isAccessible,  int? distanceFromCenter,  List<EntertainmentTag> allTags,  String? editorialSummary)?  $default,) {final _that = this;
switch (_that) {
case _EntertainmentPlaceDetail() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.tag,_that.location,_that.latitude,_that.longitude,_that.description,_that.shortDescription,_that.photos,_that.openingHours,_that.rating,_that.reviewCount,_that.website,_that.phone,_that.address,_that.priceLevel,_that.isFree,_that.isKidFriendly,_that.isAccessible,_that.distanceFromCenter,_that.allTags,_that.editorialSummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntertainmentPlaceDetail implements EntertainmentPlaceDetail {
  const _EntertainmentPlaceDetail({required this.id, required this.providerId, required this.externalId, required this.name, required this.tag, required this.location, required this.latitude, required this.longitude, this.description, this.shortDescription, final  List<String> photos = const [], this.openingHours, this.rating, this.reviewCount, this.website, this.phone, this.address, this.priceLevel, this.isFree = false, this.isKidFriendly = false, this.isAccessible = false, this.distanceFromCenter, final  List<EntertainmentTag> allTags = const [], this.editorialSummary}): _photos = photos,_allTags = allTags;
  factory _EntertainmentPlaceDetail.fromJson(Map<String, dynamic> json) => _$EntertainmentPlaceDetailFromJson(json);

/// Internal unique ID.
@override final  String id;
/// Provider ID.
@override final  String providerId;
/// External ID from the provider.
@override final  String externalId;
/// Name of the venue.
@override final  String name;
/// Primary entertainment tag.
@override final  EntertainmentTag tag;
/// Location description.
@override final  String location;
/// Latitude coordinate.
@override final  double latitude;
/// Longitude coordinate.
@override final  double longitude;
/// Full description.
@override final  String? description;
/// Short description for previews.
@override final  String? shortDescription;
/// Photo URLs.
 final  List<String> _photos;
/// Photo URLs.
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

/// Opening hours.
@override final  OpeningHours? openingHours;
/// Rating (0-5).
@override final  double? rating;
/// Review count.
@override final  int? reviewCount;
/// Website URL.
@override final  String? website;
/// Phone number.
@override final  String? phone;
/// Address.
@override final  String? address;
/// Price level (1-4, 1=cheap, 4=expensive).
@override final  int? priceLevel;
/// Whether entry is free.
@override@JsonKey() final  bool isFree;
/// Whether venue is kid-friendly.
@override@JsonKey() final  bool isKidFriendly;
/// Whether venue is accessible.
@override@JsonKey() final  bool isAccessible;
/// Distance from center in meters.
@override final  int? distanceFromCenter;
/// All applicable tags.
 final  List<EntertainmentTag> _allTags;
/// All applicable tags.
@override@JsonKey() List<EntertainmentTag> get allTags {
  if (_allTags is EqualUnmodifiableListView) return _allTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTags);
}

/// Editorial summary.
@override final  String? editorialSummary;

/// Create a copy of EntertainmentPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntertainmentPlaceDetailCopyWith<_EntertainmentPlaceDetail> get copyWith => __$EntertainmentPlaceDetailCopyWithImpl<_EntertainmentPlaceDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntertainmentPlaceDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntertainmentPlaceDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.openingHours, openingHours) || other.openingHours == openingHours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.website, website) || other.website == website)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.priceLevel, priceLevel) || other.priceLevel == priceLevel)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.isKidFriendly, isKidFriendly) || other.isKidFriendly == isKidFriendly)&&(identical(other.isAccessible, isAccessible) || other.isAccessible == isAccessible)&&(identical(other.distanceFromCenter, distanceFromCenter) || other.distanceFromCenter == distanceFromCenter)&&const DeepCollectionEquality().equals(other._allTags, _allTags)&&(identical(other.editorialSummary, editorialSummary) || other.editorialSummary == editorialSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,providerId,externalId,name,tag,location,latitude,longitude,description,shortDescription,const DeepCollectionEquality().hash(_photos),openingHours,rating,reviewCount,website,phone,address,priceLevel,isFree,isKidFriendly,isAccessible,distanceFromCenter,const DeepCollectionEquality().hash(_allTags),editorialSummary]);

@override
String toString() {
  return 'EntertainmentPlaceDetail(id: $id, providerId: $providerId, externalId: $externalId, name: $name, tag: $tag, location: $location, latitude: $latitude, longitude: $longitude, description: $description, shortDescription: $shortDescription, photos: $photos, openingHours: $openingHours, rating: $rating, reviewCount: $reviewCount, website: $website, phone: $phone, address: $address, priceLevel: $priceLevel, isFree: $isFree, isKidFriendly: $isKidFriendly, isAccessible: $isAccessible, distanceFromCenter: $distanceFromCenter, allTags: $allTags, editorialSummary: $editorialSummary)';
}


}

/// @nodoc
abstract mixin class _$EntertainmentPlaceDetailCopyWith<$Res> implements $EntertainmentPlaceDetailCopyWith<$Res> {
  factory _$EntertainmentPlaceDetailCopyWith(_EntertainmentPlaceDetail value, $Res Function(_EntertainmentPlaceDetail) _then) = __$EntertainmentPlaceDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String name, EntertainmentTag tag, String location, double latitude, double longitude, String? description, String? shortDescription, List<String> photos, OpeningHours? openingHours, double? rating, int? reviewCount, String? website, String? phone, String? address, int? priceLevel, bool isFree, bool isKidFriendly, bool isAccessible, int? distanceFromCenter, List<EntertainmentTag> allTags, String? editorialSummary
});


@override $OpeningHoursCopyWith<$Res>? get openingHours;

}
/// @nodoc
class __$EntertainmentPlaceDetailCopyWithImpl<$Res>
    implements _$EntertainmentPlaceDetailCopyWith<$Res> {
  __$EntertainmentPlaceDetailCopyWithImpl(this._self, this._then);

  final _EntertainmentPlaceDetail _self;
  final $Res Function(_EntertainmentPlaceDetail) _then;

/// Create a copy of EntertainmentPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? tag = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? description = freezed,Object? shortDescription = freezed,Object? photos = null,Object? openingHours = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? website = freezed,Object? phone = freezed,Object? address = freezed,Object? priceLevel = freezed,Object? isFree = null,Object? isKidFriendly = null,Object? isAccessible = null,Object? distanceFromCenter = freezed,Object? allTags = null,Object? editorialSummary = freezed,}) {
  return _then(_EntertainmentPlaceDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as EntertainmentTag,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,openingHours: freezed == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as OpeningHours?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,priceLevel: freezed == priceLevel ? _self.priceLevel : priceLevel // ignore: cast_nullable_to_non_nullable
as int?,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,isKidFriendly: null == isKidFriendly ? _self.isKidFriendly : isKidFriendly // ignore: cast_nullable_to_non_nullable
as bool,isAccessible: null == isAccessible ? _self.isAccessible : isAccessible // ignore: cast_nullable_to_non_nullable
as bool,distanceFromCenter: freezed == distanceFromCenter ? _self.distanceFromCenter : distanceFromCenter // ignore: cast_nullable_to_non_nullable
as int?,allTags: null == allTags ? _self._allTags : allTags // ignore: cast_nullable_to_non_nullable
as List<EntertainmentTag>,editorialSummary: freezed == editorialSummary ? _self.editorialSummary : editorialSummary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EntertainmentPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpeningHoursCopyWith<$Res>? get openingHours {
    if (_self.openingHours == null) {
    return null;
  }

  return $OpeningHoursCopyWith<$Res>(_self.openingHours!, (value) {
    return _then(_self.copyWith(openingHours: value));
  });
}
}


/// @nodoc
mixin _$EntertainmentSearchResult {

/// List of result cards.
 List<EntertainmentResultCard> get items;/// Total number of results available.
 int get totalCount;/// Cursor for next page (null if no more).
 String? get nextCursor;/// Whether results are from cache.
 bool get fromCache;
/// Create a copy of EntertainmentSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntertainmentSearchResultCopyWith<EntertainmentSearchResult> get copyWith => _$EntertainmentSearchResultCopyWithImpl<EntertainmentSearchResult>(this as EntertainmentSearchResult, _$identity);

  /// Serializes this EntertainmentSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntertainmentSearchResult&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCount,nextCursor,fromCache);

@override
String toString() {
  return 'EntertainmentSearchResult(items: $items, totalCount: $totalCount, nextCursor: $nextCursor, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class $EntertainmentSearchResultCopyWith<$Res>  {
  factory $EntertainmentSearchResultCopyWith(EntertainmentSearchResult value, $Res Function(EntertainmentSearchResult) _then) = _$EntertainmentSearchResultCopyWithImpl;
@useResult
$Res call({
 List<EntertainmentResultCard> items, int totalCount, String? nextCursor, bool fromCache
});




}
/// @nodoc
class _$EntertainmentSearchResultCopyWithImpl<$Res>
    implements $EntertainmentSearchResultCopyWith<$Res> {
  _$EntertainmentSearchResultCopyWithImpl(this._self, this._then);

  final EntertainmentSearchResult _self;
  final $Res Function(EntertainmentSearchResult) _then;

/// Create a copy of EntertainmentSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCount = null,Object? nextCursor = freezed,Object? fromCache = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EntertainmentResultCard>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EntertainmentSearchResult].
extension EntertainmentSearchResultPatterns on EntertainmentSearchResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntertainmentSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntertainmentSearchResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntertainmentSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _EntertainmentSearchResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntertainmentSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _EntertainmentSearchResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EntertainmentResultCard> items,  int totalCount,  String? nextCursor,  bool fromCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntertainmentSearchResult() when $default != null:
return $default(_that.items,_that.totalCount,_that.nextCursor,_that.fromCache);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EntertainmentResultCard> items,  int totalCount,  String? nextCursor,  bool fromCache)  $default,) {final _that = this;
switch (_that) {
case _EntertainmentSearchResult():
return $default(_that.items,_that.totalCount,_that.nextCursor,_that.fromCache);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EntertainmentResultCard> items,  int totalCount,  String? nextCursor,  bool fromCache)?  $default,) {final _that = this;
switch (_that) {
case _EntertainmentSearchResult() when $default != null:
return $default(_that.items,_that.totalCount,_that.nextCursor,_that.fromCache);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntertainmentSearchResult implements EntertainmentSearchResult {
  const _EntertainmentSearchResult({required final  List<EntertainmentResultCard> items, required this.totalCount, this.nextCursor, this.fromCache = false}): _items = items;
  factory _EntertainmentSearchResult.fromJson(Map<String, dynamic> json) => _$EntertainmentSearchResultFromJson(json);

/// List of result cards.
 final  List<EntertainmentResultCard> _items;
/// List of result cards.
@override List<EntertainmentResultCard> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Total number of results available.
@override final  int totalCount;
/// Cursor for next page (null if no more).
@override final  String? nextCursor;
/// Whether results are from cache.
@override@JsonKey() final  bool fromCache;

/// Create a copy of EntertainmentSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntertainmentSearchResultCopyWith<_EntertainmentSearchResult> get copyWith => __$EntertainmentSearchResultCopyWithImpl<_EntertainmentSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntertainmentSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntertainmentSearchResult&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCount,nextCursor,fromCache);

@override
String toString() {
  return 'EntertainmentSearchResult(items: $items, totalCount: $totalCount, nextCursor: $nextCursor, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class _$EntertainmentSearchResultCopyWith<$Res> implements $EntertainmentSearchResultCopyWith<$Res> {
  factory _$EntertainmentSearchResultCopyWith(_EntertainmentSearchResult value, $Res Function(_EntertainmentSearchResult) _then) = __$EntertainmentSearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<EntertainmentResultCard> items, int totalCount, String? nextCursor, bool fromCache
});




}
/// @nodoc
class __$EntertainmentSearchResultCopyWithImpl<$Res>
    implements _$EntertainmentSearchResultCopyWith<$Res> {
  __$EntertainmentSearchResultCopyWithImpl(this._self, this._then);

  final _EntertainmentSearchResult _self;
  final $Res Function(_EntertainmentSearchResult) _then;

/// Create a copy of EntertainmentSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCount = null,Object? nextCursor = freezed,Object? fromCache = null,}) {
  return _then(_EntertainmentSearchResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EntertainmentResultCard>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
