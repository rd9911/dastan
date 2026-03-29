// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedItemExternal {

 String get vendor; String? get vendorUrl; String? get externalId;
/// Create a copy of SavedItemExternal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedItemExternalCopyWith<SavedItemExternal> get copyWith => _$SavedItemExternalCopyWithImpl<SavedItemExternal>(this as SavedItemExternal, _$identity);

  /// Serializes this SavedItemExternal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedItemExternal&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl)&&(identical(other.externalId, externalId) || other.externalId == externalId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vendor,vendorUrl,externalId);

@override
String toString() {
  return 'SavedItemExternal(vendor: $vendor, vendorUrl: $vendorUrl, externalId: $externalId)';
}


}

/// @nodoc
abstract mixin class $SavedItemExternalCopyWith<$Res>  {
  factory $SavedItemExternalCopyWith(SavedItemExternal value, $Res Function(SavedItemExternal) _then) = _$SavedItemExternalCopyWithImpl;
@useResult
$Res call({
 String vendor, String? vendorUrl, String? externalId
});




}
/// @nodoc
class _$SavedItemExternalCopyWithImpl<$Res>
    implements $SavedItemExternalCopyWith<$Res> {
  _$SavedItemExternalCopyWithImpl(this._self, this._then);

  final SavedItemExternal _self;
  final $Res Function(SavedItemExternal) _then;

/// Create a copy of SavedItemExternal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vendor = null,Object? vendorUrl = freezed,Object? externalId = freezed,}) {
  return _then(_self.copyWith(
vendor: null == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,externalId: freezed == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedItemExternal].
extension SavedItemExternalPatterns on SavedItemExternal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedItemExternal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedItemExternal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedItemExternal value)  $default,){
final _that = this;
switch (_that) {
case _SavedItemExternal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedItemExternal value)?  $default,){
final _that = this;
switch (_that) {
case _SavedItemExternal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vendor,  String? vendorUrl,  String? externalId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedItemExternal() when $default != null:
return $default(_that.vendor,_that.vendorUrl,_that.externalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vendor,  String? vendorUrl,  String? externalId)  $default,) {final _that = this;
switch (_that) {
case _SavedItemExternal():
return $default(_that.vendor,_that.vendorUrl,_that.externalId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vendor,  String? vendorUrl,  String? externalId)?  $default,) {final _that = this;
switch (_that) {
case _SavedItemExternal() when $default != null:
return $default(_that.vendor,_that.vendorUrl,_that.externalId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedItemExternal implements SavedItemExternal {
  const _SavedItemExternal({required this.vendor, required this.vendorUrl, required this.externalId});
  factory _SavedItemExternal.fromJson(Map<String, dynamic> json) => _$SavedItemExternalFromJson(json);

@override final  String vendor;
@override final  String? vendorUrl;
@override final  String? externalId;

/// Create a copy of SavedItemExternal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedItemExternalCopyWith<_SavedItemExternal> get copyWith => __$SavedItemExternalCopyWithImpl<_SavedItemExternal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedItemExternalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedItemExternal&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl)&&(identical(other.externalId, externalId) || other.externalId == externalId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vendor,vendorUrl,externalId);

@override
String toString() {
  return 'SavedItemExternal(vendor: $vendor, vendorUrl: $vendorUrl, externalId: $externalId)';
}


}

/// @nodoc
abstract mixin class _$SavedItemExternalCopyWith<$Res> implements $SavedItemExternalCopyWith<$Res> {
  factory _$SavedItemExternalCopyWith(_SavedItemExternal value, $Res Function(_SavedItemExternal) _then) = __$SavedItemExternalCopyWithImpl;
@override @useResult
$Res call({
 String vendor, String? vendorUrl, String? externalId
});




}
/// @nodoc
class __$SavedItemExternalCopyWithImpl<$Res>
    implements _$SavedItemExternalCopyWith<$Res> {
  __$SavedItemExternalCopyWithImpl(this._self, this._then);

  final _SavedItemExternal _self;
  final $Res Function(_SavedItemExternal) _then;

/// Create a copy of SavedItemExternal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vendor = null,Object? vendorUrl = freezed,Object? externalId = freezed,}) {
  return _then(_SavedItemExternal(
vendor: null == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,externalId: freezed == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SavedItemTime {

 DateTime get start; DateTime get end;
/// Create a copy of SavedItemTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedItemTimeCopyWith<SavedItemTime> get copyWith => _$SavedItemTimeCopyWithImpl<SavedItemTime>(this as SavedItemTime, _$identity);

  /// Serializes this SavedItemTime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedItemTime&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'SavedItemTime(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $SavedItemTimeCopyWith<$Res>  {
  factory $SavedItemTimeCopyWith(SavedItemTime value, $Res Function(SavedItemTime) _then) = _$SavedItemTimeCopyWithImpl;
@useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class _$SavedItemTimeCopyWithImpl<$Res>
    implements $SavedItemTimeCopyWith<$Res> {
  _$SavedItemTimeCopyWithImpl(this._self, this._then);

  final SavedItemTime _self;
  final $Res Function(SavedItemTime) _then;

/// Create a copy of SavedItemTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedItemTime].
extension SavedItemTimePatterns on SavedItemTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedItemTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedItemTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedItemTime value)  $default,){
final _that = this;
switch (_that) {
case _SavedItemTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedItemTime value)?  $default,){
final _that = this;
switch (_that) {
case _SavedItemTime() when $default != null:
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
case _SavedItemTime() when $default != null:
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
case _SavedItemTime():
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
case _SavedItemTime() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedItemTime implements SavedItemTime {
  const _SavedItemTime({required this.start, required this.end});
  factory _SavedItemTime.fromJson(Map<String, dynamic> json) => _$SavedItemTimeFromJson(json);

@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of SavedItemTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedItemTimeCopyWith<_SavedItemTime> get copyWith => __$SavedItemTimeCopyWithImpl<_SavedItemTime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedItemTimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedItemTime&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'SavedItemTime(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$SavedItemTimeCopyWith<$Res> implements $SavedItemTimeCopyWith<$Res> {
  factory _$SavedItemTimeCopyWith(_SavedItemTime value, $Res Function(_SavedItemTime) _then) = __$SavedItemTimeCopyWithImpl;
@override @useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class __$SavedItemTimeCopyWithImpl<$Res>
    implements _$SavedItemTimeCopyWith<$Res> {
  __$SavedItemTimeCopyWithImpl(this._self, this._then);

  final _SavedItemTime _self;
  final $Res Function(_SavedItemTime) _then;

/// Create a copy of SavedItemTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_SavedItemTime(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SavedItemLocation {

 String get name; double get lat; double get lng;
/// Create a copy of SavedItemLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedItemLocationCopyWith<SavedItemLocation> get copyWith => _$SavedItemLocationCopyWithImpl<SavedItemLocation>(this as SavedItemLocation, _$identity);

  /// Serializes this SavedItemLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedItemLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,lat,lng);

@override
String toString() {
  return 'SavedItemLocation(name: $name, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $SavedItemLocationCopyWith<$Res>  {
  factory $SavedItemLocationCopyWith(SavedItemLocation value, $Res Function(SavedItemLocation) _then) = _$SavedItemLocationCopyWithImpl;
@useResult
$Res call({
 String name, double lat, double lng
});




}
/// @nodoc
class _$SavedItemLocationCopyWithImpl<$Res>
    implements $SavedItemLocationCopyWith<$Res> {
  _$SavedItemLocationCopyWithImpl(this._self, this._then);

  final SavedItemLocation _self;
  final $Res Function(SavedItemLocation) _then;

/// Create a copy of SavedItemLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedItemLocation].
extension SavedItemLocationPatterns on SavedItemLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedItemLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedItemLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedItemLocation value)  $default,){
final _that = this;
switch (_that) {
case _SavedItemLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedItemLocation value)?  $default,){
final _that = this;
switch (_that) {
case _SavedItemLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedItemLocation() when $default != null:
return $default(_that.name,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _SavedItemLocation():
return $default(_that.name,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _SavedItemLocation() when $default != null:
return $default(_that.name,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedItemLocation implements SavedItemLocation {
  const _SavedItemLocation({required this.name, required this.lat, required this.lng});
  factory _SavedItemLocation.fromJson(Map<String, dynamic> json) => _$SavedItemLocationFromJson(json);

@override final  String name;
@override final  double lat;
@override final  double lng;

/// Create a copy of SavedItemLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedItemLocationCopyWith<_SavedItemLocation> get copyWith => __$SavedItemLocationCopyWithImpl<_SavedItemLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedItemLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedItemLocation&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,lat,lng);

@override
String toString() {
  return 'SavedItemLocation(name: $name, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$SavedItemLocationCopyWith<$Res> implements $SavedItemLocationCopyWith<$Res> {
  factory _$SavedItemLocationCopyWith(_SavedItemLocation value, $Res Function(_SavedItemLocation) _then) = __$SavedItemLocationCopyWithImpl;
@override @useResult
$Res call({
 String name, double lat, double lng
});




}
/// @nodoc
class __$SavedItemLocationCopyWithImpl<$Res>
    implements _$SavedItemLocationCopyWith<$Res> {
  __$SavedItemLocationCopyWithImpl(this._self, this._then);

  final _SavedItemLocation _self;
  final $Res Function(_SavedItemLocation) _then;

/// Create a copy of SavedItemLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? lat = null,Object? lng = null,}) {
  return _then(_SavedItemLocation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SavedItemSync {

 SyncStatus get status; DateTime? get lastAttemptAt;
/// Create a copy of SavedItemSync
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedItemSyncCopyWith<SavedItemSync> get copyWith => _$SavedItemSyncCopyWithImpl<SavedItemSync>(this as SavedItemSync, _$identity);

  /// Serializes this SavedItemSync to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedItemSync&&(identical(other.status, status) || other.status == status)&&(identical(other.lastAttemptAt, lastAttemptAt) || other.lastAttemptAt == lastAttemptAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,lastAttemptAt);

@override
String toString() {
  return 'SavedItemSync(status: $status, lastAttemptAt: $lastAttemptAt)';
}


}

/// @nodoc
abstract mixin class $SavedItemSyncCopyWith<$Res>  {
  factory $SavedItemSyncCopyWith(SavedItemSync value, $Res Function(SavedItemSync) _then) = _$SavedItemSyncCopyWithImpl;
@useResult
$Res call({
 SyncStatus status, DateTime? lastAttemptAt
});




}
/// @nodoc
class _$SavedItemSyncCopyWithImpl<$Res>
    implements $SavedItemSyncCopyWith<$Res> {
  _$SavedItemSyncCopyWithImpl(this._self, this._then);

  final SavedItemSync _self;
  final $Res Function(SavedItemSync) _then;

/// Create a copy of SavedItemSync
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? lastAttemptAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncStatus,lastAttemptAt: freezed == lastAttemptAt ? _self.lastAttemptAt : lastAttemptAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedItemSync].
extension SavedItemSyncPatterns on SavedItemSync {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedItemSync value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedItemSync() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedItemSync value)  $default,){
final _that = this;
switch (_that) {
case _SavedItemSync():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedItemSync value)?  $default,){
final _that = this;
switch (_that) {
case _SavedItemSync() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SyncStatus status,  DateTime? lastAttemptAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedItemSync() when $default != null:
return $default(_that.status,_that.lastAttemptAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SyncStatus status,  DateTime? lastAttemptAt)  $default,) {final _that = this;
switch (_that) {
case _SavedItemSync():
return $default(_that.status,_that.lastAttemptAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SyncStatus status,  DateTime? lastAttemptAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedItemSync() when $default != null:
return $default(_that.status,_that.lastAttemptAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedItemSync implements SavedItemSync {
  const _SavedItemSync({required this.status, this.lastAttemptAt});
  factory _SavedItemSync.fromJson(Map<String, dynamic> json) => _$SavedItemSyncFromJson(json);

@override final  SyncStatus status;
@override final  DateTime? lastAttemptAt;

/// Create a copy of SavedItemSync
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedItemSyncCopyWith<_SavedItemSync> get copyWith => __$SavedItemSyncCopyWithImpl<_SavedItemSync>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedItemSyncToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedItemSync&&(identical(other.status, status) || other.status == status)&&(identical(other.lastAttemptAt, lastAttemptAt) || other.lastAttemptAt == lastAttemptAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,lastAttemptAt);

@override
String toString() {
  return 'SavedItemSync(status: $status, lastAttemptAt: $lastAttemptAt)';
}


}

/// @nodoc
abstract mixin class _$SavedItemSyncCopyWith<$Res> implements $SavedItemSyncCopyWith<$Res> {
  factory _$SavedItemSyncCopyWith(_SavedItemSync value, $Res Function(_SavedItemSync) _then) = __$SavedItemSyncCopyWithImpl;
@override @useResult
$Res call({
 SyncStatus status, DateTime? lastAttemptAt
});




}
/// @nodoc
class __$SavedItemSyncCopyWithImpl<$Res>
    implements _$SavedItemSyncCopyWith<$Res> {
  __$SavedItemSyncCopyWithImpl(this._self, this._then);

  final _SavedItemSync _self;
  final $Res Function(_SavedItemSync) _then;

/// Create a copy of SavedItemSync
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? lastAttemptAt = freezed,}) {
  return _then(_SavedItemSync(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncStatus,lastAttemptAt: freezed == lastAttemptAt ? _self.lastAttemptAt : lastAttemptAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$SavedItem {

 String get id; String get itineraryId; ItinerarySection get section; String get title; Map<String, dynamic> get details; SavedItemExternal? get externalData; SavedItemTime? get time; SavedItemLocation? get location; List<Map<String, dynamic>> get media; String get dedupeKey; SavedItemSync get sync; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedItemCopyWith<SavedItem> get copyWith => _$SavedItemCopyWithImpl<SavedItem>(this as SavedItem, _$identity);

  /// Serializes this SavedItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.section, section) || other.section == section)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.details, details)&&(identical(other.externalData, externalData) || other.externalData == externalData)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.dedupeKey, dedupeKey) || other.dedupeKey == dedupeKey)&&(identical(other.sync, sync) || other.sync == sync)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryId,section,title,const DeepCollectionEquality().hash(details),externalData,time,location,const DeepCollectionEquality().hash(media),dedupeKey,sync,createdAt,updatedAt);

@override
String toString() {
  return 'SavedItem(id: $id, itineraryId: $itineraryId, section: $section, title: $title, details: $details, externalData: $externalData, time: $time, location: $location, media: $media, dedupeKey: $dedupeKey, sync: $sync, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SavedItemCopyWith<$Res>  {
  factory $SavedItemCopyWith(SavedItem value, $Res Function(SavedItem) _then) = _$SavedItemCopyWithImpl;
@useResult
$Res call({
 String id, String itineraryId, ItinerarySection section, String title, Map<String, dynamic> details, SavedItemExternal? externalData, SavedItemTime? time, SavedItemLocation? location, List<Map<String, dynamic>> media, String dedupeKey, SavedItemSync sync, DateTime createdAt, DateTime updatedAt
});


$SavedItemExternalCopyWith<$Res>? get externalData;$SavedItemTimeCopyWith<$Res>? get time;$SavedItemLocationCopyWith<$Res>? get location;$SavedItemSyncCopyWith<$Res> get sync;

}
/// @nodoc
class _$SavedItemCopyWithImpl<$Res>
    implements $SavedItemCopyWith<$Res> {
  _$SavedItemCopyWithImpl(this._self, this._then);

  final SavedItem _self;
  final $Res Function(SavedItem) _then;

/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itineraryId = null,Object? section = null,Object? title = null,Object? details = null,Object? externalData = freezed,Object? time = freezed,Object? location = freezed,Object? media = null,Object? dedupeKey = null,Object? sync = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as ItinerarySection,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,externalData: freezed == externalData ? _self.externalData : externalData // ignore: cast_nullable_to_non_nullable
as SavedItemExternal?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as SavedItemTime?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as SavedItemLocation?,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,dedupeKey: null == dedupeKey ? _self.dedupeKey : dedupeKey // ignore: cast_nullable_to_non_nullable
as String,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as SavedItemSync,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavedItemExternalCopyWith<$Res>? get externalData {
    if (_self.externalData == null) {
    return null;
  }

  return $SavedItemExternalCopyWith<$Res>(_self.externalData!, (value) {
    return _then(_self.copyWith(externalData: value));
  });
}/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavedItemTimeCopyWith<$Res>? get time {
    if (_self.time == null) {
    return null;
  }

  return $SavedItemTimeCopyWith<$Res>(_self.time!, (value) {
    return _then(_self.copyWith(time: value));
  });
}/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavedItemLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $SavedItemLocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavedItemSyncCopyWith<$Res> get sync {
  
  return $SavedItemSyncCopyWith<$Res>(_self.sync, (value) {
    return _then(_self.copyWith(sync: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedItem].
extension SavedItemPatterns on SavedItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedItem value)  $default,){
final _that = this;
switch (_that) {
case _SavedItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedItem value)?  $default,){
final _that = this;
switch (_that) {
case _SavedItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String itineraryId,  ItinerarySection section,  String title,  Map<String, dynamic> details,  SavedItemExternal? externalData,  SavedItemTime? time,  SavedItemLocation? location,  List<Map<String, dynamic>> media,  String dedupeKey,  SavedItemSync sync,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedItem() when $default != null:
return $default(_that.id,_that.itineraryId,_that.section,_that.title,_that.details,_that.externalData,_that.time,_that.location,_that.media,_that.dedupeKey,_that.sync,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String itineraryId,  ItinerarySection section,  String title,  Map<String, dynamic> details,  SavedItemExternal? externalData,  SavedItemTime? time,  SavedItemLocation? location,  List<Map<String, dynamic>> media,  String dedupeKey,  SavedItemSync sync,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedItem():
return $default(_that.id,_that.itineraryId,_that.section,_that.title,_that.details,_that.externalData,_that.time,_that.location,_that.media,_that.dedupeKey,_that.sync,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String itineraryId,  ItinerarySection section,  String title,  Map<String, dynamic> details,  SavedItemExternal? externalData,  SavedItemTime? time,  SavedItemLocation? location,  List<Map<String, dynamic>> media,  String dedupeKey,  SavedItemSync sync,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedItem() when $default != null:
return $default(_that.id,_that.itineraryId,_that.section,_that.title,_that.details,_that.externalData,_that.time,_that.location,_that.media,_that.dedupeKey,_that.sync,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedItem implements SavedItem {
  const _SavedItem({required this.id, required this.itineraryId, required this.section, required this.title, required final  Map<String, dynamic> details, required this.externalData, required this.time, required this.location, final  List<Map<String, dynamic>> media = const [], required this.dedupeKey, required this.sync, required this.createdAt, required this.updatedAt}): _details = details,_media = media;
  factory _SavedItem.fromJson(Map<String, dynamic> json) => _$SavedItemFromJson(json);

@override final  String id;
@override final  String itineraryId;
@override final  ItinerarySection section;
@override final  String title;
 final  Map<String, dynamic> _details;
@override Map<String, dynamic> get details {
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_details);
}

@override final  SavedItemExternal? externalData;
@override final  SavedItemTime? time;
@override final  SavedItemLocation? location;
 final  List<Map<String, dynamic>> _media;
@override@JsonKey() List<Map<String, dynamic>> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

@override final  String dedupeKey;
@override final  SavedItemSync sync;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedItemCopyWith<_SavedItem> get copyWith => __$SavedItemCopyWithImpl<_SavedItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.section, section) || other.section == section)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._details, _details)&&(identical(other.externalData, externalData) || other.externalData == externalData)&&(identical(other.time, time) || other.time == time)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.dedupeKey, dedupeKey) || other.dedupeKey == dedupeKey)&&(identical(other.sync, sync) || other.sync == sync)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryId,section,title,const DeepCollectionEquality().hash(_details),externalData,time,location,const DeepCollectionEquality().hash(_media),dedupeKey,sync,createdAt,updatedAt);

@override
String toString() {
  return 'SavedItem(id: $id, itineraryId: $itineraryId, section: $section, title: $title, details: $details, externalData: $externalData, time: $time, location: $location, media: $media, dedupeKey: $dedupeKey, sync: $sync, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedItemCopyWith<$Res> implements $SavedItemCopyWith<$Res> {
  factory _$SavedItemCopyWith(_SavedItem value, $Res Function(_SavedItem) _then) = __$SavedItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String itineraryId, ItinerarySection section, String title, Map<String, dynamic> details, SavedItemExternal? externalData, SavedItemTime? time, SavedItemLocation? location, List<Map<String, dynamic>> media, String dedupeKey, SavedItemSync sync, DateTime createdAt, DateTime updatedAt
});


@override $SavedItemExternalCopyWith<$Res>? get externalData;@override $SavedItemTimeCopyWith<$Res>? get time;@override $SavedItemLocationCopyWith<$Res>? get location;@override $SavedItemSyncCopyWith<$Res> get sync;

}
/// @nodoc
class __$SavedItemCopyWithImpl<$Res>
    implements _$SavedItemCopyWith<$Res> {
  __$SavedItemCopyWithImpl(this._self, this._then);

  final _SavedItem _self;
  final $Res Function(_SavedItem) _then;

/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itineraryId = null,Object? section = null,Object? title = null,Object? details = null,Object? externalData = freezed,Object? time = freezed,Object? location = freezed,Object? media = null,Object? dedupeKey = null,Object? sync = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SavedItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as ItinerarySection,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,externalData: freezed == externalData ? _self.externalData : externalData // ignore: cast_nullable_to_non_nullable
as SavedItemExternal?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as SavedItemTime?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as SavedItemLocation?,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,dedupeKey: null == dedupeKey ? _self.dedupeKey : dedupeKey // ignore: cast_nullable_to_non_nullable
as String,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as SavedItemSync,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavedItemExternalCopyWith<$Res>? get externalData {
    if (_self.externalData == null) {
    return null;
  }

  return $SavedItemExternalCopyWith<$Res>(_self.externalData!, (value) {
    return _then(_self.copyWith(externalData: value));
  });
}/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavedItemTimeCopyWith<$Res>? get time {
    if (_self.time == null) {
    return null;
  }

  return $SavedItemTimeCopyWith<$Res>(_self.time!, (value) {
    return _then(_self.copyWith(time: value));
  });
}/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavedItemLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $SavedItemLocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of SavedItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavedItemSyncCopyWith<$Res> get sync {
  
  return $SavedItemSyncCopyWith<$Res>(_self.sync, (value) {
    return _then(_self.copyWith(sync: value));
  });
}
}

// dart format on
