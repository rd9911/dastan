// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trails_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrailPlace {

 PlaceGranularity get granularity; String get value; double? get latitude; double? get longitude;
/// Create a copy of TrailPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailPlaceCopyWith<TrailPlace> get copyWith => _$TrailPlaceCopyWithImpl<TrailPlace>(this as TrailPlace, _$identity);

  /// Serializes this TrailPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailPlace&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.value, value) || other.value == value)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,value,latitude,longitude);

@override
String toString() {
  return 'TrailPlace(granularity: $granularity, value: $value, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $TrailPlaceCopyWith<$Res>  {
  factory $TrailPlaceCopyWith(TrailPlace value, $Res Function(TrailPlace) _then) = _$TrailPlaceCopyWithImpl;
@useResult
$Res call({
 PlaceGranularity granularity, String value, double? latitude, double? longitude
});




}
/// @nodoc
class _$TrailPlaceCopyWithImpl<$Res>
    implements $TrailPlaceCopyWith<$Res> {
  _$TrailPlaceCopyWithImpl(this._self, this._then);

  final TrailPlace _self;
  final $Res Function(TrailPlace) _then;

/// Create a copy of TrailPlace
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


/// Adds pattern-matching-related methods to [TrailPlace].
extension TrailPlacePatterns on TrailPlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailPlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailPlace value)  $default,){
final _that = this;
switch (_that) {
case _TrailPlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailPlace value)?  $default,){
final _that = this;
switch (_that) {
case _TrailPlace() when $default != null:
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
case _TrailPlace() when $default != null:
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
case _TrailPlace():
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
case _TrailPlace() when $default != null:
return $default(_that.granularity,_that.value,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailPlace implements TrailPlace {
  const _TrailPlace({required this.granularity, required this.value, this.latitude, this.longitude});
  factory _TrailPlace.fromJson(Map<String, dynamic> json) => _$TrailPlaceFromJson(json);

@override final  PlaceGranularity granularity;
@override final  String value;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of TrailPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailPlaceCopyWith<_TrailPlace> get copyWith => __$TrailPlaceCopyWithImpl<_TrailPlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailPlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailPlace&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.value, value) || other.value == value)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,value,latitude,longitude);

@override
String toString() {
  return 'TrailPlace(granularity: $granularity, value: $value, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$TrailPlaceCopyWith<$Res> implements $TrailPlaceCopyWith<$Res> {
  factory _$TrailPlaceCopyWith(_TrailPlace value, $Res Function(_TrailPlace) _then) = __$TrailPlaceCopyWithImpl;
@override @useResult
$Res call({
 PlaceGranularity granularity, String value, double? latitude, double? longitude
});




}
/// @nodoc
class __$TrailPlaceCopyWithImpl<$Res>
    implements _$TrailPlaceCopyWith<$Res> {
  __$TrailPlaceCopyWithImpl(this._self, this._then);

  final _TrailPlace _self;
  final $Res Function(_TrailPlace) _then;

/// Create a copy of TrailPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? granularity = null,Object? value = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_TrailPlace(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as PlaceGranularity,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$TrailLocation {

 double get lat; double get lng; String get name; String? get address; double? get distanceFromCenterKm;
/// Create a copy of TrailLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailLocationCopyWith<TrailLocation> get copyWith => _$TrailLocationCopyWithImpl<TrailLocation>(this as TrailLocation, _$identity);

  /// Serializes this TrailLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailLocation&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.distanceFromCenterKm, distanceFromCenterKm) || other.distanceFromCenterKm == distanceFromCenterKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,name,address,distanceFromCenterKm);

@override
String toString() {
  return 'TrailLocation(lat: $lat, lng: $lng, name: $name, address: $address, distanceFromCenterKm: $distanceFromCenterKm)';
}


}

/// @nodoc
abstract mixin class $TrailLocationCopyWith<$Res>  {
  factory $TrailLocationCopyWith(TrailLocation value, $Res Function(TrailLocation) _then) = _$TrailLocationCopyWithImpl;
@useResult
$Res call({
 double lat, double lng, String name, String? address, double? distanceFromCenterKm
});




}
/// @nodoc
class _$TrailLocationCopyWithImpl<$Res>
    implements $TrailLocationCopyWith<$Res> {
  _$TrailLocationCopyWithImpl(this._self, this._then);

  final TrailLocation _self;
  final $Res Function(TrailLocation) _then;

/// Create a copy of TrailLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,Object? name = null,Object? address = freezed,Object? distanceFromCenterKm = freezed,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,distanceFromCenterKm: freezed == distanceFromCenterKm ? _self.distanceFromCenterKm : distanceFromCenterKm // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrailLocation].
extension TrailLocationPatterns on TrailLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailLocation value)  $default,){
final _that = this;
switch (_that) {
case _TrailLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailLocation value)?  $default,){
final _that = this;
switch (_that) {
case _TrailLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng,  String name,  String? address,  double? distanceFromCenterKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailLocation() when $default != null:
return $default(_that.lat,_that.lng,_that.name,_that.address,_that.distanceFromCenterKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng,  String name,  String? address,  double? distanceFromCenterKm)  $default,) {final _that = this;
switch (_that) {
case _TrailLocation():
return $default(_that.lat,_that.lng,_that.name,_that.address,_that.distanceFromCenterKm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng,  String name,  String? address,  double? distanceFromCenterKm)?  $default,) {final _that = this;
switch (_that) {
case _TrailLocation() when $default != null:
return $default(_that.lat,_that.lng,_that.name,_that.address,_that.distanceFromCenterKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailLocation implements TrailLocation {
  const _TrailLocation({required this.lat, required this.lng, required this.name, this.address, this.distanceFromCenterKm});
  factory _TrailLocation.fromJson(Map<String, dynamic> json) => _$TrailLocationFromJson(json);

@override final  double lat;
@override final  double lng;
@override final  String name;
@override final  String? address;
@override final  double? distanceFromCenterKm;

/// Create a copy of TrailLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailLocationCopyWith<_TrailLocation> get copyWith => __$TrailLocationCopyWithImpl<_TrailLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailLocation&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.distanceFromCenterKm, distanceFromCenterKm) || other.distanceFromCenterKm == distanceFromCenterKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,name,address,distanceFromCenterKm);

@override
String toString() {
  return 'TrailLocation(lat: $lat, lng: $lng, name: $name, address: $address, distanceFromCenterKm: $distanceFromCenterKm)';
}


}

/// @nodoc
abstract mixin class _$TrailLocationCopyWith<$Res> implements $TrailLocationCopyWith<$Res> {
  factory _$TrailLocationCopyWith(_TrailLocation value, $Res Function(_TrailLocation) _then) = __$TrailLocationCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng, String name, String? address, double? distanceFromCenterKm
});




}
/// @nodoc
class __$TrailLocationCopyWithImpl<$Res>
    implements _$TrailLocationCopyWith<$Res> {
  __$TrailLocationCopyWithImpl(this._self, this._then);

  final _TrailLocation _self;
  final $Res Function(_TrailLocation) _then;

/// Create a copy of TrailLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,Object? name = null,Object? address = freezed,Object? distanceFromCenterKm = freezed,}) {
  return _then(_TrailLocation(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,distanceFromCenterKm: freezed == distanceFromCenterKm ? _self.distanceFromCenterKm : distanceFromCenterKm // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$TrailsFilters {

 List<TrailDifficulty> get difficulty; double? get lengthMinKm; double? get lengthMaxKm; double? get elevationGainMinM; double? get elevationGainMaxM; bool? get loopOnly; bool? get kidFriendly; bool? get dogFriendly;
/// Create a copy of TrailsFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailsFiltersCopyWith<TrailsFilters> get copyWith => _$TrailsFiltersCopyWithImpl<TrailsFilters>(this as TrailsFilters, _$identity);

  /// Serializes this TrailsFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailsFilters&&const DeepCollectionEquality().equals(other.difficulty, difficulty)&&(identical(other.lengthMinKm, lengthMinKm) || other.lengthMinKm == lengthMinKm)&&(identical(other.lengthMaxKm, lengthMaxKm) || other.lengthMaxKm == lengthMaxKm)&&(identical(other.elevationGainMinM, elevationGainMinM) || other.elevationGainMinM == elevationGainMinM)&&(identical(other.elevationGainMaxM, elevationGainMaxM) || other.elevationGainMaxM == elevationGainMaxM)&&(identical(other.loopOnly, loopOnly) || other.loopOnly == loopOnly)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(difficulty),lengthMinKm,lengthMaxKm,elevationGainMinM,elevationGainMaxM,loopOnly,kidFriendly,dogFriendly);

@override
String toString() {
  return 'TrailsFilters(difficulty: $difficulty, lengthMinKm: $lengthMinKm, lengthMaxKm: $lengthMaxKm, elevationGainMinM: $elevationGainMinM, elevationGainMaxM: $elevationGainMaxM, loopOnly: $loopOnly, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly)';
}


}

/// @nodoc
abstract mixin class $TrailsFiltersCopyWith<$Res>  {
  factory $TrailsFiltersCopyWith(TrailsFilters value, $Res Function(TrailsFilters) _then) = _$TrailsFiltersCopyWithImpl;
@useResult
$Res call({
 List<TrailDifficulty> difficulty, double? lengthMinKm, double? lengthMaxKm, double? elevationGainMinM, double? elevationGainMaxM, bool? loopOnly, bool? kidFriendly, bool? dogFriendly
});




}
/// @nodoc
class _$TrailsFiltersCopyWithImpl<$Res>
    implements $TrailsFiltersCopyWith<$Res> {
  _$TrailsFiltersCopyWithImpl(this._self, this._then);

  final TrailsFilters _self;
  final $Res Function(TrailsFilters) _then;

/// Create a copy of TrailsFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? difficulty = null,Object? lengthMinKm = freezed,Object? lengthMaxKm = freezed,Object? elevationGainMinM = freezed,Object? elevationGainMaxM = freezed,Object? loopOnly = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,}) {
  return _then(_self.copyWith(
difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as List<TrailDifficulty>,lengthMinKm: freezed == lengthMinKm ? _self.lengthMinKm : lengthMinKm // ignore: cast_nullable_to_non_nullable
as double?,lengthMaxKm: freezed == lengthMaxKm ? _self.lengthMaxKm : lengthMaxKm // ignore: cast_nullable_to_non_nullable
as double?,elevationGainMinM: freezed == elevationGainMinM ? _self.elevationGainMinM : elevationGainMinM // ignore: cast_nullable_to_non_nullable
as double?,elevationGainMaxM: freezed == elevationGainMaxM ? _self.elevationGainMaxM : elevationGainMaxM // ignore: cast_nullable_to_non_nullable
as double?,loopOnly: freezed == loopOnly ? _self.loopOnly : loopOnly // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrailsFilters].
extension TrailsFiltersPatterns on TrailsFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailsFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailsFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailsFilters value)  $default,){
final _that = this;
switch (_that) {
case _TrailsFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailsFilters value)?  $default,){
final _that = this;
switch (_that) {
case _TrailsFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TrailDifficulty> difficulty,  double? lengthMinKm,  double? lengthMaxKm,  double? elevationGainMinM,  double? elevationGainMaxM,  bool? loopOnly,  bool? kidFriendly,  bool? dogFriendly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailsFilters() when $default != null:
return $default(_that.difficulty,_that.lengthMinKm,_that.lengthMaxKm,_that.elevationGainMinM,_that.elevationGainMaxM,_that.loopOnly,_that.kidFriendly,_that.dogFriendly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TrailDifficulty> difficulty,  double? lengthMinKm,  double? lengthMaxKm,  double? elevationGainMinM,  double? elevationGainMaxM,  bool? loopOnly,  bool? kidFriendly,  bool? dogFriendly)  $default,) {final _that = this;
switch (_that) {
case _TrailsFilters():
return $default(_that.difficulty,_that.lengthMinKm,_that.lengthMaxKm,_that.elevationGainMinM,_that.elevationGainMaxM,_that.loopOnly,_that.kidFriendly,_that.dogFriendly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TrailDifficulty> difficulty,  double? lengthMinKm,  double? lengthMaxKm,  double? elevationGainMinM,  double? elevationGainMaxM,  bool? loopOnly,  bool? kidFriendly,  bool? dogFriendly)?  $default,) {final _that = this;
switch (_that) {
case _TrailsFilters() when $default != null:
return $default(_that.difficulty,_that.lengthMinKm,_that.lengthMaxKm,_that.elevationGainMinM,_that.elevationGainMaxM,_that.loopOnly,_that.kidFriendly,_that.dogFriendly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailsFilters implements TrailsFilters {
  const _TrailsFilters({final  List<TrailDifficulty> difficulty = const [], this.lengthMinKm, this.lengthMaxKm, this.elevationGainMinM, this.elevationGainMaxM, this.loopOnly, this.kidFriendly, this.dogFriendly}): _difficulty = difficulty;
  factory _TrailsFilters.fromJson(Map<String, dynamic> json) => _$TrailsFiltersFromJson(json);

 final  List<TrailDifficulty> _difficulty;
@override@JsonKey() List<TrailDifficulty> get difficulty {
  if (_difficulty is EqualUnmodifiableListView) return _difficulty;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_difficulty);
}

@override final  double? lengthMinKm;
@override final  double? lengthMaxKm;
@override final  double? elevationGainMinM;
@override final  double? elevationGainMaxM;
@override final  bool? loopOnly;
@override final  bool? kidFriendly;
@override final  bool? dogFriendly;

/// Create a copy of TrailsFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailsFiltersCopyWith<_TrailsFilters> get copyWith => __$TrailsFiltersCopyWithImpl<_TrailsFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailsFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailsFilters&&const DeepCollectionEquality().equals(other._difficulty, _difficulty)&&(identical(other.lengthMinKm, lengthMinKm) || other.lengthMinKm == lengthMinKm)&&(identical(other.lengthMaxKm, lengthMaxKm) || other.lengthMaxKm == lengthMaxKm)&&(identical(other.elevationGainMinM, elevationGainMinM) || other.elevationGainMinM == elevationGainMinM)&&(identical(other.elevationGainMaxM, elevationGainMaxM) || other.elevationGainMaxM == elevationGainMaxM)&&(identical(other.loopOnly, loopOnly) || other.loopOnly == loopOnly)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_difficulty),lengthMinKm,lengthMaxKm,elevationGainMinM,elevationGainMaxM,loopOnly,kidFriendly,dogFriendly);

@override
String toString() {
  return 'TrailsFilters(difficulty: $difficulty, lengthMinKm: $lengthMinKm, lengthMaxKm: $lengthMaxKm, elevationGainMinM: $elevationGainMinM, elevationGainMaxM: $elevationGainMaxM, loopOnly: $loopOnly, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly)';
}


}

/// @nodoc
abstract mixin class _$TrailsFiltersCopyWith<$Res> implements $TrailsFiltersCopyWith<$Res> {
  factory _$TrailsFiltersCopyWith(_TrailsFilters value, $Res Function(_TrailsFilters) _then) = __$TrailsFiltersCopyWithImpl;
@override @useResult
$Res call({
 List<TrailDifficulty> difficulty, double? lengthMinKm, double? lengthMaxKm, double? elevationGainMinM, double? elevationGainMaxM, bool? loopOnly, bool? kidFriendly, bool? dogFriendly
});




}
/// @nodoc
class __$TrailsFiltersCopyWithImpl<$Res>
    implements _$TrailsFiltersCopyWith<$Res> {
  __$TrailsFiltersCopyWithImpl(this._self, this._then);

  final _TrailsFilters _self;
  final $Res Function(_TrailsFilters) _then;

/// Create a copy of TrailsFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? difficulty = null,Object? lengthMinKm = freezed,Object? lengthMaxKm = freezed,Object? elevationGainMinM = freezed,Object? elevationGainMaxM = freezed,Object? loopOnly = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,}) {
  return _then(_TrailsFilters(
difficulty: null == difficulty ? _self._difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as List<TrailDifficulty>,lengthMinKm: freezed == lengthMinKm ? _self.lengthMinKm : lengthMinKm // ignore: cast_nullable_to_non_nullable
as double?,lengthMaxKm: freezed == lengthMaxKm ? _self.lengthMaxKm : lengthMaxKm // ignore: cast_nullable_to_non_nullable
as double?,elevationGainMinM: freezed == elevationGainMinM ? _self.elevationGainMinM : elevationGainMinM // ignore: cast_nullable_to_non_nullable
as double?,elevationGainMaxM: freezed == elevationGainMaxM ? _self.elevationGainMaxM : elevationGainMaxM // ignore: cast_nullable_to_non_nullable
as double?,loopOnly: freezed == loopOnly ? _self.loopOnly : loopOnly // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$TrailsSearchRequest {

 String get itineraryId; TrailPlace get place; TrailsFilters? get filters; TrailsSort get sort;
/// Create a copy of TrailsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailsSearchRequestCopyWith<TrailsSearchRequest> get copyWith => _$TrailsSearchRequestCopyWithImpl<TrailsSearchRequest>(this as TrailsSearchRequest, _$identity);

  /// Serializes this TrailsSearchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailsSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,filters,sort);

@override
String toString() {
  return 'TrailsSearchRequest(itineraryId: $itineraryId, place: $place, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $TrailsSearchRequestCopyWith<$Res>  {
  factory $TrailsSearchRequestCopyWith(TrailsSearchRequest value, $Res Function(TrailsSearchRequest) _then) = _$TrailsSearchRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, TrailPlace place, TrailsFilters? filters, TrailsSort sort
});


$TrailPlaceCopyWith<$Res> get place;$TrailsFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class _$TrailsSearchRequestCopyWithImpl<$Res>
    implements $TrailsSearchRequestCopyWith<$Res> {
  _$TrailsSearchRequestCopyWithImpl(this._self, this._then);

  final TrailsSearchRequest _self;
  final $Res Function(TrailsSearchRequest) _then;

/// Create a copy of TrailsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? place = null,Object? filters = freezed,Object? sort = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as TrailPlace,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as TrailsFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as TrailsSort,
  ));
}
/// Create a copy of TrailsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailPlaceCopyWith<$Res> get place {
  
  return $TrailPlaceCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of TrailsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailsFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $TrailsFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrailsSearchRequest].
extension TrailsSearchRequestPatterns on TrailsSearchRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailsSearchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailsSearchRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailsSearchRequest value)  $default,){
final _that = this;
switch (_that) {
case _TrailsSearchRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailsSearchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TrailsSearchRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  TrailPlace place,  TrailsFilters? filters,  TrailsSort sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailsSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.filters,_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  TrailPlace place,  TrailsFilters? filters,  TrailsSort sort)  $default,) {final _that = this;
switch (_that) {
case _TrailsSearchRequest():
return $default(_that.itineraryId,_that.place,_that.filters,_that.sort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  TrailPlace place,  TrailsFilters? filters,  TrailsSort sort)?  $default,) {final _that = this;
switch (_that) {
case _TrailsSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.filters,_that.sort);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailsSearchRequest implements TrailsSearchRequest {
  const _TrailsSearchRequest({required this.itineraryId, required this.place, this.filters = const TrailsFilters(), this.sort = TrailsSort.recommended});
  factory _TrailsSearchRequest.fromJson(Map<String, dynamic> json) => _$TrailsSearchRequestFromJson(json);

@override final  String itineraryId;
@override final  TrailPlace place;
@override@JsonKey() final  TrailsFilters? filters;
@override@JsonKey() final  TrailsSort sort;

/// Create a copy of TrailsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailsSearchRequestCopyWith<_TrailsSearchRequest> get copyWith => __$TrailsSearchRequestCopyWithImpl<_TrailsSearchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailsSearchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailsSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,filters,sort);

@override
String toString() {
  return 'TrailsSearchRequest(itineraryId: $itineraryId, place: $place, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$TrailsSearchRequestCopyWith<$Res> implements $TrailsSearchRequestCopyWith<$Res> {
  factory _$TrailsSearchRequestCopyWith(_TrailsSearchRequest value, $Res Function(_TrailsSearchRequest) _then) = __$TrailsSearchRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, TrailPlace place, TrailsFilters? filters, TrailsSort sort
});


@override $TrailPlaceCopyWith<$Res> get place;@override $TrailsFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class __$TrailsSearchRequestCopyWithImpl<$Res>
    implements _$TrailsSearchRequestCopyWith<$Res> {
  __$TrailsSearchRequestCopyWithImpl(this._self, this._then);

  final _TrailsSearchRequest _self;
  final $Res Function(_TrailsSearchRequest) _then;

/// Create a copy of TrailsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? place = null,Object? filters = freezed,Object? sort = null,}) {
  return _then(_TrailsSearchRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as TrailPlace,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as TrailsFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as TrailsSort,
  ));
}

/// Create a copy of TrailsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailPlaceCopyWith<$Res> get place {
  
  return $TrailPlaceCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of TrailsSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailsFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $TrailsFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// @nodoc
mixin _$TrailCard {

 String get id; String get providerId; String get externalId; String get name; String get thumbnail; int get durationMinutes; TrailDifficulty get difficulty; double get lengthKm; double? get elevationGainM; TrailLocation get location; String? get website; bool? get isLoop;
/// Create a copy of TrailCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailCardCopyWith<TrailCard> get copyWith => _$TrailCardCopyWithImpl<TrailCard>(this as TrailCard, _$identity);

  /// Serializes this TrailCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailCard&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.lengthKm, lengthKm) || other.lengthKm == lengthKm)&&(identical(other.elevationGainM, elevationGainM) || other.elevationGainM == elevationGainM)&&(identical(other.location, location) || other.location == location)&&(identical(other.website, website) || other.website == website)&&(identical(other.isLoop, isLoop) || other.isLoop == isLoop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,name,thumbnail,durationMinutes,difficulty,lengthKm,elevationGainM,location,website,isLoop);

@override
String toString() {
  return 'TrailCard(id: $id, providerId: $providerId, externalId: $externalId, name: $name, thumbnail: $thumbnail, durationMinutes: $durationMinutes, difficulty: $difficulty, lengthKm: $lengthKm, elevationGainM: $elevationGainM, location: $location, website: $website, isLoop: $isLoop)';
}


}

/// @nodoc
abstract mixin class $TrailCardCopyWith<$Res>  {
  factory $TrailCardCopyWith(TrailCard value, $Res Function(TrailCard) _then) = _$TrailCardCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String name, String thumbnail, int durationMinutes, TrailDifficulty difficulty, double lengthKm, double? elevationGainM, TrailLocation location, String? website, bool? isLoop
});


$TrailLocationCopyWith<$Res> get location;

}
/// @nodoc
class _$TrailCardCopyWithImpl<$Res>
    implements $TrailCardCopyWith<$Res> {
  _$TrailCardCopyWithImpl(this._self, this._then);

  final TrailCard _self;
  final $Res Function(TrailCard) _then;

/// Create a copy of TrailCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? thumbnail = null,Object? durationMinutes = null,Object? difficulty = null,Object? lengthKm = null,Object? elevationGainM = freezed,Object? location = null,Object? website = freezed,Object? isLoop = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as TrailDifficulty,lengthKm: null == lengthKm ? _self.lengthKm : lengthKm // ignore: cast_nullable_to_non_nullable
as double,elevationGainM: freezed == elevationGainM ? _self.elevationGainM : elevationGainM // ignore: cast_nullable_to_non_nullable
as double?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as TrailLocation,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,isLoop: freezed == isLoop ? _self.isLoop : isLoop // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of TrailCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailLocationCopyWith<$Res> get location {
  
  return $TrailLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrailCard].
extension TrailCardPatterns on TrailCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailCard value)  $default,){
final _that = this;
switch (_that) {
case _TrailCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailCard value)?  $default,){
final _that = this;
switch (_that) {
case _TrailCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  int durationMinutes,  TrailDifficulty difficulty,  double lengthKm,  double? elevationGainM,  TrailLocation location,  String? website,  bool? isLoop)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailCard() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.durationMinutes,_that.difficulty,_that.lengthKm,_that.elevationGainM,_that.location,_that.website,_that.isLoop);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  int durationMinutes,  TrailDifficulty difficulty,  double lengthKm,  double? elevationGainM,  TrailLocation location,  String? website,  bool? isLoop)  $default,) {final _that = this;
switch (_that) {
case _TrailCard():
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.durationMinutes,_that.difficulty,_that.lengthKm,_that.elevationGainM,_that.location,_that.website,_that.isLoop);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  int durationMinutes,  TrailDifficulty difficulty,  double lengthKm,  double? elevationGainM,  TrailLocation location,  String? website,  bool? isLoop)?  $default,) {final _that = this;
switch (_that) {
case _TrailCard() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.durationMinutes,_that.difficulty,_that.lengthKm,_that.elevationGainM,_that.location,_that.website,_that.isLoop);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailCard implements TrailCard {
  const _TrailCard({required this.id, required this.providerId, required this.externalId, required this.name, required this.thumbnail, required this.durationMinutes, required this.difficulty, required this.lengthKm, this.elevationGainM, required this.location, this.website, this.isLoop});
  factory _TrailCard.fromJson(Map<String, dynamic> json) => _$TrailCardFromJson(json);

@override final  String id;
@override final  String providerId;
@override final  String externalId;
@override final  String name;
@override final  String thumbnail;
@override final  int durationMinutes;
@override final  TrailDifficulty difficulty;
@override final  double lengthKm;
@override final  double? elevationGainM;
@override final  TrailLocation location;
@override final  String? website;
@override final  bool? isLoop;

/// Create a copy of TrailCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailCardCopyWith<_TrailCard> get copyWith => __$TrailCardCopyWithImpl<_TrailCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailCard&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.lengthKm, lengthKm) || other.lengthKm == lengthKm)&&(identical(other.elevationGainM, elevationGainM) || other.elevationGainM == elevationGainM)&&(identical(other.location, location) || other.location == location)&&(identical(other.website, website) || other.website == website)&&(identical(other.isLoop, isLoop) || other.isLoop == isLoop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,name,thumbnail,durationMinutes,difficulty,lengthKm,elevationGainM,location,website,isLoop);

@override
String toString() {
  return 'TrailCard(id: $id, providerId: $providerId, externalId: $externalId, name: $name, thumbnail: $thumbnail, durationMinutes: $durationMinutes, difficulty: $difficulty, lengthKm: $lengthKm, elevationGainM: $elevationGainM, location: $location, website: $website, isLoop: $isLoop)';
}


}

/// @nodoc
abstract mixin class _$TrailCardCopyWith<$Res> implements $TrailCardCopyWith<$Res> {
  factory _$TrailCardCopyWith(_TrailCard value, $Res Function(_TrailCard) _then) = __$TrailCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String name, String thumbnail, int durationMinutes, TrailDifficulty difficulty, double lengthKm, double? elevationGainM, TrailLocation location, String? website, bool? isLoop
});


@override $TrailLocationCopyWith<$Res> get location;

}
/// @nodoc
class __$TrailCardCopyWithImpl<$Res>
    implements _$TrailCardCopyWith<$Res> {
  __$TrailCardCopyWithImpl(this._self, this._then);

  final _TrailCard _self;
  final $Res Function(_TrailCard) _then;

/// Create a copy of TrailCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? thumbnail = null,Object? durationMinutes = null,Object? difficulty = null,Object? lengthKm = null,Object? elevationGainM = freezed,Object? location = null,Object? website = freezed,Object? isLoop = freezed,}) {
  return _then(_TrailCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as TrailDifficulty,lengthKm: null == lengthKm ? _self.lengthKm : lengthKm // ignore: cast_nullable_to_non_nullable
as double,elevationGainM: freezed == elevationGainM ? _self.elevationGainM : elevationGainM // ignore: cast_nullable_to_non_nullable
as double?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as TrailLocation,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,isLoop: freezed == isLoop ? _self.isLoop : isLoop // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of TrailCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailLocationCopyWith<$Res> get location {
  
  return $TrailLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$TrailDetail {

 String get id; String get providerId; String get externalId; String get name; String get thumbnail; int get durationMinutes; TrailDifficulty get difficulty; double get lengthKm; double? get elevationGainM; TrailLocation get location; List<String> get photos; String? get description; String? get externalUrl; bool? get isLoop; bool? get kidFriendly; bool? get dogFriendly;
/// Create a copy of TrailDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailDetailCopyWith<TrailDetail> get copyWith => _$TrailDetailCopyWithImpl<TrailDetail>(this as TrailDetail, _$identity);

  /// Serializes this TrailDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.lengthKm, lengthKm) || other.lengthKm == lengthKm)&&(identical(other.elevationGainM, elevationGainM) || other.elevationGainM == elevationGainM)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.description, description) || other.description == description)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.isLoop, isLoop) || other.isLoop == isLoop)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,name,thumbnail,durationMinutes,difficulty,lengthKm,elevationGainM,location,const DeepCollectionEquality().hash(photos),description,externalUrl,isLoop,kidFriendly,dogFriendly);

@override
String toString() {
  return 'TrailDetail(id: $id, providerId: $providerId, externalId: $externalId, name: $name, thumbnail: $thumbnail, durationMinutes: $durationMinutes, difficulty: $difficulty, lengthKm: $lengthKm, elevationGainM: $elevationGainM, location: $location, photos: $photos, description: $description, externalUrl: $externalUrl, isLoop: $isLoop, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly)';
}


}

/// @nodoc
abstract mixin class $TrailDetailCopyWith<$Res>  {
  factory $TrailDetailCopyWith(TrailDetail value, $Res Function(TrailDetail) _then) = _$TrailDetailCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String name, String thumbnail, int durationMinutes, TrailDifficulty difficulty, double lengthKm, double? elevationGainM, TrailLocation location, List<String> photos, String? description, String? externalUrl, bool? isLoop, bool? kidFriendly, bool? dogFriendly
});


$TrailLocationCopyWith<$Res> get location;

}
/// @nodoc
class _$TrailDetailCopyWithImpl<$Res>
    implements $TrailDetailCopyWith<$Res> {
  _$TrailDetailCopyWithImpl(this._self, this._then);

  final TrailDetail _self;
  final $Res Function(TrailDetail) _then;

/// Create a copy of TrailDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? thumbnail = null,Object? durationMinutes = null,Object? difficulty = null,Object? lengthKm = null,Object? elevationGainM = freezed,Object? location = null,Object? photos = null,Object? description = freezed,Object? externalUrl = freezed,Object? isLoop = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as TrailDifficulty,lengthKm: null == lengthKm ? _self.lengthKm : lengthKm // ignore: cast_nullable_to_non_nullable
as double,elevationGainM: freezed == elevationGainM ? _self.elevationGainM : elevationGainM // ignore: cast_nullable_to_non_nullable
as double?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as TrailLocation,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,isLoop: freezed == isLoop ? _self.isLoop : isLoop // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of TrailDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailLocationCopyWith<$Res> get location {
  
  return $TrailLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrailDetail].
extension TrailDetailPatterns on TrailDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailDetail value)  $default,){
final _that = this;
switch (_that) {
case _TrailDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TrailDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  int durationMinutes,  TrailDifficulty difficulty,  double lengthKm,  double? elevationGainM,  TrailLocation location,  List<String> photos,  String? description,  String? externalUrl,  bool? isLoop,  bool? kidFriendly,  bool? dogFriendly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailDetail() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.durationMinutes,_that.difficulty,_that.lengthKm,_that.elevationGainM,_that.location,_that.photos,_that.description,_that.externalUrl,_that.isLoop,_that.kidFriendly,_that.dogFriendly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  int durationMinutes,  TrailDifficulty difficulty,  double lengthKm,  double? elevationGainM,  TrailLocation location,  List<String> photos,  String? description,  String? externalUrl,  bool? isLoop,  bool? kidFriendly,  bool? dogFriendly)  $default,) {final _that = this;
switch (_that) {
case _TrailDetail():
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.durationMinutes,_that.difficulty,_that.lengthKm,_that.elevationGainM,_that.location,_that.photos,_that.description,_that.externalUrl,_that.isLoop,_that.kidFriendly,_that.dogFriendly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  int durationMinutes,  TrailDifficulty difficulty,  double lengthKm,  double? elevationGainM,  TrailLocation location,  List<String> photos,  String? description,  String? externalUrl,  bool? isLoop,  bool? kidFriendly,  bool? dogFriendly)?  $default,) {final _that = this;
switch (_that) {
case _TrailDetail() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.durationMinutes,_that.difficulty,_that.lengthKm,_that.elevationGainM,_that.location,_that.photos,_that.description,_that.externalUrl,_that.isLoop,_that.kidFriendly,_that.dogFriendly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailDetail implements TrailDetail {
  const _TrailDetail({required this.id, required this.providerId, required this.externalId, required this.name, required this.thumbnail, required this.durationMinutes, required this.difficulty, required this.lengthKm, this.elevationGainM, required this.location, final  List<String> photos = const [], this.description, this.externalUrl, this.isLoop, this.kidFriendly, this.dogFriendly}): _photos = photos;
  factory _TrailDetail.fromJson(Map<String, dynamic> json) => _$TrailDetailFromJson(json);

@override final  String id;
@override final  String providerId;
@override final  String externalId;
@override final  String name;
@override final  String thumbnail;
@override final  int durationMinutes;
@override final  TrailDifficulty difficulty;
@override final  double lengthKm;
@override final  double? elevationGainM;
@override final  TrailLocation location;
 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  String? description;
@override final  String? externalUrl;
@override final  bool? isLoop;
@override final  bool? kidFriendly;
@override final  bool? dogFriendly;

/// Create a copy of TrailDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailDetailCopyWith<_TrailDetail> get copyWith => __$TrailDetailCopyWithImpl<_TrailDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.lengthKm, lengthKm) || other.lengthKm == lengthKm)&&(identical(other.elevationGainM, elevationGainM) || other.elevationGainM == elevationGainM)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.description, description) || other.description == description)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.isLoop, isLoop) || other.isLoop == isLoop)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,name,thumbnail,durationMinutes,difficulty,lengthKm,elevationGainM,location,const DeepCollectionEquality().hash(_photos),description,externalUrl,isLoop,kidFriendly,dogFriendly);

@override
String toString() {
  return 'TrailDetail(id: $id, providerId: $providerId, externalId: $externalId, name: $name, thumbnail: $thumbnail, durationMinutes: $durationMinutes, difficulty: $difficulty, lengthKm: $lengthKm, elevationGainM: $elevationGainM, location: $location, photos: $photos, description: $description, externalUrl: $externalUrl, isLoop: $isLoop, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly)';
}


}

/// @nodoc
abstract mixin class _$TrailDetailCopyWith<$Res> implements $TrailDetailCopyWith<$Res> {
  factory _$TrailDetailCopyWith(_TrailDetail value, $Res Function(_TrailDetail) _then) = __$TrailDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String name, String thumbnail, int durationMinutes, TrailDifficulty difficulty, double lengthKm, double? elevationGainM, TrailLocation location, List<String> photos, String? description, String? externalUrl, bool? isLoop, bool? kidFriendly, bool? dogFriendly
});


@override $TrailLocationCopyWith<$Res> get location;

}
/// @nodoc
class __$TrailDetailCopyWithImpl<$Res>
    implements _$TrailDetailCopyWith<$Res> {
  __$TrailDetailCopyWithImpl(this._self, this._then);

  final _TrailDetail _self;
  final $Res Function(_TrailDetail) _then;

/// Create a copy of TrailDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? thumbnail = null,Object? durationMinutes = null,Object? difficulty = null,Object? lengthKm = null,Object? elevationGainM = freezed,Object? location = null,Object? photos = null,Object? description = freezed,Object? externalUrl = freezed,Object? isLoop = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,}) {
  return _then(_TrailDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as TrailDifficulty,lengthKm: null == lengthKm ? _self.lengthKm : lengthKm // ignore: cast_nullable_to_non_nullable
as double,elevationGainM: freezed == elevationGainM ? _self.elevationGainM : elevationGainM // ignore: cast_nullable_to_non_nullable
as double?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as TrailLocation,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,isLoop: freezed == isLoop ? _self.isLoop : isLoop // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of TrailDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailLocationCopyWith<$Res> get location {
  
  return $TrailLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$TrailsSearchResult {

 List<TrailCard> get items; int get totalCount; String? get nextCursor; bool get fromCache;
/// Create a copy of TrailsSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailsSearchResultCopyWith<TrailsSearchResult> get copyWith => _$TrailsSearchResultCopyWithImpl<TrailsSearchResult>(this as TrailsSearchResult, _$identity);

  /// Serializes this TrailsSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailsSearchResult&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCount,nextCursor,fromCache);

@override
String toString() {
  return 'TrailsSearchResult(items: $items, totalCount: $totalCount, nextCursor: $nextCursor, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class $TrailsSearchResultCopyWith<$Res>  {
  factory $TrailsSearchResultCopyWith(TrailsSearchResult value, $Res Function(TrailsSearchResult) _then) = _$TrailsSearchResultCopyWithImpl;
@useResult
$Res call({
 List<TrailCard> items, int totalCount, String? nextCursor, bool fromCache
});




}
/// @nodoc
class _$TrailsSearchResultCopyWithImpl<$Res>
    implements $TrailsSearchResultCopyWith<$Res> {
  _$TrailsSearchResultCopyWithImpl(this._self, this._then);

  final TrailsSearchResult _self;
  final $Res Function(TrailsSearchResult) _then;

/// Create a copy of TrailsSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCount = null,Object? nextCursor = freezed,Object? fromCache = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<TrailCard>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TrailsSearchResult].
extension TrailsSearchResultPatterns on TrailsSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailsSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailsSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailsSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _TrailsSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailsSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _TrailsSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TrailCard> items,  int totalCount,  String? nextCursor,  bool fromCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailsSearchResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TrailCard> items,  int totalCount,  String? nextCursor,  bool fromCache)  $default,) {final _that = this;
switch (_that) {
case _TrailsSearchResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TrailCard> items,  int totalCount,  String? nextCursor,  bool fromCache)?  $default,) {final _that = this;
switch (_that) {
case _TrailsSearchResult() when $default != null:
return $default(_that.items,_that.totalCount,_that.nextCursor,_that.fromCache);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailsSearchResult implements TrailsSearchResult {
  const _TrailsSearchResult({required final  List<TrailCard> items, required this.totalCount, this.nextCursor, this.fromCache = false}): _items = items;
  factory _TrailsSearchResult.fromJson(Map<String, dynamic> json) => _$TrailsSearchResultFromJson(json);

 final  List<TrailCard> _items;
@override List<TrailCard> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int totalCount;
@override final  String? nextCursor;
@override@JsonKey() final  bool fromCache;

/// Create a copy of TrailsSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailsSearchResultCopyWith<_TrailsSearchResult> get copyWith => __$TrailsSearchResultCopyWithImpl<_TrailsSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailsSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailsSearchResult&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCount,nextCursor,fromCache);

@override
String toString() {
  return 'TrailsSearchResult(items: $items, totalCount: $totalCount, nextCursor: $nextCursor, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class _$TrailsSearchResultCopyWith<$Res> implements $TrailsSearchResultCopyWith<$Res> {
  factory _$TrailsSearchResultCopyWith(_TrailsSearchResult value, $Res Function(_TrailsSearchResult) _then) = __$TrailsSearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<TrailCard> items, int totalCount, String? nextCursor, bool fromCache
});




}
/// @nodoc
class __$TrailsSearchResultCopyWithImpl<$Res>
    implements _$TrailsSearchResultCopyWith<$Res> {
  __$TrailsSearchResultCopyWithImpl(this._self, this._then);

  final _TrailsSearchResult _self;
  final $Res Function(_TrailsSearchResult) _then;

/// Create a copy of TrailsSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCount = null,Object? nextCursor = freezed,Object? fromCache = null,}) {
  return _then(_TrailsSearchResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<TrailCard>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
