// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gastronomy_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GastronomyPlace {

 PlaceGranularity get granularity; String get value; double? get latitude; double? get longitude;
/// Create a copy of GastronomyPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GastronomyPlaceCopyWith<GastronomyPlace> get copyWith => _$GastronomyPlaceCopyWithImpl<GastronomyPlace>(this as GastronomyPlace, _$identity);

  /// Serializes this GastronomyPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GastronomyPlace&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.value, value) || other.value == value)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,value,latitude,longitude);

@override
String toString() {
  return 'GastronomyPlace(granularity: $granularity, value: $value, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $GastronomyPlaceCopyWith<$Res>  {
  factory $GastronomyPlaceCopyWith(GastronomyPlace value, $Res Function(GastronomyPlace) _then) = _$GastronomyPlaceCopyWithImpl;
@useResult
$Res call({
 PlaceGranularity granularity, String value, double? latitude, double? longitude
});




}
/// @nodoc
class _$GastronomyPlaceCopyWithImpl<$Res>
    implements $GastronomyPlaceCopyWith<$Res> {
  _$GastronomyPlaceCopyWithImpl(this._self, this._then);

  final GastronomyPlace _self;
  final $Res Function(GastronomyPlace) _then;

/// Create a copy of GastronomyPlace
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


/// Adds pattern-matching-related methods to [GastronomyPlace].
extension GastronomyPlacePatterns on GastronomyPlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GastronomyPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GastronomyPlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GastronomyPlace value)  $default,){
final _that = this;
switch (_that) {
case _GastronomyPlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GastronomyPlace value)?  $default,){
final _that = this;
switch (_that) {
case _GastronomyPlace() when $default != null:
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
case _GastronomyPlace() when $default != null:
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
case _GastronomyPlace():
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
case _GastronomyPlace() when $default != null:
return $default(_that.granularity,_that.value,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GastronomyPlace implements GastronomyPlace {
  const _GastronomyPlace({required this.granularity, required this.value, this.latitude, this.longitude});
  factory _GastronomyPlace.fromJson(Map<String, dynamic> json) => _$GastronomyPlaceFromJson(json);

@override final  PlaceGranularity granularity;
@override final  String value;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of GastronomyPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GastronomyPlaceCopyWith<_GastronomyPlace> get copyWith => __$GastronomyPlaceCopyWithImpl<_GastronomyPlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GastronomyPlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GastronomyPlace&&(identical(other.granularity, granularity) || other.granularity == granularity)&&(identical(other.value, value) || other.value == value)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,granularity,value,latitude,longitude);

@override
String toString() {
  return 'GastronomyPlace(granularity: $granularity, value: $value, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$GastronomyPlaceCopyWith<$Res> implements $GastronomyPlaceCopyWith<$Res> {
  factory _$GastronomyPlaceCopyWith(_GastronomyPlace value, $Res Function(_GastronomyPlace) _then) = __$GastronomyPlaceCopyWithImpl;
@override @useResult
$Res call({
 PlaceGranularity granularity, String value, double? latitude, double? longitude
});




}
/// @nodoc
class __$GastronomyPlaceCopyWithImpl<$Res>
    implements _$GastronomyPlaceCopyWith<$Res> {
  __$GastronomyPlaceCopyWithImpl(this._self, this._then);

  final _GastronomyPlace _self;
  final $Res Function(_GastronomyPlace) _then;

/// Create a copy of GastronomyPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? granularity = null,Object? value = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_GastronomyPlace(
granularity: null == granularity ? _self.granularity : granularity // ignore: cast_nullable_to_non_nullable
as PlaceGranularity,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$GastronomyFilters {

 List<DietaryOption> get dietary; List<CuisineType> get cuisine; PriceBand? get priceBand; double? get minRating; double? get maxDistance; bool? get openNow; bool? get kidFriendly; bool? get dogFriendly; NoiseLevel? get noiseLevel;
/// Create a copy of GastronomyFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GastronomyFiltersCopyWith<GastronomyFilters> get copyWith => _$GastronomyFiltersCopyWithImpl<GastronomyFilters>(this as GastronomyFilters, _$identity);

  /// Serializes this GastronomyFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GastronomyFilters&&const DeepCollectionEquality().equals(other.dietary, dietary)&&const DeepCollectionEquality().equals(other.cuisine, cuisine)&&(identical(other.priceBand, priceBand) || other.priceBand == priceBand)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.maxDistance, maxDistance) || other.maxDistance == maxDistance)&&(identical(other.openNow, openNow) || other.openNow == openNow)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.noiseLevel, noiseLevel) || other.noiseLevel == noiseLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dietary),const DeepCollectionEquality().hash(cuisine),priceBand,minRating,maxDistance,openNow,kidFriendly,dogFriendly,noiseLevel);

@override
String toString() {
  return 'GastronomyFilters(dietary: $dietary, cuisine: $cuisine, priceBand: $priceBand, minRating: $minRating, maxDistance: $maxDistance, openNow: $openNow, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly, noiseLevel: $noiseLevel)';
}


}

/// @nodoc
abstract mixin class $GastronomyFiltersCopyWith<$Res>  {
  factory $GastronomyFiltersCopyWith(GastronomyFilters value, $Res Function(GastronomyFilters) _then) = _$GastronomyFiltersCopyWithImpl;
@useResult
$Res call({
 List<DietaryOption> dietary, List<CuisineType> cuisine, PriceBand? priceBand, double? minRating, double? maxDistance, bool? openNow, bool? kidFriendly, bool? dogFriendly, NoiseLevel? noiseLevel
});




}
/// @nodoc
class _$GastronomyFiltersCopyWithImpl<$Res>
    implements $GastronomyFiltersCopyWith<$Res> {
  _$GastronomyFiltersCopyWithImpl(this._self, this._then);

  final GastronomyFilters _self;
  final $Res Function(GastronomyFilters) _then;

/// Create a copy of GastronomyFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dietary = null,Object? cuisine = null,Object? priceBand = freezed,Object? minRating = freezed,Object? maxDistance = freezed,Object? openNow = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,Object? noiseLevel = freezed,}) {
  return _then(_self.copyWith(
dietary: null == dietary ? _self.dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<DietaryOption>,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as List<CuisineType>,priceBand: freezed == priceBand ? _self.priceBand : priceBand // ignore: cast_nullable_to_non_nullable
as PriceBand?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double?,maxDistance: freezed == maxDistance ? _self.maxDistance : maxDistance // ignore: cast_nullable_to_non_nullable
as double?,openNow: freezed == openNow ? _self.openNow : openNow // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,noiseLevel: freezed == noiseLevel ? _self.noiseLevel : noiseLevel // ignore: cast_nullable_to_non_nullable
as NoiseLevel?,
  ));
}

}


/// Adds pattern-matching-related methods to [GastronomyFilters].
extension GastronomyFiltersPatterns on GastronomyFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GastronomyFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GastronomyFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GastronomyFilters value)  $default,){
final _that = this;
switch (_that) {
case _GastronomyFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GastronomyFilters value)?  $default,){
final _that = this;
switch (_that) {
case _GastronomyFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DietaryOption> dietary,  List<CuisineType> cuisine,  PriceBand? priceBand,  double? minRating,  double? maxDistance,  bool? openNow,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GastronomyFilters() when $default != null:
return $default(_that.dietary,_that.cuisine,_that.priceBand,_that.minRating,_that.maxDistance,_that.openNow,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DietaryOption> dietary,  List<CuisineType> cuisine,  PriceBand? priceBand,  double? minRating,  double? maxDistance,  bool? openNow,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel)  $default,) {final _that = this;
switch (_that) {
case _GastronomyFilters():
return $default(_that.dietary,_that.cuisine,_that.priceBand,_that.minRating,_that.maxDistance,_that.openNow,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DietaryOption> dietary,  List<CuisineType> cuisine,  PriceBand? priceBand,  double? minRating,  double? maxDistance,  bool? openNow,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel)?  $default,) {final _that = this;
switch (_that) {
case _GastronomyFilters() when $default != null:
return $default(_that.dietary,_that.cuisine,_that.priceBand,_that.minRating,_that.maxDistance,_that.openNow,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GastronomyFilters implements GastronomyFilters {
  const _GastronomyFilters({final  List<DietaryOption> dietary = const [], final  List<CuisineType> cuisine = const [], this.priceBand, this.minRating, this.maxDistance, this.openNow, this.kidFriendly, this.dogFriendly, this.noiseLevel}): _dietary = dietary,_cuisine = cuisine;
  factory _GastronomyFilters.fromJson(Map<String, dynamic> json) => _$GastronomyFiltersFromJson(json);

 final  List<DietaryOption> _dietary;
@override@JsonKey() List<DietaryOption> get dietary {
  if (_dietary is EqualUnmodifiableListView) return _dietary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietary);
}

 final  List<CuisineType> _cuisine;
@override@JsonKey() List<CuisineType> get cuisine {
  if (_cuisine is EqualUnmodifiableListView) return _cuisine;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cuisine);
}

@override final  PriceBand? priceBand;
@override final  double? minRating;
@override final  double? maxDistance;
@override final  bool? openNow;
@override final  bool? kidFriendly;
@override final  bool? dogFriendly;
@override final  NoiseLevel? noiseLevel;

/// Create a copy of GastronomyFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GastronomyFiltersCopyWith<_GastronomyFilters> get copyWith => __$GastronomyFiltersCopyWithImpl<_GastronomyFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GastronomyFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GastronomyFilters&&const DeepCollectionEquality().equals(other._dietary, _dietary)&&const DeepCollectionEquality().equals(other._cuisine, _cuisine)&&(identical(other.priceBand, priceBand) || other.priceBand == priceBand)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.maxDistance, maxDistance) || other.maxDistance == maxDistance)&&(identical(other.openNow, openNow) || other.openNow == openNow)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.noiseLevel, noiseLevel) || other.noiseLevel == noiseLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dietary),const DeepCollectionEquality().hash(_cuisine),priceBand,minRating,maxDistance,openNow,kidFriendly,dogFriendly,noiseLevel);

@override
String toString() {
  return 'GastronomyFilters(dietary: $dietary, cuisine: $cuisine, priceBand: $priceBand, minRating: $minRating, maxDistance: $maxDistance, openNow: $openNow, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly, noiseLevel: $noiseLevel)';
}


}

/// @nodoc
abstract mixin class _$GastronomyFiltersCopyWith<$Res> implements $GastronomyFiltersCopyWith<$Res> {
  factory _$GastronomyFiltersCopyWith(_GastronomyFilters value, $Res Function(_GastronomyFilters) _then) = __$GastronomyFiltersCopyWithImpl;
@override @useResult
$Res call({
 List<DietaryOption> dietary, List<CuisineType> cuisine, PriceBand? priceBand, double? minRating, double? maxDistance, bool? openNow, bool? kidFriendly, bool? dogFriendly, NoiseLevel? noiseLevel
});




}
/// @nodoc
class __$GastronomyFiltersCopyWithImpl<$Res>
    implements _$GastronomyFiltersCopyWith<$Res> {
  __$GastronomyFiltersCopyWithImpl(this._self, this._then);

  final _GastronomyFilters _self;
  final $Res Function(_GastronomyFilters) _then;

/// Create a copy of GastronomyFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dietary = null,Object? cuisine = null,Object? priceBand = freezed,Object? minRating = freezed,Object? maxDistance = freezed,Object? openNow = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,Object? noiseLevel = freezed,}) {
  return _then(_GastronomyFilters(
dietary: null == dietary ? _self._dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<DietaryOption>,cuisine: null == cuisine ? _self._cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as List<CuisineType>,priceBand: freezed == priceBand ? _self.priceBand : priceBand // ignore: cast_nullable_to_non_nullable
as PriceBand?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double?,maxDistance: freezed == maxDistance ? _self.maxDistance : maxDistance // ignore: cast_nullable_to_non_nullable
as double?,openNow: freezed == openNow ? _self.openNow : openNow // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,noiseLevel: freezed == noiseLevel ? _self.noiseLevel : noiseLevel // ignore: cast_nullable_to_non_nullable
as NoiseLevel?,
  ));
}


}


/// @nodoc
mixin _$GastronomySearchRequest {

 String get itineraryId; GastronomyPlace get place; GastronomyFilters? get filters; GastronomySort get sort;
/// Create a copy of GastronomySearchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GastronomySearchRequestCopyWith<GastronomySearchRequest> get copyWith => _$GastronomySearchRequestCopyWithImpl<GastronomySearchRequest>(this as GastronomySearchRequest, _$identity);

  /// Serializes this GastronomySearchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GastronomySearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,filters,sort);

@override
String toString() {
  return 'GastronomySearchRequest(itineraryId: $itineraryId, place: $place, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $GastronomySearchRequestCopyWith<$Res>  {
  factory $GastronomySearchRequestCopyWith(GastronomySearchRequest value, $Res Function(GastronomySearchRequest) _then) = _$GastronomySearchRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, GastronomyPlace place, GastronomyFilters? filters, GastronomySort sort
});


$GastronomyPlaceCopyWith<$Res> get place;$GastronomyFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class _$GastronomySearchRequestCopyWithImpl<$Res>
    implements $GastronomySearchRequestCopyWith<$Res> {
  _$GastronomySearchRequestCopyWithImpl(this._self, this._then);

  final GastronomySearchRequest _self;
  final $Res Function(GastronomySearchRequest) _then;

/// Create a copy of GastronomySearchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? place = null,Object? filters = freezed,Object? sort = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as GastronomyPlace,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as GastronomyFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as GastronomySort,
  ));
}
/// Create a copy of GastronomySearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GastronomyPlaceCopyWith<$Res> get place {
  
  return $GastronomyPlaceCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of GastronomySearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GastronomyFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $GastronomyFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// Adds pattern-matching-related methods to [GastronomySearchRequest].
extension GastronomySearchRequestPatterns on GastronomySearchRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GastronomySearchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GastronomySearchRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GastronomySearchRequest value)  $default,){
final _that = this;
switch (_that) {
case _GastronomySearchRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GastronomySearchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GastronomySearchRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  GastronomyPlace place,  GastronomyFilters? filters,  GastronomySort sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GastronomySearchRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  GastronomyPlace place,  GastronomyFilters? filters,  GastronomySort sort)  $default,) {final _that = this;
switch (_that) {
case _GastronomySearchRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  GastronomyPlace place,  GastronomyFilters? filters,  GastronomySort sort)?  $default,) {final _that = this;
switch (_that) {
case _GastronomySearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.filters,_that.sort);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GastronomySearchRequest implements GastronomySearchRequest {
  const _GastronomySearchRequest({required this.itineraryId, required this.place, this.filters = const GastronomyFilters(), this.sort = GastronomySort.recommended});
  factory _GastronomySearchRequest.fromJson(Map<String, dynamic> json) => _$GastronomySearchRequestFromJson(json);

@override final  String itineraryId;
@override final  GastronomyPlace place;
@override@JsonKey() final  GastronomyFilters? filters;
@override@JsonKey() final  GastronomySort sort;

/// Create a copy of GastronomySearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GastronomySearchRequestCopyWith<_GastronomySearchRequest> get copyWith => __$GastronomySearchRequestCopyWithImpl<_GastronomySearchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GastronomySearchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GastronomySearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,filters,sort);

@override
String toString() {
  return 'GastronomySearchRequest(itineraryId: $itineraryId, place: $place, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$GastronomySearchRequestCopyWith<$Res> implements $GastronomySearchRequestCopyWith<$Res> {
  factory _$GastronomySearchRequestCopyWith(_GastronomySearchRequest value, $Res Function(_GastronomySearchRequest) _then) = __$GastronomySearchRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, GastronomyPlace place, GastronomyFilters? filters, GastronomySort sort
});


@override $GastronomyPlaceCopyWith<$Res> get place;@override $GastronomyFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class __$GastronomySearchRequestCopyWithImpl<$Res>
    implements _$GastronomySearchRequestCopyWith<$Res> {
  __$GastronomySearchRequestCopyWithImpl(this._self, this._then);

  final _GastronomySearchRequest _self;
  final $Res Function(_GastronomySearchRequest) _then;

/// Create a copy of GastronomySearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? place = null,Object? filters = freezed,Object? sort = null,}) {
  return _then(_GastronomySearchRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as GastronomyPlace,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as GastronomyFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as GastronomySort,
  ));
}

/// Create a copy of GastronomySearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GastronomyPlaceCopyWith<$Res> get place {
  
  return $GastronomyPlaceCopyWith<$Res>(_self.place, (value) {
    return _then(_self.copyWith(place: value));
  });
}/// Create a copy of GastronomySearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GastronomyFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $GastronomyFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// @nodoc
mixin _$GastronomyResultCard {

 String get id; String get providerId; String get externalId; String get name; String get thumbnail; PriceBand get priceBand; String get location; double get latitude; double get longitude; double? get rating; int? get reviewCount; List<CuisineType> get cuisines; List<DietaryOption> get dietary; List<String> get photos; int? get distance; String? get website; String? get address; String? get shortDescription; bool? get isOpen; bool? get kidFriendly; bool? get dogFriendly; NoiseLevel? get noiseLevel;
/// Create a copy of GastronomyResultCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GastronomyResultCardCopyWith<GastronomyResultCard> get copyWith => _$GastronomyResultCardCopyWithImpl<GastronomyResultCard>(this as GastronomyResultCard, _$identity);

  /// Serializes this GastronomyResultCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GastronomyResultCard&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.priceBand, priceBand) || other.priceBand == priceBand)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&const DeepCollectionEquality().equals(other.cuisines, cuisines)&&const DeepCollectionEquality().equals(other.dietary, dietary)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.noiseLevel, noiseLevel) || other.noiseLevel == noiseLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,providerId,externalId,name,thumbnail,priceBand,location,latitude,longitude,rating,reviewCount,const DeepCollectionEquality().hash(cuisines),const DeepCollectionEquality().hash(dietary),const DeepCollectionEquality().hash(photos),distance,website,address,shortDescription,isOpen,kidFriendly,dogFriendly,noiseLevel]);

@override
String toString() {
  return 'GastronomyResultCard(id: $id, providerId: $providerId, externalId: $externalId, name: $name, thumbnail: $thumbnail, priceBand: $priceBand, location: $location, latitude: $latitude, longitude: $longitude, rating: $rating, reviewCount: $reviewCount, cuisines: $cuisines, dietary: $dietary, photos: $photos, distance: $distance, website: $website, address: $address, shortDescription: $shortDescription, isOpen: $isOpen, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly, noiseLevel: $noiseLevel)';
}


}

/// @nodoc
abstract mixin class $GastronomyResultCardCopyWith<$Res>  {
  factory $GastronomyResultCardCopyWith(GastronomyResultCard value, $Res Function(GastronomyResultCard) _then) = _$GastronomyResultCardCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String name, String thumbnail, PriceBand priceBand, String location, double latitude, double longitude, double? rating, int? reviewCount, List<CuisineType> cuisines, List<DietaryOption> dietary, List<String> photos, int? distance, String? website, String? address, String? shortDescription, bool? isOpen, bool? kidFriendly, bool? dogFriendly, NoiseLevel? noiseLevel
});




}
/// @nodoc
class _$GastronomyResultCardCopyWithImpl<$Res>
    implements $GastronomyResultCardCopyWith<$Res> {
  _$GastronomyResultCardCopyWithImpl(this._self, this._then);

  final GastronomyResultCard _self;
  final $Res Function(GastronomyResultCard) _then;

/// Create a copy of GastronomyResultCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? thumbnail = null,Object? priceBand = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? rating = freezed,Object? reviewCount = freezed,Object? cuisines = null,Object? dietary = null,Object? photos = null,Object? distance = freezed,Object? website = freezed,Object? address = freezed,Object? shortDescription = freezed,Object? isOpen = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,Object? noiseLevel = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,priceBand: null == priceBand ? _self.priceBand : priceBand // ignore: cast_nullable_to_non_nullable
as PriceBand,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,cuisines: null == cuisines ? _self.cuisines : cuisines // ignore: cast_nullable_to_non_nullable
as List<CuisineType>,dietary: null == dietary ? _self.dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<DietaryOption>,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,isOpen: freezed == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,noiseLevel: freezed == noiseLevel ? _self.noiseLevel : noiseLevel // ignore: cast_nullable_to_non_nullable
as NoiseLevel?,
  ));
}

}


/// Adds pattern-matching-related methods to [GastronomyResultCard].
extension GastronomyResultCardPatterns on GastronomyResultCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GastronomyResultCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GastronomyResultCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GastronomyResultCard value)  $default,){
final _that = this;
switch (_that) {
case _GastronomyResultCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GastronomyResultCard value)?  $default,){
final _that = this;
switch (_that) {
case _GastronomyResultCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  PriceBand priceBand,  String location,  double latitude,  double longitude,  double? rating,  int? reviewCount,  List<CuisineType> cuisines,  List<DietaryOption> dietary,  List<String> photos,  int? distance,  String? website,  String? address,  String? shortDescription,  bool? isOpen,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GastronomyResultCard() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.priceBand,_that.location,_that.latitude,_that.longitude,_that.rating,_that.reviewCount,_that.cuisines,_that.dietary,_that.photos,_that.distance,_that.website,_that.address,_that.shortDescription,_that.isOpen,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  PriceBand priceBand,  String location,  double latitude,  double longitude,  double? rating,  int? reviewCount,  List<CuisineType> cuisines,  List<DietaryOption> dietary,  List<String> photos,  int? distance,  String? website,  String? address,  String? shortDescription,  bool? isOpen,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel)  $default,) {final _that = this;
switch (_that) {
case _GastronomyResultCard():
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.priceBand,_that.location,_that.latitude,_that.longitude,_that.rating,_that.reviewCount,_that.cuisines,_that.dietary,_that.photos,_that.distance,_that.website,_that.address,_that.shortDescription,_that.isOpen,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String name,  String thumbnail,  PriceBand priceBand,  String location,  double latitude,  double longitude,  double? rating,  int? reviewCount,  List<CuisineType> cuisines,  List<DietaryOption> dietary,  List<String> photos,  int? distance,  String? website,  String? address,  String? shortDescription,  bool? isOpen,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel)?  $default,) {final _that = this;
switch (_that) {
case _GastronomyResultCard() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.thumbnail,_that.priceBand,_that.location,_that.latitude,_that.longitude,_that.rating,_that.reviewCount,_that.cuisines,_that.dietary,_that.photos,_that.distance,_that.website,_that.address,_that.shortDescription,_that.isOpen,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GastronomyResultCard implements GastronomyResultCard {
  const _GastronomyResultCard({required this.id, required this.providerId, required this.externalId, required this.name, required this.thumbnail, required this.priceBand, required this.location, required this.latitude, required this.longitude, this.rating, this.reviewCount, final  List<CuisineType> cuisines = const [], final  List<DietaryOption> dietary = const [], final  List<String> photos = const [], this.distance, this.website, this.address, this.shortDescription, this.isOpen, this.kidFriendly, this.dogFriendly, this.noiseLevel}): _cuisines = cuisines,_dietary = dietary,_photos = photos;
  factory _GastronomyResultCard.fromJson(Map<String, dynamic> json) => _$GastronomyResultCardFromJson(json);

@override final  String id;
@override final  String providerId;
@override final  String externalId;
@override final  String name;
@override final  String thumbnail;
@override final  PriceBand priceBand;
@override final  String location;
@override final  double latitude;
@override final  double longitude;
@override final  double? rating;
@override final  int? reviewCount;
 final  List<CuisineType> _cuisines;
@override@JsonKey() List<CuisineType> get cuisines {
  if (_cuisines is EqualUnmodifiableListView) return _cuisines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cuisines);
}

 final  List<DietaryOption> _dietary;
@override@JsonKey() List<DietaryOption> get dietary {
  if (_dietary is EqualUnmodifiableListView) return _dietary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietary);
}

 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  int? distance;
@override final  String? website;
@override final  String? address;
@override final  String? shortDescription;
@override final  bool? isOpen;
@override final  bool? kidFriendly;
@override final  bool? dogFriendly;
@override final  NoiseLevel? noiseLevel;

/// Create a copy of GastronomyResultCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GastronomyResultCardCopyWith<_GastronomyResultCard> get copyWith => __$GastronomyResultCardCopyWithImpl<_GastronomyResultCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GastronomyResultCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GastronomyResultCard&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.priceBand, priceBand) || other.priceBand == priceBand)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&const DeepCollectionEquality().equals(other._cuisines, _cuisines)&&const DeepCollectionEquality().equals(other._dietary, _dietary)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.noiseLevel, noiseLevel) || other.noiseLevel == noiseLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,providerId,externalId,name,thumbnail,priceBand,location,latitude,longitude,rating,reviewCount,const DeepCollectionEquality().hash(_cuisines),const DeepCollectionEquality().hash(_dietary),const DeepCollectionEquality().hash(_photos),distance,website,address,shortDescription,isOpen,kidFriendly,dogFriendly,noiseLevel]);

@override
String toString() {
  return 'GastronomyResultCard(id: $id, providerId: $providerId, externalId: $externalId, name: $name, thumbnail: $thumbnail, priceBand: $priceBand, location: $location, latitude: $latitude, longitude: $longitude, rating: $rating, reviewCount: $reviewCount, cuisines: $cuisines, dietary: $dietary, photos: $photos, distance: $distance, website: $website, address: $address, shortDescription: $shortDescription, isOpen: $isOpen, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly, noiseLevel: $noiseLevel)';
}


}

/// @nodoc
abstract mixin class _$GastronomyResultCardCopyWith<$Res> implements $GastronomyResultCardCopyWith<$Res> {
  factory _$GastronomyResultCardCopyWith(_GastronomyResultCard value, $Res Function(_GastronomyResultCard) _then) = __$GastronomyResultCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String name, String thumbnail, PriceBand priceBand, String location, double latitude, double longitude, double? rating, int? reviewCount, List<CuisineType> cuisines, List<DietaryOption> dietary, List<String> photos, int? distance, String? website, String? address, String? shortDescription, bool? isOpen, bool? kidFriendly, bool? dogFriendly, NoiseLevel? noiseLevel
});




}
/// @nodoc
class __$GastronomyResultCardCopyWithImpl<$Res>
    implements _$GastronomyResultCardCopyWith<$Res> {
  __$GastronomyResultCardCopyWithImpl(this._self, this._then);

  final _GastronomyResultCard _self;
  final $Res Function(_GastronomyResultCard) _then;

/// Create a copy of GastronomyResultCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? thumbnail = null,Object? priceBand = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? rating = freezed,Object? reviewCount = freezed,Object? cuisines = null,Object? dietary = null,Object? photos = null,Object? distance = freezed,Object? website = freezed,Object? address = freezed,Object? shortDescription = freezed,Object? isOpen = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,Object? noiseLevel = freezed,}) {
  return _then(_GastronomyResultCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,priceBand: null == priceBand ? _self.priceBand : priceBand // ignore: cast_nullable_to_non_nullable
as PriceBand,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,cuisines: null == cuisines ? _self._cuisines : cuisines // ignore: cast_nullable_to_non_nullable
as List<CuisineType>,dietary: null == dietary ? _self._dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<DietaryOption>,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as int?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,isOpen: freezed == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,noiseLevel: freezed == noiseLevel ? _self.noiseLevel : noiseLevel // ignore: cast_nullable_to_non_nullable
as NoiseLevel?,
  ));
}


}


/// @nodoc
mixin _$MenuItem {

 String get name; String? get description; double? get price; String? get currency; List<DietaryOption> get dietary; String? get category;
/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemCopyWith<MenuItem> get copyWith => _$MenuItemCopyWithImpl<MenuItem>(this as MenuItem, _$identity);

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItem&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.dietary, dietary)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,price,currency,const DeepCollectionEquality().hash(dietary),category);

@override
String toString() {
  return 'MenuItem(name: $name, description: $description, price: $price, currency: $currency, dietary: $dietary, category: $category)';
}


}

/// @nodoc
abstract mixin class $MenuItemCopyWith<$Res>  {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) _then) = _$MenuItemCopyWithImpl;
@useResult
$Res call({
 String name, String? description, double? price, String? currency, List<DietaryOption> dietary, String? category
});




}
/// @nodoc
class _$MenuItemCopyWithImpl<$Res>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._self, this._then);

  final MenuItem _self;
  final $Res Function(MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? price = freezed,Object? currency = freezed,Object? dietary = null,Object? category = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,dietary: null == dietary ? _self.dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<DietaryOption>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItem].
extension MenuItemPatterns on MenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItem value)  $default,){
final _that = this;
switch (_that) {
case _MenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  double? price,  String? currency,  List<DietaryOption> dietary,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.name,_that.description,_that.price,_that.currency,_that.dietary,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  double? price,  String? currency,  List<DietaryOption> dietary,  String? category)  $default,) {final _that = this;
switch (_that) {
case _MenuItem():
return $default(_that.name,_that.description,_that.price,_that.currency,_that.dietary,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  double? price,  String? currency,  List<DietaryOption> dietary,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.name,_that.description,_that.price,_that.currency,_that.dietary,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItem implements MenuItem {
  const _MenuItem({required this.name, this.description, this.price, this.currency, final  List<DietaryOption> dietary = const [], this.category}): _dietary = dietary;
  factory _MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

@override final  String name;
@override final  String? description;
@override final  double? price;
@override final  String? currency;
 final  List<DietaryOption> _dietary;
@override@JsonKey() List<DietaryOption> get dietary {
  if (_dietary is EqualUnmodifiableListView) return _dietary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietary);
}

@override final  String? category;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemCopyWith<_MenuItem> get copyWith => __$MenuItemCopyWithImpl<_MenuItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItem&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._dietary, _dietary)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,price,currency,const DeepCollectionEquality().hash(_dietary),category);

@override
String toString() {
  return 'MenuItem(name: $name, description: $description, price: $price, currency: $currency, dietary: $dietary, category: $category)';
}


}

/// @nodoc
abstract mixin class _$MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$MenuItemCopyWith(_MenuItem value, $Res Function(_MenuItem) _then) = __$MenuItemCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, double? price, String? currency, List<DietaryOption> dietary, String? category
});




}
/// @nodoc
class __$MenuItemCopyWithImpl<$Res>
    implements _$MenuItemCopyWith<$Res> {
  __$MenuItemCopyWithImpl(this._self, this._then);

  final _MenuItem _self;
  final $Res Function(_MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? price = freezed,Object? currency = freezed,Object? dietary = null,Object? category = freezed,}) {
  return _then(_MenuItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,dietary: null == dietary ? _self._dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<DietaryOption>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GastronomyOpeningHours {

 String? get monday; String? get tuesday; String? get wednesday; String? get thursday; String? get friday; String? get saturday; String? get sunday;
/// Create a copy of GastronomyOpeningHours
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GastronomyOpeningHoursCopyWith<GastronomyOpeningHours> get copyWith => _$GastronomyOpeningHoursCopyWithImpl<GastronomyOpeningHours>(this as GastronomyOpeningHours, _$identity);

  /// Serializes this GastronomyOpeningHours to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GastronomyOpeningHours&&(identical(other.monday, monday) || other.monday == monday)&&(identical(other.tuesday, tuesday) || other.tuesday == tuesday)&&(identical(other.wednesday, wednesday) || other.wednesday == wednesday)&&(identical(other.thursday, thursday) || other.thursday == thursday)&&(identical(other.friday, friday) || other.friday == friday)&&(identical(other.saturday, saturday) || other.saturday == saturday)&&(identical(other.sunday, sunday) || other.sunday == sunday));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monday,tuesday,wednesday,thursday,friday,saturday,sunday);

@override
String toString() {
  return 'GastronomyOpeningHours(monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday)';
}


}

/// @nodoc
abstract mixin class $GastronomyOpeningHoursCopyWith<$Res>  {
  factory $GastronomyOpeningHoursCopyWith(GastronomyOpeningHours value, $Res Function(GastronomyOpeningHours) _then) = _$GastronomyOpeningHoursCopyWithImpl;
@useResult
$Res call({
 String? monday, String? tuesday, String? wednesday, String? thursday, String? friday, String? saturday, String? sunday
});




}
/// @nodoc
class _$GastronomyOpeningHoursCopyWithImpl<$Res>
    implements $GastronomyOpeningHoursCopyWith<$Res> {
  _$GastronomyOpeningHoursCopyWithImpl(this._self, this._then);

  final GastronomyOpeningHours _self;
  final $Res Function(GastronomyOpeningHours) _then;

/// Create a copy of GastronomyOpeningHours
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


/// Adds pattern-matching-related methods to [GastronomyOpeningHours].
extension GastronomyOpeningHoursPatterns on GastronomyOpeningHours {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GastronomyOpeningHours value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GastronomyOpeningHours() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GastronomyOpeningHours value)  $default,){
final _that = this;
switch (_that) {
case _GastronomyOpeningHours():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GastronomyOpeningHours value)?  $default,){
final _that = this;
switch (_that) {
case _GastronomyOpeningHours() when $default != null:
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
case _GastronomyOpeningHours() when $default != null:
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
case _GastronomyOpeningHours():
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
case _GastronomyOpeningHours() when $default != null:
return $default(_that.monday,_that.tuesday,_that.wednesday,_that.thursday,_that.friday,_that.saturday,_that.sunday);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GastronomyOpeningHours implements GastronomyOpeningHours {
  const _GastronomyOpeningHours({this.monday, this.tuesday, this.wednesday, this.thursday, this.friday, this.saturday, this.sunday});
  factory _GastronomyOpeningHours.fromJson(Map<String, dynamic> json) => _$GastronomyOpeningHoursFromJson(json);

@override final  String? monday;
@override final  String? tuesday;
@override final  String? wednesday;
@override final  String? thursday;
@override final  String? friday;
@override final  String? saturday;
@override final  String? sunday;

/// Create a copy of GastronomyOpeningHours
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GastronomyOpeningHoursCopyWith<_GastronomyOpeningHours> get copyWith => __$GastronomyOpeningHoursCopyWithImpl<_GastronomyOpeningHours>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GastronomyOpeningHoursToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GastronomyOpeningHours&&(identical(other.monday, monday) || other.monday == monday)&&(identical(other.tuesday, tuesday) || other.tuesday == tuesday)&&(identical(other.wednesday, wednesday) || other.wednesday == wednesday)&&(identical(other.thursday, thursday) || other.thursday == thursday)&&(identical(other.friday, friday) || other.friday == friday)&&(identical(other.saturday, saturday) || other.saturday == saturday)&&(identical(other.sunday, sunday) || other.sunday == sunday));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,monday,tuesday,wednesday,thursday,friday,saturday,sunday);

@override
String toString() {
  return 'GastronomyOpeningHours(monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday)';
}


}

/// @nodoc
abstract mixin class _$GastronomyOpeningHoursCopyWith<$Res> implements $GastronomyOpeningHoursCopyWith<$Res> {
  factory _$GastronomyOpeningHoursCopyWith(_GastronomyOpeningHours value, $Res Function(_GastronomyOpeningHours) _then) = __$GastronomyOpeningHoursCopyWithImpl;
@override @useResult
$Res call({
 String? monday, String? tuesday, String? wednesday, String? thursday, String? friday, String? saturday, String? sunday
});




}
/// @nodoc
class __$GastronomyOpeningHoursCopyWithImpl<$Res>
    implements _$GastronomyOpeningHoursCopyWith<$Res> {
  __$GastronomyOpeningHoursCopyWithImpl(this._self, this._then);

  final _GastronomyOpeningHours _self;
  final $Res Function(_GastronomyOpeningHours) _then;

/// Create a copy of GastronomyOpeningHours
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? monday = freezed,Object? tuesday = freezed,Object? wednesday = freezed,Object? thursday = freezed,Object? friday = freezed,Object? saturday = freezed,Object? sunday = freezed,}) {
  return _then(_GastronomyOpeningHours(
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
mixin _$GastronomyPlaceDetail {

 String get id; String get providerId; String get externalId; String get name; String get location; double get latitude; double get longitude; PriceBand get priceBand; String? get description; List<String> get photos; List<MenuItem> get menu; List<CuisineType> get cuisines; List<DietaryOption> get dietary; GastronomyOpeningHours? get openingHours; double? get rating; int? get reviewCount; String? get website; String? get phone; String? get address; bool? get kidFriendly; bool? get dogFriendly; NoiseLevel? get noiseLevel; int? get distanceFromCenter; String? get editorialSummary;
/// Create a copy of GastronomyPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GastronomyPlaceDetailCopyWith<GastronomyPlaceDetail> get copyWith => _$GastronomyPlaceDetailCopyWithImpl<GastronomyPlaceDetail>(this as GastronomyPlaceDetail, _$identity);

  /// Serializes this GastronomyPlaceDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GastronomyPlaceDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.priceBand, priceBand) || other.priceBand == priceBand)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.menu, menu)&&const DeepCollectionEquality().equals(other.cuisines, cuisines)&&const DeepCollectionEquality().equals(other.dietary, dietary)&&(identical(other.openingHours, openingHours) || other.openingHours == openingHours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.website, website) || other.website == website)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.noiseLevel, noiseLevel) || other.noiseLevel == noiseLevel)&&(identical(other.distanceFromCenter, distanceFromCenter) || other.distanceFromCenter == distanceFromCenter)&&(identical(other.editorialSummary, editorialSummary) || other.editorialSummary == editorialSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,providerId,externalId,name,location,latitude,longitude,priceBand,description,const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(menu),const DeepCollectionEquality().hash(cuisines),const DeepCollectionEquality().hash(dietary),openingHours,rating,reviewCount,website,phone,address,kidFriendly,dogFriendly,noiseLevel,distanceFromCenter,editorialSummary]);

@override
String toString() {
  return 'GastronomyPlaceDetail(id: $id, providerId: $providerId, externalId: $externalId, name: $name, location: $location, latitude: $latitude, longitude: $longitude, priceBand: $priceBand, description: $description, photos: $photos, menu: $menu, cuisines: $cuisines, dietary: $dietary, openingHours: $openingHours, rating: $rating, reviewCount: $reviewCount, website: $website, phone: $phone, address: $address, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly, noiseLevel: $noiseLevel, distanceFromCenter: $distanceFromCenter, editorialSummary: $editorialSummary)';
}


}

/// @nodoc
abstract mixin class $GastronomyPlaceDetailCopyWith<$Res>  {
  factory $GastronomyPlaceDetailCopyWith(GastronomyPlaceDetail value, $Res Function(GastronomyPlaceDetail) _then) = _$GastronomyPlaceDetailCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String name, String location, double latitude, double longitude, PriceBand priceBand, String? description, List<String> photos, List<MenuItem> menu, List<CuisineType> cuisines, List<DietaryOption> dietary, GastronomyOpeningHours? openingHours, double? rating, int? reviewCount, String? website, String? phone, String? address, bool? kidFriendly, bool? dogFriendly, NoiseLevel? noiseLevel, int? distanceFromCenter, String? editorialSummary
});


$GastronomyOpeningHoursCopyWith<$Res>? get openingHours;

}
/// @nodoc
class _$GastronomyPlaceDetailCopyWithImpl<$Res>
    implements $GastronomyPlaceDetailCopyWith<$Res> {
  _$GastronomyPlaceDetailCopyWithImpl(this._self, this._then);

  final GastronomyPlaceDetail _self;
  final $Res Function(GastronomyPlaceDetail) _then;

/// Create a copy of GastronomyPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? priceBand = null,Object? description = freezed,Object? photos = null,Object? menu = null,Object? cuisines = null,Object? dietary = null,Object? openingHours = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? website = freezed,Object? phone = freezed,Object? address = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,Object? noiseLevel = freezed,Object? distanceFromCenter = freezed,Object? editorialSummary = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,priceBand: null == priceBand ? _self.priceBand : priceBand // ignore: cast_nullable_to_non_nullable
as PriceBand,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,menu: null == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,cuisines: null == cuisines ? _self.cuisines : cuisines // ignore: cast_nullable_to_non_nullable
as List<CuisineType>,dietary: null == dietary ? _self.dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<DietaryOption>,openingHours: freezed == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as GastronomyOpeningHours?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,noiseLevel: freezed == noiseLevel ? _self.noiseLevel : noiseLevel // ignore: cast_nullable_to_non_nullable
as NoiseLevel?,distanceFromCenter: freezed == distanceFromCenter ? _self.distanceFromCenter : distanceFromCenter // ignore: cast_nullable_to_non_nullable
as int?,editorialSummary: freezed == editorialSummary ? _self.editorialSummary : editorialSummary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of GastronomyPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GastronomyOpeningHoursCopyWith<$Res>? get openingHours {
    if (_self.openingHours == null) {
    return null;
  }

  return $GastronomyOpeningHoursCopyWith<$Res>(_self.openingHours!, (value) {
    return _then(_self.copyWith(openingHours: value));
  });
}
}


/// Adds pattern-matching-related methods to [GastronomyPlaceDetail].
extension GastronomyPlaceDetailPatterns on GastronomyPlaceDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GastronomyPlaceDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GastronomyPlaceDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GastronomyPlaceDetail value)  $default,){
final _that = this;
switch (_that) {
case _GastronomyPlaceDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GastronomyPlaceDetail value)?  $default,){
final _that = this;
switch (_that) {
case _GastronomyPlaceDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String location,  double latitude,  double longitude,  PriceBand priceBand,  String? description,  List<String> photos,  List<MenuItem> menu,  List<CuisineType> cuisines,  List<DietaryOption> dietary,  GastronomyOpeningHours? openingHours,  double? rating,  int? reviewCount,  String? website,  String? phone,  String? address,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel,  int? distanceFromCenter,  String? editorialSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GastronomyPlaceDetail() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.location,_that.latitude,_that.longitude,_that.priceBand,_that.description,_that.photos,_that.menu,_that.cuisines,_that.dietary,_that.openingHours,_that.rating,_that.reviewCount,_that.website,_that.phone,_that.address,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel,_that.distanceFromCenter,_that.editorialSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  String location,  double latitude,  double longitude,  PriceBand priceBand,  String? description,  List<String> photos,  List<MenuItem> menu,  List<CuisineType> cuisines,  List<DietaryOption> dietary,  GastronomyOpeningHours? openingHours,  double? rating,  int? reviewCount,  String? website,  String? phone,  String? address,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel,  int? distanceFromCenter,  String? editorialSummary)  $default,) {final _that = this;
switch (_that) {
case _GastronomyPlaceDetail():
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.location,_that.latitude,_that.longitude,_that.priceBand,_that.description,_that.photos,_that.menu,_that.cuisines,_that.dietary,_that.openingHours,_that.rating,_that.reviewCount,_that.website,_that.phone,_that.address,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel,_that.distanceFromCenter,_that.editorialSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String name,  String location,  double latitude,  double longitude,  PriceBand priceBand,  String? description,  List<String> photos,  List<MenuItem> menu,  List<CuisineType> cuisines,  List<DietaryOption> dietary,  GastronomyOpeningHours? openingHours,  double? rating,  int? reviewCount,  String? website,  String? phone,  String? address,  bool? kidFriendly,  bool? dogFriendly,  NoiseLevel? noiseLevel,  int? distanceFromCenter,  String? editorialSummary)?  $default,) {final _that = this;
switch (_that) {
case _GastronomyPlaceDetail() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.location,_that.latitude,_that.longitude,_that.priceBand,_that.description,_that.photos,_that.menu,_that.cuisines,_that.dietary,_that.openingHours,_that.rating,_that.reviewCount,_that.website,_that.phone,_that.address,_that.kidFriendly,_that.dogFriendly,_that.noiseLevel,_that.distanceFromCenter,_that.editorialSummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GastronomyPlaceDetail implements GastronomyPlaceDetail {
  const _GastronomyPlaceDetail({required this.id, required this.providerId, required this.externalId, required this.name, required this.location, required this.latitude, required this.longitude, required this.priceBand, this.description, final  List<String> photos = const [], final  List<MenuItem> menu = const [], final  List<CuisineType> cuisines = const [], final  List<DietaryOption> dietary = const [], this.openingHours, this.rating, this.reviewCount, this.website, this.phone, this.address, this.kidFriendly, this.dogFriendly, this.noiseLevel, this.distanceFromCenter, this.editorialSummary}): _photos = photos,_menu = menu,_cuisines = cuisines,_dietary = dietary;
  factory _GastronomyPlaceDetail.fromJson(Map<String, dynamic> json) => _$GastronomyPlaceDetailFromJson(json);

@override final  String id;
@override final  String providerId;
@override final  String externalId;
@override final  String name;
@override final  String location;
@override final  double latitude;
@override final  double longitude;
@override final  PriceBand priceBand;
@override final  String? description;
 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

 final  List<MenuItem> _menu;
@override@JsonKey() List<MenuItem> get menu {
  if (_menu is EqualUnmodifiableListView) return _menu;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menu);
}

 final  List<CuisineType> _cuisines;
@override@JsonKey() List<CuisineType> get cuisines {
  if (_cuisines is EqualUnmodifiableListView) return _cuisines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cuisines);
}

 final  List<DietaryOption> _dietary;
@override@JsonKey() List<DietaryOption> get dietary {
  if (_dietary is EqualUnmodifiableListView) return _dietary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietary);
}

@override final  GastronomyOpeningHours? openingHours;
@override final  double? rating;
@override final  int? reviewCount;
@override final  String? website;
@override final  String? phone;
@override final  String? address;
@override final  bool? kidFriendly;
@override final  bool? dogFriendly;
@override final  NoiseLevel? noiseLevel;
@override final  int? distanceFromCenter;
@override final  String? editorialSummary;

/// Create a copy of GastronomyPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GastronomyPlaceDetailCopyWith<_GastronomyPlaceDetail> get copyWith => __$GastronomyPlaceDetailCopyWithImpl<_GastronomyPlaceDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GastronomyPlaceDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GastronomyPlaceDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.priceBand, priceBand) || other.priceBand == priceBand)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._menu, _menu)&&const DeepCollectionEquality().equals(other._cuisines, _cuisines)&&const DeepCollectionEquality().equals(other._dietary, _dietary)&&(identical(other.openingHours, openingHours) || other.openingHours == openingHours)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.website, website) || other.website == website)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.kidFriendly, kidFriendly) || other.kidFriendly == kidFriendly)&&(identical(other.dogFriendly, dogFriendly) || other.dogFriendly == dogFriendly)&&(identical(other.noiseLevel, noiseLevel) || other.noiseLevel == noiseLevel)&&(identical(other.distanceFromCenter, distanceFromCenter) || other.distanceFromCenter == distanceFromCenter)&&(identical(other.editorialSummary, editorialSummary) || other.editorialSummary == editorialSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,providerId,externalId,name,location,latitude,longitude,priceBand,description,const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_menu),const DeepCollectionEquality().hash(_cuisines),const DeepCollectionEquality().hash(_dietary),openingHours,rating,reviewCount,website,phone,address,kidFriendly,dogFriendly,noiseLevel,distanceFromCenter,editorialSummary]);

@override
String toString() {
  return 'GastronomyPlaceDetail(id: $id, providerId: $providerId, externalId: $externalId, name: $name, location: $location, latitude: $latitude, longitude: $longitude, priceBand: $priceBand, description: $description, photos: $photos, menu: $menu, cuisines: $cuisines, dietary: $dietary, openingHours: $openingHours, rating: $rating, reviewCount: $reviewCount, website: $website, phone: $phone, address: $address, kidFriendly: $kidFriendly, dogFriendly: $dogFriendly, noiseLevel: $noiseLevel, distanceFromCenter: $distanceFromCenter, editorialSummary: $editorialSummary)';
}


}

/// @nodoc
abstract mixin class _$GastronomyPlaceDetailCopyWith<$Res> implements $GastronomyPlaceDetailCopyWith<$Res> {
  factory _$GastronomyPlaceDetailCopyWith(_GastronomyPlaceDetail value, $Res Function(_GastronomyPlaceDetail) _then) = __$GastronomyPlaceDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String name, String location, double latitude, double longitude, PriceBand priceBand, String? description, List<String> photos, List<MenuItem> menu, List<CuisineType> cuisines, List<DietaryOption> dietary, GastronomyOpeningHours? openingHours, double? rating, int? reviewCount, String? website, String? phone, String? address, bool? kidFriendly, bool? dogFriendly, NoiseLevel? noiseLevel, int? distanceFromCenter, String? editorialSummary
});


@override $GastronomyOpeningHoursCopyWith<$Res>? get openingHours;

}
/// @nodoc
class __$GastronomyPlaceDetailCopyWithImpl<$Res>
    implements _$GastronomyPlaceDetailCopyWith<$Res> {
  __$GastronomyPlaceDetailCopyWithImpl(this._self, this._then);

  final _GastronomyPlaceDetail _self;
  final $Res Function(_GastronomyPlaceDetail) _then;

/// Create a copy of GastronomyPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? priceBand = null,Object? description = freezed,Object? photos = null,Object? menu = null,Object? cuisines = null,Object? dietary = null,Object? openingHours = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? website = freezed,Object? phone = freezed,Object? address = freezed,Object? kidFriendly = freezed,Object? dogFriendly = freezed,Object? noiseLevel = freezed,Object? distanceFromCenter = freezed,Object? editorialSummary = freezed,}) {
  return _then(_GastronomyPlaceDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,priceBand: null == priceBand ? _self.priceBand : priceBand // ignore: cast_nullable_to_non_nullable
as PriceBand,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,menu: null == menu ? _self._menu : menu // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,cuisines: null == cuisines ? _self._cuisines : cuisines // ignore: cast_nullable_to_non_nullable
as List<CuisineType>,dietary: null == dietary ? _self._dietary : dietary // ignore: cast_nullable_to_non_nullable
as List<DietaryOption>,openingHours: freezed == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as GastronomyOpeningHours?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,kidFriendly: freezed == kidFriendly ? _self.kidFriendly : kidFriendly // ignore: cast_nullable_to_non_nullable
as bool?,dogFriendly: freezed == dogFriendly ? _self.dogFriendly : dogFriendly // ignore: cast_nullable_to_non_nullable
as bool?,noiseLevel: freezed == noiseLevel ? _self.noiseLevel : noiseLevel // ignore: cast_nullable_to_non_nullable
as NoiseLevel?,distanceFromCenter: freezed == distanceFromCenter ? _self.distanceFromCenter : distanceFromCenter // ignore: cast_nullable_to_non_nullable
as int?,editorialSummary: freezed == editorialSummary ? _self.editorialSummary : editorialSummary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of GastronomyPlaceDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GastronomyOpeningHoursCopyWith<$Res>? get openingHours {
    if (_self.openingHours == null) {
    return null;
  }

  return $GastronomyOpeningHoursCopyWith<$Res>(_self.openingHours!, (value) {
    return _then(_self.copyWith(openingHours: value));
  });
}
}


/// @nodoc
mixin _$GastronomySearchResult {

 List<GastronomyResultCard> get items; int get totalCount; String? get nextCursor; bool get fromCache;
/// Create a copy of GastronomySearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GastronomySearchResultCopyWith<GastronomySearchResult> get copyWith => _$GastronomySearchResultCopyWithImpl<GastronomySearchResult>(this as GastronomySearchResult, _$identity);

  /// Serializes this GastronomySearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GastronomySearchResult&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCount,nextCursor,fromCache);

@override
String toString() {
  return 'GastronomySearchResult(items: $items, totalCount: $totalCount, nextCursor: $nextCursor, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class $GastronomySearchResultCopyWith<$Res>  {
  factory $GastronomySearchResultCopyWith(GastronomySearchResult value, $Res Function(GastronomySearchResult) _then) = _$GastronomySearchResultCopyWithImpl;
@useResult
$Res call({
 List<GastronomyResultCard> items, int totalCount, String? nextCursor, bool fromCache
});




}
/// @nodoc
class _$GastronomySearchResultCopyWithImpl<$Res>
    implements $GastronomySearchResultCopyWith<$Res> {
  _$GastronomySearchResultCopyWithImpl(this._self, this._then);

  final GastronomySearchResult _self;
  final $Res Function(GastronomySearchResult) _then;

/// Create a copy of GastronomySearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCount = null,Object? nextCursor = freezed,Object? fromCache = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<GastronomyResultCard>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GastronomySearchResult].
extension GastronomySearchResultPatterns on GastronomySearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GastronomySearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GastronomySearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GastronomySearchResult value)  $default,){
final _that = this;
switch (_that) {
case _GastronomySearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GastronomySearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _GastronomySearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GastronomyResultCard> items,  int totalCount,  String? nextCursor,  bool fromCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GastronomySearchResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GastronomyResultCard> items,  int totalCount,  String? nextCursor,  bool fromCache)  $default,) {final _that = this;
switch (_that) {
case _GastronomySearchResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GastronomyResultCard> items,  int totalCount,  String? nextCursor,  bool fromCache)?  $default,) {final _that = this;
switch (_that) {
case _GastronomySearchResult() when $default != null:
return $default(_that.items,_that.totalCount,_that.nextCursor,_that.fromCache);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GastronomySearchResult implements GastronomySearchResult {
  const _GastronomySearchResult({required final  List<GastronomyResultCard> items, required this.totalCount, this.nextCursor, this.fromCache = false}): _items = items;
  factory _GastronomySearchResult.fromJson(Map<String, dynamic> json) => _$GastronomySearchResultFromJson(json);

 final  List<GastronomyResultCard> _items;
@override List<GastronomyResultCard> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int totalCount;
@override final  String? nextCursor;
@override@JsonKey() final  bool fromCache;

/// Create a copy of GastronomySearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GastronomySearchResultCopyWith<_GastronomySearchResult> get copyWith => __$GastronomySearchResultCopyWithImpl<_GastronomySearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GastronomySearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GastronomySearchResult&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCount,nextCursor,fromCache);

@override
String toString() {
  return 'GastronomySearchResult(items: $items, totalCount: $totalCount, nextCursor: $nextCursor, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class _$GastronomySearchResultCopyWith<$Res> implements $GastronomySearchResultCopyWith<$Res> {
  factory _$GastronomySearchResultCopyWith(_GastronomySearchResult value, $Res Function(_GastronomySearchResult) _then) = __$GastronomySearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<GastronomyResultCard> items, int totalCount, String? nextCursor, bool fromCache
});




}
/// @nodoc
class __$GastronomySearchResultCopyWithImpl<$Res>
    implements _$GastronomySearchResultCopyWith<$Res> {
  __$GastronomySearchResultCopyWithImpl(this._self, this._then);

  final _GastronomySearchResult _self;
  final $Res Function(_GastronomySearchResult) _then;

/// Create a copy of GastronomySearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCount = null,Object? nextCursor = freezed,Object? fromCache = null,}) {
  return _then(_GastronomySearchResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<GastronomyResultCard>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,fromCache: null == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
