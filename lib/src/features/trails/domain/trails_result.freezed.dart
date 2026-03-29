// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trails_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrailsResult {

 String get id; String get name; String get location; double get distanceKm; TrailDifficulty get difficulty; int get durationMinutes; String? get description; int? get elevationGainMeters; String? get imageUrl;
/// Create a copy of TrailsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailsResultCopyWith<TrailsResult> get copyWith => _$TrailsResultCopyWithImpl<TrailsResult>(this as TrailsResult, _$identity);

  /// Serializes this TrailsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailsResult&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.description, description) || other.description == description)&&(identical(other.elevationGainMeters, elevationGainMeters) || other.elevationGainMeters == elevationGainMeters)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,distanceKm,difficulty,durationMinutes,description,elevationGainMeters,imageUrl);

@override
String toString() {
  return 'TrailsResult(id: $id, name: $name, location: $location, distanceKm: $distanceKm, difficulty: $difficulty, durationMinutes: $durationMinutes, description: $description, elevationGainMeters: $elevationGainMeters, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $TrailsResultCopyWith<$Res>  {
  factory $TrailsResultCopyWith(TrailsResult value, $Res Function(TrailsResult) _then) = _$TrailsResultCopyWithImpl;
@useResult
$Res call({
 String id, String name, String location, double distanceKm, TrailDifficulty difficulty, int durationMinutes, String? description, int? elevationGainMeters, String? imageUrl
});




}
/// @nodoc
class _$TrailsResultCopyWithImpl<$Res>
    implements $TrailsResultCopyWith<$Res> {
  _$TrailsResultCopyWithImpl(this._self, this._then);

  final TrailsResult _self;
  final $Res Function(TrailsResult) _then;

/// Create a copy of TrailsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? location = null,Object? distanceKm = null,Object? difficulty = null,Object? durationMinutes = null,Object? description = freezed,Object? elevationGainMeters = freezed,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as TrailDifficulty,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,elevationGainMeters: freezed == elevationGainMeters ? _self.elevationGainMeters : elevationGainMeters // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrailsResult].
extension TrailsResultPatterns on TrailsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailsResult value)  $default,){
final _that = this;
switch (_that) {
case _TrailsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailsResult value)?  $default,){
final _that = this;
switch (_that) {
case _TrailsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String location,  double distanceKm,  TrailDifficulty difficulty,  int durationMinutes,  String? description,  int? elevationGainMeters,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailsResult() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.distanceKm,_that.difficulty,_that.durationMinutes,_that.description,_that.elevationGainMeters,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String location,  double distanceKm,  TrailDifficulty difficulty,  int durationMinutes,  String? description,  int? elevationGainMeters,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _TrailsResult():
return $default(_that.id,_that.name,_that.location,_that.distanceKm,_that.difficulty,_that.durationMinutes,_that.description,_that.elevationGainMeters,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String location,  double distanceKm,  TrailDifficulty difficulty,  int durationMinutes,  String? description,  int? elevationGainMeters,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _TrailsResult() when $default != null:
return $default(_that.id,_that.name,_that.location,_that.distanceKm,_that.difficulty,_that.durationMinutes,_that.description,_that.elevationGainMeters,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailsResult implements TrailsResult {
  const _TrailsResult({required this.id, required this.name, required this.location, required this.distanceKm, required this.difficulty, required this.durationMinutes, this.description, this.elevationGainMeters, this.imageUrl});
  factory _TrailsResult.fromJson(Map<String, dynamic> json) => _$TrailsResultFromJson(json);

@override final  String id;
@override final  String name;
@override final  String location;
@override final  double distanceKm;
@override final  TrailDifficulty difficulty;
@override final  int durationMinutes;
@override final  String? description;
@override final  int? elevationGainMeters;
@override final  String? imageUrl;

/// Create a copy of TrailsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailsResultCopyWith<_TrailsResult> get copyWith => __$TrailsResultCopyWithImpl<_TrailsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailsResult&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.description, description) || other.description == description)&&(identical(other.elevationGainMeters, elevationGainMeters) || other.elevationGainMeters == elevationGainMeters)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location,distanceKm,difficulty,durationMinutes,description,elevationGainMeters,imageUrl);

@override
String toString() {
  return 'TrailsResult(id: $id, name: $name, location: $location, distanceKm: $distanceKm, difficulty: $difficulty, durationMinutes: $durationMinutes, description: $description, elevationGainMeters: $elevationGainMeters, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$TrailsResultCopyWith<$Res> implements $TrailsResultCopyWith<$Res> {
  factory _$TrailsResultCopyWith(_TrailsResult value, $Res Function(_TrailsResult) _then) = __$TrailsResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String location, double distanceKm, TrailDifficulty difficulty, int durationMinutes, String? description, int? elevationGainMeters, String? imageUrl
});




}
/// @nodoc
class __$TrailsResultCopyWithImpl<$Res>
    implements _$TrailsResultCopyWith<$Res> {
  __$TrailsResultCopyWithImpl(this._self, this._then);

  final _TrailsResult _self;
  final $Res Function(_TrailsResult) _then;

/// Create a copy of TrailsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? location = null,Object? distanceKm = null,Object? difficulty = null,Object? durationMinutes = null,Object? description = freezed,Object? elevationGainMeters = freezed,Object? imageUrl = freezed,}) {
  return _then(_TrailsResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as TrailDifficulty,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,elevationGainMeters: freezed == elevationGainMeters ? _self.elevationGainMeters : elevationGainMeters // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
