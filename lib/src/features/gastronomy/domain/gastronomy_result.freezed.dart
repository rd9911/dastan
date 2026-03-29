// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gastronomy_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GastronomyResult {

 String get id; GastronomyType get type; String get name; String get location; String get cuisine; String? get priceRange; int? get rating; String? get imageUrl; String? get vendorUrl;
/// Create a copy of GastronomyResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GastronomyResultCopyWith<GastronomyResult> get copyWith => _$GastronomyResultCopyWithImpl<GastronomyResult>(this as GastronomyResult, _$identity);

  /// Serializes this GastronomyResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GastronomyResult&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.priceRange, priceRange) || other.priceRange == priceRange)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,location,cuisine,priceRange,rating,imageUrl,vendorUrl);

@override
String toString() {
  return 'GastronomyResult(id: $id, type: $type, name: $name, location: $location, cuisine: $cuisine, priceRange: $priceRange, rating: $rating, imageUrl: $imageUrl, vendorUrl: $vendorUrl)';
}


}

/// @nodoc
abstract mixin class $GastronomyResultCopyWith<$Res>  {
  factory $GastronomyResultCopyWith(GastronomyResult value, $Res Function(GastronomyResult) _then) = _$GastronomyResultCopyWithImpl;
@useResult
$Res call({
 String id, GastronomyType type, String name, String location, String cuisine, String? priceRange, int? rating, String? imageUrl, String? vendorUrl
});




}
/// @nodoc
class _$GastronomyResultCopyWithImpl<$Res>
    implements $GastronomyResultCopyWith<$Res> {
  _$GastronomyResultCopyWithImpl(this._self, this._then);

  final GastronomyResult _self;
  final $Res Function(GastronomyResult) _then;

/// Create a copy of GastronomyResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? name = null,Object? location = null,Object? cuisine = null,Object? priceRange = freezed,Object? rating = freezed,Object? imageUrl = freezed,Object? vendorUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GastronomyType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,priceRange: freezed == priceRange ? _self.priceRange : priceRange // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GastronomyResult].
extension GastronomyResultPatterns on GastronomyResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GastronomyResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GastronomyResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GastronomyResult value)  $default,){
final _that = this;
switch (_that) {
case _GastronomyResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GastronomyResult value)?  $default,){
final _that = this;
switch (_that) {
case _GastronomyResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  GastronomyType type,  String name,  String location,  String cuisine,  String? priceRange,  int? rating,  String? imageUrl,  String? vendorUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GastronomyResult() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.location,_that.cuisine,_that.priceRange,_that.rating,_that.imageUrl,_that.vendorUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  GastronomyType type,  String name,  String location,  String cuisine,  String? priceRange,  int? rating,  String? imageUrl,  String? vendorUrl)  $default,) {final _that = this;
switch (_that) {
case _GastronomyResult():
return $default(_that.id,_that.type,_that.name,_that.location,_that.cuisine,_that.priceRange,_that.rating,_that.imageUrl,_that.vendorUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  GastronomyType type,  String name,  String location,  String cuisine,  String? priceRange,  int? rating,  String? imageUrl,  String? vendorUrl)?  $default,) {final _that = this;
switch (_that) {
case _GastronomyResult() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.location,_that.cuisine,_that.priceRange,_that.rating,_that.imageUrl,_that.vendorUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GastronomyResult implements GastronomyResult {
  const _GastronomyResult({required this.id, required this.type, required this.name, required this.location, required this.cuisine, this.priceRange, this.rating, this.imageUrl, this.vendorUrl});
  factory _GastronomyResult.fromJson(Map<String, dynamic> json) => _$GastronomyResultFromJson(json);

@override final  String id;
@override final  GastronomyType type;
@override final  String name;
@override final  String location;
@override final  String cuisine;
@override final  String? priceRange;
@override final  int? rating;
@override final  String? imageUrl;
@override final  String? vendorUrl;

/// Create a copy of GastronomyResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GastronomyResultCopyWith<_GastronomyResult> get copyWith => __$GastronomyResultCopyWithImpl<_GastronomyResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GastronomyResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GastronomyResult&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.priceRange, priceRange) || other.priceRange == priceRange)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,location,cuisine,priceRange,rating,imageUrl,vendorUrl);

@override
String toString() {
  return 'GastronomyResult(id: $id, type: $type, name: $name, location: $location, cuisine: $cuisine, priceRange: $priceRange, rating: $rating, imageUrl: $imageUrl, vendorUrl: $vendorUrl)';
}


}

/// @nodoc
abstract mixin class _$GastronomyResultCopyWith<$Res> implements $GastronomyResultCopyWith<$Res> {
  factory _$GastronomyResultCopyWith(_GastronomyResult value, $Res Function(_GastronomyResult) _then) = __$GastronomyResultCopyWithImpl;
@override @useResult
$Res call({
 String id, GastronomyType type, String name, String location, String cuisine, String? priceRange, int? rating, String? imageUrl, String? vendorUrl
});




}
/// @nodoc
class __$GastronomyResultCopyWithImpl<$Res>
    implements _$GastronomyResultCopyWith<$Res> {
  __$GastronomyResultCopyWithImpl(this._self, this._then);

  final _GastronomyResult _self;
  final $Res Function(_GastronomyResult) _then;

/// Create a copy of GastronomyResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? name = null,Object? location = null,Object? cuisine = null,Object? priceRange = freezed,Object? rating = freezed,Object? imageUrl = freezed,Object? vendorUrl = freezed,}) {
  return _then(_GastronomyResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GastronomyType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,priceRange: freezed == priceRange ? _self.priceRange : priceRange // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
