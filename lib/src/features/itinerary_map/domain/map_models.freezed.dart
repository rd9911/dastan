// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapItem {

 String get id; MapItemType get type; double get latitude; double get longitude; String get title; String? get subtitle; String? get iconUrl; String get dedupeKey;// For polylines or additional geometry (e.g. flight path)
 List<MapPoint> get geometry;
/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapItemCopyWith<MapItem> get copyWith => _$MapItemCopyWithImpl<MapItem>(this as MapItem, _$identity);

  /// Serializes this MapItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.dedupeKey, dedupeKey) || other.dedupeKey == dedupeKey)&&const DeepCollectionEquality().equals(other.geometry, geometry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,latitude,longitude,title,subtitle,iconUrl,dedupeKey,const DeepCollectionEquality().hash(geometry));

@override
String toString() {
  return 'MapItem(id: $id, type: $type, latitude: $latitude, longitude: $longitude, title: $title, subtitle: $subtitle, iconUrl: $iconUrl, dedupeKey: $dedupeKey, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class $MapItemCopyWith<$Res>  {
  factory $MapItemCopyWith(MapItem value, $Res Function(MapItem) _then) = _$MapItemCopyWithImpl;
@useResult
$Res call({
 String id, MapItemType type, double latitude, double longitude, String title, String? subtitle, String? iconUrl, String dedupeKey, List<MapPoint> geometry
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? latitude = null,Object? longitude = null,Object? title = null,Object? subtitle = freezed,Object? iconUrl = freezed,Object? dedupeKey = null,Object? geometry = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MapItemType,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,dedupeKey: null == dedupeKey ? _self.dedupeKey : dedupeKey // ignore: cast_nullable_to_non_nullable
as String,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<MapPoint>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MapItemType type,  double latitude,  double longitude,  String title,  String? subtitle,  String? iconUrl,  String dedupeKey,  List<MapPoint> geometry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapItem() when $default != null:
return $default(_that.id,_that.type,_that.latitude,_that.longitude,_that.title,_that.subtitle,_that.iconUrl,_that.dedupeKey,_that.geometry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MapItemType type,  double latitude,  double longitude,  String title,  String? subtitle,  String? iconUrl,  String dedupeKey,  List<MapPoint> geometry)  $default,) {final _that = this;
switch (_that) {
case _MapItem():
return $default(_that.id,_that.type,_that.latitude,_that.longitude,_that.title,_that.subtitle,_that.iconUrl,_that.dedupeKey,_that.geometry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MapItemType type,  double latitude,  double longitude,  String title,  String? subtitle,  String? iconUrl,  String dedupeKey,  List<MapPoint> geometry)?  $default,) {final _that = this;
switch (_that) {
case _MapItem() when $default != null:
return $default(_that.id,_that.type,_that.latitude,_that.longitude,_that.title,_that.subtitle,_that.iconUrl,_that.dedupeKey,_that.geometry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapItem implements MapItem {
  const _MapItem({required this.id, required this.type, required this.latitude, required this.longitude, required this.title, this.subtitle, this.iconUrl, required this.dedupeKey, final  List<MapPoint> geometry = const []}): _geometry = geometry;
  factory _MapItem.fromJson(Map<String, dynamic> json) => _$MapItemFromJson(json);

@override final  String id;
@override final  MapItemType type;
@override final  double latitude;
@override final  double longitude;
@override final  String title;
@override final  String? subtitle;
@override final  String? iconUrl;
@override final  String dedupeKey;
// For polylines or additional geometry (e.g. flight path)
 final  List<MapPoint> _geometry;
// For polylines or additional geometry (e.g. flight path)
@override@JsonKey() List<MapPoint> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}


/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapItemCopyWith<_MapItem> get copyWith => __$MapItemCopyWithImpl<_MapItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.dedupeKey, dedupeKey) || other.dedupeKey == dedupeKey)&&const DeepCollectionEquality().equals(other._geometry, _geometry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,latitude,longitude,title,subtitle,iconUrl,dedupeKey,const DeepCollectionEquality().hash(_geometry));

@override
String toString() {
  return 'MapItem(id: $id, type: $type, latitude: $latitude, longitude: $longitude, title: $title, subtitle: $subtitle, iconUrl: $iconUrl, dedupeKey: $dedupeKey, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class _$MapItemCopyWith<$Res> implements $MapItemCopyWith<$Res> {
  factory _$MapItemCopyWith(_MapItem value, $Res Function(_MapItem) _then) = __$MapItemCopyWithImpl;
@override @useResult
$Res call({
 String id, MapItemType type, double latitude, double longitude, String title, String? subtitle, String? iconUrl, String dedupeKey, List<MapPoint> geometry
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? latitude = null,Object? longitude = null,Object? title = null,Object? subtitle = freezed,Object? iconUrl = freezed,Object? dedupeKey = null,Object? geometry = null,}) {
  return _then(_MapItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MapItemType,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,dedupeKey: null == dedupeKey ? _self.dedupeKey : dedupeKey // ignore: cast_nullable_to_non_nullable
as String,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<MapPoint>,
  ));
}


}


/// @nodoc
mixin _$MapPoint {

 double get lat; double get lng;
/// Create a copy of MapPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapPointCopyWith<MapPoint> get copyWith => _$MapPointCopyWithImpl<MapPoint>(this as MapPoint, _$identity);

  /// Serializes this MapPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapPoint&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'MapPoint(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $MapPointCopyWith<$Res>  {
  factory $MapPointCopyWith(MapPoint value, $Res Function(MapPoint) _then) = _$MapPointCopyWithImpl;
@useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class _$MapPointCopyWithImpl<$Res>
    implements $MapPointCopyWith<$Res> {
  _$MapPointCopyWithImpl(this._self, this._then);

  final MapPoint _self;
  final $Res Function(MapPoint) _then;

/// Create a copy of MapPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MapPoint].
extension MapPointPatterns on MapPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapPoint value)  $default,){
final _that = this;
switch (_that) {
case _MapPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapPoint value)?  $default,){
final _that = this;
switch (_that) {
case _MapPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapPoint() when $default != null:
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _MapPoint():
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _MapPoint() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapPoint implements MapPoint {
  const _MapPoint({required this.lat, required this.lng});
  factory _MapPoint.fromJson(Map<String, dynamic> json) => _$MapPointFromJson(json);

@override final  double lat;
@override final  double lng;

/// Create a copy of MapPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapPointCopyWith<_MapPoint> get copyWith => __$MapPointCopyWithImpl<_MapPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapPoint&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'MapPoint(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$MapPointCopyWith<$Res> implements $MapPointCopyWith<$Res> {
  factory _$MapPointCopyWith(_MapPoint value, $Res Function(_MapPoint) _then) = __$MapPointCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class __$MapPointCopyWithImpl<$Res>
    implements _$MapPointCopyWith<$Res> {
  __$MapPointCopyWithImpl(this._self, this._then);

  final _MapPoint _self;
  final $Res Function(_MapPoint) _then;

/// Create a copy of MapPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_MapPoint(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$MapState {

 List<MapItem> get items; bool get isLoading; Set<MapLayer> get visibleLayers;// Current viewport
 double? get centerLat; double? get centerLng; double? get zoom;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.visibleLayers, visibleLayers)&&(identical(other.centerLat, centerLat) || other.centerLat == centerLat)&&(identical(other.centerLng, centerLng) || other.centerLng == centerLng)&&(identical(other.zoom, zoom) || other.zoom == zoom));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),isLoading,const DeepCollectionEquality().hash(visibleLayers),centerLat,centerLng,zoom);

@override
String toString() {
  return 'MapState(items: $items, isLoading: $isLoading, visibleLayers: $visibleLayers, centerLat: $centerLat, centerLng: $centerLng, zoom: $zoom)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 List<MapItem> items, bool isLoading, Set<MapLayer> visibleLayers, double? centerLat, double? centerLng, double? zoom
});




}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? isLoading = null,Object? visibleLayers = null,Object? centerLat = freezed,Object? centerLng = freezed,Object? zoom = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MapItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,visibleLayers: null == visibleLayers ? _self.visibleLayers : visibleLayers // ignore: cast_nullable_to_non_nullable
as Set<MapLayer>,centerLat: freezed == centerLat ? _self.centerLat : centerLat // ignore: cast_nullable_to_non_nullable
as double?,centerLng: freezed == centerLng ? _self.centerLng : centerLng // ignore: cast_nullable_to_non_nullable
as double?,zoom: freezed == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapState value)  $default,){
final _that = this;
switch (_that) {
case _MapState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapState value)?  $default,){
final _that = this;
switch (_that) {
case _MapState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MapItem> items,  bool isLoading,  Set<MapLayer> visibleLayers,  double? centerLat,  double? centerLng,  double? zoom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.items,_that.isLoading,_that.visibleLayers,_that.centerLat,_that.centerLng,_that.zoom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MapItem> items,  bool isLoading,  Set<MapLayer> visibleLayers,  double? centerLat,  double? centerLng,  double? zoom)  $default,) {final _that = this;
switch (_that) {
case _MapState():
return $default(_that.items,_that.isLoading,_that.visibleLayers,_that.centerLat,_that.centerLng,_that.zoom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MapItem> items,  bool isLoading,  Set<MapLayer> visibleLayers,  double? centerLat,  double? centerLng,  double? zoom)?  $default,) {final _that = this;
switch (_that) {
case _MapState() when $default != null:
return $default(_that.items,_that.isLoading,_that.visibleLayers,_that.centerLat,_that.centerLng,_that.zoom);case _:
  return null;

}
}

}

/// @nodoc


class _MapState implements MapState {
  const _MapState({final  List<MapItem> items = const [], this.isLoading = true, final  Set<MapLayer> visibleLayers = const {MapLayer.transport, MapLayer.accommodation, MapLayer.entertainment, MapLayer.gastronomy, MapLayer.events, MapLayer.trails, MapLayer.photos}, this.centerLat, this.centerLng, this.zoom}): _items = items,_visibleLayers = visibleLayers;
  

 final  List<MapItem> _items;
@override@JsonKey() List<MapItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isLoading;
 final  Set<MapLayer> _visibleLayers;
@override@JsonKey() Set<MapLayer> get visibleLayers {
  if (_visibleLayers is EqualUnmodifiableSetView) return _visibleLayers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_visibleLayers);
}

// Current viewport
@override final  double? centerLat;
@override final  double? centerLng;
@override final  double? zoom;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._visibleLayers, _visibleLayers)&&(identical(other.centerLat, centerLat) || other.centerLat == centerLat)&&(identical(other.centerLng, centerLng) || other.centerLng == centerLng)&&(identical(other.zoom, zoom) || other.zoom == zoom));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),isLoading,const DeepCollectionEquality().hash(_visibleLayers),centerLat,centerLng,zoom);

@override
String toString() {
  return 'MapState(items: $items, isLoading: $isLoading, visibleLayers: $visibleLayers, centerLat: $centerLat, centerLng: $centerLng, zoom: $zoom)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 List<MapItem> items, bool isLoading, Set<MapLayer> visibleLayers, double? centerLat, double? centerLng, double? zoom
});




}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? isLoading = null,Object? visibleLayers = null,Object? centerLat = freezed,Object? centerLng = freezed,Object? zoom = freezed,}) {
  return _then(_MapState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MapItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,visibleLayers: null == visibleLayers ? _self._visibleLayers : visibleLayers // ignore: cast_nullable_to_non_nullable
as Set<MapLayer>,centerLat: freezed == centerLat ? _self.centerLat : centerLat // ignore: cast_nullable_to_non_nullable
as double?,centerLng: freezed == centerLng ? _self.centerLng : centerLng // ignore: cast_nullable_to_non_nullable
as double?,zoom: freezed == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$MapSnapshotRequest {

 String get itineraryId; double get centerLat; double get centerLng; double get zoom; MapTheme get theme; List<String> get highlightItemIds;
/// Create a copy of MapSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapSnapshotRequestCopyWith<MapSnapshotRequest> get copyWith => _$MapSnapshotRequestCopyWithImpl<MapSnapshotRequest>(this as MapSnapshotRequest, _$identity);

  /// Serializes this MapSnapshotRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapSnapshotRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.centerLat, centerLat) || other.centerLat == centerLat)&&(identical(other.centerLng, centerLng) || other.centerLng == centerLng)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.theme, theme) || other.theme == theme)&&const DeepCollectionEquality().equals(other.highlightItemIds, highlightItemIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,centerLat,centerLng,zoom,theme,const DeepCollectionEquality().hash(highlightItemIds));

@override
String toString() {
  return 'MapSnapshotRequest(itineraryId: $itineraryId, centerLat: $centerLat, centerLng: $centerLng, zoom: $zoom, theme: $theme, highlightItemIds: $highlightItemIds)';
}


}

/// @nodoc
abstract mixin class $MapSnapshotRequestCopyWith<$Res>  {
  factory $MapSnapshotRequestCopyWith(MapSnapshotRequest value, $Res Function(MapSnapshotRequest) _then) = _$MapSnapshotRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, double centerLat, double centerLng, double zoom, MapTheme theme, List<String> highlightItemIds
});




}
/// @nodoc
class _$MapSnapshotRequestCopyWithImpl<$Res>
    implements $MapSnapshotRequestCopyWith<$Res> {
  _$MapSnapshotRequestCopyWithImpl(this._self, this._then);

  final MapSnapshotRequest _self;
  final $Res Function(MapSnapshotRequest) _then;

/// Create a copy of MapSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? centerLat = null,Object? centerLng = null,Object? zoom = null,Object? theme = null,Object? highlightItemIds = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,centerLat: null == centerLat ? _self.centerLat : centerLat // ignore: cast_nullable_to_non_nullable
as double,centerLng: null == centerLng ? _self.centerLng : centerLng // ignore: cast_nullable_to_non_nullable
as double,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as MapTheme,highlightItemIds: null == highlightItemIds ? _self.highlightItemIds : highlightItemIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MapSnapshotRequest].
extension MapSnapshotRequestPatterns on MapSnapshotRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapSnapshotRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapSnapshotRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapSnapshotRequest value)  $default,){
final _that = this;
switch (_that) {
case _MapSnapshotRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapSnapshotRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MapSnapshotRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  double centerLat,  double centerLng,  double zoom,  MapTheme theme,  List<String> highlightItemIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapSnapshotRequest() when $default != null:
return $default(_that.itineraryId,_that.centerLat,_that.centerLng,_that.zoom,_that.theme,_that.highlightItemIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  double centerLat,  double centerLng,  double zoom,  MapTheme theme,  List<String> highlightItemIds)  $default,) {final _that = this;
switch (_that) {
case _MapSnapshotRequest():
return $default(_that.itineraryId,_that.centerLat,_that.centerLng,_that.zoom,_that.theme,_that.highlightItemIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  double centerLat,  double centerLng,  double zoom,  MapTheme theme,  List<String> highlightItemIds)?  $default,) {final _that = this;
switch (_that) {
case _MapSnapshotRequest() when $default != null:
return $default(_that.itineraryId,_that.centerLat,_that.centerLng,_that.zoom,_that.theme,_that.highlightItemIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapSnapshotRequest implements MapSnapshotRequest {
  const _MapSnapshotRequest({required this.itineraryId, required this.centerLat, required this.centerLng, required this.zoom, required this.theme, final  List<String> highlightItemIds = const []}): _highlightItemIds = highlightItemIds;
  factory _MapSnapshotRequest.fromJson(Map<String, dynamic> json) => _$MapSnapshotRequestFromJson(json);

@override final  String itineraryId;
@override final  double centerLat;
@override final  double centerLng;
@override final  double zoom;
@override final  MapTheme theme;
 final  List<String> _highlightItemIds;
@override@JsonKey() List<String> get highlightItemIds {
  if (_highlightItemIds is EqualUnmodifiableListView) return _highlightItemIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlightItemIds);
}


/// Create a copy of MapSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapSnapshotRequestCopyWith<_MapSnapshotRequest> get copyWith => __$MapSnapshotRequestCopyWithImpl<_MapSnapshotRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapSnapshotRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapSnapshotRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.centerLat, centerLat) || other.centerLat == centerLat)&&(identical(other.centerLng, centerLng) || other.centerLng == centerLng)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.theme, theme) || other.theme == theme)&&const DeepCollectionEquality().equals(other._highlightItemIds, _highlightItemIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,centerLat,centerLng,zoom,theme,const DeepCollectionEquality().hash(_highlightItemIds));

@override
String toString() {
  return 'MapSnapshotRequest(itineraryId: $itineraryId, centerLat: $centerLat, centerLng: $centerLng, zoom: $zoom, theme: $theme, highlightItemIds: $highlightItemIds)';
}


}

/// @nodoc
abstract mixin class _$MapSnapshotRequestCopyWith<$Res> implements $MapSnapshotRequestCopyWith<$Res> {
  factory _$MapSnapshotRequestCopyWith(_MapSnapshotRequest value, $Res Function(_MapSnapshotRequest) _then) = __$MapSnapshotRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, double centerLat, double centerLng, double zoom, MapTheme theme, List<String> highlightItemIds
});




}
/// @nodoc
class __$MapSnapshotRequestCopyWithImpl<$Res>
    implements _$MapSnapshotRequestCopyWith<$Res> {
  __$MapSnapshotRequestCopyWithImpl(this._self, this._then);

  final _MapSnapshotRequest _self;
  final $Res Function(_MapSnapshotRequest) _then;

/// Create a copy of MapSnapshotRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? centerLat = null,Object? centerLng = null,Object? zoom = null,Object? theme = null,Object? highlightItemIds = null,}) {
  return _then(_MapSnapshotRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,centerLat: null == centerLat ? _self.centerLat : centerLat // ignore: cast_nullable_to_non_nullable
as double,centerLng: null == centerLng ? _self.centerLng : centerLng // ignore: cast_nullable_to_non_nullable
as double,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as MapTheme,highlightItemIds: null == highlightItemIds ? _self._highlightItemIds : highlightItemIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$MapSnapshotResponse {

 String get snapshotId; String get imageUrl; DateTime get createdAt;
/// Create a copy of MapSnapshotResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapSnapshotResponseCopyWith<MapSnapshotResponse> get copyWith => _$MapSnapshotResponseCopyWithImpl<MapSnapshotResponse>(this as MapSnapshotResponse, _$identity);

  /// Serializes this MapSnapshotResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapSnapshotResponse&&(identical(other.snapshotId, snapshotId) || other.snapshotId == snapshotId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snapshotId,imageUrl,createdAt);

@override
String toString() {
  return 'MapSnapshotResponse(snapshotId: $snapshotId, imageUrl: $imageUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MapSnapshotResponseCopyWith<$Res>  {
  factory $MapSnapshotResponseCopyWith(MapSnapshotResponse value, $Res Function(MapSnapshotResponse) _then) = _$MapSnapshotResponseCopyWithImpl;
@useResult
$Res call({
 String snapshotId, String imageUrl, DateTime createdAt
});




}
/// @nodoc
class _$MapSnapshotResponseCopyWithImpl<$Res>
    implements $MapSnapshotResponseCopyWith<$Res> {
  _$MapSnapshotResponseCopyWithImpl(this._self, this._then);

  final MapSnapshotResponse _self;
  final $Res Function(MapSnapshotResponse) _then;

/// Create a copy of MapSnapshotResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? snapshotId = null,Object? imageUrl = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
snapshotId: null == snapshotId ? _self.snapshotId : snapshotId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MapSnapshotResponse].
extension MapSnapshotResponsePatterns on MapSnapshotResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapSnapshotResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapSnapshotResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapSnapshotResponse value)  $default,){
final _that = this;
switch (_that) {
case _MapSnapshotResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapSnapshotResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MapSnapshotResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String snapshotId,  String imageUrl,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapSnapshotResponse() when $default != null:
return $default(_that.snapshotId,_that.imageUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String snapshotId,  String imageUrl,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MapSnapshotResponse():
return $default(_that.snapshotId,_that.imageUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String snapshotId,  String imageUrl,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MapSnapshotResponse() when $default != null:
return $default(_that.snapshotId,_that.imageUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapSnapshotResponse implements MapSnapshotResponse {
  const _MapSnapshotResponse({required this.snapshotId, required this.imageUrl, required this.createdAt});
  factory _MapSnapshotResponse.fromJson(Map<String, dynamic> json) => _$MapSnapshotResponseFromJson(json);

@override final  String snapshotId;
@override final  String imageUrl;
@override final  DateTime createdAt;

/// Create a copy of MapSnapshotResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapSnapshotResponseCopyWith<_MapSnapshotResponse> get copyWith => __$MapSnapshotResponseCopyWithImpl<_MapSnapshotResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapSnapshotResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapSnapshotResponse&&(identical(other.snapshotId, snapshotId) || other.snapshotId == snapshotId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,snapshotId,imageUrl,createdAt);

@override
String toString() {
  return 'MapSnapshotResponse(snapshotId: $snapshotId, imageUrl: $imageUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MapSnapshotResponseCopyWith<$Res> implements $MapSnapshotResponseCopyWith<$Res> {
  factory _$MapSnapshotResponseCopyWith(_MapSnapshotResponse value, $Res Function(_MapSnapshotResponse) _then) = __$MapSnapshotResponseCopyWithImpl;
@override @useResult
$Res call({
 String snapshotId, String imageUrl, DateTime createdAt
});




}
/// @nodoc
class __$MapSnapshotResponseCopyWithImpl<$Res>
    implements _$MapSnapshotResponseCopyWith<$Res> {
  __$MapSnapshotResponseCopyWithImpl(this._self, this._then);

  final _MapSnapshotResponse _self;
  final $Res Function(_MapSnapshotResponse) _then;

/// Create a copy of MapSnapshotResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? snapshotId = null,Object? imageUrl = null,Object? createdAt = null,}) {
  return _then(_MapSnapshotResponse(
snapshotId: null == snapshotId ? _self.snapshotId : snapshotId // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
