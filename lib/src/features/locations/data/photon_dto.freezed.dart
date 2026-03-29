// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photon_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotonResponse {

 String get type; List<PhotonFeature> get features;
/// Create a copy of PhotonResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotonResponseCopyWith<PhotonResponse> get copyWith => _$PhotonResponseCopyWithImpl<PhotonResponse>(this as PhotonResponse, _$identity);

  /// Serializes this PhotonResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotonResponse&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.features, features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(features));

@override
String toString() {
  return 'PhotonResponse(type: $type, features: $features)';
}


}

/// @nodoc
abstract mixin class $PhotonResponseCopyWith<$Res>  {
  factory $PhotonResponseCopyWith(PhotonResponse value, $Res Function(PhotonResponse) _then) = _$PhotonResponseCopyWithImpl;
@useResult
$Res call({
 String type, List<PhotonFeature> features
});




}
/// @nodoc
class _$PhotonResponseCopyWithImpl<$Res>
    implements $PhotonResponseCopyWith<$Res> {
  _$PhotonResponseCopyWithImpl(this._self, this._then);

  final PhotonResponse _self;
  final $Res Function(PhotonResponse) _then;

/// Create a copy of PhotonResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? features = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<PhotonFeature>,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotonResponse].
extension PhotonResponsePatterns on PhotonResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotonResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotonResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotonResponse value)  $default,){
final _that = this;
switch (_that) {
case _PhotonResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotonResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PhotonResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  List<PhotonFeature> features)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotonResponse() when $default != null:
return $default(_that.type,_that.features);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  List<PhotonFeature> features)  $default,) {final _that = this;
switch (_that) {
case _PhotonResponse():
return $default(_that.type,_that.features);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  List<PhotonFeature> features)?  $default,) {final _that = this;
switch (_that) {
case _PhotonResponse() when $default != null:
return $default(_that.type,_that.features);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotonResponse implements PhotonResponse {
  const _PhotonResponse({required this.type, required final  List<PhotonFeature> features}): _features = features;
  factory _PhotonResponse.fromJson(Map<String, dynamic> json) => _$PhotonResponseFromJson(json);

@override final  String type;
 final  List<PhotonFeature> _features;
@override List<PhotonFeature> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}


/// Create a copy of PhotonResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotonResponseCopyWith<_PhotonResponse> get copyWith => __$PhotonResponseCopyWithImpl<_PhotonResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotonResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotonResponse&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._features, _features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_features));

@override
String toString() {
  return 'PhotonResponse(type: $type, features: $features)';
}


}

/// @nodoc
abstract mixin class _$PhotonResponseCopyWith<$Res> implements $PhotonResponseCopyWith<$Res> {
  factory _$PhotonResponseCopyWith(_PhotonResponse value, $Res Function(_PhotonResponse) _then) = __$PhotonResponseCopyWithImpl;
@override @useResult
$Res call({
 String type, List<PhotonFeature> features
});




}
/// @nodoc
class __$PhotonResponseCopyWithImpl<$Res>
    implements _$PhotonResponseCopyWith<$Res> {
  __$PhotonResponseCopyWithImpl(this._self, this._then);

  final _PhotonResponse _self;
  final $Res Function(_PhotonResponse) _then;

/// Create a copy of PhotonResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? features = null,}) {
  return _then(_PhotonResponse(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<PhotonFeature>,
  ));
}


}


/// @nodoc
mixin _$PhotonFeature {

 String get type; PhotonGeometry get geometry; PhotonProperties get properties;
/// Create a copy of PhotonFeature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotonFeatureCopyWith<PhotonFeature> get copyWith => _$PhotonFeatureCopyWithImpl<PhotonFeature>(this as PhotonFeature, _$identity);

  /// Serializes this PhotonFeature to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotonFeature&&(identical(other.type, type) || other.type == type)&&(identical(other.geometry, geometry) || other.geometry == geometry)&&(identical(other.properties, properties) || other.properties == properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,geometry,properties);

@override
String toString() {
  return 'PhotonFeature(type: $type, geometry: $geometry, properties: $properties)';
}


}

/// @nodoc
abstract mixin class $PhotonFeatureCopyWith<$Res>  {
  factory $PhotonFeatureCopyWith(PhotonFeature value, $Res Function(PhotonFeature) _then) = _$PhotonFeatureCopyWithImpl;
@useResult
$Res call({
 String type, PhotonGeometry geometry, PhotonProperties properties
});


$PhotonGeometryCopyWith<$Res> get geometry;$PhotonPropertiesCopyWith<$Res> get properties;

}
/// @nodoc
class _$PhotonFeatureCopyWithImpl<$Res>
    implements $PhotonFeatureCopyWith<$Res> {
  _$PhotonFeatureCopyWithImpl(this._self, this._then);

  final PhotonFeature _self;
  final $Res Function(PhotonFeature) _then;

/// Create a copy of PhotonFeature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? geometry = null,Object? properties = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as PhotonGeometry,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as PhotonProperties,
  ));
}
/// Create a copy of PhotonFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotonGeometryCopyWith<$Res> get geometry {
  
  return $PhotonGeometryCopyWith<$Res>(_self.geometry, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}/// Create a copy of PhotonFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotonPropertiesCopyWith<$Res> get properties {
  
  return $PhotonPropertiesCopyWith<$Res>(_self.properties, (value) {
    return _then(_self.copyWith(properties: value));
  });
}
}


/// Adds pattern-matching-related methods to [PhotonFeature].
extension PhotonFeaturePatterns on PhotonFeature {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotonFeature value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotonFeature() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotonFeature value)  $default,){
final _that = this;
switch (_that) {
case _PhotonFeature():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotonFeature value)?  $default,){
final _that = this;
switch (_that) {
case _PhotonFeature() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  PhotonGeometry geometry,  PhotonProperties properties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotonFeature() when $default != null:
return $default(_that.type,_that.geometry,_that.properties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  PhotonGeometry geometry,  PhotonProperties properties)  $default,) {final _that = this;
switch (_that) {
case _PhotonFeature():
return $default(_that.type,_that.geometry,_that.properties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  PhotonGeometry geometry,  PhotonProperties properties)?  $default,) {final _that = this;
switch (_that) {
case _PhotonFeature() when $default != null:
return $default(_that.type,_that.geometry,_that.properties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotonFeature implements PhotonFeature {
  const _PhotonFeature({required this.type, required this.geometry, required this.properties});
  factory _PhotonFeature.fromJson(Map<String, dynamic> json) => _$PhotonFeatureFromJson(json);

@override final  String type;
@override final  PhotonGeometry geometry;
@override final  PhotonProperties properties;

/// Create a copy of PhotonFeature
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotonFeatureCopyWith<_PhotonFeature> get copyWith => __$PhotonFeatureCopyWithImpl<_PhotonFeature>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotonFeatureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotonFeature&&(identical(other.type, type) || other.type == type)&&(identical(other.geometry, geometry) || other.geometry == geometry)&&(identical(other.properties, properties) || other.properties == properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,geometry,properties);

@override
String toString() {
  return 'PhotonFeature(type: $type, geometry: $geometry, properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$PhotonFeatureCopyWith<$Res> implements $PhotonFeatureCopyWith<$Res> {
  factory _$PhotonFeatureCopyWith(_PhotonFeature value, $Res Function(_PhotonFeature) _then) = __$PhotonFeatureCopyWithImpl;
@override @useResult
$Res call({
 String type, PhotonGeometry geometry, PhotonProperties properties
});


@override $PhotonGeometryCopyWith<$Res> get geometry;@override $PhotonPropertiesCopyWith<$Res> get properties;

}
/// @nodoc
class __$PhotonFeatureCopyWithImpl<$Res>
    implements _$PhotonFeatureCopyWith<$Res> {
  __$PhotonFeatureCopyWithImpl(this._self, this._then);

  final _PhotonFeature _self;
  final $Res Function(_PhotonFeature) _then;

/// Create a copy of PhotonFeature
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? geometry = null,Object? properties = null,}) {
  return _then(_PhotonFeature(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as PhotonGeometry,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as PhotonProperties,
  ));
}

/// Create a copy of PhotonFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotonGeometryCopyWith<$Res> get geometry {
  
  return $PhotonGeometryCopyWith<$Res>(_self.geometry, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}/// Create a copy of PhotonFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotonPropertiesCopyWith<$Res> get properties {
  
  return $PhotonPropertiesCopyWith<$Res>(_self.properties, (value) {
    return _then(_self.copyWith(properties: value));
  });
}
}


/// @nodoc
mixin _$PhotonGeometry {

 String get type;/// [longitude, latitude] - note the order!
 List<double> get coordinates;
/// Create a copy of PhotonGeometry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotonGeometryCopyWith<PhotonGeometry> get copyWith => _$PhotonGeometryCopyWithImpl<PhotonGeometry>(this as PhotonGeometry, _$identity);

  /// Serializes this PhotonGeometry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotonGeometry&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.coordinates, coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(coordinates));

@override
String toString() {
  return 'PhotonGeometry(type: $type, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $PhotonGeometryCopyWith<$Res>  {
  factory $PhotonGeometryCopyWith(PhotonGeometry value, $Res Function(PhotonGeometry) _then) = _$PhotonGeometryCopyWithImpl;
@useResult
$Res call({
 String type, List<double> coordinates
});




}
/// @nodoc
class _$PhotonGeometryCopyWithImpl<$Res>
    implements $PhotonGeometryCopyWith<$Res> {
  _$PhotonGeometryCopyWithImpl(this._self, this._then);

  final PhotonGeometry _self;
  final $Res Function(PhotonGeometry) _then;

/// Create a copy of PhotonGeometry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? coordinates = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotonGeometry].
extension PhotonGeometryPatterns on PhotonGeometry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotonGeometry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotonGeometry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotonGeometry value)  $default,){
final _that = this;
switch (_that) {
case _PhotonGeometry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotonGeometry value)?  $default,){
final _that = this;
switch (_that) {
case _PhotonGeometry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  List<double> coordinates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotonGeometry() when $default != null:
return $default(_that.type,_that.coordinates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  List<double> coordinates)  $default,) {final _that = this;
switch (_that) {
case _PhotonGeometry():
return $default(_that.type,_that.coordinates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  List<double> coordinates)?  $default,) {final _that = this;
switch (_that) {
case _PhotonGeometry() when $default != null:
return $default(_that.type,_that.coordinates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotonGeometry implements PhotonGeometry {
  const _PhotonGeometry({required this.type, required final  List<double> coordinates}): _coordinates = coordinates;
  factory _PhotonGeometry.fromJson(Map<String, dynamic> json) => _$PhotonGeometryFromJson(json);

@override final  String type;
/// [longitude, latitude] - note the order!
 final  List<double> _coordinates;
/// [longitude, latitude] - note the order!
@override List<double> get coordinates {
  if (_coordinates is EqualUnmodifiableListView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coordinates);
}


/// Create a copy of PhotonGeometry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotonGeometryCopyWith<_PhotonGeometry> get copyWith => __$PhotonGeometryCopyWithImpl<_PhotonGeometry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotonGeometryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotonGeometry&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._coordinates, _coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_coordinates));

@override
String toString() {
  return 'PhotonGeometry(type: $type, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$PhotonGeometryCopyWith<$Res> implements $PhotonGeometryCopyWith<$Res> {
  factory _$PhotonGeometryCopyWith(_PhotonGeometry value, $Res Function(_PhotonGeometry) _then) = __$PhotonGeometryCopyWithImpl;
@override @useResult
$Res call({
 String type, List<double> coordinates
});




}
/// @nodoc
class __$PhotonGeometryCopyWithImpl<$Res>
    implements _$PhotonGeometryCopyWith<$Res> {
  __$PhotonGeometryCopyWithImpl(this._self, this._then);

  final _PhotonGeometry _self;
  final $Res Function(_PhotonGeometry) _then;

/// Create a copy of PhotonGeometry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? coordinates = null,}) {
  return _then(_PhotonGeometry(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}


/// @nodoc
mixin _$PhotonProperties {

@JsonKey(name: 'osm_id') int? get osmId;@JsonKey(name: 'osm_type') String? get osmType;@JsonKey(name: 'osm_key') String? get osmKey;@JsonKey(name: 'osm_value') String? get osmValue; String? get name; String? get country; String? get state; String? get city; String? get street; String? get postcode;@JsonKey(name: 'housenumber') String? get houseNumber;/// OSM feature type (e.g., "city", "town", "village", "aerodrome")
 String? get type;
/// Create a copy of PhotonProperties
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotonPropertiesCopyWith<PhotonProperties> get copyWith => _$PhotonPropertiesCopyWithImpl<PhotonProperties>(this as PhotonProperties, _$identity);

  /// Serializes this PhotonProperties to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotonProperties&&(identical(other.osmId, osmId) || other.osmId == osmId)&&(identical(other.osmType, osmType) || other.osmType == osmType)&&(identical(other.osmKey, osmKey) || other.osmKey == osmKey)&&(identical(other.osmValue, osmValue) || other.osmValue == osmValue)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state)&&(identical(other.city, city) || other.city == city)&&(identical(other.street, street) || other.street == street)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,osmId,osmType,osmKey,osmValue,name,country,state,city,street,postcode,houseNumber,type);

@override
String toString() {
  return 'PhotonProperties(osmId: $osmId, osmType: $osmType, osmKey: $osmKey, osmValue: $osmValue, name: $name, country: $country, state: $state, city: $city, street: $street, postcode: $postcode, houseNumber: $houseNumber, type: $type)';
}


}

/// @nodoc
abstract mixin class $PhotonPropertiesCopyWith<$Res>  {
  factory $PhotonPropertiesCopyWith(PhotonProperties value, $Res Function(PhotonProperties) _then) = _$PhotonPropertiesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'osm_id') int? osmId,@JsonKey(name: 'osm_type') String? osmType,@JsonKey(name: 'osm_key') String? osmKey,@JsonKey(name: 'osm_value') String? osmValue, String? name, String? country, String? state, String? city, String? street, String? postcode,@JsonKey(name: 'housenumber') String? houseNumber, String? type
});




}
/// @nodoc
class _$PhotonPropertiesCopyWithImpl<$Res>
    implements $PhotonPropertiesCopyWith<$Res> {
  _$PhotonPropertiesCopyWithImpl(this._self, this._then);

  final PhotonProperties _self;
  final $Res Function(PhotonProperties) _then;

/// Create a copy of PhotonProperties
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? osmId = freezed,Object? osmType = freezed,Object? osmKey = freezed,Object? osmValue = freezed,Object? name = freezed,Object? country = freezed,Object? state = freezed,Object? city = freezed,Object? street = freezed,Object? postcode = freezed,Object? houseNumber = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
osmId: freezed == osmId ? _self.osmId : osmId // ignore: cast_nullable_to_non_nullable
as int?,osmType: freezed == osmType ? _self.osmType : osmType // ignore: cast_nullable_to_non_nullable
as String?,osmKey: freezed == osmKey ? _self.osmKey : osmKey // ignore: cast_nullable_to_non_nullable
as String?,osmValue: freezed == osmValue ? _self.osmValue : osmValue // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotonProperties].
extension PhotonPropertiesPatterns on PhotonProperties {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotonProperties value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotonProperties() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotonProperties value)  $default,){
final _that = this;
switch (_that) {
case _PhotonProperties():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotonProperties value)?  $default,){
final _that = this;
switch (_that) {
case _PhotonProperties() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'osm_id')  int? osmId, @JsonKey(name: 'osm_type')  String? osmType, @JsonKey(name: 'osm_key')  String? osmKey, @JsonKey(name: 'osm_value')  String? osmValue,  String? name,  String? country,  String? state,  String? city,  String? street,  String? postcode, @JsonKey(name: 'housenumber')  String? houseNumber,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotonProperties() when $default != null:
return $default(_that.osmId,_that.osmType,_that.osmKey,_that.osmValue,_that.name,_that.country,_that.state,_that.city,_that.street,_that.postcode,_that.houseNumber,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'osm_id')  int? osmId, @JsonKey(name: 'osm_type')  String? osmType, @JsonKey(name: 'osm_key')  String? osmKey, @JsonKey(name: 'osm_value')  String? osmValue,  String? name,  String? country,  String? state,  String? city,  String? street,  String? postcode, @JsonKey(name: 'housenumber')  String? houseNumber,  String? type)  $default,) {final _that = this;
switch (_that) {
case _PhotonProperties():
return $default(_that.osmId,_that.osmType,_that.osmKey,_that.osmValue,_that.name,_that.country,_that.state,_that.city,_that.street,_that.postcode,_that.houseNumber,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'osm_id')  int? osmId, @JsonKey(name: 'osm_type')  String? osmType, @JsonKey(name: 'osm_key')  String? osmKey, @JsonKey(name: 'osm_value')  String? osmValue,  String? name,  String? country,  String? state,  String? city,  String? street,  String? postcode, @JsonKey(name: 'housenumber')  String? houseNumber,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _PhotonProperties() when $default != null:
return $default(_that.osmId,_that.osmType,_that.osmKey,_that.osmValue,_that.name,_that.country,_that.state,_that.city,_that.street,_that.postcode,_that.houseNumber,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotonProperties implements PhotonProperties {
  const _PhotonProperties({@JsonKey(name: 'osm_id') this.osmId, @JsonKey(name: 'osm_type') this.osmType, @JsonKey(name: 'osm_key') this.osmKey, @JsonKey(name: 'osm_value') this.osmValue, this.name, this.country, this.state, this.city, this.street, this.postcode, @JsonKey(name: 'housenumber') this.houseNumber, this.type});
  factory _PhotonProperties.fromJson(Map<String, dynamic> json) => _$PhotonPropertiesFromJson(json);

@override@JsonKey(name: 'osm_id') final  int? osmId;
@override@JsonKey(name: 'osm_type') final  String? osmType;
@override@JsonKey(name: 'osm_key') final  String? osmKey;
@override@JsonKey(name: 'osm_value') final  String? osmValue;
@override final  String? name;
@override final  String? country;
@override final  String? state;
@override final  String? city;
@override final  String? street;
@override final  String? postcode;
@override@JsonKey(name: 'housenumber') final  String? houseNumber;
/// OSM feature type (e.g., "city", "town", "village", "aerodrome")
@override final  String? type;

/// Create a copy of PhotonProperties
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotonPropertiesCopyWith<_PhotonProperties> get copyWith => __$PhotonPropertiesCopyWithImpl<_PhotonProperties>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotonPropertiesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotonProperties&&(identical(other.osmId, osmId) || other.osmId == osmId)&&(identical(other.osmType, osmType) || other.osmType == osmType)&&(identical(other.osmKey, osmKey) || other.osmKey == osmKey)&&(identical(other.osmValue, osmValue) || other.osmValue == osmValue)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state)&&(identical(other.city, city) || other.city == city)&&(identical(other.street, street) || other.street == street)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,osmId,osmType,osmKey,osmValue,name,country,state,city,street,postcode,houseNumber,type);

@override
String toString() {
  return 'PhotonProperties(osmId: $osmId, osmType: $osmType, osmKey: $osmKey, osmValue: $osmValue, name: $name, country: $country, state: $state, city: $city, street: $street, postcode: $postcode, houseNumber: $houseNumber, type: $type)';
}


}

/// @nodoc
abstract mixin class _$PhotonPropertiesCopyWith<$Res> implements $PhotonPropertiesCopyWith<$Res> {
  factory _$PhotonPropertiesCopyWith(_PhotonProperties value, $Res Function(_PhotonProperties) _then) = __$PhotonPropertiesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'osm_id') int? osmId,@JsonKey(name: 'osm_type') String? osmType,@JsonKey(name: 'osm_key') String? osmKey,@JsonKey(name: 'osm_value') String? osmValue, String? name, String? country, String? state, String? city, String? street, String? postcode,@JsonKey(name: 'housenumber') String? houseNumber, String? type
});




}
/// @nodoc
class __$PhotonPropertiesCopyWithImpl<$Res>
    implements _$PhotonPropertiesCopyWith<$Res> {
  __$PhotonPropertiesCopyWithImpl(this._self, this._then);

  final _PhotonProperties _self;
  final $Res Function(_PhotonProperties) _then;

/// Create a copy of PhotonProperties
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? osmId = freezed,Object? osmType = freezed,Object? osmKey = freezed,Object? osmValue = freezed,Object? name = freezed,Object? country = freezed,Object? state = freezed,Object? city = freezed,Object? street = freezed,Object? postcode = freezed,Object? houseNumber = freezed,Object? type = freezed,}) {
  return _then(_PhotonProperties(
osmId: freezed == osmId ? _self.osmId : osmId // ignore: cast_nullable_to_non_nullable
as int?,osmType: freezed == osmType ? _self.osmType : osmType // ignore: cast_nullable_to_non_nullable
as String?,osmKey: freezed == osmKey ? _self.osmKey : osmKey // ignore: cast_nullable_to_non_nullable
as String?,osmValue: freezed == osmValue ? _self.osmValue : osmValue // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
