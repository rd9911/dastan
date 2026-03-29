// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Country {

 String get id; String get name; String get description; String get heroImageUrl; String? get flagEmoji; int get sortOrder; List<City> get cities;
/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryCopyWith<Country> get copyWith => _$CountryCopyWithImpl<Country>(this as Country, _$identity);

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Country&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.heroImageUrl, heroImageUrl) || other.heroImageUrl == heroImageUrl)&&(identical(other.flagEmoji, flagEmoji) || other.flagEmoji == flagEmoji)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.cities, cities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,heroImageUrl,flagEmoji,sortOrder,const DeepCollectionEquality().hash(cities));

@override
String toString() {
  return 'Country(id: $id, name: $name, description: $description, heroImageUrl: $heroImageUrl, flagEmoji: $flagEmoji, sortOrder: $sortOrder, cities: $cities)';
}


}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res>  {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) = _$CountryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String heroImageUrl, String? flagEmoji, int sortOrder, List<City> cities
});




}
/// @nodoc
class _$CountryCopyWithImpl<$Res>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._self, this._then);

  final Country _self;
  final $Res Function(Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? heroImageUrl = null,Object? flagEmoji = freezed,Object? sortOrder = null,Object? cities = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,heroImageUrl: null == heroImageUrl ? _self.heroImageUrl : heroImageUrl // ignore: cast_nullable_to_non_nullable
as String,flagEmoji: freezed == flagEmoji ? _self.flagEmoji : flagEmoji // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<City>,
  ));
}

}


/// Adds pattern-matching-related methods to [Country].
extension CountryPatterns on Country {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Country value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Country() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Country value)  $default,){
final _that = this;
switch (_that) {
case _Country():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Country value)?  $default,){
final _that = this;
switch (_that) {
case _Country() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String heroImageUrl,  String? flagEmoji,  int sortOrder,  List<City> cities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.heroImageUrl,_that.flagEmoji,_that.sortOrder,_that.cities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String heroImageUrl,  String? flagEmoji,  int sortOrder,  List<City> cities)  $default,) {final _that = this;
switch (_that) {
case _Country():
return $default(_that.id,_that.name,_that.description,_that.heroImageUrl,_that.flagEmoji,_that.sortOrder,_that.cities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String heroImageUrl,  String? flagEmoji,  int sortOrder,  List<City> cities)?  $default,) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.heroImageUrl,_that.flagEmoji,_that.sortOrder,_that.cities);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Country implements Country {
  const _Country({required this.id, required this.name, required this.description, required this.heroImageUrl, this.flagEmoji, required this.sortOrder, final  List<City> cities = const []}): _cities = cities;
  factory _Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String heroImageUrl;
@override final  String? flagEmoji;
@override final  int sortOrder;
 final  List<City> _cities;
@override@JsonKey() List<City> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}


/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryCopyWith<_Country> get copyWith => __$CountryCopyWithImpl<_Country>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Country&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.heroImageUrl, heroImageUrl) || other.heroImageUrl == heroImageUrl)&&(identical(other.flagEmoji, flagEmoji) || other.flagEmoji == flagEmoji)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._cities, _cities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,heroImageUrl,flagEmoji,sortOrder,const DeepCollectionEquality().hash(_cities));

@override
String toString() {
  return 'Country(id: $id, name: $name, description: $description, heroImageUrl: $heroImageUrl, flagEmoji: $flagEmoji, sortOrder: $sortOrder, cities: $cities)';
}


}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) = __$CountryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String heroImageUrl, String? flagEmoji, int sortOrder, List<City> cities
});




}
/// @nodoc
class __$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(this._self, this._then);

  final _Country _self;
  final $Res Function(_Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? heroImageUrl = null,Object? flagEmoji = freezed,Object? sortOrder = null,Object? cities = null,}) {
  return _then(_Country(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,heroImageUrl: null == heroImageUrl ? _self.heroImageUrl : heroImageUrl // ignore: cast_nullable_to_non_nullable
as String,flagEmoji: freezed == flagEmoji ? _self.flagEmoji : flagEmoji // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<City>,
  ));
}


}


/// @nodoc
mixin _$City {

 String get id; String get countryId; String get name; String get description; String get heroImageUrl; double? get latitude; double? get longitude; int get sortOrder;
/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityCopyWith<City> get copyWith => _$CityCopyWithImpl<City>(this as City, _$identity);

  /// Serializes this City to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is City&&(identical(other.id, id) || other.id == id)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.heroImageUrl, heroImageUrl) || other.heroImageUrl == heroImageUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,countryId,name,description,heroImageUrl,latitude,longitude,sortOrder);

@override
String toString() {
  return 'City(id: $id, countryId: $countryId, name: $name, description: $description, heroImageUrl: $heroImageUrl, latitude: $latitude, longitude: $longitude, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $CityCopyWith<$Res>  {
  factory $CityCopyWith(City value, $Res Function(City) _then) = _$CityCopyWithImpl;
@useResult
$Res call({
 String id, String countryId, String name, String description, String heroImageUrl, double? latitude, double? longitude, int sortOrder
});




}
/// @nodoc
class _$CityCopyWithImpl<$Res>
    implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._self, this._then);

  final City _self;
  final $Res Function(City) _then;

/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? countryId = null,Object? name = null,Object? description = null,Object? heroImageUrl = null,Object? latitude = freezed,Object? longitude = freezed,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,heroImageUrl: null == heroImageUrl ? _self.heroImageUrl : heroImageUrl // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [City].
extension CityPatterns on City {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _City value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _City() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _City value)  $default,){
final _that = this;
switch (_that) {
case _City():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _City value)?  $default,){
final _that = this;
switch (_that) {
case _City() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String countryId,  String name,  String description,  String heroImageUrl,  double? latitude,  double? longitude,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _City() when $default != null:
return $default(_that.id,_that.countryId,_that.name,_that.description,_that.heroImageUrl,_that.latitude,_that.longitude,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String countryId,  String name,  String description,  String heroImageUrl,  double? latitude,  double? longitude,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _City():
return $default(_that.id,_that.countryId,_that.name,_that.description,_that.heroImageUrl,_that.latitude,_that.longitude,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String countryId,  String name,  String description,  String heroImageUrl,  double? latitude,  double? longitude,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _City() when $default != null:
return $default(_that.id,_that.countryId,_that.name,_that.description,_that.heroImageUrl,_that.latitude,_that.longitude,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _City implements City {
  const _City({required this.id, required this.countryId, required this.name, required this.description, required this.heroImageUrl, this.latitude, this.longitude, required this.sortOrder});
  factory _City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

@override final  String id;
@override final  String countryId;
@override final  String name;
@override final  String description;
@override final  String heroImageUrl;
@override final  double? latitude;
@override final  double? longitude;
@override final  int sortOrder;

/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityCopyWith<_City> get copyWith => __$CityCopyWithImpl<_City>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _City&&(identical(other.id, id) || other.id == id)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.heroImageUrl, heroImageUrl) || other.heroImageUrl == heroImageUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,countryId,name,description,heroImageUrl,latitude,longitude,sortOrder);

@override
String toString() {
  return 'City(id: $id, countryId: $countryId, name: $name, description: $description, heroImageUrl: $heroImageUrl, latitude: $latitude, longitude: $longitude, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$CityCopyWith(_City value, $Res Function(_City) _then) = __$CityCopyWithImpl;
@override @useResult
$Res call({
 String id, String countryId, String name, String description, String heroImageUrl, double? latitude, double? longitude, int sortOrder
});




}
/// @nodoc
class __$CityCopyWithImpl<$Res>
    implements _$CityCopyWith<$Res> {
  __$CityCopyWithImpl(this._self, this._then);

  final _City _self;
  final $Res Function(_City) _then;

/// Create a copy of City
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? countryId = null,Object? name = null,Object? description = null,Object? heroImageUrl = null,Object? latitude = freezed,Object? longitude = freezed,Object? sortOrder = null,}) {
  return _then(_City(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,heroImageUrl: null == heroImageUrl ? _self.heroImageUrl : heroImageUrl // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TourCategory {

 String get id; String get name; String? get icon;
/// Create a copy of TourCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourCategoryCopyWith<TourCategory> get copyWith => _$TourCategoryCopyWithImpl<TourCategory>(this as TourCategory, _$identity);

  /// Serializes this TourCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'TourCategory(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $TourCategoryCopyWith<$Res>  {
  factory $TourCategoryCopyWith(TourCategory value, $Res Function(TourCategory) _then) = _$TourCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? icon
});




}
/// @nodoc
class _$TourCategoryCopyWithImpl<$Res>
    implements $TourCategoryCopyWith<$Res> {
  _$TourCategoryCopyWithImpl(this._self, this._then);

  final TourCategory _self;
  final $Res Function(TourCategory) _then;

/// Create a copy of TourCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourCategory].
extension TourCategoryPatterns on TourCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourCategory value)  $default,){
final _that = this;
switch (_that) {
case _TourCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourCategory value)?  $default,){
final _that = this;
switch (_that) {
case _TourCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourCategory() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _TourCategory():
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _TourCategory() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourCategory implements TourCategory {
  const _TourCategory({required this.id, required this.name, this.icon});
  factory _TourCategory.fromJson(Map<String, dynamic> json) => _$TourCategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? icon;

/// Create a copy of TourCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourCategoryCopyWith<_TourCategory> get copyWith => __$TourCategoryCopyWithImpl<_TourCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'TourCategory(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$TourCategoryCopyWith<$Res> implements $TourCategoryCopyWith<$Res> {
  factory _$TourCategoryCopyWith(_TourCategory value, $Res Function(_TourCategory) _then) = __$TourCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? icon
});




}
/// @nodoc
class __$TourCategoryCopyWithImpl<$Res>
    implements _$TourCategoryCopyWith<$Res> {
  __$TourCategoryCopyWithImpl(this._self, this._then);

  final _TourCategory _self;
  final $Res Function(_TourCategory) _then;

/// Create a copy of TourCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_TourCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TourSummary {

 String get id; String get cityId; TourType get type; String get name; String get tagline; String get mainImageUrl; int get durationMinutes; double get priceUsd; bool get isFree; double? get averageRating; int get reviewCount; List<TourCategory> get categories;
/// Create a copy of TourSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourSummaryCopyWith<TourSummary> get copyWith => _$TourSummaryCopyWithImpl<TourSummary>(this as TourSummary, _$identity);

  /// Serializes this TourSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.mainImageUrl, mainImageUrl) || other.mainImageUrl == mainImageUrl)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cityId,type,name,tagline,mainImageUrl,durationMinutes,priceUsd,isFree,averageRating,reviewCount,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'TourSummary(id: $id, cityId: $cityId, type: $type, name: $name, tagline: $tagline, mainImageUrl: $mainImageUrl, durationMinutes: $durationMinutes, priceUsd: $priceUsd, isFree: $isFree, averageRating: $averageRating, reviewCount: $reviewCount, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $TourSummaryCopyWith<$Res>  {
  factory $TourSummaryCopyWith(TourSummary value, $Res Function(TourSummary) _then) = _$TourSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String cityId, TourType type, String name, String tagline, String mainImageUrl, int durationMinutes, double priceUsd, bool isFree, double? averageRating, int reviewCount, List<TourCategory> categories
});




}
/// @nodoc
class _$TourSummaryCopyWithImpl<$Res>
    implements $TourSummaryCopyWith<$Res> {
  _$TourSummaryCopyWithImpl(this._self, this._then);

  final TourSummary _self;
  final $Res Function(TourSummary) _then;

/// Create a copy of TourSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cityId = null,Object? type = null,Object? name = null,Object? tagline = null,Object? mainImageUrl = null,Object? durationMinutes = null,Object? priceUsd = null,Object? isFree = null,Object? averageRating = freezed,Object? reviewCount = null,Object? categories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TourType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,mainImageUrl: null == mainImageUrl ? _self.mainImageUrl : mainImageUrl // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,priceUsd: null == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as double,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<TourCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [TourSummary].
extension TourSummaryPatterns on TourSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourSummary value)  $default,){
final _that = this;
switch (_that) {
case _TourSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourSummary value)?  $default,){
final _that = this;
switch (_that) {
case _TourSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String cityId,  TourType type,  String name,  String tagline,  String mainImageUrl,  int durationMinutes,  double priceUsd,  bool isFree,  double? averageRating,  int reviewCount,  List<TourCategory> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourSummary() when $default != null:
return $default(_that.id,_that.cityId,_that.type,_that.name,_that.tagline,_that.mainImageUrl,_that.durationMinutes,_that.priceUsd,_that.isFree,_that.averageRating,_that.reviewCount,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String cityId,  TourType type,  String name,  String tagline,  String mainImageUrl,  int durationMinutes,  double priceUsd,  bool isFree,  double? averageRating,  int reviewCount,  List<TourCategory> categories)  $default,) {final _that = this;
switch (_that) {
case _TourSummary():
return $default(_that.id,_that.cityId,_that.type,_that.name,_that.tagline,_that.mainImageUrl,_that.durationMinutes,_that.priceUsd,_that.isFree,_that.averageRating,_that.reviewCount,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String cityId,  TourType type,  String name,  String tagline,  String mainImageUrl,  int durationMinutes,  double priceUsd,  bool isFree,  double? averageRating,  int reviewCount,  List<TourCategory> categories)?  $default,) {final _that = this;
switch (_that) {
case _TourSummary() when $default != null:
return $default(_that.id,_that.cityId,_that.type,_that.name,_that.tagline,_that.mainImageUrl,_that.durationMinutes,_that.priceUsd,_that.isFree,_that.averageRating,_that.reviewCount,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourSummary implements TourSummary {
  const _TourSummary({required this.id, required this.cityId, required this.type, required this.name, required this.tagline, required this.mainImageUrl, required this.durationMinutes, required this.priceUsd, required this.isFree, this.averageRating, required this.reviewCount, required final  List<TourCategory> categories}): _categories = categories;
  factory _TourSummary.fromJson(Map<String, dynamic> json) => _$TourSummaryFromJson(json);

@override final  String id;
@override final  String cityId;
@override final  TourType type;
@override final  String name;
@override final  String tagline;
@override final  String mainImageUrl;
@override final  int durationMinutes;
@override final  double priceUsd;
@override final  bool isFree;
@override final  double? averageRating;
@override final  int reviewCount;
 final  List<TourCategory> _categories;
@override List<TourCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of TourSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourSummaryCopyWith<_TourSummary> get copyWith => __$TourSummaryCopyWithImpl<_TourSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.mainImageUrl, mainImageUrl) || other.mainImageUrl == mainImageUrl)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd)&&(identical(other.isFree, isFree) || other.isFree == isFree)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cityId,type,name,tagline,mainImageUrl,durationMinutes,priceUsd,isFree,averageRating,reviewCount,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'TourSummary(id: $id, cityId: $cityId, type: $type, name: $name, tagline: $tagline, mainImageUrl: $mainImageUrl, durationMinutes: $durationMinutes, priceUsd: $priceUsd, isFree: $isFree, averageRating: $averageRating, reviewCount: $reviewCount, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$TourSummaryCopyWith<$Res> implements $TourSummaryCopyWith<$Res> {
  factory _$TourSummaryCopyWith(_TourSummary value, $Res Function(_TourSummary) _then) = __$TourSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String cityId, TourType type, String name, String tagline, String mainImageUrl, int durationMinutes, double priceUsd, bool isFree, double? averageRating, int reviewCount, List<TourCategory> categories
});




}
/// @nodoc
class __$TourSummaryCopyWithImpl<$Res>
    implements _$TourSummaryCopyWith<$Res> {
  __$TourSummaryCopyWithImpl(this._self, this._then);

  final _TourSummary _self;
  final $Res Function(_TourSummary) _then;

/// Create a copy of TourSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cityId = null,Object? type = null,Object? name = null,Object? tagline = null,Object? mainImageUrl = null,Object? durationMinutes = null,Object? priceUsd = null,Object? isFree = null,Object? averageRating = freezed,Object? reviewCount = null,Object? categories = null,}) {
  return _then(_TourSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cityId: null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TourType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,mainImageUrl: null == mainImageUrl ? _self.mainImageUrl : mainImageUrl // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,priceUsd: null == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as double,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<TourCategory>,
  ));
}


}


/// @nodoc
mixin _$TourDetail {

 TourSummary get summary; String get creatorId; String? get creatorName; String? get creatorAvatarUrl; String get fullDescription; GuideContent get guideContent; List<TourWaypoint> get waypoints; List<AudioVersion> get audioVersions;// For multi-tours only:
 List<TourSummary>? get childTours;
/// Create a copy of TourDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourDetailCopyWith<TourDetail> get copyWith => _$TourDetailCopyWithImpl<TourDetail>(this as TourDetail, _$identity);

  /// Serializes this TourDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourDetail&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.creatorAvatarUrl, creatorAvatarUrl) || other.creatorAvatarUrl == creatorAvatarUrl)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&(identical(other.guideContent, guideContent) || other.guideContent == guideContent)&&const DeepCollectionEquality().equals(other.waypoints, waypoints)&&const DeepCollectionEquality().equals(other.audioVersions, audioVersions)&&const DeepCollectionEquality().equals(other.childTours, childTours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,creatorId,creatorName,creatorAvatarUrl,fullDescription,guideContent,const DeepCollectionEquality().hash(waypoints),const DeepCollectionEquality().hash(audioVersions),const DeepCollectionEquality().hash(childTours));

@override
String toString() {
  return 'TourDetail(summary: $summary, creatorId: $creatorId, creatorName: $creatorName, creatorAvatarUrl: $creatorAvatarUrl, fullDescription: $fullDescription, guideContent: $guideContent, waypoints: $waypoints, audioVersions: $audioVersions, childTours: $childTours)';
}


}

/// @nodoc
abstract mixin class $TourDetailCopyWith<$Res>  {
  factory $TourDetailCopyWith(TourDetail value, $Res Function(TourDetail) _then) = _$TourDetailCopyWithImpl;
@useResult
$Res call({
 TourSummary summary, String creatorId, String? creatorName, String? creatorAvatarUrl, String fullDescription, GuideContent guideContent, List<TourWaypoint> waypoints, List<AudioVersion> audioVersions, List<TourSummary>? childTours
});


$TourSummaryCopyWith<$Res> get summary;$GuideContentCopyWith<$Res> get guideContent;

}
/// @nodoc
class _$TourDetailCopyWithImpl<$Res>
    implements $TourDetailCopyWith<$Res> {
  _$TourDetailCopyWithImpl(this._self, this._then);

  final TourDetail _self;
  final $Res Function(TourDetail) _then;

/// Create a copy of TourDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? creatorId = null,Object? creatorName = freezed,Object? creatorAvatarUrl = freezed,Object? fullDescription = null,Object? guideContent = null,Object? waypoints = null,Object? audioVersions = null,Object? childTours = freezed,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as TourSummary,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,creatorAvatarUrl: freezed == creatorAvatarUrl ? _self.creatorAvatarUrl : creatorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fullDescription: null == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String,guideContent: null == guideContent ? _self.guideContent : guideContent // ignore: cast_nullable_to_non_nullable
as GuideContent,waypoints: null == waypoints ? _self.waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<TourWaypoint>,audioVersions: null == audioVersions ? _self.audioVersions : audioVersions // ignore: cast_nullable_to_non_nullable
as List<AudioVersion>,childTours: freezed == childTours ? _self.childTours : childTours // ignore: cast_nullable_to_non_nullable
as List<TourSummary>?,
  ));
}
/// Create a copy of TourDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourSummaryCopyWith<$Res> get summary {
  
  return $TourSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of TourDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuideContentCopyWith<$Res> get guideContent {
  
  return $GuideContentCopyWith<$Res>(_self.guideContent, (value) {
    return _then(_self.copyWith(guideContent: value));
  });
}
}


/// Adds pattern-matching-related methods to [TourDetail].
extension TourDetailPatterns on TourDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourDetail value)  $default,){
final _that = this;
switch (_that) {
case _TourDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TourDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TourSummary summary,  String creatorId,  String? creatorName,  String? creatorAvatarUrl,  String fullDescription,  GuideContent guideContent,  List<TourWaypoint> waypoints,  List<AudioVersion> audioVersions,  List<TourSummary>? childTours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourDetail() when $default != null:
return $default(_that.summary,_that.creatorId,_that.creatorName,_that.creatorAvatarUrl,_that.fullDescription,_that.guideContent,_that.waypoints,_that.audioVersions,_that.childTours);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TourSummary summary,  String creatorId,  String? creatorName,  String? creatorAvatarUrl,  String fullDescription,  GuideContent guideContent,  List<TourWaypoint> waypoints,  List<AudioVersion> audioVersions,  List<TourSummary>? childTours)  $default,) {final _that = this;
switch (_that) {
case _TourDetail():
return $default(_that.summary,_that.creatorId,_that.creatorName,_that.creatorAvatarUrl,_that.fullDescription,_that.guideContent,_that.waypoints,_that.audioVersions,_that.childTours);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TourSummary summary,  String creatorId,  String? creatorName,  String? creatorAvatarUrl,  String fullDescription,  GuideContent guideContent,  List<TourWaypoint> waypoints,  List<AudioVersion> audioVersions,  List<TourSummary>? childTours)?  $default,) {final _that = this;
switch (_that) {
case _TourDetail() when $default != null:
return $default(_that.summary,_that.creatorId,_that.creatorName,_that.creatorAvatarUrl,_that.fullDescription,_that.guideContent,_that.waypoints,_that.audioVersions,_that.childTours);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourDetail implements TourDetail {
  const _TourDetail({required this.summary, required this.creatorId, this.creatorName, this.creatorAvatarUrl, required this.fullDescription, required this.guideContent, required final  List<TourWaypoint> waypoints, required final  List<AudioVersion> audioVersions, final  List<TourSummary>? childTours}): _waypoints = waypoints,_audioVersions = audioVersions,_childTours = childTours;
  factory _TourDetail.fromJson(Map<String, dynamic> json) => _$TourDetailFromJson(json);

@override final  TourSummary summary;
@override final  String creatorId;
@override final  String? creatorName;
@override final  String? creatorAvatarUrl;
@override final  String fullDescription;
@override final  GuideContent guideContent;
 final  List<TourWaypoint> _waypoints;
@override List<TourWaypoint> get waypoints {
  if (_waypoints is EqualUnmodifiableListView) return _waypoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waypoints);
}

 final  List<AudioVersion> _audioVersions;
@override List<AudioVersion> get audioVersions {
  if (_audioVersions is EqualUnmodifiableListView) return _audioVersions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_audioVersions);
}

// For multi-tours only:
 final  List<TourSummary>? _childTours;
// For multi-tours only:
@override List<TourSummary>? get childTours {
  final value = _childTours;
  if (value == null) return null;
  if (_childTours is EqualUnmodifiableListView) return _childTours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TourDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourDetailCopyWith<_TourDetail> get copyWith => __$TourDetailCopyWithImpl<_TourDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourDetail&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.creatorAvatarUrl, creatorAvatarUrl) || other.creatorAvatarUrl == creatorAvatarUrl)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&(identical(other.guideContent, guideContent) || other.guideContent == guideContent)&&const DeepCollectionEquality().equals(other._waypoints, _waypoints)&&const DeepCollectionEquality().equals(other._audioVersions, _audioVersions)&&const DeepCollectionEquality().equals(other._childTours, _childTours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,creatorId,creatorName,creatorAvatarUrl,fullDescription,guideContent,const DeepCollectionEquality().hash(_waypoints),const DeepCollectionEquality().hash(_audioVersions),const DeepCollectionEquality().hash(_childTours));

@override
String toString() {
  return 'TourDetail(summary: $summary, creatorId: $creatorId, creatorName: $creatorName, creatorAvatarUrl: $creatorAvatarUrl, fullDescription: $fullDescription, guideContent: $guideContent, waypoints: $waypoints, audioVersions: $audioVersions, childTours: $childTours)';
}


}

/// @nodoc
abstract mixin class _$TourDetailCopyWith<$Res> implements $TourDetailCopyWith<$Res> {
  factory _$TourDetailCopyWith(_TourDetail value, $Res Function(_TourDetail) _then) = __$TourDetailCopyWithImpl;
@override @useResult
$Res call({
 TourSummary summary, String creatorId, String? creatorName, String? creatorAvatarUrl, String fullDescription, GuideContent guideContent, List<TourWaypoint> waypoints, List<AudioVersion> audioVersions, List<TourSummary>? childTours
});


@override $TourSummaryCopyWith<$Res> get summary;@override $GuideContentCopyWith<$Res> get guideContent;

}
/// @nodoc
class __$TourDetailCopyWithImpl<$Res>
    implements _$TourDetailCopyWith<$Res> {
  __$TourDetailCopyWithImpl(this._self, this._then);

  final _TourDetail _self;
  final $Res Function(_TourDetail) _then;

/// Create a copy of TourDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? creatorId = null,Object? creatorName = freezed,Object? creatorAvatarUrl = freezed,Object? fullDescription = null,Object? guideContent = null,Object? waypoints = null,Object? audioVersions = null,Object? childTours = freezed,}) {
  return _then(_TourDetail(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as TourSummary,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,creatorName: freezed == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String?,creatorAvatarUrl: freezed == creatorAvatarUrl ? _self.creatorAvatarUrl : creatorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fullDescription: null == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String,guideContent: null == guideContent ? _self.guideContent : guideContent // ignore: cast_nullable_to_non_nullable
as GuideContent,waypoints: null == waypoints ? _self._waypoints : waypoints // ignore: cast_nullable_to_non_nullable
as List<TourWaypoint>,audioVersions: null == audioVersions ? _self._audioVersions : audioVersions // ignore: cast_nullable_to_non_nullable
as List<AudioVersion>,childTours: freezed == childTours ? _self._childTours : childTours // ignore: cast_nullable_to_non_nullable
as List<TourSummary>?,
  ));
}

/// Create a copy of TourDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourSummaryCopyWith<$Res> get summary {
  
  return $TourSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of TourDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuideContentCopyWith<$Res> get guideContent {
  
  return $GuideContentCopyWith<$Res>(_self.guideContent, (value) {
    return _then(_self.copyWith(guideContent: value));
  });
}
}


/// @nodoc
mixin _$TourWaypoint {

 String get id; String get tourId; int get orderIndex; String? get label; double get latitude; double get longitude; int get radiusMeters;
/// Create a copy of TourWaypoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourWaypointCopyWith<TourWaypoint> get copyWith => _$TourWaypointCopyWithImpl<TourWaypoint>(this as TourWaypoint, _$identity);

  /// Serializes this TourWaypoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourWaypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.label, label) || other.label == label)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,orderIndex,label,latitude,longitude,radiusMeters);

@override
String toString() {
  return 'TourWaypoint(id: $id, tourId: $tourId, orderIndex: $orderIndex, label: $label, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters)';
}


}

/// @nodoc
abstract mixin class $TourWaypointCopyWith<$Res>  {
  factory $TourWaypointCopyWith(TourWaypoint value, $Res Function(TourWaypoint) _then) = _$TourWaypointCopyWithImpl;
@useResult
$Res call({
 String id, String tourId, int orderIndex, String? label, double latitude, double longitude, int radiusMeters
});




}
/// @nodoc
class _$TourWaypointCopyWithImpl<$Res>
    implements $TourWaypointCopyWith<$Res> {
  _$TourWaypointCopyWithImpl(this._self, this._then);

  final TourWaypoint _self;
  final $Res Function(TourWaypoint) _then;

/// Create a copy of TourWaypoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tourId = null,Object? orderIndex = null,Object? label = freezed,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TourWaypoint].
extension TourWaypointPatterns on TourWaypoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourWaypoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourWaypoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourWaypoint value)  $default,){
final _that = this;
switch (_that) {
case _TourWaypoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourWaypoint value)?  $default,){
final _that = this;
switch (_that) {
case _TourWaypoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tourId,  int orderIndex,  String? label,  double latitude,  double longitude,  int radiusMeters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourWaypoint() when $default != null:
return $default(_that.id,_that.tourId,_that.orderIndex,_that.label,_that.latitude,_that.longitude,_that.radiusMeters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tourId,  int orderIndex,  String? label,  double latitude,  double longitude,  int radiusMeters)  $default,) {final _that = this;
switch (_that) {
case _TourWaypoint():
return $default(_that.id,_that.tourId,_that.orderIndex,_that.label,_that.latitude,_that.longitude,_that.radiusMeters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tourId,  int orderIndex,  String? label,  double latitude,  double longitude,  int radiusMeters)?  $default,) {final _that = this;
switch (_that) {
case _TourWaypoint() when $default != null:
return $default(_that.id,_that.tourId,_that.orderIndex,_that.label,_that.latitude,_that.longitude,_that.radiusMeters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourWaypoint implements TourWaypoint {
  const _TourWaypoint({required this.id, required this.tourId, required this.orderIndex, this.label, required this.latitude, required this.longitude, required this.radiusMeters});
  factory _TourWaypoint.fromJson(Map<String, dynamic> json) => _$TourWaypointFromJson(json);

@override final  String id;
@override final  String tourId;
@override final  int orderIndex;
@override final  String? label;
@override final  double latitude;
@override final  double longitude;
@override final  int radiusMeters;

/// Create a copy of TourWaypoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourWaypointCopyWith<_TourWaypoint> get copyWith => __$TourWaypointCopyWithImpl<_TourWaypoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourWaypointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourWaypoint&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.label, label) || other.label == label)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,orderIndex,label,latitude,longitude,radiusMeters);

@override
String toString() {
  return 'TourWaypoint(id: $id, tourId: $tourId, orderIndex: $orderIndex, label: $label, latitude: $latitude, longitude: $longitude, radiusMeters: $radiusMeters)';
}


}

/// @nodoc
abstract mixin class _$TourWaypointCopyWith<$Res> implements $TourWaypointCopyWith<$Res> {
  factory _$TourWaypointCopyWith(_TourWaypoint value, $Res Function(_TourWaypoint) _then) = __$TourWaypointCopyWithImpl;
@override @useResult
$Res call({
 String id, String tourId, int orderIndex, String? label, double latitude, double longitude, int radiusMeters
});




}
/// @nodoc
class __$TourWaypointCopyWithImpl<$Res>
    implements _$TourWaypointCopyWith<$Res> {
  __$TourWaypointCopyWithImpl(this._self, this._then);

  final _TourWaypoint _self;
  final $Res Function(_TourWaypoint) _then;

/// Create a copy of TourWaypoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tourId = null,Object? orderIndex = null,Object? label = freezed,Object? latitude = null,Object? longitude = null,Object? radiusMeters = null,}) {
  return _then(_TourWaypoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MultiTourItem {

 String get id; String get multiTourId; String get singleTourId; int get orderIndex; double? get triggerLatitude; double? get triggerLongitude; int get triggerRadiusMeters; TourSummary? get singleTourSummary;
/// Create a copy of MultiTourItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultiTourItemCopyWith<MultiTourItem> get copyWith => _$MultiTourItemCopyWithImpl<MultiTourItem>(this as MultiTourItem, _$identity);

  /// Serializes this MultiTourItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultiTourItem&&(identical(other.id, id) || other.id == id)&&(identical(other.multiTourId, multiTourId) || other.multiTourId == multiTourId)&&(identical(other.singleTourId, singleTourId) || other.singleTourId == singleTourId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.triggerLatitude, triggerLatitude) || other.triggerLatitude == triggerLatitude)&&(identical(other.triggerLongitude, triggerLongitude) || other.triggerLongitude == triggerLongitude)&&(identical(other.triggerRadiusMeters, triggerRadiusMeters) || other.triggerRadiusMeters == triggerRadiusMeters)&&(identical(other.singleTourSummary, singleTourSummary) || other.singleTourSummary == singleTourSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,multiTourId,singleTourId,orderIndex,triggerLatitude,triggerLongitude,triggerRadiusMeters,singleTourSummary);

@override
String toString() {
  return 'MultiTourItem(id: $id, multiTourId: $multiTourId, singleTourId: $singleTourId, orderIndex: $orderIndex, triggerLatitude: $triggerLatitude, triggerLongitude: $triggerLongitude, triggerRadiusMeters: $triggerRadiusMeters, singleTourSummary: $singleTourSummary)';
}


}

/// @nodoc
abstract mixin class $MultiTourItemCopyWith<$Res>  {
  factory $MultiTourItemCopyWith(MultiTourItem value, $Res Function(MultiTourItem) _then) = _$MultiTourItemCopyWithImpl;
@useResult
$Res call({
 String id, String multiTourId, String singleTourId, int orderIndex, double? triggerLatitude, double? triggerLongitude, int triggerRadiusMeters, TourSummary? singleTourSummary
});


$TourSummaryCopyWith<$Res>? get singleTourSummary;

}
/// @nodoc
class _$MultiTourItemCopyWithImpl<$Res>
    implements $MultiTourItemCopyWith<$Res> {
  _$MultiTourItemCopyWithImpl(this._self, this._then);

  final MultiTourItem _self;
  final $Res Function(MultiTourItem) _then;

/// Create a copy of MultiTourItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? multiTourId = null,Object? singleTourId = null,Object? orderIndex = null,Object? triggerLatitude = freezed,Object? triggerLongitude = freezed,Object? triggerRadiusMeters = null,Object? singleTourSummary = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,multiTourId: null == multiTourId ? _self.multiTourId : multiTourId // ignore: cast_nullable_to_non_nullable
as String,singleTourId: null == singleTourId ? _self.singleTourId : singleTourId // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,triggerLatitude: freezed == triggerLatitude ? _self.triggerLatitude : triggerLatitude // ignore: cast_nullable_to_non_nullable
as double?,triggerLongitude: freezed == triggerLongitude ? _self.triggerLongitude : triggerLongitude // ignore: cast_nullable_to_non_nullable
as double?,triggerRadiusMeters: null == triggerRadiusMeters ? _self.triggerRadiusMeters : triggerRadiusMeters // ignore: cast_nullable_to_non_nullable
as int,singleTourSummary: freezed == singleTourSummary ? _self.singleTourSummary : singleTourSummary // ignore: cast_nullable_to_non_nullable
as TourSummary?,
  ));
}
/// Create a copy of MultiTourItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourSummaryCopyWith<$Res>? get singleTourSummary {
    if (_self.singleTourSummary == null) {
    return null;
  }

  return $TourSummaryCopyWith<$Res>(_self.singleTourSummary!, (value) {
    return _then(_self.copyWith(singleTourSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [MultiTourItem].
extension MultiTourItemPatterns on MultiTourItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MultiTourItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MultiTourItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MultiTourItem value)  $default,){
final _that = this;
switch (_that) {
case _MultiTourItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MultiTourItem value)?  $default,){
final _that = this;
switch (_that) {
case _MultiTourItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String multiTourId,  String singleTourId,  int orderIndex,  double? triggerLatitude,  double? triggerLongitude,  int triggerRadiusMeters,  TourSummary? singleTourSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MultiTourItem() when $default != null:
return $default(_that.id,_that.multiTourId,_that.singleTourId,_that.orderIndex,_that.triggerLatitude,_that.triggerLongitude,_that.triggerRadiusMeters,_that.singleTourSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String multiTourId,  String singleTourId,  int orderIndex,  double? triggerLatitude,  double? triggerLongitude,  int triggerRadiusMeters,  TourSummary? singleTourSummary)  $default,) {final _that = this;
switch (_that) {
case _MultiTourItem():
return $default(_that.id,_that.multiTourId,_that.singleTourId,_that.orderIndex,_that.triggerLatitude,_that.triggerLongitude,_that.triggerRadiusMeters,_that.singleTourSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String multiTourId,  String singleTourId,  int orderIndex,  double? triggerLatitude,  double? triggerLongitude,  int triggerRadiusMeters,  TourSummary? singleTourSummary)?  $default,) {final _that = this;
switch (_that) {
case _MultiTourItem() when $default != null:
return $default(_that.id,_that.multiTourId,_that.singleTourId,_that.orderIndex,_that.triggerLatitude,_that.triggerLongitude,_that.triggerRadiusMeters,_that.singleTourSummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MultiTourItem implements MultiTourItem {
  const _MultiTourItem({required this.id, required this.multiTourId, required this.singleTourId, required this.orderIndex, this.triggerLatitude, this.triggerLongitude, required this.triggerRadiusMeters, this.singleTourSummary});
  factory _MultiTourItem.fromJson(Map<String, dynamic> json) => _$MultiTourItemFromJson(json);

@override final  String id;
@override final  String multiTourId;
@override final  String singleTourId;
@override final  int orderIndex;
@override final  double? triggerLatitude;
@override final  double? triggerLongitude;
@override final  int triggerRadiusMeters;
@override final  TourSummary? singleTourSummary;

/// Create a copy of MultiTourItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MultiTourItemCopyWith<_MultiTourItem> get copyWith => __$MultiTourItemCopyWithImpl<_MultiTourItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MultiTourItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MultiTourItem&&(identical(other.id, id) || other.id == id)&&(identical(other.multiTourId, multiTourId) || other.multiTourId == multiTourId)&&(identical(other.singleTourId, singleTourId) || other.singleTourId == singleTourId)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.triggerLatitude, triggerLatitude) || other.triggerLatitude == triggerLatitude)&&(identical(other.triggerLongitude, triggerLongitude) || other.triggerLongitude == triggerLongitude)&&(identical(other.triggerRadiusMeters, triggerRadiusMeters) || other.triggerRadiusMeters == triggerRadiusMeters)&&(identical(other.singleTourSummary, singleTourSummary) || other.singleTourSummary == singleTourSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,multiTourId,singleTourId,orderIndex,triggerLatitude,triggerLongitude,triggerRadiusMeters,singleTourSummary);

@override
String toString() {
  return 'MultiTourItem(id: $id, multiTourId: $multiTourId, singleTourId: $singleTourId, orderIndex: $orderIndex, triggerLatitude: $triggerLatitude, triggerLongitude: $triggerLongitude, triggerRadiusMeters: $triggerRadiusMeters, singleTourSummary: $singleTourSummary)';
}


}

/// @nodoc
abstract mixin class _$MultiTourItemCopyWith<$Res> implements $MultiTourItemCopyWith<$Res> {
  factory _$MultiTourItemCopyWith(_MultiTourItem value, $Res Function(_MultiTourItem) _then) = __$MultiTourItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String multiTourId, String singleTourId, int orderIndex, double? triggerLatitude, double? triggerLongitude, int triggerRadiusMeters, TourSummary? singleTourSummary
});


@override $TourSummaryCopyWith<$Res>? get singleTourSummary;

}
/// @nodoc
class __$MultiTourItemCopyWithImpl<$Res>
    implements _$MultiTourItemCopyWith<$Res> {
  __$MultiTourItemCopyWithImpl(this._self, this._then);

  final _MultiTourItem _self;
  final $Res Function(_MultiTourItem) _then;

/// Create a copy of MultiTourItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? multiTourId = null,Object? singleTourId = null,Object? orderIndex = null,Object? triggerLatitude = freezed,Object? triggerLongitude = freezed,Object? triggerRadiusMeters = null,Object? singleTourSummary = freezed,}) {
  return _then(_MultiTourItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,multiTourId: null == multiTourId ? _self.multiTourId : multiTourId // ignore: cast_nullable_to_non_nullable
as String,singleTourId: null == singleTourId ? _self.singleTourId : singleTourId // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,triggerLatitude: freezed == triggerLatitude ? _self.triggerLatitude : triggerLatitude // ignore: cast_nullable_to_non_nullable
as double?,triggerLongitude: freezed == triggerLongitude ? _self.triggerLongitude : triggerLongitude // ignore: cast_nullable_to_non_nullable
as double?,triggerRadiusMeters: null == triggerRadiusMeters ? _self.triggerRadiusMeters : triggerRadiusMeters // ignore: cast_nullable_to_non_nullable
as int,singleTourSummary: freezed == singleTourSummary ? _self.singleTourSummary : singleTourSummary // ignore: cast_nullable_to_non_nullable
as TourSummary?,
  ));
}

/// Create a copy of MultiTourItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourSummaryCopyWith<$Res>? get singleTourSummary {
    if (_self.singleTourSummary == null) {
    return null;
  }

  return $TourSummaryCopyWith<$Res>(_self.singleTourSummary!, (value) {
    return _then(_self.copyWith(singleTourSummary: value));
  });
}
}


/// @nodoc
mixin _$AudioVersion {

 String get id; String get tourId; String get languageCode; String? get audioUrl; String? get previewUrl; int? get durationSeconds; AudioStatus get status;
/// Create a copy of AudioVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioVersionCopyWith<AudioVersion> get copyWith => _$AudioVersionCopyWithImpl<AudioVersion>(this as AudioVersion, _$identity);

  /// Serializes this AudioVersion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioVersion&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,languageCode,audioUrl,previewUrl,durationSeconds,status);

@override
String toString() {
  return 'AudioVersion(id: $id, tourId: $tourId, languageCode: $languageCode, audioUrl: $audioUrl, previewUrl: $previewUrl, durationSeconds: $durationSeconds, status: $status)';
}


}

/// @nodoc
abstract mixin class $AudioVersionCopyWith<$Res>  {
  factory $AudioVersionCopyWith(AudioVersion value, $Res Function(AudioVersion) _then) = _$AudioVersionCopyWithImpl;
@useResult
$Res call({
 String id, String tourId, String languageCode, String? audioUrl, String? previewUrl, int? durationSeconds, AudioStatus status
});




}
/// @nodoc
class _$AudioVersionCopyWithImpl<$Res>
    implements $AudioVersionCopyWith<$Res> {
  _$AudioVersionCopyWithImpl(this._self, this._then);

  final AudioVersion _self;
  final $Res Function(AudioVersion) _then;

/// Create a copy of AudioVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tourId = null,Object? languageCode = null,Object? audioUrl = freezed,Object? previewUrl = freezed,Object? durationSeconds = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AudioStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioVersion].
extension AudioVersionPatterns on AudioVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioVersion value)  $default,){
final _that = this;
switch (_that) {
case _AudioVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioVersion value)?  $default,){
final _that = this;
switch (_that) {
case _AudioVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tourId,  String languageCode,  String? audioUrl,  String? previewUrl,  int? durationSeconds,  AudioStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioVersion() when $default != null:
return $default(_that.id,_that.tourId,_that.languageCode,_that.audioUrl,_that.previewUrl,_that.durationSeconds,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tourId,  String languageCode,  String? audioUrl,  String? previewUrl,  int? durationSeconds,  AudioStatus status)  $default,) {final _that = this;
switch (_that) {
case _AudioVersion():
return $default(_that.id,_that.tourId,_that.languageCode,_that.audioUrl,_that.previewUrl,_that.durationSeconds,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tourId,  String languageCode,  String? audioUrl,  String? previewUrl,  int? durationSeconds,  AudioStatus status)?  $default,) {final _that = this;
switch (_that) {
case _AudioVersion() when $default != null:
return $default(_that.id,_that.tourId,_that.languageCode,_that.audioUrl,_that.previewUrl,_that.durationSeconds,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioVersion implements AudioVersion {
  const _AudioVersion({required this.id, required this.tourId, required this.languageCode, this.audioUrl, this.previewUrl, this.durationSeconds, required this.status});
  factory _AudioVersion.fromJson(Map<String, dynamic> json) => _$AudioVersionFromJson(json);

@override final  String id;
@override final  String tourId;
@override final  String languageCode;
@override final  String? audioUrl;
@override final  String? previewUrl;
@override final  int? durationSeconds;
@override final  AudioStatus status;

/// Create a copy of AudioVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioVersionCopyWith<_AudioVersion> get copyWith => __$AudioVersionCopyWithImpl<_AudioVersion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioVersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioVersion&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,languageCode,audioUrl,previewUrl,durationSeconds,status);

@override
String toString() {
  return 'AudioVersion(id: $id, tourId: $tourId, languageCode: $languageCode, audioUrl: $audioUrl, previewUrl: $previewUrl, durationSeconds: $durationSeconds, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AudioVersionCopyWith<$Res> implements $AudioVersionCopyWith<$Res> {
  factory _$AudioVersionCopyWith(_AudioVersion value, $Res Function(_AudioVersion) _then) = __$AudioVersionCopyWithImpl;
@override @useResult
$Res call({
 String id, String tourId, String languageCode, String? audioUrl, String? previewUrl, int? durationSeconds, AudioStatus status
});




}
/// @nodoc
class __$AudioVersionCopyWithImpl<$Res>
    implements _$AudioVersionCopyWith<$Res> {
  __$AudioVersionCopyWithImpl(this._self, this._then);

  final _AudioVersion _self;
  final $Res Function(_AudioVersion) _then;

/// Create a copy of AudioVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tourId = null,Object? languageCode = null,Object? audioUrl = freezed,Object? previewUrl = freezed,Object? durationSeconds = freezed,Object? status = null,}) {
  return _then(_AudioVersion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AudioStatus,
  ));
}


}


/// @nodoc
mixin _$GuideContent {

 String get tourId; List<GuideSection> get sections; int get version;
/// Create a copy of GuideContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideContentCopyWith<GuideContent> get copyWith => _$GuideContentCopyWithImpl<GuideContent>(this as GuideContent, _$identity);

  /// Serializes this GuideContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideContent&&(identical(other.tourId, tourId) || other.tourId == tourId)&&const DeepCollectionEquality().equals(other.sections, sections)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tourId,const DeepCollectionEquality().hash(sections),version);

@override
String toString() {
  return 'GuideContent(tourId: $tourId, sections: $sections, version: $version)';
}


}

/// @nodoc
abstract mixin class $GuideContentCopyWith<$Res>  {
  factory $GuideContentCopyWith(GuideContent value, $Res Function(GuideContent) _then) = _$GuideContentCopyWithImpl;
@useResult
$Res call({
 String tourId, List<GuideSection> sections, int version
});




}
/// @nodoc
class _$GuideContentCopyWithImpl<$Res>
    implements $GuideContentCopyWith<$Res> {
  _$GuideContentCopyWithImpl(this._self, this._then);

  final GuideContent _self;
  final $Res Function(GuideContent) _then;

/// Create a copy of GuideContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tourId = null,Object? sections = null,Object? version = null,}) {
  return _then(_self.copyWith(
tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<GuideSection>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GuideContent].
extension GuideContentPatterns on GuideContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuideContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuideContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuideContent value)  $default,){
final _that = this;
switch (_that) {
case _GuideContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuideContent value)?  $default,){
final _that = this;
switch (_that) {
case _GuideContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tourId,  List<GuideSection> sections,  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuideContent() when $default != null:
return $default(_that.tourId,_that.sections,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tourId,  List<GuideSection> sections,  int version)  $default,) {final _that = this;
switch (_that) {
case _GuideContent():
return $default(_that.tourId,_that.sections,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tourId,  List<GuideSection> sections,  int version)?  $default,) {final _that = this;
switch (_that) {
case _GuideContent() when $default != null:
return $default(_that.tourId,_that.sections,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuideContent implements GuideContent {
  const _GuideContent({required this.tourId, required final  List<GuideSection> sections, required this.version}): _sections = sections;
  factory _GuideContent.fromJson(Map<String, dynamic> json) => _$GuideContentFromJson(json);

@override final  String tourId;
 final  List<GuideSection> _sections;
@override List<GuideSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override final  int version;

/// Create a copy of GuideContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuideContentCopyWith<_GuideContent> get copyWith => __$GuideContentCopyWithImpl<_GuideContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuideContent&&(identical(other.tourId, tourId) || other.tourId == tourId)&&const DeepCollectionEquality().equals(other._sections, _sections)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tourId,const DeepCollectionEquality().hash(_sections),version);

@override
String toString() {
  return 'GuideContent(tourId: $tourId, sections: $sections, version: $version)';
}


}

/// @nodoc
abstract mixin class _$GuideContentCopyWith<$Res> implements $GuideContentCopyWith<$Res> {
  factory _$GuideContentCopyWith(_GuideContent value, $Res Function(_GuideContent) _then) = __$GuideContentCopyWithImpl;
@override @useResult
$Res call({
 String tourId, List<GuideSection> sections, int version
});




}
/// @nodoc
class __$GuideContentCopyWithImpl<$Res>
    implements _$GuideContentCopyWith<$Res> {
  __$GuideContentCopyWithImpl(this._self, this._then);

  final _GuideContent _self;
  final $Res Function(_GuideContent) _then;

/// Create a copy of GuideContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tourId = null,Object? sections = null,Object? version = null,}) {
  return _then(_GuideContent(
tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<GuideSection>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GuideSection {

 String get id; String get chapterTitle; List<GuideBlock> get blocks;
/// Create a copy of GuideSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideSectionCopyWith<GuideSection> get copyWith => _$GuideSectionCopyWithImpl<GuideSection>(this as GuideSection, _$identity);

  /// Serializes this GuideSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideSection&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterTitle, chapterTitle) || other.chapterTitle == chapterTitle)&&const DeepCollectionEquality().equals(other.blocks, blocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapterTitle,const DeepCollectionEquality().hash(blocks));

@override
String toString() {
  return 'GuideSection(id: $id, chapterTitle: $chapterTitle, blocks: $blocks)';
}


}

/// @nodoc
abstract mixin class $GuideSectionCopyWith<$Res>  {
  factory $GuideSectionCopyWith(GuideSection value, $Res Function(GuideSection) _then) = _$GuideSectionCopyWithImpl;
@useResult
$Res call({
 String id, String chapterTitle, List<GuideBlock> blocks
});




}
/// @nodoc
class _$GuideSectionCopyWithImpl<$Res>
    implements $GuideSectionCopyWith<$Res> {
  _$GuideSectionCopyWithImpl(this._self, this._then);

  final GuideSection _self;
  final $Res Function(GuideSection) _then;

/// Create a copy of GuideSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapterTitle = null,Object? blocks = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterTitle: null == chapterTitle ? _self.chapterTitle : chapterTitle // ignore: cast_nullable_to_non_nullable
as String,blocks: null == blocks ? _self.blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<GuideBlock>,
  ));
}

}


/// Adds pattern-matching-related methods to [GuideSection].
extension GuideSectionPatterns on GuideSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuideSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuideSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuideSection value)  $default,){
final _that = this;
switch (_that) {
case _GuideSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuideSection value)?  $default,){
final _that = this;
switch (_that) {
case _GuideSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String chapterTitle,  List<GuideBlock> blocks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuideSection() when $default != null:
return $default(_that.id,_that.chapterTitle,_that.blocks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String chapterTitle,  List<GuideBlock> blocks)  $default,) {final _that = this;
switch (_that) {
case _GuideSection():
return $default(_that.id,_that.chapterTitle,_that.blocks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String chapterTitle,  List<GuideBlock> blocks)?  $default,) {final _that = this;
switch (_that) {
case _GuideSection() when $default != null:
return $default(_that.id,_that.chapterTitle,_that.blocks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuideSection implements GuideSection {
  const _GuideSection({required this.id, required this.chapterTitle, required final  List<GuideBlock> blocks}): _blocks = blocks;
  factory _GuideSection.fromJson(Map<String, dynamic> json) => _$GuideSectionFromJson(json);

@override final  String id;
@override final  String chapterTitle;
 final  List<GuideBlock> _blocks;
@override List<GuideBlock> get blocks {
  if (_blocks is EqualUnmodifiableListView) return _blocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blocks);
}


/// Create a copy of GuideSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuideSectionCopyWith<_GuideSection> get copyWith => __$GuideSectionCopyWithImpl<_GuideSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideSectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuideSection&&(identical(other.id, id) || other.id == id)&&(identical(other.chapterTitle, chapterTitle) || other.chapterTitle == chapterTitle)&&const DeepCollectionEquality().equals(other._blocks, _blocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapterTitle,const DeepCollectionEquality().hash(_blocks));

@override
String toString() {
  return 'GuideSection(id: $id, chapterTitle: $chapterTitle, blocks: $blocks)';
}


}

/// @nodoc
abstract mixin class _$GuideSectionCopyWith<$Res> implements $GuideSectionCopyWith<$Res> {
  factory _$GuideSectionCopyWith(_GuideSection value, $Res Function(_GuideSection) _then) = __$GuideSectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String chapterTitle, List<GuideBlock> blocks
});




}
/// @nodoc
class __$GuideSectionCopyWithImpl<$Res>
    implements _$GuideSectionCopyWith<$Res> {
  __$GuideSectionCopyWithImpl(this._self, this._then);

  final _GuideSection _self;
  final $Res Function(_GuideSection) _then;

/// Create a copy of GuideSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chapterTitle = null,Object? blocks = null,}) {
  return _then(_GuideSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chapterTitle: null == chapterTitle ? _self.chapterTitle : chapterTitle // ignore: cast_nullable_to_non_nullable
as String,blocks: null == blocks ? _self._blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<GuideBlock>,
  ));
}


}

GuideBlock _$GuideBlockFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'text':
          return GuideBlockText.fromJson(
            json
          );
                case 'highlight':
          return GuideBlockHighlight.fromJson(
            json
          );
                case 'image':
          return GuideBlockImage.fromJson(
            json
          );
                case 'fact':
          return GuideBlockFact.fromJson(
            json
          );
                case 'location':
          return GuideBlockLocation.fromJson(
            json
          );
                case 'yearBadge':
          return GuideBlockYearBadge.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'GuideBlock',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$GuideBlock {



  /// Serializes this GuideBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideBlock);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GuideBlock()';
}


}

/// @nodoc
class $GuideBlockCopyWith<$Res>  {
$GuideBlockCopyWith(GuideBlock _, $Res Function(GuideBlock) __);
}


/// Adds pattern-matching-related methods to [GuideBlock].
extension GuideBlockPatterns on GuideBlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GuideBlockText value)?  text,TResult Function( GuideBlockHighlight value)?  highlight,TResult Function( GuideBlockImage value)?  image,TResult Function( GuideBlockFact value)?  fact,TResult Function( GuideBlockLocation value)?  location,TResult Function( GuideBlockYearBadge value)?  yearBadge,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GuideBlockText() when text != null:
return text(_that);case GuideBlockHighlight() when highlight != null:
return highlight(_that);case GuideBlockImage() when image != null:
return image(_that);case GuideBlockFact() when fact != null:
return fact(_that);case GuideBlockLocation() when location != null:
return location(_that);case GuideBlockYearBadge() when yearBadge != null:
return yearBadge(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GuideBlockText value)  text,required TResult Function( GuideBlockHighlight value)  highlight,required TResult Function( GuideBlockImage value)  image,required TResult Function( GuideBlockFact value)  fact,required TResult Function( GuideBlockLocation value)  location,required TResult Function( GuideBlockYearBadge value)  yearBadge,}){
final _that = this;
switch (_that) {
case GuideBlockText():
return text(_that);case GuideBlockHighlight():
return highlight(_that);case GuideBlockImage():
return image(_that);case GuideBlockFact():
return fact(_that);case GuideBlockLocation():
return location(_that);case GuideBlockYearBadge():
return yearBadge(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GuideBlockText value)?  text,TResult? Function( GuideBlockHighlight value)?  highlight,TResult? Function( GuideBlockImage value)?  image,TResult? Function( GuideBlockFact value)?  fact,TResult? Function( GuideBlockLocation value)?  location,TResult? Function( GuideBlockYearBadge value)?  yearBadge,}){
final _that = this;
switch (_that) {
case GuideBlockText() when text != null:
return text(_that);case GuideBlockHighlight() when highlight != null:
return highlight(_that);case GuideBlockImage() when image != null:
return image(_that);case GuideBlockFact() when fact != null:
return fact(_that);case GuideBlockLocation() when location != null:
return location(_that);case GuideBlockYearBadge() when yearBadge != null:
return yearBadge(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String content)?  text,TResult Function( String content)?  highlight,TResult Function( String imageUrl,  String? caption,  bool isLeading)?  image,TResult Function( String label,  String value)?  fact,TResult Function( String address,  double? latitude,  double? longitude)?  location,TResult Function( String label)?  yearBadge,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GuideBlockText() when text != null:
return text(_that.content);case GuideBlockHighlight() when highlight != null:
return highlight(_that.content);case GuideBlockImage() when image != null:
return image(_that.imageUrl,_that.caption,_that.isLeading);case GuideBlockFact() when fact != null:
return fact(_that.label,_that.value);case GuideBlockLocation() when location != null:
return location(_that.address,_that.latitude,_that.longitude);case GuideBlockYearBadge() when yearBadge != null:
return yearBadge(_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String content)  text,required TResult Function( String content)  highlight,required TResult Function( String imageUrl,  String? caption,  bool isLeading)  image,required TResult Function( String label,  String value)  fact,required TResult Function( String address,  double? latitude,  double? longitude)  location,required TResult Function( String label)  yearBadge,}) {final _that = this;
switch (_that) {
case GuideBlockText():
return text(_that.content);case GuideBlockHighlight():
return highlight(_that.content);case GuideBlockImage():
return image(_that.imageUrl,_that.caption,_that.isLeading);case GuideBlockFact():
return fact(_that.label,_that.value);case GuideBlockLocation():
return location(_that.address,_that.latitude,_that.longitude);case GuideBlockYearBadge():
return yearBadge(_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String content)?  text,TResult? Function( String content)?  highlight,TResult? Function( String imageUrl,  String? caption,  bool isLeading)?  image,TResult? Function( String label,  String value)?  fact,TResult? Function( String address,  double? latitude,  double? longitude)?  location,TResult? Function( String label)?  yearBadge,}) {final _that = this;
switch (_that) {
case GuideBlockText() when text != null:
return text(_that.content);case GuideBlockHighlight() when highlight != null:
return highlight(_that.content);case GuideBlockImage() when image != null:
return image(_that.imageUrl,_that.caption,_that.isLeading);case GuideBlockFact() when fact != null:
return fact(_that.label,_that.value);case GuideBlockLocation() when location != null:
return location(_that.address,_that.latitude,_that.longitude);case GuideBlockYearBadge() when yearBadge != null:
return yearBadge(_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GuideBlockText implements GuideBlock {
  const GuideBlockText({required this.content, final  String? $type}): $type = $type ?? 'text';
  factory GuideBlockText.fromJson(Map<String, dynamic> json) => _$GuideBlockTextFromJson(json);

 final  String content;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideBlockTextCopyWith<GuideBlockText> get copyWith => _$GuideBlockTextCopyWithImpl<GuideBlockText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideBlockTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideBlockText&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'GuideBlock.text(content: $content)';
}


}

/// @nodoc
abstract mixin class $GuideBlockTextCopyWith<$Res> implements $GuideBlockCopyWith<$Res> {
  factory $GuideBlockTextCopyWith(GuideBlockText value, $Res Function(GuideBlockText) _then) = _$GuideBlockTextCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$GuideBlockTextCopyWithImpl<$Res>
    implements $GuideBlockTextCopyWith<$Res> {
  _$GuideBlockTextCopyWithImpl(this._self, this._then);

  final GuideBlockText _self;
  final $Res Function(GuideBlockText) _then;

/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(GuideBlockText(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GuideBlockHighlight implements GuideBlock {
  const GuideBlockHighlight({required this.content, final  String? $type}): $type = $type ?? 'highlight';
  factory GuideBlockHighlight.fromJson(Map<String, dynamic> json) => _$GuideBlockHighlightFromJson(json);

 final  String content;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideBlockHighlightCopyWith<GuideBlockHighlight> get copyWith => _$GuideBlockHighlightCopyWithImpl<GuideBlockHighlight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideBlockHighlightToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideBlockHighlight&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'GuideBlock.highlight(content: $content)';
}


}

/// @nodoc
abstract mixin class $GuideBlockHighlightCopyWith<$Res> implements $GuideBlockCopyWith<$Res> {
  factory $GuideBlockHighlightCopyWith(GuideBlockHighlight value, $Res Function(GuideBlockHighlight) _then) = _$GuideBlockHighlightCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$GuideBlockHighlightCopyWithImpl<$Res>
    implements $GuideBlockHighlightCopyWith<$Res> {
  _$GuideBlockHighlightCopyWithImpl(this._self, this._then);

  final GuideBlockHighlight _self;
  final $Res Function(GuideBlockHighlight) _then;

/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(GuideBlockHighlight(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GuideBlockImage implements GuideBlock {
  const GuideBlockImage({required this.imageUrl, this.caption, this.isLeading = false, final  String? $type}): $type = $type ?? 'image';
  factory GuideBlockImage.fromJson(Map<String, dynamic> json) => _$GuideBlockImageFromJson(json);

 final  String imageUrl;
 final  String? caption;
@JsonKey() final  bool isLeading;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideBlockImageCopyWith<GuideBlockImage> get copyWith => _$GuideBlockImageCopyWithImpl<GuideBlockImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideBlockImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideBlockImage&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.isLeading, isLeading) || other.isLeading == isLeading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,caption,isLeading);

@override
String toString() {
  return 'GuideBlock.image(imageUrl: $imageUrl, caption: $caption, isLeading: $isLeading)';
}


}

/// @nodoc
abstract mixin class $GuideBlockImageCopyWith<$Res> implements $GuideBlockCopyWith<$Res> {
  factory $GuideBlockImageCopyWith(GuideBlockImage value, $Res Function(GuideBlockImage) _then) = _$GuideBlockImageCopyWithImpl;
@useResult
$Res call({
 String imageUrl, String? caption, bool isLeading
});




}
/// @nodoc
class _$GuideBlockImageCopyWithImpl<$Res>
    implements $GuideBlockImageCopyWith<$Res> {
  _$GuideBlockImageCopyWithImpl(this._self, this._then);

  final GuideBlockImage _self;
  final $Res Function(GuideBlockImage) _then;

/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageUrl = null,Object? caption = freezed,Object? isLeading = null,}) {
  return _then(GuideBlockImage(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,isLeading: null == isLeading ? _self.isLeading : isLeading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GuideBlockFact implements GuideBlock {
  const GuideBlockFact({required this.label, required this.value, final  String? $type}): $type = $type ?? 'fact';
  factory GuideBlockFact.fromJson(Map<String, dynamic> json) => _$GuideBlockFactFromJson(json);

 final  String label;
 final  String value;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideBlockFactCopyWith<GuideBlockFact> get copyWith => _$GuideBlockFactCopyWithImpl<GuideBlockFact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideBlockFactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideBlockFact&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'GuideBlock.fact(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class $GuideBlockFactCopyWith<$Res> implements $GuideBlockCopyWith<$Res> {
  factory $GuideBlockFactCopyWith(GuideBlockFact value, $Res Function(GuideBlockFact) _then) = _$GuideBlockFactCopyWithImpl;
@useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class _$GuideBlockFactCopyWithImpl<$Res>
    implements $GuideBlockFactCopyWith<$Res> {
  _$GuideBlockFactCopyWithImpl(this._self, this._then);

  final GuideBlockFact _self;
  final $Res Function(GuideBlockFact) _then;

/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,}) {
  return _then(GuideBlockFact(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GuideBlockLocation implements GuideBlock {
  const GuideBlockLocation({required this.address, this.latitude, this.longitude, final  String? $type}): $type = $type ?? 'location';
  factory GuideBlockLocation.fromJson(Map<String, dynamic> json) => _$GuideBlockLocationFromJson(json);

 final  String address;
 final  double? latitude;
 final  double? longitude;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideBlockLocationCopyWith<GuideBlockLocation> get copyWith => _$GuideBlockLocationCopyWithImpl<GuideBlockLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideBlockLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideBlockLocation&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,latitude,longitude);

@override
String toString() {
  return 'GuideBlock.location(address: $address, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $GuideBlockLocationCopyWith<$Res> implements $GuideBlockCopyWith<$Res> {
  factory $GuideBlockLocationCopyWith(GuideBlockLocation value, $Res Function(GuideBlockLocation) _then) = _$GuideBlockLocationCopyWithImpl;
@useResult
$Res call({
 String address, double? latitude, double? longitude
});




}
/// @nodoc
class _$GuideBlockLocationCopyWithImpl<$Res>
    implements $GuideBlockLocationCopyWith<$Res> {
  _$GuideBlockLocationCopyWithImpl(this._self, this._then);

  final GuideBlockLocation _self;
  final $Res Function(GuideBlockLocation) _then;

/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(GuideBlockLocation(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GuideBlockYearBadge implements GuideBlock {
  const GuideBlockYearBadge({required this.label, final  String? $type}): $type = $type ?? 'yearBadge';
  factory GuideBlockYearBadge.fromJson(Map<String, dynamic> json) => _$GuideBlockYearBadgeFromJson(json);

 final  String label;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuideBlockYearBadgeCopyWith<GuideBlockYearBadge> get copyWith => _$GuideBlockYearBadgeCopyWithImpl<GuideBlockYearBadge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuideBlockYearBadgeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuideBlockYearBadge&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label);

@override
String toString() {
  return 'GuideBlock.yearBadge(label: $label)';
}


}

/// @nodoc
abstract mixin class $GuideBlockYearBadgeCopyWith<$Res> implements $GuideBlockCopyWith<$Res> {
  factory $GuideBlockYearBadgeCopyWith(GuideBlockYearBadge value, $Res Function(GuideBlockYearBadge) _then) = _$GuideBlockYearBadgeCopyWithImpl;
@useResult
$Res call({
 String label
});




}
/// @nodoc
class _$GuideBlockYearBadgeCopyWithImpl<$Res>
    implements $GuideBlockYearBadgeCopyWith<$Res> {
  _$GuideBlockYearBadgeCopyWithImpl(this._self, this._then);

  final GuideBlockYearBadge _self;
  final $Res Function(GuideBlockYearBadge) _then;

/// Create a copy of GuideBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,}) {
  return _then(GuideBlockYearBadge(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SavedTour {

 String get id; String get tourId; String get userId; DateTime get savedAt; DateTime? get lastOpenedAt; TourSummary? get tourSummary;
/// Create a copy of SavedTour
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedTourCopyWith<SavedTour> get copyWith => _$SavedTourCopyWithImpl<SavedTour>(this as SavedTour, _$identity);

  /// Serializes this SavedTour to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedTour&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.lastOpenedAt, lastOpenedAt) || other.lastOpenedAt == lastOpenedAt)&&(identical(other.tourSummary, tourSummary) || other.tourSummary == tourSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,userId,savedAt,lastOpenedAt,tourSummary);

@override
String toString() {
  return 'SavedTour(id: $id, tourId: $tourId, userId: $userId, savedAt: $savedAt, lastOpenedAt: $lastOpenedAt, tourSummary: $tourSummary)';
}


}

/// @nodoc
abstract mixin class $SavedTourCopyWith<$Res>  {
  factory $SavedTourCopyWith(SavedTour value, $Res Function(SavedTour) _then) = _$SavedTourCopyWithImpl;
@useResult
$Res call({
 String id, String tourId, String userId, DateTime savedAt, DateTime? lastOpenedAt, TourSummary? tourSummary
});


$TourSummaryCopyWith<$Res>? get tourSummary;

}
/// @nodoc
class _$SavedTourCopyWithImpl<$Res>
    implements $SavedTourCopyWith<$Res> {
  _$SavedTourCopyWithImpl(this._self, this._then);

  final SavedTour _self;
  final $Res Function(SavedTour) _then;

/// Create a copy of SavedTour
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tourId = null,Object? userId = null,Object? savedAt = null,Object? lastOpenedAt = freezed,Object? tourSummary = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastOpenedAt: freezed == lastOpenedAt ? _self.lastOpenedAt : lastOpenedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tourSummary: freezed == tourSummary ? _self.tourSummary : tourSummary // ignore: cast_nullable_to_non_nullable
as TourSummary?,
  ));
}
/// Create a copy of SavedTour
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourSummaryCopyWith<$Res>? get tourSummary {
    if (_self.tourSummary == null) {
    return null;
  }

  return $TourSummaryCopyWith<$Res>(_self.tourSummary!, (value) {
    return _then(_self.copyWith(tourSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedTour].
extension SavedTourPatterns on SavedTour {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedTour value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedTour() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedTour value)  $default,){
final _that = this;
switch (_that) {
case _SavedTour():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedTour value)?  $default,){
final _that = this;
switch (_that) {
case _SavedTour() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tourId,  String userId,  DateTime savedAt,  DateTime? lastOpenedAt,  TourSummary? tourSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedTour() when $default != null:
return $default(_that.id,_that.tourId,_that.userId,_that.savedAt,_that.lastOpenedAt,_that.tourSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tourId,  String userId,  DateTime savedAt,  DateTime? lastOpenedAt,  TourSummary? tourSummary)  $default,) {final _that = this;
switch (_that) {
case _SavedTour():
return $default(_that.id,_that.tourId,_that.userId,_that.savedAt,_that.lastOpenedAt,_that.tourSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tourId,  String userId,  DateTime savedAt,  DateTime? lastOpenedAt,  TourSummary? tourSummary)?  $default,) {final _that = this;
switch (_that) {
case _SavedTour() when $default != null:
return $default(_that.id,_that.tourId,_that.userId,_that.savedAt,_that.lastOpenedAt,_that.tourSummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedTour implements SavedTour {
  const _SavedTour({required this.id, required this.tourId, required this.userId, required this.savedAt, this.lastOpenedAt, this.tourSummary});
  factory _SavedTour.fromJson(Map<String, dynamic> json) => _$SavedTourFromJson(json);

@override final  String id;
@override final  String tourId;
@override final  String userId;
@override final  DateTime savedAt;
@override final  DateTime? lastOpenedAt;
@override final  TourSummary? tourSummary;

/// Create a copy of SavedTour
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedTourCopyWith<_SavedTour> get copyWith => __$SavedTourCopyWithImpl<_SavedTour>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedTourToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedTour&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.lastOpenedAt, lastOpenedAt) || other.lastOpenedAt == lastOpenedAt)&&(identical(other.tourSummary, tourSummary) || other.tourSummary == tourSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,userId,savedAt,lastOpenedAt,tourSummary);

@override
String toString() {
  return 'SavedTour(id: $id, tourId: $tourId, userId: $userId, savedAt: $savedAt, lastOpenedAt: $lastOpenedAt, tourSummary: $tourSummary)';
}


}

/// @nodoc
abstract mixin class _$SavedTourCopyWith<$Res> implements $SavedTourCopyWith<$Res> {
  factory _$SavedTourCopyWith(_SavedTour value, $Res Function(_SavedTour) _then) = __$SavedTourCopyWithImpl;
@override @useResult
$Res call({
 String id, String tourId, String userId, DateTime savedAt, DateTime? lastOpenedAt, TourSummary? tourSummary
});


@override $TourSummaryCopyWith<$Res>? get tourSummary;

}
/// @nodoc
class __$SavedTourCopyWithImpl<$Res>
    implements _$SavedTourCopyWith<$Res> {
  __$SavedTourCopyWithImpl(this._self, this._then);

  final _SavedTour _self;
  final $Res Function(_SavedTour) _then;

/// Create a copy of SavedTour
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tourId = null,Object? userId = null,Object? savedAt = null,Object? lastOpenedAt = freezed,Object? tourSummary = freezed,}) {
  return _then(_SavedTour(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastOpenedAt: freezed == lastOpenedAt ? _self.lastOpenedAt : lastOpenedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,tourSummary: freezed == tourSummary ? _self.tourSummary : tourSummary // ignore: cast_nullable_to_non_nullable
as TourSummary?,
  ));
}

/// Create a copy of SavedTour
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TourSummaryCopyWith<$Res>? get tourSummary {
    if (_self.tourSummary == null) {
    return null;
  }

  return $TourSummaryCopyWith<$Res>(_self.tourSummary!, (value) {
    return _then(_self.copyWith(tourSummary: value));
  });
}
}


/// @nodoc
mixin _$PlaybackProgress {

 String get tourId; String get userId; int get audioPositionMs; int get currentSection; bool get completed; DateTime get lastUpdatedAt;
/// Create a copy of PlaybackProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaybackProgressCopyWith<PlaybackProgress> get copyWith => _$PlaybackProgressCopyWithImpl<PlaybackProgress>(this as PlaybackProgress, _$identity);

  /// Serializes this PlaybackProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaybackProgress&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.audioPositionMs, audioPositionMs) || other.audioPositionMs == audioPositionMs)&&(identical(other.currentSection, currentSection) || other.currentSection == currentSection)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.lastUpdatedAt, lastUpdatedAt) || other.lastUpdatedAt == lastUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tourId,userId,audioPositionMs,currentSection,completed,lastUpdatedAt);

@override
String toString() {
  return 'PlaybackProgress(tourId: $tourId, userId: $userId, audioPositionMs: $audioPositionMs, currentSection: $currentSection, completed: $completed, lastUpdatedAt: $lastUpdatedAt)';
}


}

/// @nodoc
abstract mixin class $PlaybackProgressCopyWith<$Res>  {
  factory $PlaybackProgressCopyWith(PlaybackProgress value, $Res Function(PlaybackProgress) _then) = _$PlaybackProgressCopyWithImpl;
@useResult
$Res call({
 String tourId, String userId, int audioPositionMs, int currentSection, bool completed, DateTime lastUpdatedAt
});




}
/// @nodoc
class _$PlaybackProgressCopyWithImpl<$Res>
    implements $PlaybackProgressCopyWith<$Res> {
  _$PlaybackProgressCopyWithImpl(this._self, this._then);

  final PlaybackProgress _self;
  final $Res Function(PlaybackProgress) _then;

/// Create a copy of PlaybackProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tourId = null,Object? userId = null,Object? audioPositionMs = null,Object? currentSection = null,Object? completed = null,Object? lastUpdatedAt = null,}) {
  return _then(_self.copyWith(
tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,audioPositionMs: null == audioPositionMs ? _self.audioPositionMs : audioPositionMs // ignore: cast_nullable_to_non_nullable
as int,currentSection: null == currentSection ? _self.currentSection : currentSection // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,lastUpdatedAt: null == lastUpdatedAt ? _self.lastUpdatedAt : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaybackProgress].
extension PlaybackProgressPatterns on PlaybackProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaybackProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaybackProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaybackProgress value)  $default,){
final _that = this;
switch (_that) {
case _PlaybackProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaybackProgress value)?  $default,){
final _that = this;
switch (_that) {
case _PlaybackProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tourId,  String userId,  int audioPositionMs,  int currentSection,  bool completed,  DateTime lastUpdatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaybackProgress() when $default != null:
return $default(_that.tourId,_that.userId,_that.audioPositionMs,_that.currentSection,_that.completed,_that.lastUpdatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tourId,  String userId,  int audioPositionMs,  int currentSection,  bool completed,  DateTime lastUpdatedAt)  $default,) {final _that = this;
switch (_that) {
case _PlaybackProgress():
return $default(_that.tourId,_that.userId,_that.audioPositionMs,_that.currentSection,_that.completed,_that.lastUpdatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tourId,  String userId,  int audioPositionMs,  int currentSection,  bool completed,  DateTime lastUpdatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PlaybackProgress() when $default != null:
return $default(_that.tourId,_that.userId,_that.audioPositionMs,_that.currentSection,_that.completed,_that.lastUpdatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaybackProgress implements PlaybackProgress {
  const _PlaybackProgress({required this.tourId, required this.userId, required this.audioPositionMs, required this.currentSection, required this.completed, required this.lastUpdatedAt});
  factory _PlaybackProgress.fromJson(Map<String, dynamic> json) => _$PlaybackProgressFromJson(json);

@override final  String tourId;
@override final  String userId;
@override final  int audioPositionMs;
@override final  int currentSection;
@override final  bool completed;
@override final  DateTime lastUpdatedAt;

/// Create a copy of PlaybackProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaybackProgressCopyWith<_PlaybackProgress> get copyWith => __$PlaybackProgressCopyWithImpl<_PlaybackProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaybackProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybackProgress&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.audioPositionMs, audioPositionMs) || other.audioPositionMs == audioPositionMs)&&(identical(other.currentSection, currentSection) || other.currentSection == currentSection)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.lastUpdatedAt, lastUpdatedAt) || other.lastUpdatedAt == lastUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tourId,userId,audioPositionMs,currentSection,completed,lastUpdatedAt);

@override
String toString() {
  return 'PlaybackProgress(tourId: $tourId, userId: $userId, audioPositionMs: $audioPositionMs, currentSection: $currentSection, completed: $completed, lastUpdatedAt: $lastUpdatedAt)';
}


}

/// @nodoc
abstract mixin class _$PlaybackProgressCopyWith<$Res> implements $PlaybackProgressCopyWith<$Res> {
  factory _$PlaybackProgressCopyWith(_PlaybackProgress value, $Res Function(_PlaybackProgress) _then) = __$PlaybackProgressCopyWithImpl;
@override @useResult
$Res call({
 String tourId, String userId, int audioPositionMs, int currentSection, bool completed, DateTime lastUpdatedAt
});




}
/// @nodoc
class __$PlaybackProgressCopyWithImpl<$Res>
    implements _$PlaybackProgressCopyWith<$Res> {
  __$PlaybackProgressCopyWithImpl(this._self, this._then);

  final _PlaybackProgress _self;
  final $Res Function(_PlaybackProgress) _then;

/// Create a copy of PlaybackProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tourId = null,Object? userId = null,Object? audioPositionMs = null,Object? currentSection = null,Object? completed = null,Object? lastUpdatedAt = null,}) {
  return _then(_PlaybackProgress(
tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,audioPositionMs: null == audioPositionMs ? _self.audioPositionMs : audioPositionMs // ignore: cast_nullable_to_non_nullable
as int,currentSection: null == currentSection ? _self.currentSection : currentSection // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,lastUpdatedAt: null == lastUpdatedAt ? _self.lastUpdatedAt : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$TourRating {

 String get id; String get tourId; String get userId; int get rating; String? get reviewText; DateTime get createdAt;
/// Create a copy of TourRating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourRatingCopyWith<TourRating> get copyWith => _$TourRatingCopyWithImpl<TourRating>(this as TourRating, _$identity);

  /// Serializes this TourRating to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourRating&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewText, reviewText) || other.reviewText == reviewText)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,userId,rating,reviewText,createdAt);

@override
String toString() {
  return 'TourRating(id: $id, tourId: $tourId, userId: $userId, rating: $rating, reviewText: $reviewText, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TourRatingCopyWith<$Res>  {
  factory $TourRatingCopyWith(TourRating value, $Res Function(TourRating) _then) = _$TourRatingCopyWithImpl;
@useResult
$Res call({
 String id, String tourId, String userId, int rating, String? reviewText, DateTime createdAt
});




}
/// @nodoc
class _$TourRatingCopyWithImpl<$Res>
    implements $TourRatingCopyWith<$Res> {
  _$TourRatingCopyWithImpl(this._self, this._then);

  final TourRating _self;
  final $Res Function(TourRating) _then;

/// Create a copy of TourRating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tourId = null,Object? userId = null,Object? rating = null,Object? reviewText = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,reviewText: freezed == reviewText ? _self.reviewText : reviewText // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TourRating].
extension TourRatingPatterns on TourRating {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourRating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourRating() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourRating value)  $default,){
final _that = this;
switch (_that) {
case _TourRating():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourRating value)?  $default,){
final _that = this;
switch (_that) {
case _TourRating() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tourId,  String userId,  int rating,  String? reviewText,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourRating() when $default != null:
return $default(_that.id,_that.tourId,_that.userId,_that.rating,_that.reviewText,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tourId,  String userId,  int rating,  String? reviewText,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _TourRating():
return $default(_that.id,_that.tourId,_that.userId,_that.rating,_that.reviewText,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tourId,  String userId,  int rating,  String? reviewText,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TourRating() when $default != null:
return $default(_that.id,_that.tourId,_that.userId,_that.rating,_that.reviewText,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourRating implements TourRating {
  const _TourRating({required this.id, required this.tourId, required this.userId, required this.rating, this.reviewText, required this.createdAt});
  factory _TourRating.fromJson(Map<String, dynamic> json) => _$TourRatingFromJson(json);

@override final  String id;
@override final  String tourId;
@override final  String userId;
@override final  int rating;
@override final  String? reviewText;
@override final  DateTime createdAt;

/// Create a copy of TourRating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourRatingCopyWith<_TourRating> get copyWith => __$TourRatingCopyWithImpl<_TourRating>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourRatingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourRating&&(identical(other.id, id) || other.id == id)&&(identical(other.tourId, tourId) || other.tourId == tourId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewText, reviewText) || other.reviewText == reviewText)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourId,userId,rating,reviewText,createdAt);

@override
String toString() {
  return 'TourRating(id: $id, tourId: $tourId, userId: $userId, rating: $rating, reviewText: $reviewText, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TourRatingCopyWith<$Res> implements $TourRatingCopyWith<$Res> {
  factory _$TourRatingCopyWith(_TourRating value, $Res Function(_TourRating) _then) = __$TourRatingCopyWithImpl;
@override @useResult
$Res call({
 String id, String tourId, String userId, int rating, String? reviewText, DateTime createdAt
});




}
/// @nodoc
class __$TourRatingCopyWithImpl<$Res>
    implements _$TourRatingCopyWith<$Res> {
  __$TourRatingCopyWithImpl(this._self, this._then);

  final _TourRating _self;
  final $Res Function(_TourRating) _then;

/// Create a copy of TourRating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tourId = null,Object? userId = null,Object? rating = null,Object? reviewText = freezed,Object? createdAt = null,}) {
  return _then(_TourRating(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tourId: null == tourId ? _self.tourId : tourId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,reviewText: freezed == reviewText ? _self.reviewText : reviewText // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$SavedTourCluster {

 City get city; List<SavedTour> get tours; DateTime get mostRecentOpenedAt;
/// Create a copy of SavedTourCluster
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedTourClusterCopyWith<SavedTourCluster> get copyWith => _$SavedTourClusterCopyWithImpl<SavedTourCluster>(this as SavedTourCluster, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedTourCluster&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other.tours, tours)&&(identical(other.mostRecentOpenedAt, mostRecentOpenedAt) || other.mostRecentOpenedAt == mostRecentOpenedAt));
}


@override
int get hashCode => Object.hash(runtimeType,city,const DeepCollectionEquality().hash(tours),mostRecentOpenedAt);

@override
String toString() {
  return 'SavedTourCluster(city: $city, tours: $tours, mostRecentOpenedAt: $mostRecentOpenedAt)';
}


}

/// @nodoc
abstract mixin class $SavedTourClusterCopyWith<$Res>  {
  factory $SavedTourClusterCopyWith(SavedTourCluster value, $Res Function(SavedTourCluster) _then) = _$SavedTourClusterCopyWithImpl;
@useResult
$Res call({
 City city, List<SavedTour> tours, DateTime mostRecentOpenedAt
});


$CityCopyWith<$Res> get city;

}
/// @nodoc
class _$SavedTourClusterCopyWithImpl<$Res>
    implements $SavedTourClusterCopyWith<$Res> {
  _$SavedTourClusterCopyWithImpl(this._self, this._then);

  final SavedTourCluster _self;
  final $Res Function(SavedTourCluster) _then;

/// Create a copy of SavedTourCluster
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? city = null,Object? tours = null,Object? mostRecentOpenedAt = null,}) {
  return _then(_self.copyWith(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as City,tours: null == tours ? _self.tours : tours // ignore: cast_nullable_to_non_nullable
as List<SavedTour>,mostRecentOpenedAt: null == mostRecentOpenedAt ? _self.mostRecentOpenedAt : mostRecentOpenedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SavedTourCluster
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityCopyWith<$Res> get city {
  
  return $CityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavedTourCluster].
extension SavedTourClusterPatterns on SavedTourCluster {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedTourCluster value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedTourCluster() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedTourCluster value)  $default,){
final _that = this;
switch (_that) {
case _SavedTourCluster():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedTourCluster value)?  $default,){
final _that = this;
switch (_that) {
case _SavedTourCluster() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( City city,  List<SavedTour> tours,  DateTime mostRecentOpenedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedTourCluster() when $default != null:
return $default(_that.city,_that.tours,_that.mostRecentOpenedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( City city,  List<SavedTour> tours,  DateTime mostRecentOpenedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedTourCluster():
return $default(_that.city,_that.tours,_that.mostRecentOpenedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( City city,  List<SavedTour> tours,  DateTime mostRecentOpenedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedTourCluster() when $default != null:
return $default(_that.city,_that.tours,_that.mostRecentOpenedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SavedTourCluster implements SavedTourCluster {
  const _SavedTourCluster({required this.city, required final  List<SavedTour> tours, required this.mostRecentOpenedAt}): _tours = tours;
  

@override final  City city;
 final  List<SavedTour> _tours;
@override List<SavedTour> get tours {
  if (_tours is EqualUnmodifiableListView) return _tours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tours);
}

@override final  DateTime mostRecentOpenedAt;

/// Create a copy of SavedTourCluster
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedTourClusterCopyWith<_SavedTourCluster> get copyWith => __$SavedTourClusterCopyWithImpl<_SavedTourCluster>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedTourCluster&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other._tours, _tours)&&(identical(other.mostRecentOpenedAt, mostRecentOpenedAt) || other.mostRecentOpenedAt == mostRecentOpenedAt));
}


@override
int get hashCode => Object.hash(runtimeType,city,const DeepCollectionEquality().hash(_tours),mostRecentOpenedAt);

@override
String toString() {
  return 'SavedTourCluster(city: $city, tours: $tours, mostRecentOpenedAt: $mostRecentOpenedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedTourClusterCopyWith<$Res> implements $SavedTourClusterCopyWith<$Res> {
  factory _$SavedTourClusterCopyWith(_SavedTourCluster value, $Res Function(_SavedTourCluster) _then) = __$SavedTourClusterCopyWithImpl;
@override @useResult
$Res call({
 City city, List<SavedTour> tours, DateTime mostRecentOpenedAt
});


@override $CityCopyWith<$Res> get city;

}
/// @nodoc
class __$SavedTourClusterCopyWithImpl<$Res>
    implements _$SavedTourClusterCopyWith<$Res> {
  __$SavedTourClusterCopyWithImpl(this._self, this._then);

  final _SavedTourCluster _self;
  final $Res Function(_SavedTourCluster) _then;

/// Create a copy of SavedTourCluster
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? city = null,Object? tours = null,Object? mostRecentOpenedAt = null,}) {
  return _then(_SavedTourCluster(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as City,tours: null == tours ? _self._tours : tours // ignore: cast_nullable_to_non_nullable
as List<SavedTour>,mostRecentOpenedAt: null == mostRecentOpenedAt ? _self.mostRecentOpenedAt : mostRecentOpenedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SavedTourCluster
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityCopyWith<$Res> get city {
  
  return $CityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}

// dart format on
