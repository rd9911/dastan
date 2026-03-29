// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Location {

/// Unique identifier (OSM place_id or osm_type + osm_id)
 String get id;/// Display name of the location (city, landmark, etc.)
 String get name;/// Country name
 String get country;/// State/province/region (optional)
 String? get state;/// City name if different from name (optional)
 String? get city;/// Airport IATA code if applicable (optional)
 String? get code;/// Latitude coordinate
 double? get lat;/// Longitude coordinate
 double? get lng;/// Full formatted address
 String? get formattedAddress;/// OSM type: 'N' (node), 'W' (way), 'R' (relation)
 String? get osmType;/// OSM numeric ID
 int? get osmId;
/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCopyWith<Location> get copyWith => _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Location&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state)&&(identical(other.city, city) || other.city == city)&&(identical(other.code, code) || other.code == code)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress)&&(identical(other.osmType, osmType) || other.osmType == osmType)&&(identical(other.osmId, osmId) || other.osmId == osmId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,state,city,code,lat,lng,formattedAddress,osmType,osmId);

@override
String toString() {
  return 'Location(id: $id, name: $name, country: $country, state: $state, city: $city, code: $code, lat: $lat, lng: $lng, formattedAddress: $formattedAddress, osmType: $osmType, osmId: $osmId)';
}


}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res>  {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) = _$LocationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String country, String? state, String? city, String? code, double? lat, double? lng, String? formattedAddress, String? osmType, int? osmId
});




}
/// @nodoc
class _$LocationCopyWithImpl<$Res>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? country = null,Object? state = freezed,Object? city = freezed,Object? code = freezed,Object? lat = freezed,Object? lng = freezed,Object? formattedAddress = freezed,Object? osmType = freezed,Object? osmId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,formattedAddress: freezed == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String?,osmType: freezed == osmType ? _self.osmType : osmType // ignore: cast_nullable_to_non_nullable
as String?,osmId: freezed == osmId ? _self.osmId : osmId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Location].
extension LocationPatterns on Location {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Location value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Location value)  $default,){
final _that = this;
switch (_that) {
case _Location():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Location value)?  $default,){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String country,  String? state,  String? city,  String? code,  double? lat,  double? lng,  String? formattedAddress,  String? osmType,  int? osmId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.state,_that.city,_that.code,_that.lat,_that.lng,_that.formattedAddress,_that.osmType,_that.osmId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String country,  String? state,  String? city,  String? code,  double? lat,  double? lng,  String? formattedAddress,  String? osmType,  int? osmId)  $default,) {final _that = this;
switch (_that) {
case _Location():
return $default(_that.id,_that.name,_that.country,_that.state,_that.city,_that.code,_that.lat,_that.lng,_that.formattedAddress,_that.osmType,_that.osmId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String country,  String? state,  String? city,  String? code,  double? lat,  double? lng,  String? formattedAddress,  String? osmType,  int? osmId)?  $default,) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.state,_that.city,_that.code,_that.lat,_that.lng,_that.formattedAddress,_that.osmType,_that.osmId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Location extends Location {
  const _Location({required this.id, required this.name, required this.country, this.state, this.city, this.code, this.lat, this.lng, this.formattedAddress, this.osmType, this.osmId}): super._();
  factory _Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

/// Unique identifier (OSM place_id or osm_type + osm_id)
@override final  String id;
/// Display name of the location (city, landmark, etc.)
@override final  String name;
/// Country name
@override final  String country;
/// State/province/region (optional)
@override final  String? state;
/// City name if different from name (optional)
@override final  String? city;
/// Airport IATA code if applicable (optional)
@override final  String? code;
/// Latitude coordinate
@override final  double? lat;
/// Longitude coordinate
@override final  double? lng;
/// Full formatted address
@override final  String? formattedAddress;
/// OSM type: 'N' (node), 'W' (way), 'R' (relation)
@override final  String? osmType;
/// OSM numeric ID
@override final  int? osmId;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCopyWith<_Location> get copyWith => __$LocationCopyWithImpl<_Location>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state)&&(identical(other.city, city) || other.city == city)&&(identical(other.code, code) || other.code == code)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.formattedAddress, formattedAddress) || other.formattedAddress == formattedAddress)&&(identical(other.osmType, osmType) || other.osmType == osmType)&&(identical(other.osmId, osmId) || other.osmId == osmId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,state,city,code,lat,lng,formattedAddress,osmType,osmId);

@override
String toString() {
  return 'Location(id: $id, name: $name, country: $country, state: $state, city: $city, code: $code, lat: $lat, lng: $lng, formattedAddress: $formattedAddress, osmType: $osmType, osmId: $osmId)';
}


}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) = __$LocationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String country, String? state, String? city, String? code, double? lat, double? lng, String? formattedAddress, String? osmType, int? osmId
});




}
/// @nodoc
class __$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? country = null,Object? state = freezed,Object? city = freezed,Object? code = freezed,Object? lat = freezed,Object? lng = freezed,Object? formattedAddress = freezed,Object? osmType = freezed,Object? osmId = freezed,}) {
  return _then(_Location(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,formattedAddress: freezed == formattedAddress ? _self.formattedAddress : formattedAddress // ignore: cast_nullable_to_non_nullable
as String?,osmType: freezed == osmType ? _self.osmType : osmType // ignore: cast_nullable_to_non_nullable
as String?,osmId: freezed == osmId ? _self.osmId : osmId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
