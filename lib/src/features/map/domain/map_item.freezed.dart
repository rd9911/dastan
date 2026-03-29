// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapItem {

 String get id; double get latitude; double get longitude; String get title; ItinerarySection get type; String? get description;
/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapItemCopyWith<MapItem> get copyWith => _$MapItemCopyWithImpl<MapItem>(this as MapItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapItem&&(identical(other.id, id) || other.id == id)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,latitude,longitude,title,type,description);

@override
String toString() {
  return 'MapItem(id: $id, latitude: $latitude, longitude: $longitude, title: $title, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class $MapItemCopyWith<$Res>  {
  factory $MapItemCopyWith(MapItem value, $Res Function(MapItem) _then) = _$MapItemCopyWithImpl;
@useResult
$Res call({
 String id, double latitude, double longitude, String title, ItinerarySection type, String? description
});




}
/// @nodoc
class _$MapItemCopyWithImpl<$Res>
    implements $MapItemCopyWith<$Res> {
  _$MapItemCopyWithImpl(this._self, this._then);

  final MapItem _self;
  final $Res Function(MapItem) _then;

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? latitude = null,Object? longitude = null,Object? title = null,Object? type = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ItinerarySection,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MapItem].
extension MapItemPatterns on MapItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapItem value)  $default,){
final _that = this;
switch (_that) {
case _MapItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapItem value)?  $default,){
final _that = this;
switch (_that) {
case _MapItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double latitude,  double longitude,  String title,  ItinerarySection type,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapItem() when $default != null:
return $default(_that.id,_that.latitude,_that.longitude,_that.title,_that.type,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double latitude,  double longitude,  String title,  ItinerarySection type,  String? description)  $default,) {final _that = this;
switch (_that) {
case _MapItem():
return $default(_that.id,_that.latitude,_that.longitude,_that.title,_that.type,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double latitude,  double longitude,  String title,  ItinerarySection type,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _MapItem() when $default != null:
return $default(_that.id,_that.latitude,_that.longitude,_that.title,_that.type,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _MapItem implements MapItem {
  const _MapItem({required this.id, required this.latitude, required this.longitude, required this.title, required this.type, this.description});
  

@override final  String id;
@override final  double latitude;
@override final  double longitude;
@override final  String title;
@override final  ItinerarySection type;
@override final  String? description;

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapItemCopyWith<_MapItem> get copyWith => __$MapItemCopyWithImpl<_MapItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapItem&&(identical(other.id, id) || other.id == id)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,latitude,longitude,title,type,description);

@override
String toString() {
  return 'MapItem(id: $id, latitude: $latitude, longitude: $longitude, title: $title, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class _$MapItemCopyWith<$Res> implements $MapItemCopyWith<$Res> {
  factory _$MapItemCopyWith(_MapItem value, $Res Function(_MapItem) _then) = __$MapItemCopyWithImpl;
@override @useResult
$Res call({
 String id, double latitude, double longitude, String title, ItinerarySection type, String? description
});




}
/// @nodoc
class __$MapItemCopyWithImpl<$Res>
    implements _$MapItemCopyWith<$Res> {
  __$MapItemCopyWithImpl(this._self, this._then);

  final _MapItem _self;
  final $Res Function(_MapItem) _then;

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? latitude = null,Object? longitude = null,Object? title = null,Object? type = null,Object? description = freezed,}) {
  return _then(_MapItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ItinerarySection,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
