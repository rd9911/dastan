// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventPlace {

 PlaceGranularity get granularity; String get value; double? get latitude; double? get longitude;
/// Create a copy of EventPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventPlaceCopyWith<EventPlace> get copyWith => _$EventPlaceCopyWithImpl<EventPlace>(this as EventPlace, _$identity);

  /// Serializes this EventPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventPlace&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.value, value) || other.value == value)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,value,latitude,longitude);

@override
String toString() {
  return 'EventPlace(granularity: $granularity, value: $value, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $EventPlaceCopyWith<$Res>  {
  factory $EventPlaceCopyWith(EventPlace value, $Res Function(EventPlace) _then) = _$EventPlaceCopyWithImpl;
@useResult
$Res call({
 PlaceGranularity granularity, String value, double? latitude, double? longitude
});




}
/// @nodoc
class _$EventPlaceCopyWithImpl<$Res>
    implements $EventPlaceCopyWith<$Res> {
  _$EventPlaceCopyWithImpl(this._self, this._then);

  final EventPlace _self;
  final $Res Function(EventPlace) _then;

/// Create a copy of EventPlace
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


/// Adds pattern-matching-related methods to [EventPlace].
extension EventPlacePatterns on EventPlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventPlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventPlace value)  $default,){
final _that = this;
switch (_that) {
case _EventPlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventPlace value)?  $default,){
final _that = this;
switch (_that) {
case _EventPlace() when $default != null:
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
case _EventPlace() when $default != null:
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
case _EventPlace():
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
case _EventPlace() when $default != null:
return $default(_that.granularity,_that.value,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventPlace implements EventPlace {
  const _EventPlace({required this.granularity, required this.value, this.latitude, this.longitude});
  factory _EventPlace.fromJson(Map<String, dynamic> json) => _$EventPlaceFromJson(json);

@override final  PlaceGranularity granularity;
@override final  String value;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of EventPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventPlaceCopyWith<_EventPlace> get copyWith => __$EventPlaceCopyWithImpl<_EventPlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventPlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventPlace&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.value, value) || other.value == value)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,value,latitude,longitude);

@override
String toString() {
  return 'EventPlace(granularity: $granularity, value: $value, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$EventPlaceCopyWith<$Res> implements $EventPlaceCopyWith<$Res> {
  factory _$EventPlaceCopyWith(_EventPlace value, $Res Function(_EventPlace) _then) = __$EventPlaceCopyWithImpl;
@override @useResult
$Res call({
 PlaceGranularity granularity, String value, double? latitude, double? longitude
});




}
/// @nodoc
class __$EventPlaceCopyWithImpl<$Res>
    implements _$EventPlaceCopyWith<$Res> {
  __$EventPlaceCopyWithImpl(this._self, this._then);

  final _EventPlace _self;
  final $Res Function(_EventPlace) _then;

/// Create a copy of EventPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? granularity = null,Object? value = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_EventPlace(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as PlaceGranularity,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$EventDateWindow {

 DateTime get start; DateTime get end;
/// Create a copy of EventDateWindow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDateWindowCopyWith<EventDateWindow> get copyWith => _$EventDateWindowCopyWithImpl<EventDateWindow>(this as EventDateWindow, _$identity);

  /// Serializes this EventDateWindow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDateWindow&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'EventDateWindow(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $EventDateWindowCopyWith<$Res>  {
  factory $EventDateWindowCopyWith(EventDateWindow value, $Res Function(EventDateWindow) _then) = _$EventDateWindowCopyWithImpl;
@useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class _$EventDateWindowCopyWithImpl<$Res>
    implements $EventDateWindowCopyWith<$Res> {
  _$EventDateWindowCopyWithImpl(this._self, this._then);

  final EventDateWindow _self;
  final $Res Function(EventDateWindow) _then;

/// Create a copy of EventDateWindow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [EventDateWindow].
extension EventDateWindowPatterns on EventDateWindow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventDateWindow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventDateWindow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventDateWindow value)  $default,){
final _that = this;
switch (_that) {
case _EventDateWindow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventDateWindow value)?  $default,){
final _that = this;
switch (_that) {
case _EventDateWindow() when $default != null:
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
case _EventDateWindow() when $default != null:
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
case _EventDateWindow():
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
case _EventDateWindow() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventDateWindow implements EventDateWindow {
  const _EventDateWindow({required this.start, required this.end});
  factory _EventDateWindow.fromJson(Map<String, dynamic> json) => _$EventDateWindowFromJson(json);

@override final  DateTime start;
@override final  DateTime end;

/// Create a copy of EventDateWindow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDateWindowCopyWith<_EventDateWindow> get copyWith => __$EventDateWindowCopyWithImpl<_EventDateWindow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventDateWindowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDateWindow&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'EventDateWindow(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$EventDateWindowCopyWith<$Res> implements $EventDateWindowCopyWith<$Res> {
  factory _$EventDateWindowCopyWith(_EventDateWindow value, $Res Function(_EventDateWindow) _then) = __$EventDateWindowCopyWithImpl;
@override @useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class __$EventDateWindowCopyWithImpl<$Res>
    implements _$EventDateWindowCopyWith<$Res> {
  __$EventDateWindowCopyWithImpl(this._self, this._then);

  final _EventDateWindow _self;
  final $Res Function(_EventDateWindow) _then;

/// Create a copy of EventDateWindow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_EventDateWindow(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$EventVenue {

 String get name; double get latitude; double get longitude; String? get address; String? get city;
/// Create a copy of EventVenue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventVenueCopyWith<EventVenue> get copyWith => _$EventVenueCopyWithImpl<EventVenue>(this as EventVenue, _$identity);

  /// Serializes this EventVenue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventVenue&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,latitude,longitude,address,city);

@override
String toString() {
  return 'EventVenue(name: $name, latitude: $latitude, longitude: $longitude, address: $address, city: $city)';
}


}

/// @nodoc
abstract mixin class $EventVenueCopyWith<$Res>  {
  factory $EventVenueCopyWith(EventVenue value, $Res Function(EventVenue) _then) = _$EventVenueCopyWithImpl;
@useResult
$Res call({
 String name, double latitude, double longitude, String? address, String? city
});




}
/// @nodoc
class _$EventVenueCopyWithImpl<$Res>
    implements $EventVenueCopyWith<$Res> {
  _$EventVenueCopyWithImpl(this._self, this._then);

  final EventVenue _self;
  final $Res Function(EventVenue) _then;

/// Create a copy of EventVenue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? latitude = null,Object? longitude = null,Object? address = freezed,Object? city = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventVenue].
extension EventVenuePatterns on EventVenue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventVenue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventVenue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventVenue value)  $default,){
final _that = this;
switch (_that) {
case _EventVenue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventVenue value)?  $default,){
final _that = this;
switch (_that) {
case _EventVenue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double latitude,  double longitude,  String? address,  String? city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventVenue() when $default != null:
return $default(_that.name,_that.latitude,_that.longitude,_that.address,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double latitude,  double longitude,  String? address,  String? city)  $default,) {final _that = this;
switch (_that) {
case _EventVenue():
return $default(_that.name,_that.latitude,_that.longitude,_that.address,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double latitude,  double longitude,  String? address,  String? city)?  $default,) {final _that = this;
switch (_that) {
case _EventVenue() when $default != null:
return $default(_that.name,_that.latitude,_that.longitude,_that.address,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventVenue implements EventVenue {
  const _EventVenue({required this.name, required this.latitude, required this.longitude, this.address, this.city});
  factory _EventVenue.fromJson(Map<String, dynamic> json) => _$EventVenueFromJson(json);

@override final  String name;
@override final  double latitude;
@override final  double longitude;
@override final  String? address;
@override final  String? city;

/// Create a copy of EventVenue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventVenueCopyWith<_EventVenue> get copyWith => __$EventVenueCopyWithImpl<_EventVenue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventVenueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventVenue&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,latitude,longitude,address,city);

@override
String toString() {
  return 'EventVenue(name: $name, latitude: $latitude, longitude: $longitude, address: $address, city: $city)';
}


}

/// @nodoc
abstract mixin class _$EventVenueCopyWith<$Res> implements $EventVenueCopyWith<$Res> {
  factory _$EventVenueCopyWith(_EventVenue value, $Res Function(_EventVenue) _then) = __$EventVenueCopyWithImpl;
@override @useResult
$Res call({
 String name, double latitude, double longitude, String? address, String? city
});




}
/// @nodoc
class __$EventVenueCopyWithImpl<$Res>
    implements _$EventVenueCopyWith<$Res> {
  __$EventVenueCopyWithImpl(this._self, this._then);

  final _EventVenue _self;
  final $Res Function(_EventVenue) _then;

/// Create a copy of EventVenue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? latitude = null,Object? longitude = null,Object? address = freezed,Object? city = freezed,}) {
  return _then(_EventVenue(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EventsFilters {

 List<EventCategory> get categories; bool? get duringMyDates; bool? get free; bool? get familyFriendly; bool? get thisWeekend; bool? get today;
/// Create a copy of EventsFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventsFiltersCopyWith<EventsFilters> get copyWith => _$EventsFiltersCopyWithImpl<EventsFilters>(this as EventsFilters, _$identity);

  /// Serializes this EventsFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsFilters&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.duringMyDates, duringMyDates) || other.duringMyDates == duringMyDates)&&(identical(other.free, free) || other.free == free)&&(identical(other.familyFriendly, familyFriendly) || other.familyFriendly == familyFriendly)&&(identical(other.thisWeekend, thisWeekend) || other.thisWeekend == thisWeekend)&&(identical(other.today, today) || other.today == today));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),duringMyDates,free,familyFriendly,thisWeekend,today);

@override
String toString() {
  return 'EventsFilters(categories: $categories, duringMyDates: $duringMyDates, free: $free, familyFriendly: $familyFriendly, thisWeekend: $thisWeekend, today: $today)';
}


}

/// @nodoc
abstract mixin class $EventsFiltersCopyWith<$Res>  {
  factory $EventsFiltersCopyWith(EventsFilters value, $Res Function(EventsFilters) _then) = _$EventsFiltersCopyWithImpl;
@useResult
$Res call({
 List<EventCategory> categories, bool? duringMyDates, bool? free, bool? familyFriendly, bool? thisWeekend, bool? today
});




}
/// @nodoc
class _$EventsFiltersCopyWithImpl<$Res>
    implements $EventsFiltersCopyWith<$Res> {
  _$EventsFiltersCopyWithImpl(this._self, this._then);

  final EventsFilters _self;
  final $Res Function(EventsFilters) _then;

/// Create a copy of EventsFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? duringMyDates = freezed,Object? free = freezed,Object? familyFriendly = freezed,Object? thisWeekend = freezed,Object? today = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<EventCategory>,duringMyDates: freezed == duringMyDates ? _self.duringMyDates : duringMyDates // ignore: cast_nullable_to_non_nullable
as bool?,free: freezed == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as bool?,familyFriendly: freezed == familyFriendly ? _self.familyFriendly : familyFriendly // ignore: cast_nullable_to_non_nullable
as bool?,thisWeekend: freezed == thisWeekend ? _self.thisWeekend : thisWeekend // ignore: cast_nullable_to_non_nullable
as bool?,today: freezed == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventsFilters].
extension EventsFiltersPatterns on EventsFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventsFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventsFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventsFilters value)  $default,){
final _that = this;
switch (_that) {
case _EventsFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventsFilters value)?  $default,){
final _that = this;
switch (_that) {
case _EventsFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EventCategory> categories,  bool? duringMyDates,  bool? free,  bool? familyFriendly,  bool? thisWeekend,  bool? today)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventsFilters() when $default != null:
return $default(_that.categories,_that.duringMyDates,_that.free,_that.familyFriendly,_that.thisWeekend,_that.today);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EventCategory> categories,  bool? duringMyDates,  bool? free,  bool? familyFriendly,  bool? thisWeekend,  bool? today)  $default,) {final _that = this;
switch (_that) {
case _EventsFilters():
return $default(_that.categories,_that.duringMyDates,_that.free,_that.familyFriendly,_that.thisWeekend,_that.today);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EventCategory> categories,  bool? duringMyDates,  bool? free,  bool? familyFriendly,  bool? thisWeekend,  bool? today)?  $default,) {final _that = this;
switch (_that) {
case _EventsFilters() when $default != null:
return $default(_that.categories,_that.duringMyDates,_that.free,_that.familyFriendly,_that.thisWeekend,_that.today);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventsFilters implements EventsFilters {
  const _EventsFilters({final  List<EventCategory> categories = const [], this.duringMyDates, this.free, this.familyFriendly, this.thisWeekend, this.today}): _categories = categories;
  factory _EventsFilters.fromJson(Map<String, dynamic> json) => _$EventsFiltersFromJson(json);

 final  List<EventCategory> _categories;
@override@JsonKey() List<EventCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  bool? duringMyDates;
@override final  bool? free;
@override final  bool? familyFriendly;
@override final  bool? thisWeekend;
@override final  bool? today;

/// Create a copy of EventsFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsFiltersCopyWith<_EventsFilters> get copyWith => __$EventsFiltersCopyWithImpl<_EventsFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventsFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsFilters&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.duringMyDates, duringMyDates) || other.duringMyDates == duringMyDates)&&(identical(other.free, free) || other.free == free)&&(identical(other.familyFriendly, familyFriendly) || other.familyFriendly == familyFriendly)&&(identical(other.thisWeekend, thisWeekend) || other.thisWeekend == thisWeekend)&&(identical(other.today, today) || other.today == today));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),duringMyDates,free,familyFriendly,thisWeekend,today);

@override
String toString() {
  return 'EventsFilters(categories: $categories, duringMyDates: $duringMyDates, free: $free, familyFriendly: $familyFriendly, thisWeekend: $thisWeekend, today: $today)';
}


}

/// @nodoc
abstract mixin class _$EventsFiltersCopyWith<$Res> implements $EventsFiltersCopyWith<$Res> {
  factory _$EventsFiltersCopyWith(_EventsFilters value, $Res Function(_EventsFilters) _then) = __$EventsFiltersCopyWithImpl;
@override @useResult
$Res call({
 List<EventCategory> categories, bool? duringMyDates, bool? free, bool? familyFriendly, bool? thisWeekend, bool? today
});




}
/// @nodoc
class __$EventsFiltersCopyWithImpl<$Res>
    implements _$EventsFiltersCopyWith<$Res> {
  __$EventsFiltersCopyWithImpl(this._self, this._then);

  final _EventsFilters _self;
  final $Res Function(_EventsFilters) _then;

/// Create a copy of EventsFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? duringMyDates = freezed,Object? free = freezed,Object? familyFriendly = freezed,Object? thisWeekend = freezed,Object? today = freezed,}) {
  return _then(_EventsFilters(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<EventCategory>,duringMyDates: freezed == duringMyDates ? _self.duringMyDates : duringMyDates // ignore: cast_nullable_to_non_nullable
as bool?,free: freezed == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as bool?,familyFriendly: freezed == familyFriendly ? _self.familyFriendly : familyFriendly // ignore: cast_nullable_to_non_nullable
as bool?,thisWeekend: freezed == thisWeekend ? _self.thisWeekend : thisWeekend // ignore: cast_nullable_to_non_nullable
as bool?,today: freezed == today ? _self.today : today // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$EventsSearchRequest {

 String get itineraryId; EventPlace get place; EventDateWindow? get dateWindow; EventsFilters? get filters; EventsSort get sort;
/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventsSearchRequestCopyWith<EventsSearchRequest> get copyWith => _$EventsSearchRequestCopyWithImpl<EventsSearchRequest>(this as EventsSearchRequest, _$identity);

  /// Serializes this EventsSearchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.dateWindow, dateWindow) || other.dateWindow == dateWindow)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,dateWindow,filters,sort);

@override
String toString() {
  return 'EventsSearchRequest(itineraryId: $itineraryId, place: $place, dateWindow: $dateWindow, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $EventsSearchRequestCopyWith<$Res>  {
  factory $EventsSearchRequestCopyWith(EventsSearchRequest value, $Res Function(EventsSearchRequest) _then) = _$EventsSearchRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, EventPlace place, EventDateWindow? dateWindow, EventsFilters? filters, EventsSort sort
});


$EventPlaceCopyWith<$Res> get place;$EventDateWindowCopyWith<$Res>? get dateWindow;$EventsFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class _$EventsSearchRequestCopyWithImpl<$Res>
    implements $EventsSearchRequestCopyWith<$Res> {
  _$EventsSearchRequestCopyWithImpl(this._self, this._then);

  final EventsSearchRequest _self;
  final $Res Function(EventsSearchRequest) _then;

/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? place = null,Object? dateWindow = freezed,Object? filters = freezed,Object? sort = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as EventPlace,dateWindow: freezed == dateWindow ? _self.dateWindow : dateWindow // ignore: cast_nullable_to_non_nullable
as EventDateWindow?,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as EventsFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as EventsSort,
  ));
}
/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventPlaceCopyWith<$Res> get place {
  
  return $EventPlaceCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventDateWindowCopyWith<$Res>? get dateWindow {
    if (_self.dateWindow == null) {
    return null;
  }

  return $EventDateWindowCopyWith<$Res>(_self.dateWindow!, (value) {
    return _then(_self.copyWith(dateWindow: value));
  });
}/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventsFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $EventsFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// Adds pattern-matching-related methods to [EventsSearchRequest].
extension EventsSearchRequestPatterns on EventsSearchRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventsSearchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventsSearchRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventsSearchRequest value)  $default,){
final _that = this;
switch (_that) {
case _EventsSearchRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventsSearchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EventsSearchRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  EventPlace place,  EventDateWindow? dateWindow,  EventsFilters? filters,  EventsSort sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventsSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.dateWindow,_that.filters,_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  EventPlace place,  EventDateWindow? dateWindow,  EventsFilters? filters,  EventsSort sort)  $default,) {final _that = this;
switch (_that) {
case _EventsSearchRequest():
return $default(_that.itineraryId,_that.place,_that.dateWindow,_that.filters,_that.sort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  EventPlace place,  EventDateWindow? dateWindow,  EventsFilters? filters,  EventsSort sort)?  $default,) {final _that = this;
switch (_that) {
case _EventsSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.dateWindow,_that.filters,_that.sort);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventsSearchRequest implements EventsSearchRequest {
  const _EventsSearchRequest({required this.itineraryId, required this.place, this.dateWindow, this.filters = const EventsFilters(), this.sort = EventsSort.date});
  factory _EventsSearchRequest.fromJson(Map<String, dynamic> json) => _$EventsSearchRequestFromJson(json);

@override final  String itineraryId;
@override final  EventPlace place;
@override final  EventDateWindow? dateWindow;
@override@JsonKey() final  EventsFilters? filters;
@override@JsonKey() final  EventsSort sort;

/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsSearchRequestCopyWith<_EventsSearchRequest> get copyWith => __$EventsSearchRequestCopyWithImpl<_EventsSearchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventsSearchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.dateWindow, dateWindow) || other.dateWindow == dateWindow)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,dateWindow,filters,sort);

@override
String toString() {
  return 'EventsSearchRequest(itineraryId: $itineraryId, place: $place, dateWindow: $dateWindow, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$EventsSearchRequestCopyWith<$Res> implements $EventsSearchRequestCopyWith<$Res> {
  factory _$EventsSearchRequestCopyWith(_EventsSearchRequest value, $Res Function(_EventsSearchRequest) _then) = __$EventsSearchRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, EventPlace place, EventDateWindow? dateWindow, EventsFilters? filters, EventsSort sort
});


@override $EventPlaceCopyWith<$Res> get place;@override $EventDateWindowCopyWith<$Res>? get dateWindow;@override $EventsFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class __$EventsSearchRequestCopyWithImpl<$Res>
    implements _$EventsSearchRequestCopyWith<$Res> {
  __$EventsSearchRequestCopyWithImpl(this._self, this._then);

  final _EventsSearchRequest _self;
  final $Res Function(_EventsSearchRequest) _then;

/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? place = null,Object? dateWindow = freezed,Object? filters = freezed,Object? sort = null,}) {
  return _then(_EventsSearchRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as EventPlace,dateWindow: freezed == dateWindow ? _self.dateWindow : dateWindow // ignore: cast_nullable_to_non_nullable
as EventDateWindow?,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as EventsFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as EventsSort,
  ));
}

/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventPlaceCopyWith<$Res> get place {
  
  return $EventPlaceCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventDateWindowCopyWith<$Res>? get dateWindow {
    if (_self.dateWindow == null) {
    return null;
  }

  return $EventDateWindowCopyWith<$Res>(_self.dateWindow!, (value) {
    return _then(_self.copyWith(dateWindow: value));
  });
}/// Create a copy of EventsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventsFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $EventsFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// @nodoc
mixin _$EventCard {

 String get id; String get providerId; String get externalId; String get title; EventCategory get category; DateTime get start; DateTime? get end; EventVenue get venue; String get leadImage; int? get distance; String? get price; bool? get isFree; bool? get familyFriendly; String? get website; String? get ticketUrl; String? get shortDescription;
/// Create a copy of EventCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCardCopyWith<EventCard> get copyWith => _$EventCardCopyWithImpl<EventCard>(this as EventCard, _$identity);

  /// Serializes this EventCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventCard&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.leadImage, leadImage) || other.leadImage == leadImage)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.familyFriendly, familyFriendly) || other.familyFriendly == familyFriendly)&&(identical(other.website, website) || other.website == website)&&(identical(other.ticketUrl, ticketUrl) || other.ticketUrl == ticketUrl)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,title,category,start,end,venue,leadImage,distance,price,isFree,familyFriendly,website,ticketUrl,shortDescription);

@override
String toString() {
  return 'EventCard(id: $id, providerId: $providerId, externalId: $externalId, title: $title, category: $category, start: $start, end: $end, venue: $venue, leadImage: $leadImage, distance: $distance, price: $price, isFree: $isFree, familyFriendly: $familyFriendly, website: $website, ticketUrl: $ticketUrl, shortDescription: $shortDescription)';
}


}

/// @nodoc
abstract mixin class $EventCardCopyWith<$Res>  {
  factory $EventCardCopyWith(EventCard value, $Res Function(EventCard) _then) = _$EventCardCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String title, EventCategory category, DateTime start, DateTime? end, EventVenue venue, String leadImage, int? distance, String? price, bool? isFree, bool? familyFriendly, String? website, String? ticketUrl, String? shortDescription
});


$EventVenueCopyWith<$Res> get venue;

}
/// @nodoc
class _$EventCardCopyWithImpl<$Res>
    implements $EventCardCopyWith<$Res> {
  _$EventCardCopyWithImpl(this._self, this._then);

  final EventCard _self;
  final $Res Function(EventCard) _then;

/// Create a copy of EventCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? title = null,Object? category = null,Object? start = null,Object? end = freezed,Object? venue = null,Object? leadImage = null,Object? distance = freezed,Object? price = freezed,Object? isFree = freezed,Object? familyFriendly = freezed,Object? website = freezed,Object? ticketUrl = freezed,Object? shortDescription = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as EventCategory,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as EventVenue,leadImage: null == leadImage ? _self.leadImage : leadImage // ignore: cast_nullable_to_non_nullable
as String,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,familyFriendly: freezed == familyFriendly ? _self.familyFriendly : familyFriendly // ignore: cast_nullable_to_non_nullable
as bool?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,ticketUrl: freezed == ticketUrl ? _self.ticketUrl : ticketUrl // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EventCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventVenueCopyWith<$Res> get venue {
  
  return $EventVenueCopyWith<$Res>(_self.venue, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}


/// Adds pattern-matching-related methods to [EventCard].
extension EventCardPatterns on EventCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventCard value)  $default,){
final _that = this;
switch (_that) {
case _EventCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventCard value)?  $default,){
final _that = this;
switch (_that) {
case _EventCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String title,  EventCategory category,  DateTime start,  DateTime? end,  EventVenue venue,  String leadImage,  int? distance,  String? price,  bool? isFree,  bool? familyFriendly,  String? website,  String? ticketUrl,  String? shortDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventCard() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.title,_that.category,_that.start,_that.end,_that.venue,_that.leadImage,_that.distance,_that.price,_that.isFree,_that.familyFriendly,_that.website,_that.ticketUrl,_that.shortDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String title,  EventCategory category,  DateTime start,  DateTime? end,  EventVenue venue,  String leadImage,  int? distance,  String? price,  bool? isFree,  bool? familyFriendly,  String? website,  String? ticketUrl,  String? shortDescription)  $default,) {final _that = this;
switch (_that) {
case _EventCard():
return $default(_that.id,_that.providerId,_that.externalId,_that.title,_that.category,_that.start,_that.end,_that.venue,_that.leadImage,_that.distance,_that.price,_that.isFree,_that.familyFriendly,_that.website,_that.ticketUrl,_that.shortDescription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String title,  EventCategory category,  DateTime start,  DateTime? end,  EventVenue venue,  String leadImage,  int? distance,  String? price,  bool? isFree,  bool? familyFriendly,  String? website,  String? ticketUrl,  String? shortDescription)?  $default,) {final _that = this;
switch (_that) {
case _EventCard() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.title,_that.category,_that.start,_that.end,_that.venue,_that.leadImage,_that.distance,_that.price,_that.isFree,_that.familyFriendly,_that.website,_that.ticketUrl,_that.shortDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventCard implements EventCard {
  const _EventCard({required this.id, required this.providerId, required this.externalId, required this.title, required this.category, required this.start, this.end, required this.venue, required this.leadImage, this.distance, this.price, this.isFree, this.familyFriendly, this.website, this.ticketUrl, this.shortDescription});
  factory _EventCard.fromJson(Map<String, dynamic> json) => _$EventCardFromJson(json);

@override final  String id;
@override final  String providerId;
@override final  String externalId;
@override final  String title;
@override final  EventCategory category;
@override final  DateTime start;
@override final  DateTime? end;
@override final  EventVenue venue;
@override final  String leadImage;
@override final  int? distance;
@override final  String? price;
@override final  bool? isFree;
@override final  bool? familyFriendly;
@override final  String? website;
@override final  String? ticketUrl;
@override final  String? shortDescription;

/// Create a copy of EventCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCardCopyWith<_EventCard> get copyWith => __$EventCardCopyWithImpl<_EventCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventCard&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.leadImage, leadImage) || other.leadImage == leadImage)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.familyFriendly, familyFriendly) || other.familyFriendly == familyFriendly)&&(identical(other.website, website) || other.website == website)&&(identical(other.ticketUrl, ticketUrl) || other.ticketUrl == ticketUrl)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,title,category,start,end,venue,leadImage,distance,price,isFree,familyFriendly,website,ticketUrl,shortDescription);

@override
String toString() {
  return 'EventCard(id: $id, providerId: $providerId, externalId: $externalId, title: $title, category: $category, start: $start, end: $end, venue: $venue, leadImage: $leadImage, distance: $distance, price: $price, isFree: $isFree, familyFriendly: $familyFriendly, website: $website, ticketUrl: $ticketUrl, shortDescription: $shortDescription)';
}


}

/// @nodoc
abstract mixin class _$EventCardCopyWith<$Res> implements $EventCardCopyWith<$Res> {
  factory _$EventCardCopyWith(_EventCard value, $Res Function(_EventCard) _then) = __$EventCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String title, EventCategory category, DateTime start, DateTime? end, EventVenue venue, String leadImage, int? distance, String? price, bool? isFree, bool? familyFriendly, String? website, String? ticketUrl, String? shortDescription
});


@override $EventVenueCopyWith<$Res> get venue;

}
/// @nodoc
class __$EventCardCopyWithImpl<$Res>
    implements _$EventCardCopyWith<$Res> {
  __$EventCardCopyWithImpl(this._self, this._then);

  final _EventCard _self;
  final $Res Function(_EventCard) _then;

/// Create a copy of EventCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? title = null,Object? category = null,Object? start = null,Object? end = freezed,Object? venue = null,Object? leadImage = null,Object? distance = freezed,Object? price = freezed,Object? isFree = freezed,Object? familyFriendly = freezed,Object? website = freezed,Object? ticketUrl = freezed,Object? shortDescription = freezed,}) {
  return _then(_EventCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as EventCategory,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as EventVenue,leadImage: null == leadImage ? _self.leadImage : leadImage // ignore: cast_nullable_to_non_nullable
as String,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,familyFriendly: freezed == familyFriendly ? _self.familyFriendly : familyFriendly // ignore: cast_nullable_to_non_nullable
as bool?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,ticketUrl: freezed == ticketUrl ? _self.ticketUrl : ticketUrl // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EventCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventVenueCopyWith<$Res> get venue {
  
  return $EventVenueCopyWith<$Res>(_self.venue, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}


/// @nodoc
mixin _$EventDetail {

 String get id; String get providerId; String get externalId; String get title; EventCategory get category; DateTime get start; DateTime? get end; EventVenue get venue; List<String> get photos; String? get descriptionShort; String? get descriptionFull; String? get website; String? get ticketUrl; String? get price; bool? get isFree; bool? get familyFriendly; String? get organizer; int? get attendeeCount;
/// Create a copy of EventDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDetailCopyWith<EventDetail> get copyWith => _$EventDetailCopyWithImpl<EventDetail>(this as EventDetail, _$identity);

  /// Serializes this EventDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.venue, venue) || other.venue == venue)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.descriptionShort, descriptionShort) || other.descriptionShort == descriptionShort)&&(identical(other.descriptionFull, descriptionFull) || other.descriptionFull == descriptionFull)&&(identical(other.website, website) || other.website == website)&&(identical(other.ticketUrl, ticketUrl) || other.ticketUrl == ticketUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.familyFriendly, familyFriendly) || other.familyFriendly == familyFriendly)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.attendeeCount, attendeeCount) || other.attendeeCount == attendeeCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,title,category,start,end,venue,const DeepCollectionEquality().hash(photos),descriptionShort,descriptionFull,website,ticketUrl,price,isFree,familyFriendly,organizer,attendeeCount);

@override
String toString() {
  return 'EventDetail(id: $id, providerId: $providerId, externalId: $externalId, title: $title, category: $category, start: $start, end: $end, venue: $venue, photos: $photos, descriptionShort: $descriptionShort, descriptionFull: $descriptionFull, website: $website, ticketUrl: $ticketUrl, price: $price, isFree: $isFree, familyFriendly: $familyFriendly, organizer: $organizer, attendeeCount: $attendeeCount)';
}


}

/// @nodoc
abstract mixin class $EventDetailCopyWith<$Res>  {
  factory $EventDetailCopyWith(EventDetail value, $Res Function(EventDetail) _then) = _$EventDetailCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String title, EventCategory category, DateTime start, DateTime? end, EventVenue venue, List<String> photos, String? descriptionShort, String? descriptionFull, String? website, String? ticketUrl, String? price, bool? isFree, bool? familyFriendly, String? organizer, int? attendeeCount
});


$EventVenueCopyWith<$Res> get venue;

}
/// @nodoc
class _$EventDetailCopyWithImpl<$Res>
    implements $EventDetailCopyWith<$Res> {
  _$EventDetailCopyWithImpl(this._self, this._then);

  final EventDetail _self;
  final $Res Function(EventDetail) _then;

/// Create a copy of EventDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? title = null,Object? category = null,Object? start = null,Object? end = freezed,Object? venue = null,Object? photos = null,Object? descriptionShort = freezed,Object? descriptionFull = freezed,Object? website = freezed,Object? ticketUrl = freezed,Object? price = freezed,Object? isFree = freezed,Object? familyFriendly = freezed,Object? organizer = freezed,Object? attendeeCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as EventCategory,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as EventVenue,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,descriptionShort: freezed == descriptionShort ? _self.descriptionShort : descriptionShort // ignore: cast_nullable_to_non_nullable
as String?,descriptionFull: freezed == descriptionFull ? _self.descriptionFull : descriptionFull // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,ticketUrl: freezed == ticketUrl ? _self.ticketUrl : ticketUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,familyFriendly: freezed == familyFriendly ? _self.familyFriendly : familyFriendly // ignore: cast_nullable_to_non_nullable
as bool?,organizer: freezed == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String?,attendeeCount: freezed == attendeeCount ? _self.attendeeCount : attendeeCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of EventDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventVenueCopyWith<$Res> get venue {
  
  return $EventVenueCopyWith<$Res>(_self.venue, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}


/// Adds pattern-matching-related methods to [EventDetail].
extension EventDetailPatterns on EventDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventDetail value)  $default,){
final _that = this;
switch (_that) {
case _EventDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventDetail value)?  $default,){
final _that = this;
switch (_that) {
case _EventDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String title,  EventCategory category,  DateTime start,  DateTime? end,  EventVenue venue,  List<String> photos,  String? descriptionShort,  String? descriptionFull,  String? website,  String? ticketUrl,  String? price,  bool? isFree,  bool? familyFriendly,  String? organizer,  int? attendeeCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventDetail() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.title,_that.category,_that.start,_that.end,_that.venue,_that.photos,_that.descriptionShort,_that.descriptionFull,_that.website,_that.ticketUrl,_that.price,_that.isFree,_that.familyFriendly,_that.organizer,_that.attendeeCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String title,  EventCategory category,  DateTime start,  DateTime? end,  EventVenue venue,  List<String> photos,  String? descriptionShort,  String? descriptionFull,  String? website,  String? ticketUrl,  String? price,  bool? isFree,  bool? familyFriendly,  String? organizer,  int? attendeeCount)  $default,) {final _that = this;
switch (_that) {
case _EventDetail():
return $default(_that.id,_that.providerId,_that.externalId,_that.title,_that.category,_that.start,_that.end,_that.venue,_that.photos,_that.descriptionShort,_that.descriptionFull,_that.website,_that.ticketUrl,_that.price,_that.isFree,_that.familyFriendly,_that.organizer,_that.attendeeCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String title,  EventCategory category,  DateTime start,  DateTime? end,  EventVenue venue,  List<String> photos,  String? descriptionShort,  String? descriptionFull,  String? website,  String? ticketUrl,  String? price,  bool? isFree,  bool? familyFriendly,  String? organizer,  int? attendeeCount)?  $default,) {final _that = this;
switch (_that) {
case _EventDetail() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.title,_that.category,_that.start,_that.end,_that.venue,_that.photos,_that.descriptionShort,_that.descriptionFull,_that.website,_that.ticketUrl,_that.price,_that.isFree,_that.familyFriendly,_that.organizer,_that.attendeeCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventDetail implements EventDetail {
  const _EventDetail({required this.id, required this.providerId, required this.externalId, required this.title, required this.category, required this.start, this.end, required this.venue, final  List<String> photos = const [], this.descriptionShort, this.descriptionFull, this.website, this.ticketUrl, this.price, this.isFree, this.familyFriendly, this.organizer, this.attendeeCount}): _photos = photos;
  factory _EventDetail.fromJson(Map<String, dynamic> json) => _$EventDetailFromJson(json);

@override final  String id;
@override final  String providerId;
@override final  String externalId;
@override final  String title;
@override final  EventCategory category;
@override final  DateTime start;
@override final  DateTime? end;
@override final  EventVenue venue;
 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  String? descriptionShort;
@override final  String? descriptionFull;
@override final  String? website;
@override final  String? ticketUrl;
@override final  String? price;
@override final  bool? isFree;
@override final  bool? familyFriendly;
@override final  String? organizer;
@override final  int? attendeeCount;

/// Create a copy of EventDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDetailCopyWith<_EventDetail> get copyWith => __$EventDetailCopyWithImpl<_EventDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.venue, venue) || other.venue == venue)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.descriptionShort, descriptionShort) || other.descriptionShort == descriptionShort)&&(identical(other.descriptionFull, descriptionFull) || other.descriptionFull == descriptionFull)&&(identical(other.website, website) || other.website == website)&&(identical(other.ticketUrl, ticketUrl) || other.ticketUrl == ticketUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.familyFriendly, familyFriendly) || other.familyFriendly == familyFriendly)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.attendeeCount, attendeeCount) || other.attendeeCount == attendeeCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,title,category,start,end,venue,const DeepCollectionEquality().hash(_photos),descriptionShort,descriptionFull,website,ticketUrl,price,isFree,familyFriendly,organizer,attendeeCount);

@override
String toString() {
  return 'EventDetail(id: $id, providerId: $providerId, externalId: $externalId, title: $title, category: $category, start: $start, end: $end, venue: $venue, photos: $photos, descriptionShort: $descriptionShort, descriptionFull: $descriptionFull, website: $website, ticketUrl: $ticketUrl, price: $price, isFree: $isFree, familyFriendly: $familyFriendly, organizer: $organizer, attendeeCount: $attendeeCount)';
}


}

/// @nodoc
abstract mixin class _$EventDetailCopyWith<$Res> implements $EventDetailCopyWith<$Res> {
  factory _$EventDetailCopyWith(_EventDetail value, $Res Function(_EventDetail) _then) = __$EventDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String title, EventCategory category, DateTime start, DateTime? end, EventVenue venue, List<String> photos, String? descriptionShort, String? descriptionFull, String? website, String? ticketUrl, String? price, bool? isFree, bool? familyFriendly, String? organizer, int? attendeeCount
});


@override $EventVenueCopyWith<$Res> get venue;

}
/// @nodoc
class __$EventDetailCopyWithImpl<$Res>
    implements _$EventDetailCopyWith<$Res> {
  __$EventDetailCopyWithImpl(this._self, this._then);

  final _EventDetail _self;
  final $Res Function(_EventDetail) _then;

/// Create a copy of EventDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? title = null,Object? category = null,Object? start = null,Object? end = freezed,Object? venue = null,Object? photos = null,Object? descriptionShort = freezed,Object? descriptionFull = freezed,Object? website = freezed,Object? ticketUrl = freezed,Object? price = freezed,Object? isFree = freezed,Object? familyFriendly = freezed,Object? organizer = freezed,Object? attendeeCount = freezed,}) {
  return _then(_EventDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as EventCategory,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as EventVenue,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,descriptionShort: freezed == descriptionShort ? _self.descriptionShort : descriptionShort // ignore: cast_nullable_to_non_nullable
as String?,descriptionFull: freezed == descriptionFull ? _self.descriptionFull : descriptionFull // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,ticketUrl: freezed == ticketUrl ? _self.ticketUrl : ticketUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,isFree: freezed == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool?,familyFriendly: freezed == familyFriendly ? _self.familyFriendly : familyFriendly // ignore: cast_nullable_to_non_nullable
as bool?,organizer: freezed == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String?,attendeeCount: freezed == attendeeCount ? _self.attendeeCount : attendeeCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of EventDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EventVenueCopyWith<$Res> get venue {
  
  return $EventVenueCopyWith<$Res>(_self.venue, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}


/// @nodoc
mixin _$EventsSearchResult {

 List<EventCard> get items; int get totalCount; String? get nextCursor; bool get fromCache;
/// Create a copy of EventsSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventsSearchResultCopyWith<EventsSearchResult> get copyWith => _$EventsSearchResultCopyWithImpl<EventsSearchResult>(this as EventsSearchResult, _$identity);

  /// Serializes this EventsSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsSearchResult&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCount,nextCursor,fromCache);

@override
String toString() {
  return 'EventsSearchResult(items: $items, totalCount: $totalCount, nextCursor: $nextCursor, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class $EventsSearchResultCopyWith<$Res>  {
  factory $EventsSearchResultCopyWith(EventsSearchResult value, $Res Function(EventsSearchResult) _then) = _$EventsSearchResultCopyWithImpl;
@useResult
$Res call({
 List<EventCard> items, int totalCount, String? nextCursor, bool fromCache
});




}
/// @nodoc
class _$EventsSearchResultCopyWithImpl<$Res>
    implements $EventsSearchResultCopyWith<$Res> {
  _$EventsSearchResultCopyWithImpl(this._self, this._then);

  final EventsSearchResult _self;
  final $Res Function(EventsSearchResult) _then;

/// Create a copy of EventsSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCount = null,Object? nextCursor = freezed,Object? fromCache = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<EventCard>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EventsSearchResult].
extension EventsSearchResultPatterns on EventsSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventsSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventsSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventsSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _EventsSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventsSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _EventsSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EventCard> items,  int totalCount,  String? nextCursor,  bool fromCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventsSearchResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EventCard> items,  int totalCount,  String? nextCursor,  bool fromCache)  $default,) {final _that = this;
switch (_that) {
case _EventsSearchResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EventCard> items,  int totalCount,  String? nextCursor,  bool fromCache)?  $default,) {final _that = this;
switch (_that) {
case _EventsSearchResult() when $default != null:
return $default(_that.items,_that.totalCount,_that.nextCursor,_that.fromCache);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventsSearchResult implements EventsSearchResult {
  const _EventsSearchResult({required final  List<EventCard> items, required this.totalCount, this.nextCursor, this.fromCache = false}): _items = items;
  factory _EventsSearchResult.fromJson(Map<String, dynamic> json) => _$EventsSearchResultFromJson(json);

 final  List<EventCard> _items;
@override List<EventCard> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int totalCount;
@override final  String? nextCursor;
@override@JsonKey() final  bool fromCache;

/// Create a copy of EventsSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsSearchResultCopyWith<_EventsSearchResult> get copyWith => __$EventsSearchResultCopyWithImpl<_EventsSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventsSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsSearchResult&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCount,nextCursor,fromCache);

@override
String toString() {
  return 'EventsSearchResult(items: $items, totalCount: $totalCount, nextCursor: $nextCursor, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class _$EventsSearchResultCopyWith<$Res> implements $EventsSearchResultCopyWith<$Res> {
  factory _$EventsSearchResultCopyWith(_EventsSearchResult value, $Res Function(_EventsSearchResult) _then) = __$EventsSearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<EventCard> items, int totalCount, String? nextCursor, bool fromCache
});




}
/// @nodoc
class __$EventsSearchResultCopyWithImpl<$Res>
    implements _$EventsSearchResultCopyWith<$Res> {
  __$EventsSearchResultCopyWithImpl(this._self, this._then);

  final _EventsSearchResult _self;
  final $Res Function(_EventsSearchResult) _then;

/// Create a copy of EventsSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCount = null,Object? nextCursor = freezed,Object? fromCache = null,}) {
  return _then(_EventsSearchResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<EventCard>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
