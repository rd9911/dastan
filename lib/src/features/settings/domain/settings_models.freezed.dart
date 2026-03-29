// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnitsPrefs {

 bool get useKilometers; bool get useCelsius; bool get use24HourClock;
/// Create a copy of UnitsPrefs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitsPrefsCopyWith<UnitsPrefs> get copyWith => _$UnitsPrefsCopyWithImpl<UnitsPrefs>(this as UnitsPrefs, _$identity);

  /// Serializes this UnitsPrefs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitsPrefs&&(identical(other.useKilometers, useKilometers) || other.useKilometers == useKilometers)&&(identical(other.useCelsius, useCelsius) || other.useCelsius == useCelsius)&&(identical(other.use24HourClock, use24HourClock) || other.use24HourClock == use24HourClock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,useKilometers,useCelsius,use24HourClock);

@override
String toString() {
  return 'UnitsPrefs(useKilometers: $useKilometers, useCelsius: $useCelsius, use24HourClock: $use24HourClock)';
}


}

/// @nodoc
abstract mixin class $UnitsPrefsCopyWith<$Res>  {
  factory $UnitsPrefsCopyWith(UnitsPrefs value, $Res Function(UnitsPrefs) _then) = _$UnitsPrefsCopyWithImpl;
@useResult
$Res call({
 bool useKilometers, bool useCelsius, bool use24HourClock
});




}
/// @nodoc
class _$UnitsPrefsCopyWithImpl<$Res>
    implements $UnitsPrefsCopyWith<$Res> {
  _$UnitsPrefsCopyWithImpl(this._self, this._then);

  final UnitsPrefs _self;
  final $Res Function(UnitsPrefs) _then;

/// Create a copy of UnitsPrefs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? useKilometers = null,Object? useCelsius = null,Object? use24HourClock = null,}) {
  return _then(_self.copyWith(
useKilometers: null == useKilometers ? _self.useKilometers : useKilometers // ignore: cast_nullable_to_non_nullable
as bool,useCelsius: null == useCelsius ? _self.useCelsius : useCelsius // ignore: cast_nullable_to_non_nullable
as bool,use24HourClock: null == use24HourClock ? _self.use24HourClock : use24HourClock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UnitsPrefs].
extension UnitsPrefsPatterns on UnitsPrefs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitsPrefs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitsPrefs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitsPrefs value)  $default,){
final _that = this;
switch (_that) {
case _UnitsPrefs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitsPrefs value)?  $default,){
final _that = this;
switch (_that) {
case _UnitsPrefs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool useKilometers,  bool useCelsius,  bool use24HourClock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitsPrefs() when $default != null:
return $default(_that.useKilometers,_that.useCelsius,_that.use24HourClock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool useKilometers,  bool useCelsius,  bool use24HourClock)  $default,) {final _that = this;
switch (_that) {
case _UnitsPrefs():
return $default(_that.useKilometers,_that.useCelsius,_that.use24HourClock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool useKilometers,  bool useCelsius,  bool use24HourClock)?  $default,) {final _that = this;
switch (_that) {
case _UnitsPrefs() when $default != null:
return $default(_that.useKilometers,_that.useCelsius,_that.use24HourClock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnitsPrefs implements UnitsPrefs {
  const _UnitsPrefs({this.useKilometers = true, this.useCelsius = true, this.use24HourClock = true});
  factory _UnitsPrefs.fromJson(Map<String, dynamic> json) => _$UnitsPrefsFromJson(json);

@override@JsonKey() final  bool useKilometers;
@override@JsonKey() final  bool useCelsius;
@override@JsonKey() final  bool use24HourClock;

/// Create a copy of UnitsPrefs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitsPrefsCopyWith<_UnitsPrefs> get copyWith => __$UnitsPrefsCopyWithImpl<_UnitsPrefs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnitsPrefsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitsPrefs&&(identical(other.useKilometers, useKilometers) || other.useKilometers == useKilometers)&&(identical(other.useCelsius, useCelsius) || other.useCelsius == useCelsius)&&(identical(other.use24HourClock, use24HourClock) || other.use24HourClock == use24HourClock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,useKilometers,useCelsius,use24HourClock);

@override
String toString() {
  return 'UnitsPrefs(useKilometers: $useKilometers, useCelsius: $useCelsius, use24HourClock: $use24HourClock)';
}


}

/// @nodoc
abstract mixin class _$UnitsPrefsCopyWith<$Res> implements $UnitsPrefsCopyWith<$Res> {
  factory _$UnitsPrefsCopyWith(_UnitsPrefs value, $Res Function(_UnitsPrefs) _then) = __$UnitsPrefsCopyWithImpl;
@override @useResult
$Res call({
 bool useKilometers, bool useCelsius, bool use24HourClock
});




}
/// @nodoc
class __$UnitsPrefsCopyWithImpl<$Res>
    implements _$UnitsPrefsCopyWith<$Res> {
  __$UnitsPrefsCopyWithImpl(this._self, this._then);

  final _UnitsPrefs _self;
  final $Res Function(_UnitsPrefs) _then;

/// Create a copy of UnitsPrefs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? useKilometers = null,Object? useCelsius = null,Object? use24HourClock = null,}) {
  return _then(_UnitsPrefs(
useKilometers: null == useKilometers ? _self.useKilometers : useKilometers // ignore: cast_nullable_to_non_nullable
as bool,useCelsius: null == useCelsius ? _self.useCelsius : useCelsius // ignore: cast_nullable_to_non_nullable
as bool,use24HourClock: null == use24HourClock ? _self.use24HourClock : use24HourClock // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UserProfile {

 String get userId; String get name; String? get avatarUrl; String? get homeCity; String get timezone; String get locale; String get currency; UnitsPrefs get units;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.homeCity, homeCity) || other.homeCity == homeCity)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.units, units) || other.units == units));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,avatarUrl,homeCity,timezone,locale,currency,units);

@override
String toString() {
  return 'UserProfile(userId: $userId, name: $name, avatarUrl: $avatarUrl, homeCity: $homeCity, timezone: $timezone, locale: $locale, currency: $currency, units: $units)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String userId, String name, String? avatarUrl, String? homeCity, String timezone, String locale, String currency, UnitsPrefs units
});


$UnitsPrefsCopyWith<$Res> get units;

}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? avatarUrl = freezed,Object? homeCity = freezed,Object? timezone = null,Object? locale = null,Object? currency = null,Object? units = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,homeCity: freezed == homeCity ? _self.homeCity : homeCity // ignore: cast_nullable_to_non_nullable
as String?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as UnitsPrefs,
  ));
}
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitsPrefsCopyWith<$Res> get units {
  
  return $UnitsPrefsCopyWith<$Res>(_self.units, (value) {
    return _then(_self.copyWith(units: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String name,  String? avatarUrl,  String? homeCity,  String timezone,  String locale,  String currency,  UnitsPrefs units)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.userId,_that.name,_that.avatarUrl,_that.homeCity,_that.timezone,_that.locale,_that.currency,_that.units);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String name,  String? avatarUrl,  String? homeCity,  String timezone,  String locale,  String currency,  UnitsPrefs units)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.userId,_that.name,_that.avatarUrl,_that.homeCity,_that.timezone,_that.locale,_that.currency,_that.units);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String name,  String? avatarUrl,  String? homeCity,  String timezone,  String locale,  String currency,  UnitsPrefs units)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.userId,_that.name,_that.avatarUrl,_that.homeCity,_that.timezone,_that.locale,_that.currency,_that.units);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.userId, required this.name, this.avatarUrl, this.homeCity, this.timezone = 'UTC', this.locale = 'en', this.currency = 'USD', this.units = const UnitsPrefs()});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String userId;
@override final  String name;
@override final  String? avatarUrl;
@override final  String? homeCity;
@override@JsonKey() final  String timezone;
@override@JsonKey() final  String locale;
@override@JsonKey() final  String currency;
@override@JsonKey() final  UnitsPrefs units;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.homeCity, homeCity) || other.homeCity == homeCity)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.units, units) || other.units == units));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,avatarUrl,homeCity,timezone,locale,currency,units);

@override
String toString() {
  return 'UserProfile(userId: $userId, name: $name, avatarUrl: $avatarUrl, homeCity: $homeCity, timezone: $timezone, locale: $locale, currency: $currency, units: $units)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String userId, String name, String? avatarUrl, String? homeCity, String timezone, String locale, String currency, UnitsPrefs units
});


@override $UnitsPrefsCopyWith<$Res> get units;

}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? avatarUrl = freezed,Object? homeCity = freezed,Object? timezone = null,Object? locale = null,Object? currency = null,Object? units = null,}) {
  return _then(_UserProfile(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,homeCity: freezed == homeCity ? _self.homeCity : homeCity // ignore: cast_nullable_to_non_nullable
as String?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as UnitsPrefs,
  ));
}

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitsPrefsCopyWith<$Res> get units {
  
  return $UnitsPrefsCopyWith<$Res>(_self.units, (value) {
    return _then(_self.copyWith(units: value));
  });
}
}


/// @nodoc
mixin _$TravelerPreset {

 String get id; String get name; int get adults; List<int> get childAges; bool get isDefault;
/// Create a copy of TravelerPreset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TravelerPresetCopyWith<TravelerPreset> get copyWith => _$TravelerPresetCopyWithImpl<TravelerPreset>(this as TravelerPreset, _$identity);

  /// Serializes this TravelerPreset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TravelerPreset&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.adults, adults) || other.adults == adults)&&const DeepCollectionEquality().equals(other.childAges, childAges)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,adults,const DeepCollectionEquality().hash(childAges),isDefault);

@override
String toString() {
  return 'TravelerPreset(id: $id, name: $name, adults: $adults, childAges: $childAges, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $TravelerPresetCopyWith<$Res>  {
  factory $TravelerPresetCopyWith(TravelerPreset value, $Res Function(TravelerPreset) _then) = _$TravelerPresetCopyWithImpl;
@useResult
$Res call({
 String id, String name, int adults, List<int> childAges, bool isDefault
});




}
/// @nodoc
class _$TravelerPresetCopyWithImpl<$Res>
    implements $TravelerPresetCopyWith<$Res> {
  _$TravelerPresetCopyWithImpl(this._self, this._then);

  final TravelerPreset _self;
  final $Res Function(TravelerPreset) _then;

/// Create a copy of TravelerPreset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? adults = null,Object? childAges = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,adults: null == adults ? _self.adults : adults // ignore: cast_nullable_to_non_nullable
as int,childAges: null == childAges ? _self.childAges : childAges // ignore: cast_nullable_to_non_nullable
as List<int>,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TravelerPreset].
extension TravelerPresetPatterns on TravelerPreset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TravelerPreset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TravelerPreset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TravelerPreset value)  $default,){
final _that = this;
switch (_that) {
case _TravelerPreset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TravelerPreset value)?  $default,){
final _that = this;
switch (_that) {
case _TravelerPreset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int adults,  List<int> childAges,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TravelerPreset() when $default != null:
return $default(_that.id,_that.name,_that.adults,_that.childAges,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int adults,  List<int> childAges,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _TravelerPreset():
return $default(_that.id,_that.name,_that.adults,_that.childAges,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int adults,  List<int> childAges,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _TravelerPreset() when $default != null:
return $default(_that.id,_that.name,_that.adults,_that.childAges,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TravelerPreset implements TravelerPreset {
  const _TravelerPreset({required this.id, required this.name, this.adults = 2, final  List<int> childAges = const [], this.isDefault = false}): _childAges = childAges;
  factory _TravelerPreset.fromJson(Map<String, dynamic> json) => _$TravelerPresetFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  int adults;
 final  List<int> _childAges;
@override@JsonKey() List<int> get childAges {
  if (_childAges is EqualUnmodifiableListView) return _childAges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_childAges);
}

@override@JsonKey() final  bool isDefault;

/// Create a copy of TravelerPreset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TravelerPresetCopyWith<_TravelerPreset> get copyWith => __$TravelerPresetCopyWithImpl<_TravelerPreset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TravelerPresetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TravelerPreset&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.adults, adults) || other.adults == adults)&&const DeepCollectionEquality().equals(other._childAges, _childAges)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,adults,const DeepCollectionEquality().hash(_childAges),isDefault);

@override
String toString() {
  return 'TravelerPreset(id: $id, name: $name, adults: $adults, childAges: $childAges, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$TravelerPresetCopyWith<$Res> implements $TravelerPresetCopyWith<$Res> {
  factory _$TravelerPresetCopyWith(_TravelerPreset value, $Res Function(_TravelerPreset) _then) = __$TravelerPresetCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int adults, List<int> childAges, bool isDefault
});




}
/// @nodoc
class __$TravelerPresetCopyWithImpl<$Res>
    implements _$TravelerPresetCopyWith<$Res> {
  __$TravelerPresetCopyWithImpl(this._self, this._then);

  final _TravelerPreset _self;
  final $Res Function(_TravelerPreset) _then;

/// Create a copy of TravelerPreset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? adults = null,Object? childAges = null,Object? isDefault = null,}) {
  return _then(_TravelerPreset(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,adults: null == adults ? _self.adults : adults // ignore: cast_nullable_to_non_nullable
as int,childAges: null == childAges ? _self._childAges : childAges // ignore: cast_nullable_to_non_nullable
as List<int>,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SearchDefaults {

 TransportDefaults? get transport; AccommodationDefaults? get accommodation; FoodDefaults? get food; TrailDefaults? get trails;
/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchDefaultsCopyWith<SearchDefaults> get copyWith => _$SearchDefaultsCopyWithImpl<SearchDefaults>(this as SearchDefaults, _$identity);

  /// Serializes this SearchDefaults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchDefaults&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.accommodation, accommodation) || other.accommodation == accommodation)&&(identical(other.food, food) || other.food == food)&&(identical(other.trails, trails) || other.trails == trails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transport,accommodation,food,trails);

@override
String toString() {
  return 'SearchDefaults(transport: $transport, accommodation: $accommodation, food: $food, trails: $trails)';
}


}

/// @nodoc
abstract mixin class $SearchDefaultsCopyWith<$Res>  {
  factory $SearchDefaultsCopyWith(SearchDefaults value, $Res Function(SearchDefaults) _then) = _$SearchDefaultsCopyWithImpl;
@useResult
$Res call({
 TransportDefaults? transport, AccommodationDefaults? accommodation, FoodDefaults? food, TrailDefaults? trails
});


$TransportDefaultsCopyWith<$Res>? get transport;$AccommodationDefaultsCopyWith<$Res>? get accommodation;$FoodDefaultsCopyWith<$Res>? get food;$TrailDefaultsCopyWith<$Res>? get trails;

}
/// @nodoc
class _$SearchDefaultsCopyWithImpl<$Res>
    implements $SearchDefaultsCopyWith<$Res> {
  _$SearchDefaultsCopyWithImpl(this._self, this._then);

  final SearchDefaults _self;
  final $Res Function(SearchDefaults) _then;

/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transport = freezed,Object? accommodation = freezed,Object? food = freezed,Object? trails = freezed,}) {
  return _then(_self.copyWith(
transport: freezed == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as TransportDefaults?,accommodation: freezed == accommodation ? _self.accommodation : accommodation // ignore: cast_nullable_to_non_nullable
as AccommodationDefaults?,food: freezed == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as FoodDefaults?,trails: freezed == trails ? _self.trails : trails // ignore: cast_nullable_to_non_nullable
as TrailDefaults?,
  ));
}
/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransportDefaultsCopyWith<$Res>? get transport {
    if (_self.transport == null) {
    return null;
  }

  return $TransportDefaultsCopyWith<$Res>(_self.transport!, (value) {
    return _then(_self.copyWith(transport: value));
  });
}/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccommodationDefaultsCopyWith<$Res>? get accommodation {
    if (_self.accommodation == null) {
    return null;
  }

  return $AccommodationDefaultsCopyWith<$Res>(_self.accommodation!, (value) {
    return _then(_self.copyWith(accommodation: value));
  });
}/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodDefaultsCopyWith<$Res>? get food {
    if (_self.food == null) {
    return null;
  }

  return $FoodDefaultsCopyWith<$Res>(_self.food!, (value) {
    return _then(_self.copyWith(food: value));
  });
}/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailDefaultsCopyWith<$Res>? get trails {
    if (_self.trails == null) {
    return null;
  }

  return $TrailDefaultsCopyWith<$Res>(_self.trails!, (value) {
    return _then(_self.copyWith(trails: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchDefaults].
extension SearchDefaultsPatterns on SearchDefaults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchDefaults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchDefaults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchDefaults value)  $default,){
final _that = this;
switch (_that) {
case _SearchDefaults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchDefaults value)?  $default,){
final _that = this;
switch (_that) {
case _SearchDefaults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TransportDefaults? transport,  AccommodationDefaults? accommodation,  FoodDefaults? food,  TrailDefaults? trails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchDefaults() when $default != null:
return $default(_that.transport,_that.accommodation,_that.food,_that.trails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TransportDefaults? transport,  AccommodationDefaults? accommodation,  FoodDefaults? food,  TrailDefaults? trails)  $default,) {final _that = this;
switch (_that) {
case _SearchDefaults():
return $default(_that.transport,_that.accommodation,_that.food,_that.trails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TransportDefaults? transport,  AccommodationDefaults? accommodation,  FoodDefaults? food,  TrailDefaults? trails)?  $default,) {final _that = this;
switch (_that) {
case _SearchDefaults() when $default != null:
return $default(_that.transport,_that.accommodation,_that.food,_that.trails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchDefaults implements SearchDefaults {
  const _SearchDefaults({this.transport, this.accommodation, this.food, this.trails});
  factory _SearchDefaults.fromJson(Map<String, dynamic> json) => _$SearchDefaultsFromJson(json);

@override final  TransportDefaults? transport;
@override final  AccommodationDefaults? accommodation;
@override final  FoodDefaults? food;
@override final  TrailDefaults? trails;

/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchDefaultsCopyWith<_SearchDefaults> get copyWith => __$SearchDefaultsCopyWithImpl<_SearchDefaults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchDefaultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchDefaults&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.accommodation, accommodation) || other.accommodation == accommodation)&&(identical(other.food, food) || other.food == food)&&(identical(other.trails, trails) || other.trails == trails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,transport,accommodation,food,trails);

@override
String toString() {
  return 'SearchDefaults(transport: $transport, accommodation: $accommodation, food: $food, trails: $trails)';
}


}

/// @nodoc
abstract mixin class _$SearchDefaultsCopyWith<$Res> implements $SearchDefaultsCopyWith<$Res> {
  factory _$SearchDefaultsCopyWith(_SearchDefaults value, $Res Function(_SearchDefaults) _then) = __$SearchDefaultsCopyWithImpl;
@override @useResult
$Res call({
 TransportDefaults? transport, AccommodationDefaults? accommodation, FoodDefaults? food, TrailDefaults? trails
});


@override $TransportDefaultsCopyWith<$Res>? get transport;@override $AccommodationDefaultsCopyWith<$Res>? get accommodation;@override $FoodDefaultsCopyWith<$Res>? get food;@override $TrailDefaultsCopyWith<$Res>? get trails;

}
/// @nodoc
class __$SearchDefaultsCopyWithImpl<$Res>
    implements _$SearchDefaultsCopyWith<$Res> {
  __$SearchDefaultsCopyWithImpl(this._self, this._then);

  final _SearchDefaults _self;
  final $Res Function(_SearchDefaults) _then;

/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transport = freezed,Object? accommodation = freezed,Object? food = freezed,Object? trails = freezed,}) {
  return _then(_SearchDefaults(
transport: freezed == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as TransportDefaults?,accommodation: freezed == accommodation ? _self.accommodation : accommodation // ignore: cast_nullable_to_non_nullable
as AccommodationDefaults?,food: freezed == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as FoodDefaults?,trails: freezed == trails ? _self.trails : trails // ignore: cast_nullable_to_non_nullable
as TrailDefaults?,
  ));
}

/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransportDefaultsCopyWith<$Res>? get transport {
    if (_self.transport == null) {
    return null;
  }

  return $TransportDefaultsCopyWith<$Res>(_self.transport!, (value) {
    return _then(_self.copyWith(transport: value));
  });
}/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccommodationDefaultsCopyWith<$Res>? get accommodation {
    if (_self.accommodation == null) {
    return null;
  }

  return $AccommodationDefaultsCopyWith<$Res>(_self.accommodation!, (value) {
    return _then(_self.copyWith(accommodation: value));
  });
}/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodDefaultsCopyWith<$Res>? get food {
    if (_self.food == null) {
    return null;
  }

  return $FoodDefaultsCopyWith<$Res>(_self.food!, (value) {
    return _then(_self.copyWith(food: value));
  });
}/// Create a copy of SearchDefaults
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrailDefaultsCopyWith<$Res>? get trails {
    if (_self.trails == null) {
    return null;
  }

  return $TrailDefaultsCopyWith<$Res>(_self.trails!, (value) {
    return _then(_self.copyWith(trails: value));
  });
}
}


/// @nodoc
mixin _$TransportDefaults {

 List<String> get preferredModes;// train, bus, flight, etc.
 bool get directOnly; String get cabinClass;
/// Create a copy of TransportDefaults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportDefaultsCopyWith<TransportDefaults> get copyWith => _$TransportDefaultsCopyWithImpl<TransportDefaults>(this as TransportDefaults, _$identity);

  /// Serializes this TransportDefaults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportDefaults&&const DeepCollectionEquality().equals(other.preferredModes, preferredModes)&&(identical(other.directOnly, directOnly) || other.directOnly == directOnly)&&(identical(other.cabinClass, cabinClass) || other.cabinClass == cabinClass));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(preferredModes),directOnly,cabinClass);

@override
String toString() {
  return 'TransportDefaults(preferredModes: $preferredModes, directOnly: $directOnly, cabinClass: $cabinClass)';
}


}

/// @nodoc
abstract mixin class $TransportDefaultsCopyWith<$Res>  {
  factory $TransportDefaultsCopyWith(TransportDefaults value, $Res Function(TransportDefaults) _then) = _$TransportDefaultsCopyWithImpl;
@useResult
$Res call({
 List<String> preferredModes, bool directOnly, String cabinClass
});




}
/// @nodoc
class _$TransportDefaultsCopyWithImpl<$Res>
    implements $TransportDefaultsCopyWith<$Res> {
  _$TransportDefaultsCopyWithImpl(this._self, this._then);

  final TransportDefaults _self;
  final $Res Function(TransportDefaults) _then;

/// Create a copy of TransportDefaults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preferredModes = null,Object? directOnly = null,Object? cabinClass = null,}) {
  return _then(_self.copyWith(
preferredModes: null == preferredModes ? _self.preferredModes : preferredModes // ignore: cast_nullable_to_non_nullable
as List<String>,directOnly: null == directOnly ? _self.directOnly : directOnly // ignore: cast_nullable_to_non_nullable
as bool,cabinClass: null == cabinClass ? _self.cabinClass : cabinClass // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransportDefaults].
extension TransportDefaultsPatterns on TransportDefaults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportDefaults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportDefaults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportDefaults value)  $default,){
final _that = this;
switch (_that) {
case _TransportDefaults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportDefaults value)?  $default,){
final _that = this;
switch (_that) {
case _TransportDefaults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> preferredModes,  bool directOnly,  String cabinClass)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportDefaults() when $default != null:
return $default(_that.preferredModes,_that.directOnly,_that.cabinClass);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> preferredModes,  bool directOnly,  String cabinClass)  $default,) {final _that = this;
switch (_that) {
case _TransportDefaults():
return $default(_that.preferredModes,_that.directOnly,_that.cabinClass);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> preferredModes,  bool directOnly,  String cabinClass)?  $default,) {final _that = this;
switch (_that) {
case _TransportDefaults() when $default != null:
return $default(_that.preferredModes,_that.directOnly,_that.cabinClass);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportDefaults implements TransportDefaults {
  const _TransportDefaults({final  List<String> preferredModes = const [], this.directOnly = false, this.cabinClass = 'economy'}): _preferredModes = preferredModes;
  factory _TransportDefaults.fromJson(Map<String, dynamic> json) => _$TransportDefaultsFromJson(json);

 final  List<String> _preferredModes;
@override@JsonKey() List<String> get preferredModes {
  if (_preferredModes is EqualUnmodifiableListView) return _preferredModes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preferredModes);
}

// train, bus, flight, etc.
@override@JsonKey() final  bool directOnly;
@override@JsonKey() final  String cabinClass;

/// Create a copy of TransportDefaults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportDefaultsCopyWith<_TransportDefaults> get copyWith => __$TransportDefaultsCopyWithImpl<_TransportDefaults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportDefaultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportDefaults&&const DeepCollectionEquality().equals(other._preferredModes, _preferredModes)&&(identical(other.directOnly, directOnly) || other.directOnly == directOnly)&&(identical(other.cabinClass, cabinClass) || other.cabinClass == cabinClass));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_preferredModes),directOnly,cabinClass);

@override
String toString() {
  return 'TransportDefaults(preferredModes: $preferredModes, directOnly: $directOnly, cabinClass: $cabinClass)';
}


}

/// @nodoc
abstract mixin class _$TransportDefaultsCopyWith<$Res> implements $TransportDefaultsCopyWith<$Res> {
  factory _$TransportDefaultsCopyWith(_TransportDefaults value, $Res Function(_TransportDefaults) _then) = __$TransportDefaultsCopyWithImpl;
@override @useResult
$Res call({
 List<String> preferredModes, bool directOnly, String cabinClass
});




}
/// @nodoc
class __$TransportDefaultsCopyWithImpl<$Res>
    implements _$TransportDefaultsCopyWith<$Res> {
  __$TransportDefaultsCopyWithImpl(this._self, this._then);

  final _TransportDefaults _self;
  final $Res Function(_TransportDefaults) _then;

/// Create a copy of TransportDefaults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preferredModes = null,Object? directOnly = null,Object? cabinClass = null,}) {
  return _then(_TransportDefaults(
preferredModes: null == preferredModes ? _self._preferredModes : preferredModes // ignore: cast_nullable_to_non_nullable
as List<String>,directOnly: null == directOnly ? _self.directOnly : directOnly // ignore: cast_nullable_to_non_nullable
as bool,cabinClass: null == cabinClass ? _self.cabinClass : cabinClass // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AccommodationDefaults {

 double get minReviewScore; List<String> get requiredAmenities; int? get maxPricePerNight;
/// Create a copy of AccommodationDefaults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccommodationDefaultsCopyWith<AccommodationDefaults> get copyWith => _$AccommodationDefaultsCopyWithImpl<AccommodationDefaults>(this as AccommodationDefaults, _$identity);

  /// Serializes this AccommodationDefaults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccommodationDefaults&&(identical(other.minReviewScore, minReviewScore) || other.minReviewScore == minReviewScore)&&const DeepCollectionEquality().equals(other.requiredAmenities, requiredAmenities)&&(identical(other.maxPricePerNight, maxPricePerNight) || other.maxPricePerNight == maxPricePerNight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minReviewScore,const DeepCollectionEquality().hash(requiredAmenities),maxPricePerNight);

@override
String toString() {
  return 'AccommodationDefaults(minReviewScore: $minReviewScore, requiredAmenities: $requiredAmenities, maxPricePerNight: $maxPricePerNight)';
}


}

/// @nodoc
abstract mixin class $AccommodationDefaultsCopyWith<$Res>  {
  factory $AccommodationDefaultsCopyWith(AccommodationDefaults value, $Res Function(AccommodationDefaults) _then) = _$AccommodationDefaultsCopyWithImpl;
@useResult
$Res call({
 double minReviewScore, List<String> requiredAmenities, int? maxPricePerNight
});




}
/// @nodoc
class _$AccommodationDefaultsCopyWithImpl<$Res>
    implements $AccommodationDefaultsCopyWith<$Res> {
  _$AccommodationDefaultsCopyWithImpl(this._self, this._then);

  final AccommodationDefaults _self;
  final $Res Function(AccommodationDefaults) _then;

/// Create a copy of AccommodationDefaults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minReviewScore = null,Object? requiredAmenities = null,Object? maxPricePerNight = freezed,}) {
  return _then(_self.copyWith(
minReviewScore: null == minReviewScore ? _self.minReviewScore : minReviewScore // ignore: cast_nullable_to_non_nullable
as double,requiredAmenities: null == requiredAmenities ? _self.requiredAmenities : requiredAmenities // ignore: cast_nullable_to_non_nullable
as List<String>,maxPricePerNight: freezed == maxPricePerNight ? _self.maxPricePerNight : maxPricePerNight // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccommodationDefaults].
extension AccommodationDefaultsPatterns on AccommodationDefaults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccommodationDefaults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccommodationDefaults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccommodationDefaults value)  $default,){
final _that = this;
switch (_that) {
case _AccommodationDefaults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccommodationDefaults value)?  $default,){
final _that = this;
switch (_that) {
case _AccommodationDefaults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minReviewScore,  List<String> requiredAmenities,  int? maxPricePerNight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccommodationDefaults() when $default != null:
return $default(_that.minReviewScore,_that.requiredAmenities,_that.maxPricePerNight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minReviewScore,  List<String> requiredAmenities,  int? maxPricePerNight)  $default,) {final _that = this;
switch (_that) {
case _AccommodationDefaults():
return $default(_that.minReviewScore,_that.requiredAmenities,_that.maxPricePerNight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minReviewScore,  List<String> requiredAmenities,  int? maxPricePerNight)?  $default,) {final _that = this;
switch (_that) {
case _AccommodationDefaults() when $default != null:
return $default(_that.minReviewScore,_that.requiredAmenities,_that.maxPricePerNight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccommodationDefaults implements AccommodationDefaults {
  const _AccommodationDefaults({this.minReviewScore = 3.5, final  List<String> requiredAmenities = const [], this.maxPricePerNight}): _requiredAmenities = requiredAmenities;
  factory _AccommodationDefaults.fromJson(Map<String, dynamic> json) => _$AccommodationDefaultsFromJson(json);

@override@JsonKey() final  double minReviewScore;
 final  List<String> _requiredAmenities;
@override@JsonKey() List<String> get requiredAmenities {
  if (_requiredAmenities is EqualUnmodifiableListView) return _requiredAmenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requiredAmenities);
}

@override final  int? maxPricePerNight;

/// Create a copy of AccommodationDefaults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccommodationDefaultsCopyWith<_AccommodationDefaults> get copyWith => __$AccommodationDefaultsCopyWithImpl<_AccommodationDefaults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccommodationDefaultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccommodationDefaults&&(identical(other.minReviewScore, minReviewScore) || other.minReviewScore == minReviewScore)&&const DeepCollectionEquality().equals(other._requiredAmenities, _requiredAmenities)&&(identical(other.maxPricePerNight, maxPricePerNight) || other.maxPricePerNight == maxPricePerNight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minReviewScore,const DeepCollectionEquality().hash(_requiredAmenities),maxPricePerNight);

@override
String toString() {
  return 'AccommodationDefaults(minReviewScore: $minReviewScore, requiredAmenities: $requiredAmenities, maxPricePerNight: $maxPricePerNight)';
}


}

/// @nodoc
abstract mixin class _$AccommodationDefaultsCopyWith<$Res> implements $AccommodationDefaultsCopyWith<$Res> {
  factory _$AccommodationDefaultsCopyWith(_AccommodationDefaults value, $Res Function(_AccommodationDefaults) _then) = __$AccommodationDefaultsCopyWithImpl;
@override @useResult
$Res call({
 double minReviewScore, List<String> requiredAmenities, int? maxPricePerNight
});




}
/// @nodoc
class __$AccommodationDefaultsCopyWithImpl<$Res>
    implements _$AccommodationDefaultsCopyWith<$Res> {
  __$AccommodationDefaultsCopyWithImpl(this._self, this._then);

  final _AccommodationDefaults _self;
  final $Res Function(_AccommodationDefaults) _then;

/// Create a copy of AccommodationDefaults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minReviewScore = null,Object? requiredAmenities = null,Object? maxPricePerNight = freezed,}) {
  return _then(_AccommodationDefaults(
minReviewScore: null == minReviewScore ? _self.minReviewScore : minReviewScore // ignore: cast_nullable_to_non_nullable
as double,requiredAmenities: null == requiredAmenities ? _self._requiredAmenities : requiredAmenities // ignore: cast_nullable_to_non_nullable
as List<String>,maxPricePerNight: freezed == maxPricePerNight ? _self.maxPricePerNight : maxPricePerNight // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$FoodDefaults {

 List<String> get dietaryPreferences;// vegan, vegetarian, halal, etc.
 List<String> get cuisineTypes; double get minRating;
/// Create a copy of FoodDefaults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodDefaultsCopyWith<FoodDefaults> get copyWith => _$FoodDefaultsCopyWithImpl<FoodDefaults>(this as FoodDefaults, _$identity);

  /// Serializes this FoodDefaults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodDefaults&&const DeepCollectionEquality().equals(other.dietaryPreferences, dietaryPreferences)&&const DeepCollectionEquality().equals(other.cuisineTypes, cuisineTypes)&&(identical(other.minRating, minRating) || other.minRating == minRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dietaryPreferences),const DeepCollectionEquality().hash(cuisineTypes),minRating);

@override
String toString() {
  return 'FoodDefaults(dietaryPreferences: $dietaryPreferences, cuisineTypes: $cuisineTypes, minRating: $minRating)';
}


}

/// @nodoc
abstract mixin class $FoodDefaultsCopyWith<$Res>  {
  factory $FoodDefaultsCopyWith(FoodDefaults value, $Res Function(FoodDefaults) _then) = _$FoodDefaultsCopyWithImpl;
@useResult
$Res call({
 List<String> dietaryPreferences, List<String> cuisineTypes, double minRating
});




}
/// @nodoc
class _$FoodDefaultsCopyWithImpl<$Res>
    implements $FoodDefaultsCopyWith<$Res> {
  _$FoodDefaultsCopyWithImpl(this._self, this._then);

  final FoodDefaults _self;
  final $Res Function(FoodDefaults) _then;

/// Create a copy of FoodDefaults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dietaryPreferences = null,Object? cuisineTypes = null,Object? minRating = null,}) {
  return _then(_self.copyWith(
dietaryPreferences: null == dietaryPreferences ? _self.dietaryPreferences : dietaryPreferences // ignore: cast_nullable_to_non_nullable
as List<String>,cuisineTypes: null == cuisineTypes ? _self.cuisineTypes : cuisineTypes // ignore: cast_nullable_to_non_nullable
as List<String>,minRating: null == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodDefaults].
extension FoodDefaultsPatterns on FoodDefaults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodDefaults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodDefaults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodDefaults value)  $default,){
final _that = this;
switch (_that) {
case _FoodDefaults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodDefaults value)?  $default,){
final _that = this;
switch (_that) {
case _FoodDefaults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> dietaryPreferences,  List<String> cuisineTypes,  double minRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodDefaults() when $default != null:
return $default(_that.dietaryPreferences,_that.cuisineTypes,_that.minRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> dietaryPreferences,  List<String> cuisineTypes,  double minRating)  $default,) {final _that = this;
switch (_that) {
case _FoodDefaults():
return $default(_that.dietaryPreferences,_that.cuisineTypes,_that.minRating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> dietaryPreferences,  List<String> cuisineTypes,  double minRating)?  $default,) {final _that = this;
switch (_that) {
case _FoodDefaults() when $default != null:
return $default(_that.dietaryPreferences,_that.cuisineTypes,_that.minRating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodDefaults implements FoodDefaults {
  const _FoodDefaults({final  List<String> dietaryPreferences = const [], final  List<String> cuisineTypes = const [], this.minRating = 3.0}): _dietaryPreferences = dietaryPreferences,_cuisineTypes = cuisineTypes;
  factory _FoodDefaults.fromJson(Map<String, dynamic> json) => _$FoodDefaultsFromJson(json);

 final  List<String> _dietaryPreferences;
@override@JsonKey() List<String> get dietaryPreferences {
  if (_dietaryPreferences is EqualUnmodifiableListView) return _dietaryPreferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietaryPreferences);
}

// vegan, vegetarian, halal, etc.
 final  List<String> _cuisineTypes;
// vegan, vegetarian, halal, etc.
@override@JsonKey() List<String> get cuisineTypes {
  if (_cuisineTypes is EqualUnmodifiableListView) return _cuisineTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cuisineTypes);
}

@override@JsonKey() final  double minRating;

/// Create a copy of FoodDefaults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodDefaultsCopyWith<_FoodDefaults> get copyWith => __$FoodDefaultsCopyWithImpl<_FoodDefaults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodDefaultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodDefaults&&const DeepCollectionEquality().equals(other._dietaryPreferences, _dietaryPreferences)&&const DeepCollectionEquality().equals(other._cuisineTypes, _cuisineTypes)&&(identical(other.minRating, minRating) || other.minRating == minRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dietaryPreferences),const DeepCollectionEquality().hash(_cuisineTypes),minRating);

@override
String toString() {
  return 'FoodDefaults(dietaryPreferences: $dietaryPreferences, cuisineTypes: $cuisineTypes, minRating: $minRating)';
}


}

/// @nodoc
abstract mixin class _$FoodDefaultsCopyWith<$Res> implements $FoodDefaultsCopyWith<$Res> {
  factory _$FoodDefaultsCopyWith(_FoodDefaults value, $Res Function(_FoodDefaults) _then) = __$FoodDefaultsCopyWithImpl;
@override @useResult
$Res call({
 List<String> dietaryPreferences, List<String> cuisineTypes, double minRating
});




}
/// @nodoc
class __$FoodDefaultsCopyWithImpl<$Res>
    implements _$FoodDefaultsCopyWith<$Res> {
  __$FoodDefaultsCopyWithImpl(this._self, this._then);

  final _FoodDefaults _self;
  final $Res Function(_FoodDefaults) _then;

/// Create a copy of FoodDefaults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dietaryPreferences = null,Object? cuisineTypes = null,Object? minRating = null,}) {
  return _then(_FoodDefaults(
dietaryPreferences: null == dietaryPreferences ? _self._dietaryPreferences : dietaryPreferences // ignore: cast_nullable_to_non_nullable
as List<String>,cuisineTypes: null == cuisineTypes ? _self._cuisineTypes : cuisineTypes // ignore: cast_nullable_to_non_nullable
as List<String>,minRating: null == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$TrailDefaults {

 List<String> get difficulties;// easy, moderate, hard
 int? get maxDurationMinutes; int? get maxDistanceKm;
/// Create a copy of TrailDefaults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailDefaultsCopyWith<TrailDefaults> get copyWith => _$TrailDefaultsCopyWithImpl<TrailDefaults>(this as TrailDefaults, _$identity);

  /// Serializes this TrailDefaults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailDefaults&&const DeepCollectionEquality().equals(other.difficulties, difficulties)&&(identical(other.maxDurationMinutes, maxDurationMinutes) || other.maxDurationMinutes == maxDurationMinutes)&&(identical(other.maxDistanceKm, maxDistanceKm) || other.maxDistanceKm == maxDistanceKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(difficulties),maxDurationMinutes,maxDistanceKm);

@override
String toString() {
  return 'TrailDefaults(difficulties: $difficulties, maxDurationMinutes: $maxDurationMinutes, maxDistanceKm: $maxDistanceKm)';
}


}

/// @nodoc
abstract mixin class $TrailDefaultsCopyWith<$Res>  {
  factory $TrailDefaultsCopyWith(TrailDefaults value, $Res Function(TrailDefaults) _then) = _$TrailDefaultsCopyWithImpl;
@useResult
$Res call({
 List<String> difficulties, int? maxDurationMinutes, int? maxDistanceKm
});




}
/// @nodoc
class _$TrailDefaultsCopyWithImpl<$Res>
    implements $TrailDefaultsCopyWith<$Res> {
  _$TrailDefaultsCopyWithImpl(this._self, this._then);

  final TrailDefaults _self;
  final $Res Function(TrailDefaults) _then;

/// Create a copy of TrailDefaults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? difficulties = null,Object? maxDurationMinutes = freezed,Object? maxDistanceKm = freezed,}) {
  return _then(_self.copyWith(
difficulties: null == difficulties ? _self.difficulties : difficulties // ignore: cast_nullable_to_non_nullable
as List<String>,maxDurationMinutes: freezed == maxDurationMinutes ? _self.maxDurationMinutes : maxDurationMinutes // ignore: cast_nullable_to_non_nullable
as int?,maxDistanceKm: freezed == maxDistanceKm ? _self.maxDistanceKm : maxDistanceKm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrailDefaults].
extension TrailDefaultsPatterns on TrailDefaults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailDefaults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailDefaults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailDefaults value)  $default,){
final _that = this;
switch (_that) {
case _TrailDefaults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailDefaults value)?  $default,){
final _that = this;
switch (_that) {
case _TrailDefaults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> difficulties,  int? maxDurationMinutes,  int? maxDistanceKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailDefaults() when $default != null:
return $default(_that.difficulties,_that.maxDurationMinutes,_that.maxDistanceKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> difficulties,  int? maxDurationMinutes,  int? maxDistanceKm)  $default,) {final _that = this;
switch (_that) {
case _TrailDefaults():
return $default(_that.difficulties,_that.maxDurationMinutes,_that.maxDistanceKm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> difficulties,  int? maxDurationMinutes,  int? maxDistanceKm)?  $default,) {final _that = this;
switch (_that) {
case _TrailDefaults() when $default != null:
return $default(_that.difficulties,_that.maxDurationMinutes,_that.maxDistanceKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailDefaults implements TrailDefaults {
  const _TrailDefaults({final  List<String> difficulties = const [], this.maxDurationMinutes, this.maxDistanceKm}): _difficulties = difficulties;
  factory _TrailDefaults.fromJson(Map<String, dynamic> json) => _$TrailDefaultsFromJson(json);

 final  List<String> _difficulties;
@override@JsonKey() List<String> get difficulties {
  if (_difficulties is EqualUnmodifiableListView) return _difficulties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_difficulties);
}

// easy, moderate, hard
@override final  int? maxDurationMinutes;
@override final  int? maxDistanceKm;

/// Create a copy of TrailDefaults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailDefaultsCopyWith<_TrailDefaults> get copyWith => __$TrailDefaultsCopyWithImpl<_TrailDefaults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailDefaultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailDefaults&&const DeepCollectionEquality().equals(other._difficulties, _difficulties)&&(identical(other.maxDurationMinutes, maxDurationMinutes) || other.maxDurationMinutes == maxDurationMinutes)&&(identical(other.maxDistanceKm, maxDistanceKm) || other.maxDistanceKm == maxDistanceKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_difficulties),maxDurationMinutes,maxDistanceKm);

@override
String toString() {
  return 'TrailDefaults(difficulties: $difficulties, maxDurationMinutes: $maxDurationMinutes, maxDistanceKm: $maxDistanceKm)';
}


}

/// @nodoc
abstract mixin class _$TrailDefaultsCopyWith<$Res> implements $TrailDefaultsCopyWith<$Res> {
  factory _$TrailDefaultsCopyWith(_TrailDefaults value, $Res Function(_TrailDefaults) _then) = __$TrailDefaultsCopyWithImpl;
@override @useResult
$Res call({
 List<String> difficulties, int? maxDurationMinutes, int? maxDistanceKm
});




}
/// @nodoc
class __$TrailDefaultsCopyWithImpl<$Res>
    implements _$TrailDefaultsCopyWith<$Res> {
  __$TrailDefaultsCopyWithImpl(this._self, this._then);

  final _TrailDefaults _self;
  final $Res Function(_TrailDefaults) _then;

/// Create a copy of TrailDefaults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? difficulties = null,Object? maxDurationMinutes = freezed,Object? maxDistanceKm = freezed,}) {
  return _then(_TrailDefaults(
difficulties: null == difficulties ? _self._difficulties : difficulties // ignore: cast_nullable_to_non_nullable
as List<String>,maxDurationMinutes: freezed == maxDurationMinutes ? _self.maxDurationMinutes : maxDurationMinutes // ignore: cast_nullable_to_non_nullable
as int?,maxDistanceKm: freezed == maxDistanceKm ? _self.maxDistanceKm : maxDistanceKm // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$NotificationPrefs {

 NotificationChannels get channels; NotificationCategories get categories; QuietHours? get quietHours; bool get tripOnlyMode;
/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPrefsCopyWith<NotificationPrefs> get copyWith => _$NotificationPrefsCopyWithImpl<NotificationPrefs>(this as NotificationPrefs, _$identity);

  /// Serializes this NotificationPrefs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPrefs&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.categories, categories) || other.categories == categories)&&(identical(other.quietHours, quietHours) || other.quietHours == quietHours)&&(identical(other.tripOnlyMode, tripOnlyMode) || other.tripOnlyMode == tripOnlyMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channels,categories,quietHours,tripOnlyMode);

@override
String toString() {
  return 'NotificationPrefs(channels: $channels, categories: $categories, quietHours: $quietHours, tripOnlyMode: $tripOnlyMode)';
}


}

/// @nodoc
abstract mixin class $NotificationPrefsCopyWith<$Res>  {
  factory $NotificationPrefsCopyWith(NotificationPrefs value, $Res Function(NotificationPrefs) _then) = _$NotificationPrefsCopyWithImpl;
@useResult
$Res call({
 NotificationChannels channels, NotificationCategories categories, QuietHours? quietHours, bool tripOnlyMode
});


$NotificationChannelsCopyWith<$Res> get channels;$NotificationCategoriesCopyWith<$Res> get categories;$QuietHoursCopyWith<$Res>? get quietHours;

}
/// @nodoc
class _$NotificationPrefsCopyWithImpl<$Res>
    implements $NotificationPrefsCopyWith<$Res> {
  _$NotificationPrefsCopyWithImpl(this._self, this._then);

  final NotificationPrefs _self;
  final $Res Function(NotificationPrefs) _then;

/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? channels = null,Object? categories = null,Object? quietHours = freezed,Object? tripOnlyMode = null,}) {
  return _then(_self.copyWith(
channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as NotificationChannels,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as NotificationCategories,quietHours: freezed == quietHours ? _self.quietHours : quietHours // ignore: cast_nullable_to_non_nullable
as QuietHours?,tripOnlyMode: null == tripOnlyMode ? _self.tripOnlyMode : tripOnlyMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationChannelsCopyWith<$Res> get channels {
  
  return $NotificationChannelsCopyWith<$Res>(_self.channels, (value) {
    return _then(_self.copyWith(channels: value));
  });
}/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationCategoriesCopyWith<$Res> get categories {
  
  return $NotificationCategoriesCopyWith<$Res>(_self.categories, (value) {
    return _then(_self.copyWith(categories: value));
  });
}/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuietHoursCopyWith<$Res>? get quietHours {
    if (_self.quietHours == null) {
    return null;
  }

  return $QuietHoursCopyWith<$Res>(_self.quietHours!, (value) {
    return _then(_self.copyWith(quietHours: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationPrefs].
extension NotificationPrefsPatterns on NotificationPrefs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPrefs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPrefs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPrefs value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPrefs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPrefs value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPrefs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationChannels channels,  NotificationCategories categories,  QuietHours? quietHours,  bool tripOnlyMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPrefs() when $default != null:
return $default(_that.channels,_that.categories,_that.quietHours,_that.tripOnlyMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationChannels channels,  NotificationCategories categories,  QuietHours? quietHours,  bool tripOnlyMode)  $default,) {final _that = this;
switch (_that) {
case _NotificationPrefs():
return $default(_that.channels,_that.categories,_that.quietHours,_that.tripOnlyMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationChannels channels,  NotificationCategories categories,  QuietHours? quietHours,  bool tripOnlyMode)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPrefs() when $default != null:
return $default(_that.channels,_that.categories,_that.quietHours,_that.tripOnlyMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPrefs implements NotificationPrefs {
  const _NotificationPrefs({this.channels = const NotificationChannels(), this.categories = const NotificationCategories(), this.quietHours, this.tripOnlyMode = false});
  factory _NotificationPrefs.fromJson(Map<String, dynamic> json) => _$NotificationPrefsFromJson(json);

@override@JsonKey() final  NotificationChannels channels;
@override@JsonKey() final  NotificationCategories categories;
@override final  QuietHours? quietHours;
@override@JsonKey() final  bool tripOnlyMode;

/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPrefsCopyWith<_NotificationPrefs> get copyWith => __$NotificationPrefsCopyWithImpl<_NotificationPrefs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPrefsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPrefs&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.categories, categories) || other.categories == categories)&&(identical(other.quietHours, quietHours) || other.quietHours == quietHours)&&(identical(other.tripOnlyMode, tripOnlyMode) || other.tripOnlyMode == tripOnlyMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,channels,categories,quietHours,tripOnlyMode);

@override
String toString() {
  return 'NotificationPrefs(channels: $channels, categories: $categories, quietHours: $quietHours, tripOnlyMode: $tripOnlyMode)';
}


}

/// @nodoc
abstract mixin class _$NotificationPrefsCopyWith<$Res> implements $NotificationPrefsCopyWith<$Res> {
  factory _$NotificationPrefsCopyWith(_NotificationPrefs value, $Res Function(_NotificationPrefs) _then) = __$NotificationPrefsCopyWithImpl;
@override @useResult
$Res call({
 NotificationChannels channels, NotificationCategories categories, QuietHours? quietHours, bool tripOnlyMode
});


@override $NotificationChannelsCopyWith<$Res> get channels;@override $NotificationCategoriesCopyWith<$Res> get categories;@override $QuietHoursCopyWith<$Res>? get quietHours;

}
/// @nodoc
class __$NotificationPrefsCopyWithImpl<$Res>
    implements _$NotificationPrefsCopyWith<$Res> {
  __$NotificationPrefsCopyWithImpl(this._self, this._then);

  final _NotificationPrefs _self;
  final $Res Function(_NotificationPrefs) _then;

/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? channels = null,Object? categories = null,Object? quietHours = freezed,Object? tripOnlyMode = null,}) {
  return _then(_NotificationPrefs(
channels: null == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as NotificationChannels,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as NotificationCategories,quietHours: freezed == quietHours ? _self.quietHours : quietHours // ignore: cast_nullable_to_non_nullable
as QuietHours?,tripOnlyMode: null == tripOnlyMode ? _self.tripOnlyMode : tripOnlyMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationChannelsCopyWith<$Res> get channels {
  
  return $NotificationChannelsCopyWith<$Res>(_self.channels, (value) {
    return _then(_self.copyWith(channels: value));
  });
}/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationCategoriesCopyWith<$Res> get categories {
  
  return $NotificationCategoriesCopyWith<$Res>(_self.categories, (value) {
    return _then(_self.copyWith(categories: value));
  });
}/// Create a copy of NotificationPrefs
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuietHoursCopyWith<$Res>? get quietHours {
    if (_self.quietHours == null) {
    return null;
  }

  return $QuietHoursCopyWith<$Res>(_self.quietHours!, (value) {
    return _then(_self.copyWith(quietHours: value));
  });
}
}


/// @nodoc
mixin _$NotificationChannels {

 bool get push; bool get email;
/// Create a copy of NotificationChannels
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationChannelsCopyWith<NotificationChannels> get copyWith => _$NotificationChannelsCopyWithImpl<NotificationChannels>(this as NotificationChannels, _$identity);

  /// Serializes this NotificationChannels to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationChannels&&(identical(other.push, push) || other.push == push)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,push,email);

@override
String toString() {
  return 'NotificationChannels(push: $push, email: $email)';
}


}

/// @nodoc
abstract mixin class $NotificationChannelsCopyWith<$Res>  {
  factory $NotificationChannelsCopyWith(NotificationChannels value, $Res Function(NotificationChannels) _then) = _$NotificationChannelsCopyWithImpl;
@useResult
$Res call({
 bool push, bool email
});




}
/// @nodoc
class _$NotificationChannelsCopyWithImpl<$Res>
    implements $NotificationChannelsCopyWith<$Res> {
  _$NotificationChannelsCopyWithImpl(this._self, this._then);

  final NotificationChannels _self;
  final $Res Function(NotificationChannels) _then;

/// Create a copy of NotificationChannels
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? push = null,Object? email = null,}) {
  return _then(_self.copyWith(
push: null == push ? _self.push : push // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationChannels].
extension NotificationChannelsPatterns on NotificationChannels {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationChannels value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationChannels() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationChannels value)  $default,){
final _that = this;
switch (_that) {
case _NotificationChannels():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationChannels value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationChannels() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool push,  bool email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationChannels() when $default != null:
return $default(_that.push,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool push,  bool email)  $default,) {final _that = this;
switch (_that) {
case _NotificationChannels():
return $default(_that.push,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool push,  bool email)?  $default,) {final _that = this;
switch (_that) {
case _NotificationChannels() when $default != null:
return $default(_that.push,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationChannels implements NotificationChannels {
  const _NotificationChannels({this.push = true, this.email = true});
  factory _NotificationChannels.fromJson(Map<String, dynamic> json) => _$NotificationChannelsFromJson(json);

@override@JsonKey() final  bool push;
@override@JsonKey() final  bool email;

/// Create a copy of NotificationChannels
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationChannelsCopyWith<_NotificationChannels> get copyWith => __$NotificationChannelsCopyWithImpl<_NotificationChannels>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationChannelsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationChannels&&(identical(other.push, push) || other.push == push)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,push,email);

@override
String toString() {
  return 'NotificationChannels(push: $push, email: $email)';
}


}

/// @nodoc
abstract mixin class _$NotificationChannelsCopyWith<$Res> implements $NotificationChannelsCopyWith<$Res> {
  factory _$NotificationChannelsCopyWith(_NotificationChannels value, $Res Function(_NotificationChannels) _then) = __$NotificationChannelsCopyWithImpl;
@override @useResult
$Res call({
 bool push, bool email
});




}
/// @nodoc
class __$NotificationChannelsCopyWithImpl<$Res>
    implements _$NotificationChannelsCopyWith<$Res> {
  __$NotificationChannelsCopyWithImpl(this._self, this._then);

  final _NotificationChannels _self;
  final $Res Function(_NotificationChannels) _then;

/// Create a copy of NotificationChannels
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? push = null,Object? email = null,}) {
  return _then(_NotificationChannels(
push: null == push ? _self.push : push // ignore: cast_nullable_to_non_nullable
as bool,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$NotificationCategories {

 bool get bookingUpdates; bool get saveSyncStatus; bool get plannerReminders; bool get leaveNow;
/// Create a copy of NotificationCategories
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCategoriesCopyWith<NotificationCategories> get copyWith => _$NotificationCategoriesCopyWithImpl<NotificationCategories>(this as NotificationCategories, _$identity);

  /// Serializes this NotificationCategories to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationCategories&&(identical(other.bookingUpdates, bookingUpdates) || other.bookingUpdates == bookingUpdates)&&(identical(other.saveSyncStatus, saveSyncStatus) || other.saveSyncStatus == saveSyncStatus)&&(identical(other.plannerReminders, plannerReminders) || other.plannerReminders == plannerReminders)&&(identical(other.leaveNow, leaveNow) || other.leaveNow == leaveNow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingUpdates,saveSyncStatus,plannerReminders,leaveNow);

@override
String toString() {
  return 'NotificationCategories(bookingUpdates: $bookingUpdates, saveSyncStatus: $saveSyncStatus, plannerReminders: $plannerReminders, leaveNow: $leaveNow)';
}


}

/// @nodoc
abstract mixin class $NotificationCategoriesCopyWith<$Res>  {
  factory $NotificationCategoriesCopyWith(NotificationCategories value, $Res Function(NotificationCategories) _then) = _$NotificationCategoriesCopyWithImpl;
@useResult
$Res call({
 bool bookingUpdates, bool saveSyncStatus, bool plannerReminders, bool leaveNow
});




}
/// @nodoc
class _$NotificationCategoriesCopyWithImpl<$Res>
    implements $NotificationCategoriesCopyWith<$Res> {
  _$NotificationCategoriesCopyWithImpl(this._self, this._then);

  final NotificationCategories _self;
  final $Res Function(NotificationCategories) _then;

/// Create a copy of NotificationCategories
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookingUpdates = null,Object? saveSyncStatus = null,Object? plannerReminders = null,Object? leaveNow = null,}) {
  return _then(_self.copyWith(
bookingUpdates: null == bookingUpdates ? _self.bookingUpdates : bookingUpdates // ignore: cast_nullable_to_non_nullable
as bool,saveSyncStatus: null == saveSyncStatus ? _self.saveSyncStatus : saveSyncStatus // ignore: cast_nullable_to_non_nullable
as bool,plannerReminders: null == plannerReminders ? _self.plannerReminders : plannerReminders // ignore: cast_nullable_to_non_nullable
as bool,leaveNow: null == leaveNow ? _self.leaveNow : leaveNow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationCategories].
extension NotificationCategoriesPatterns on NotificationCategories {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationCategories value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationCategories() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationCategories value)  $default,){
final _that = this;
switch (_that) {
case _NotificationCategories():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationCategories value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationCategories() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool bookingUpdates,  bool saveSyncStatus,  bool plannerReminders,  bool leaveNow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationCategories() when $default != null:
return $default(_that.bookingUpdates,_that.saveSyncStatus,_that.plannerReminders,_that.leaveNow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool bookingUpdates,  bool saveSyncStatus,  bool plannerReminders,  bool leaveNow)  $default,) {final _that = this;
switch (_that) {
case _NotificationCategories():
return $default(_that.bookingUpdates,_that.saveSyncStatus,_that.plannerReminders,_that.leaveNow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool bookingUpdates,  bool saveSyncStatus,  bool plannerReminders,  bool leaveNow)?  $default,) {final _that = this;
switch (_that) {
case _NotificationCategories() when $default != null:
return $default(_that.bookingUpdates,_that.saveSyncStatus,_that.plannerReminders,_that.leaveNow);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationCategories implements NotificationCategories {
  const _NotificationCategories({this.bookingUpdates = true, this.saveSyncStatus = true, this.plannerReminders = true, this.leaveNow = true});
  factory _NotificationCategories.fromJson(Map<String, dynamic> json) => _$NotificationCategoriesFromJson(json);

@override@JsonKey() final  bool bookingUpdates;
@override@JsonKey() final  bool saveSyncStatus;
@override@JsonKey() final  bool plannerReminders;
@override@JsonKey() final  bool leaveNow;

/// Create a copy of NotificationCategories
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationCategoriesCopyWith<_NotificationCategories> get copyWith => __$NotificationCategoriesCopyWithImpl<_NotificationCategories>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationCategoriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationCategories&&(identical(other.bookingUpdates, bookingUpdates) || other.bookingUpdates == bookingUpdates)&&(identical(other.saveSyncStatus, saveSyncStatus) || other.saveSyncStatus == saveSyncStatus)&&(identical(other.plannerReminders, plannerReminders) || other.plannerReminders == plannerReminders)&&(identical(other.leaveNow, leaveNow) || other.leaveNow == leaveNow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bookingUpdates,saveSyncStatus,plannerReminders,leaveNow);

@override
String toString() {
  return 'NotificationCategories(bookingUpdates: $bookingUpdates, saveSyncStatus: $saveSyncStatus, plannerReminders: $plannerReminders, leaveNow: $leaveNow)';
}


}

/// @nodoc
abstract mixin class _$NotificationCategoriesCopyWith<$Res> implements $NotificationCategoriesCopyWith<$Res> {
  factory _$NotificationCategoriesCopyWith(_NotificationCategories value, $Res Function(_NotificationCategories) _then) = __$NotificationCategoriesCopyWithImpl;
@override @useResult
$Res call({
 bool bookingUpdates, bool saveSyncStatus, bool plannerReminders, bool leaveNow
});




}
/// @nodoc
class __$NotificationCategoriesCopyWithImpl<$Res>
    implements _$NotificationCategoriesCopyWith<$Res> {
  __$NotificationCategoriesCopyWithImpl(this._self, this._then);

  final _NotificationCategories _self;
  final $Res Function(_NotificationCategories) _then;

/// Create a copy of NotificationCategories
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookingUpdates = null,Object? saveSyncStatus = null,Object? plannerReminders = null,Object? leaveNow = null,}) {
  return _then(_NotificationCategories(
bookingUpdates: null == bookingUpdates ? _self.bookingUpdates : bookingUpdates // ignore: cast_nullable_to_non_nullable
as bool,saveSyncStatus: null == saveSyncStatus ? _self.saveSyncStatus : saveSyncStatus // ignore: cast_nullable_to_non_nullable
as bool,plannerReminders: null == plannerReminders ? _self.plannerReminders : plannerReminders // ignore: cast_nullable_to_non_nullable
as bool,leaveNow: null == leaveNow ? _self.leaveNow : leaveNow // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$QuietHours {

 int get startHour;// 0-23
 int get endHour;
/// Create a copy of QuietHours
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuietHoursCopyWith<QuietHours> get copyWith => _$QuietHoursCopyWithImpl<QuietHours>(this as QuietHours, _$identity);

  /// Serializes this QuietHours to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuietHours&&(identical(other.startHour, startHour) || other.startHour == startHour)&&(identical(other.endHour, endHour) || other.endHour == endHour));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startHour,endHour);

@override
String toString() {
  return 'QuietHours(startHour: $startHour, endHour: $endHour)';
}


}

/// @nodoc
abstract mixin class $QuietHoursCopyWith<$Res>  {
  factory $QuietHoursCopyWith(QuietHours value, $Res Function(QuietHours) _then) = _$QuietHoursCopyWithImpl;
@useResult
$Res call({
 int startHour, int endHour
});




}
/// @nodoc
class _$QuietHoursCopyWithImpl<$Res>
    implements $QuietHoursCopyWith<$Res> {
  _$QuietHoursCopyWithImpl(this._self, this._then);

  final QuietHours _self;
  final $Res Function(QuietHours) _then;

/// Create a copy of QuietHours
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startHour = null,Object? endHour = null,}) {
  return _then(_self.copyWith(
startHour: null == startHour ? _self.startHour : startHour // ignore: cast_nullable_to_non_nullable
as int,endHour: null == endHour ? _self.endHour : endHour // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuietHours].
extension QuietHoursPatterns on QuietHours {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuietHours value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuietHours() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuietHours value)  $default,){
final _that = this;
switch (_that) {
case _QuietHours():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuietHours value)?  $default,){
final _that = this;
switch (_that) {
case _QuietHours() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int startHour,  int endHour)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuietHours() when $default != null:
return $default(_that.startHour,_that.endHour);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int startHour,  int endHour)  $default,) {final _that = this;
switch (_that) {
case _QuietHours():
return $default(_that.startHour,_that.endHour);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int startHour,  int endHour)?  $default,) {final _that = this;
switch (_that) {
case _QuietHours() when $default != null:
return $default(_that.startHour,_that.endHour);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuietHours implements QuietHours {
  const _QuietHours({required this.startHour, required this.endHour});
  factory _QuietHours.fromJson(Map<String, dynamic> json) => _$QuietHoursFromJson(json);

@override final  int startHour;
// 0-23
@override final  int endHour;

/// Create a copy of QuietHours
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuietHoursCopyWith<_QuietHours> get copyWith => __$QuietHoursCopyWithImpl<_QuietHours>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuietHoursToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuietHours&&(identical(other.startHour, startHour) || other.startHour == startHour)&&(identical(other.endHour, endHour) || other.endHour == endHour));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startHour,endHour);

@override
String toString() {
  return 'QuietHours(startHour: $startHour, endHour: $endHour)';
}


}

/// @nodoc
abstract mixin class _$QuietHoursCopyWith<$Res> implements $QuietHoursCopyWith<$Res> {
  factory _$QuietHoursCopyWith(_QuietHours value, $Res Function(_QuietHours) _then) = __$QuietHoursCopyWithImpl;
@override @useResult
$Res call({
 int startHour, int endHour
});




}
/// @nodoc
class __$QuietHoursCopyWithImpl<$Res>
    implements _$QuietHoursCopyWith<$Res> {
  __$QuietHoursCopyWithImpl(this._self, this._then);

  final _QuietHours _self;
  final $Res Function(_QuietHours) _then;

/// Create a copy of QuietHours
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startHour = null,Object? endHour = null,}) {
  return _then(_QuietHours(
startHour: null == startHour ? _self.startHour : startHour // ignore: cast_nullable_to_non_nullable
as int,endHour: null == endHour ? _self.endHour : endHour // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PrivacySettings {

 bool get analyticsOptIn; bool get diagnosticsOptIn; SnapshotDefaults get snapshotDefaults; List<String> get connectedIntegrations;
/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacySettingsCopyWith<PrivacySettings> get copyWith => _$PrivacySettingsCopyWithImpl<PrivacySettings>(this as PrivacySettings, _$identity);

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacySettings&&(identical(other.analyticsOptIn, analyticsOptIn) || other.analyticsOptIn == analyticsOptIn)&&(identical(other.diagnosticsOptIn, diagnosticsOptIn) || other.diagnosticsOptIn == diagnosticsOptIn)&&(identical(other.snapshotDefaults, snapshotDefaults) || other.snapshotDefaults == snapshotDefaults)&&const DeepCollectionEquality().equals(other.connectedIntegrations, connectedIntegrations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analyticsOptIn,diagnosticsOptIn,snapshotDefaults,const DeepCollectionEquality().hash(connectedIntegrations));

@override
String toString() {
  return 'PrivacySettings(analyticsOptIn: $analyticsOptIn, diagnosticsOptIn: $diagnosticsOptIn, snapshotDefaults: $snapshotDefaults, connectedIntegrations: $connectedIntegrations)';
}


}

/// @nodoc
abstract mixin class $PrivacySettingsCopyWith<$Res>  {
  factory $PrivacySettingsCopyWith(PrivacySettings value, $Res Function(PrivacySettings) _then) = _$PrivacySettingsCopyWithImpl;
@useResult
$Res call({
 bool analyticsOptIn, bool diagnosticsOptIn, SnapshotDefaults snapshotDefaults, List<String> connectedIntegrations
});


$SnapshotDefaultsCopyWith<$Res> get snapshotDefaults;

}
/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._self, this._then);

  final PrivacySettings _self;
  final $Res Function(PrivacySettings) _then;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? analyticsOptIn = null,Object? diagnosticsOptIn = null,Object? snapshotDefaults = null,Object? connectedIntegrations = null,}) {
  return _then(_self.copyWith(
analyticsOptIn: null == analyticsOptIn ? _self.analyticsOptIn : analyticsOptIn // ignore: cast_nullable_to_non_nullable
as bool,diagnosticsOptIn: null == diagnosticsOptIn ? _self.diagnosticsOptIn : diagnosticsOptIn // ignore: cast_nullable_to_non_nullable
as bool,snapshotDefaults: null == snapshotDefaults ? _self.snapshotDefaults : snapshotDefaults // ignore: cast_nullable_to_non_nullable
as SnapshotDefaults,connectedIntegrations: null == connectedIntegrations ? _self.connectedIntegrations : connectedIntegrations // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotDefaultsCopyWith<$Res> get snapshotDefaults {
  
  return $SnapshotDefaultsCopyWith<$Res>(_self.snapshotDefaults, (value) {
    return _then(_self.copyWith(snapshotDefaults: value));
  });
}
}


/// Adds pattern-matching-related methods to [PrivacySettings].
extension PrivacySettingsPatterns on PrivacySettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacySettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacySettings value)  $default,){
final _that = this;
switch (_that) {
case _PrivacySettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacySettings value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool analyticsOptIn,  bool diagnosticsOptIn,  SnapshotDefaults snapshotDefaults,  List<String> connectedIntegrations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that.analyticsOptIn,_that.diagnosticsOptIn,_that.snapshotDefaults,_that.connectedIntegrations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool analyticsOptIn,  bool diagnosticsOptIn,  SnapshotDefaults snapshotDefaults,  List<String> connectedIntegrations)  $default,) {final _that = this;
switch (_that) {
case _PrivacySettings():
return $default(_that.analyticsOptIn,_that.diagnosticsOptIn,_that.snapshotDefaults,_that.connectedIntegrations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool analyticsOptIn,  bool diagnosticsOptIn,  SnapshotDefaults snapshotDefaults,  List<String> connectedIntegrations)?  $default,) {final _that = this;
switch (_that) {
case _PrivacySettings() when $default != null:
return $default(_that.analyticsOptIn,_that.diagnosticsOptIn,_that.snapshotDefaults,_that.connectedIntegrations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrivacySettings implements PrivacySettings {
  const _PrivacySettings({this.analyticsOptIn = true, this.diagnosticsOptIn = true, this.snapshotDefaults = const SnapshotDefaults(), final  List<String> connectedIntegrations = const []}): _connectedIntegrations = connectedIntegrations;
  factory _PrivacySettings.fromJson(Map<String, dynamic> json) => _$PrivacySettingsFromJson(json);

@override@JsonKey() final  bool analyticsOptIn;
@override@JsonKey() final  bool diagnosticsOptIn;
@override@JsonKey() final  SnapshotDefaults snapshotDefaults;
 final  List<String> _connectedIntegrations;
@override@JsonKey() List<String> get connectedIntegrations {
  if (_connectedIntegrations is EqualUnmodifiableListView) return _connectedIntegrations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectedIntegrations);
}


/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacySettingsCopyWith<_PrivacySettings> get copyWith => __$PrivacySettingsCopyWithImpl<_PrivacySettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacySettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacySettings&&(identical(other.analyticsOptIn, analyticsOptIn) || other.analyticsOptIn == analyticsOptIn)&&(identical(other.diagnosticsOptIn, diagnosticsOptIn) || other.diagnosticsOptIn == diagnosticsOptIn)&&(identical(other.snapshotDefaults, snapshotDefaults) || other.snapshotDefaults == snapshotDefaults)&&const DeepCollectionEquality().equals(other._connectedIntegrations, _connectedIntegrations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analyticsOptIn,diagnosticsOptIn,snapshotDefaults,const DeepCollectionEquality().hash(_connectedIntegrations));

@override
String toString() {
  return 'PrivacySettings(analyticsOptIn: $analyticsOptIn, diagnosticsOptIn: $diagnosticsOptIn, snapshotDefaults: $snapshotDefaults, connectedIntegrations: $connectedIntegrations)';
}


}

/// @nodoc
abstract mixin class _$PrivacySettingsCopyWith<$Res> implements $PrivacySettingsCopyWith<$Res> {
  factory _$PrivacySettingsCopyWith(_PrivacySettings value, $Res Function(_PrivacySettings) _then) = __$PrivacySettingsCopyWithImpl;
@override @useResult
$Res call({
 bool analyticsOptIn, bool diagnosticsOptIn, SnapshotDefaults snapshotDefaults, List<String> connectedIntegrations
});


@override $SnapshotDefaultsCopyWith<$Res> get snapshotDefaults;

}
/// @nodoc
class __$PrivacySettingsCopyWithImpl<$Res>
    implements _$PrivacySettingsCopyWith<$Res> {
  __$PrivacySettingsCopyWithImpl(this._self, this._then);

  final _PrivacySettings _self;
  final $Res Function(_PrivacySettings) _then;

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? analyticsOptIn = null,Object? diagnosticsOptIn = null,Object? snapshotDefaults = null,Object? connectedIntegrations = null,}) {
  return _then(_PrivacySettings(
analyticsOptIn: null == analyticsOptIn ? _self.analyticsOptIn : analyticsOptIn // ignore: cast_nullable_to_non_nullable
as bool,diagnosticsOptIn: null == diagnosticsOptIn ? _self.diagnosticsOptIn : diagnosticsOptIn // ignore: cast_nullable_to_non_nullable
as bool,snapshotDefaults: null == snapshotDefaults ? _self.snapshotDefaults : snapshotDefaults // ignore: cast_nullable_to_non_nullable
as SnapshotDefaults,connectedIntegrations: null == connectedIntegrations ? _self._connectedIntegrations : connectedIntegrations // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of PrivacySettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnapshotDefaultsCopyWith<$Res> get snapshotDefaults {
  
  return $SnapshotDefaultsCopyWith<$Res>(_self.snapshotDefaults, (value) {
    return _then(_self.copyWith(snapshotDefaults: value));
  });
}
}


/// @nodoc
mixin _$SnapshotDefaults {

 bool get redactPII; bool get redactPrices; bool get redactNotes; String get photoVisibility;
/// Create a copy of SnapshotDefaults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnapshotDefaultsCopyWith<SnapshotDefaults> get copyWith => _$SnapshotDefaultsCopyWithImpl<SnapshotDefaults>(this as SnapshotDefaults, _$identity);

  /// Serializes this SnapshotDefaults to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnapshotDefaults&&(identical(other.redactPII, redactPII) || other.redactPII == redactPII)&&(identical(other.redactPrices, redactPrices) || other.redactPrices == redactPrices)&&(identical(other.redactNotes, redactNotes) || other.redactNotes == redactNotes)&&(identical(other.photoVisibility, photoVisibility) || other.photoVisibility == photoVisibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,redactPII,redactPrices,redactNotes,photoVisibility);

@override
String toString() {
  return 'SnapshotDefaults(redactPII: $redactPII, redactPrices: $redactPrices, redactNotes: $redactNotes, photoVisibility: $photoVisibility)';
}


}

/// @nodoc
abstract mixin class $SnapshotDefaultsCopyWith<$Res>  {
  factory $SnapshotDefaultsCopyWith(SnapshotDefaults value, $Res Function(SnapshotDefaults) _then) = _$SnapshotDefaultsCopyWithImpl;
@useResult
$Res call({
 bool redactPII, bool redactPrices, bool redactNotes, String photoVisibility
});




}
/// @nodoc
class _$SnapshotDefaultsCopyWithImpl<$Res>
    implements $SnapshotDefaultsCopyWith<$Res> {
  _$SnapshotDefaultsCopyWithImpl(this._self, this._then);

  final SnapshotDefaults _self;
  final $Res Function(SnapshotDefaults) _then;

/// Create a copy of SnapshotDefaults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? redactPII = null,Object? redactPrices = null,Object? redactNotes = null,Object? photoVisibility = null,}) {
  return _then(_self.copyWith(
redactPII: null == redactPII ? _self.redactPII : redactPII // ignore: cast_nullable_to_non_nullable
as bool,redactPrices: null == redactPrices ? _self.redactPrices : redactPrices // ignore: cast_nullable_to_non_nullable
as bool,redactNotes: null == redactNotes ? _self.redactNotes : redactNotes // ignore: cast_nullable_to_non_nullable
as bool,photoVisibility: null == photoVisibility ? _self.photoVisibility : photoVisibility // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SnapshotDefaults].
extension SnapshotDefaultsPatterns on SnapshotDefaults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnapshotDefaults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnapshotDefaults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnapshotDefaults value)  $default,){
final _that = this;
switch (_that) {
case _SnapshotDefaults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnapshotDefaults value)?  $default,){
final _that = this;
switch (_that) {
case _SnapshotDefaults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool redactPII,  bool redactPrices,  bool redactNotes,  String photoVisibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnapshotDefaults() when $default != null:
return $default(_that.redactPII,_that.redactPrices,_that.redactNotes,_that.photoVisibility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool redactPII,  bool redactPrices,  bool redactNotes,  String photoVisibility)  $default,) {final _that = this;
switch (_that) {
case _SnapshotDefaults():
return $default(_that.redactPII,_that.redactPrices,_that.redactNotes,_that.photoVisibility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool redactPII,  bool redactPrices,  bool redactNotes,  String photoVisibility)?  $default,) {final _that = this;
switch (_that) {
case _SnapshotDefaults() when $default != null:
return $default(_that.redactPII,_that.redactPrices,_that.redactNotes,_that.photoVisibility);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnapshotDefaults implements SnapshotDefaults {
  const _SnapshotDefaults({this.redactPII = true, this.redactPrices = false, this.redactNotes = true, this.photoVisibility = 'visible'});
  factory _SnapshotDefaults.fromJson(Map<String, dynamic> json) => _$SnapshotDefaultsFromJson(json);

@override@JsonKey() final  bool redactPII;
@override@JsonKey() final  bool redactPrices;
@override@JsonKey() final  bool redactNotes;
@override@JsonKey() final  String photoVisibility;

/// Create a copy of SnapshotDefaults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnapshotDefaultsCopyWith<_SnapshotDefaults> get copyWith => __$SnapshotDefaultsCopyWithImpl<_SnapshotDefaults>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnapshotDefaultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnapshotDefaults&&(identical(other.redactPII, redactPII) || other.redactPII == redactPII)&&(identical(other.redactPrices, redactPrices) || other.redactPrices == redactPrices)&&(identical(other.redactNotes, redactNotes) || other.redactNotes == redactNotes)&&(identical(other.photoVisibility, photoVisibility) || other.photoVisibility == photoVisibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,redactPII,redactPrices,redactNotes,photoVisibility);

@override
String toString() {
  return 'SnapshotDefaults(redactPII: $redactPII, redactPrices: $redactPrices, redactNotes: $redactNotes, photoVisibility: $photoVisibility)';
}


}

/// @nodoc
abstract mixin class _$SnapshotDefaultsCopyWith<$Res> implements $SnapshotDefaultsCopyWith<$Res> {
  factory _$SnapshotDefaultsCopyWith(_SnapshotDefaults value, $Res Function(_SnapshotDefaults) _then) = __$SnapshotDefaultsCopyWithImpl;
@override @useResult
$Res call({
 bool redactPII, bool redactPrices, bool redactNotes, String photoVisibility
});




}
/// @nodoc
class __$SnapshotDefaultsCopyWithImpl<$Res>
    implements _$SnapshotDefaultsCopyWith<$Res> {
  __$SnapshotDefaultsCopyWithImpl(this._self, this._then);

  final _SnapshotDefaults _self;
  final $Res Function(_SnapshotDefaults) _then;

/// Create a copy of SnapshotDefaults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? redactPII = null,Object? redactPrices = null,Object? redactNotes = null,Object? photoVisibility = null,}) {
  return _then(_SnapshotDefaults(
redactPII: null == redactPII ? _self.redactPII : redactPII // ignore: cast_nullable_to_non_nullable
as bool,redactPrices: null == redactPrices ? _self.redactPrices : redactPrices // ignore: cast_nullable_to_non_nullable
as bool,redactNotes: null == redactNotes ? _self.redactNotes : redactNotes // ignore: cast_nullable_to_non_nullable
as bool,photoVisibility: null == photoVisibility ? _self.photoVisibility : photoVisibility // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SecurityMeta {

 bool get twoFactorEnabled; String? get twoFactorMethod;// totp, sms
 List<DeviceSession> get activeSessions; DateTime? get lastPasswordChange;
/// Create a copy of SecurityMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecurityMetaCopyWith<SecurityMeta> get copyWith => _$SecurityMetaCopyWithImpl<SecurityMeta>(this as SecurityMeta, _$identity);

  /// Serializes this SecurityMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecurityMeta&&(identical(other.twoFactorEnabled, twoFactorEnabled) || other.twoFactorEnabled == twoFactorEnabled)&&(identical(other.twoFactorMethod, twoFactorMethod) || other.twoFactorMethod == twoFactorMethod)&&const DeepCollectionEquality().equals(other.activeSessions, activeSessions)&&(identical(other.lastPasswordChange, lastPasswordChange) || other.lastPasswordChange == lastPasswordChange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,twoFactorEnabled,twoFactorMethod,const DeepCollectionEquality().hash(activeSessions),lastPasswordChange);

@override
String toString() {
  return 'SecurityMeta(twoFactorEnabled: $twoFactorEnabled, twoFactorMethod: $twoFactorMethod, activeSessions: $activeSessions, lastPasswordChange: $lastPasswordChange)';
}


}

/// @nodoc
abstract mixin class $SecurityMetaCopyWith<$Res>  {
  factory $SecurityMetaCopyWith(SecurityMeta value, $Res Function(SecurityMeta) _then) = _$SecurityMetaCopyWithImpl;
@useResult
$Res call({
 bool twoFactorEnabled, String? twoFactorMethod, List<DeviceSession> activeSessions, DateTime? lastPasswordChange
});




}
/// @nodoc
class _$SecurityMetaCopyWithImpl<$Res>
    implements $SecurityMetaCopyWith<$Res> {
  _$SecurityMetaCopyWithImpl(this._self, this._then);

  final SecurityMeta _self;
  final $Res Function(SecurityMeta) _then;

/// Create a copy of SecurityMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? twoFactorEnabled = null,Object? twoFactorMethod = freezed,Object? activeSessions = null,Object? lastPasswordChange = freezed,}) {
  return _then(_self.copyWith(
twoFactorEnabled: null == twoFactorEnabled ? _self.twoFactorEnabled : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
as bool,twoFactorMethod: freezed == twoFactorMethod ? _self.twoFactorMethod : twoFactorMethod // ignore: cast_nullable_to_non_nullable
as String?,activeSessions: null == activeSessions ? _self.activeSessions : activeSessions // ignore: cast_nullable_to_non_nullable
as List<DeviceSession>,lastPasswordChange: freezed == lastPasswordChange ? _self.lastPasswordChange : lastPasswordChange // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SecurityMeta].
extension SecurityMetaPatterns on SecurityMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecurityMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecurityMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecurityMeta value)  $default,){
final _that = this;
switch (_that) {
case _SecurityMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecurityMeta value)?  $default,){
final _that = this;
switch (_that) {
case _SecurityMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool twoFactorEnabled,  String? twoFactorMethod,  List<DeviceSession> activeSessions,  DateTime? lastPasswordChange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecurityMeta() when $default != null:
return $default(_that.twoFactorEnabled,_that.twoFactorMethod,_that.activeSessions,_that.lastPasswordChange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool twoFactorEnabled,  String? twoFactorMethod,  List<DeviceSession> activeSessions,  DateTime? lastPasswordChange)  $default,) {final _that = this;
switch (_that) {
case _SecurityMeta():
return $default(_that.twoFactorEnabled,_that.twoFactorMethod,_that.activeSessions,_that.lastPasswordChange);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool twoFactorEnabled,  String? twoFactorMethod,  List<DeviceSession> activeSessions,  DateTime? lastPasswordChange)?  $default,) {final _that = this;
switch (_that) {
case _SecurityMeta() when $default != null:
return $default(_that.twoFactorEnabled,_that.twoFactorMethod,_that.activeSessions,_that.lastPasswordChange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecurityMeta implements SecurityMeta {
  const _SecurityMeta({this.twoFactorEnabled = false, this.twoFactorMethod, final  List<DeviceSession> activeSessions = const [], this.lastPasswordChange}): _activeSessions = activeSessions;
  factory _SecurityMeta.fromJson(Map<String, dynamic> json) => _$SecurityMetaFromJson(json);

@override@JsonKey() final  bool twoFactorEnabled;
@override final  String? twoFactorMethod;
// totp, sms
 final  List<DeviceSession> _activeSessions;
// totp, sms
@override@JsonKey() List<DeviceSession> get activeSessions {
  if (_activeSessions is EqualUnmodifiableListView) return _activeSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeSessions);
}

@override final  DateTime? lastPasswordChange;

/// Create a copy of SecurityMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecurityMetaCopyWith<_SecurityMeta> get copyWith => __$SecurityMetaCopyWithImpl<_SecurityMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecurityMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecurityMeta&&(identical(other.twoFactorEnabled, twoFactorEnabled) || other.twoFactorEnabled == twoFactorEnabled)&&(identical(other.twoFactorMethod, twoFactorMethod) || other.twoFactorMethod == twoFactorMethod)&&const DeepCollectionEquality().equals(other._activeSessions, _activeSessions)&&(identical(other.lastPasswordChange, lastPasswordChange) || other.lastPasswordChange == lastPasswordChange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,twoFactorEnabled,twoFactorMethod,const DeepCollectionEquality().hash(_activeSessions),lastPasswordChange);

@override
String toString() {
  return 'SecurityMeta(twoFactorEnabled: $twoFactorEnabled, twoFactorMethod: $twoFactorMethod, activeSessions: $activeSessions, lastPasswordChange: $lastPasswordChange)';
}


}

/// @nodoc
abstract mixin class _$SecurityMetaCopyWith<$Res> implements $SecurityMetaCopyWith<$Res> {
  factory _$SecurityMetaCopyWith(_SecurityMeta value, $Res Function(_SecurityMeta) _then) = __$SecurityMetaCopyWithImpl;
@override @useResult
$Res call({
 bool twoFactorEnabled, String? twoFactorMethod, List<DeviceSession> activeSessions, DateTime? lastPasswordChange
});




}
/// @nodoc
class __$SecurityMetaCopyWithImpl<$Res>
    implements _$SecurityMetaCopyWith<$Res> {
  __$SecurityMetaCopyWithImpl(this._self, this._then);

  final _SecurityMeta _self;
  final $Res Function(_SecurityMeta) _then;

/// Create a copy of SecurityMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? twoFactorEnabled = null,Object? twoFactorMethod = freezed,Object? activeSessions = null,Object? lastPasswordChange = freezed,}) {
  return _then(_SecurityMeta(
twoFactorEnabled: null == twoFactorEnabled ? _self.twoFactorEnabled : twoFactorEnabled // ignore: cast_nullable_to_non_nullable
as bool,twoFactorMethod: freezed == twoFactorMethod ? _self.twoFactorMethod : twoFactorMethod // ignore: cast_nullable_to_non_nullable
as String?,activeSessions: null == activeSessions ? _self._activeSessions : activeSessions // ignore: cast_nullable_to_non_nullable
as List<DeviceSession>,lastPasswordChange: freezed == lastPasswordChange ? _self.lastPasswordChange : lastPasswordChange // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DeviceSession {

 String get sessionId; String get deviceName; String get deviceType; DateTime get lastActive; bool get isCurrent;
/// Create a copy of DeviceSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceSessionCopyWith<DeviceSession> get copyWith => _$DeviceSessionCopyWithImpl<DeviceSession>(this as DeviceSession, _$identity);

  /// Serializes this DeviceSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.lastActive, lastActive) || other.lastActive == lastActive)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,deviceName,deviceType,lastActive,isCurrent);

@override
String toString() {
  return 'DeviceSession(sessionId: $sessionId, deviceName: $deviceName, deviceType: $deviceType, lastActive: $lastActive, isCurrent: $isCurrent)';
}


}

/// @nodoc
abstract mixin class $DeviceSessionCopyWith<$Res>  {
  factory $DeviceSessionCopyWith(DeviceSession value, $Res Function(DeviceSession) _then) = _$DeviceSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId, String deviceName, String deviceType, DateTime lastActive, bool isCurrent
});




}
/// @nodoc
class _$DeviceSessionCopyWithImpl<$Res>
    implements $DeviceSessionCopyWith<$Res> {
  _$DeviceSessionCopyWithImpl(this._self, this._then);

  final DeviceSession _self;
  final $Res Function(DeviceSession) _then;

/// Create a copy of DeviceSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? deviceName = null,Object? deviceType = null,Object? lastActive = null,Object? isCurrent = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,lastActive: null == lastActive ? _self.lastActive : lastActive // ignore: cast_nullable_to_non_nullable
as DateTime,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceSession].
extension DeviceSessionPatterns on DeviceSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceSession value)  $default,){
final _that = this;
switch (_that) {
case _DeviceSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceSession value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String deviceName,  String deviceType,  DateTime lastActive,  bool isCurrent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceSession() when $default != null:
return $default(_that.sessionId,_that.deviceName,_that.deviceType,_that.lastActive,_that.isCurrent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String deviceName,  String deviceType,  DateTime lastActive,  bool isCurrent)  $default,) {final _that = this;
switch (_that) {
case _DeviceSession():
return $default(_that.sessionId,_that.deviceName,_that.deviceType,_that.lastActive,_that.isCurrent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String deviceName,  String deviceType,  DateTime lastActive,  bool isCurrent)?  $default,) {final _that = this;
switch (_that) {
case _DeviceSession() when $default != null:
return $default(_that.sessionId,_that.deviceName,_that.deviceType,_that.lastActive,_that.isCurrent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceSession implements DeviceSession {
  const _DeviceSession({required this.sessionId, required this.deviceName, required this.deviceType, required this.lastActive, this.isCurrent = false});
  factory _DeviceSession.fromJson(Map<String, dynamic> json) => _$DeviceSessionFromJson(json);

@override final  String sessionId;
@override final  String deviceName;
@override final  String deviceType;
@override final  DateTime lastActive;
@override@JsonKey() final  bool isCurrent;

/// Create a copy of DeviceSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceSessionCopyWith<_DeviceSession> get copyWith => __$DeviceSessionCopyWithImpl<_DeviceSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.lastActive, lastActive) || other.lastActive == lastActive)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,deviceName,deviceType,lastActive,isCurrent);

@override
String toString() {
  return 'DeviceSession(sessionId: $sessionId, deviceName: $deviceName, deviceType: $deviceType, lastActive: $lastActive, isCurrent: $isCurrent)';
}


}

/// @nodoc
abstract mixin class _$DeviceSessionCopyWith<$Res> implements $DeviceSessionCopyWith<$Res> {
  factory _$DeviceSessionCopyWith(_DeviceSession value, $Res Function(_DeviceSession) _then) = __$DeviceSessionCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String deviceName, String deviceType, DateTime lastActive, bool isCurrent
});




}
/// @nodoc
class __$DeviceSessionCopyWithImpl<$Res>
    implements _$DeviceSessionCopyWith<$Res> {
  __$DeviceSessionCopyWithImpl(this._self, this._then);

  final _DeviceSession _self;
  final $Res Function(_DeviceSession) _then;

/// Create a copy of DeviceSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? deviceName = null,Object? deviceType = null,Object? lastActive = null,Object? isCurrent = null,}) {
  return _then(_DeviceSession(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,deviceName: null == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,lastActive: null == lastActive ? _self.lastActive : lastActive // ignore: cast_nullable_to_non_nullable
as DateTime,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$StorageEntry {

 String get itineraryId; String get itineraryName; int get sizeBytes; DateTime get downloadedAt; DateTime? get lastSyncedAt;
/// Create a copy of StorageEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageEntryCopyWith<StorageEntry> get copyWith => _$StorageEntryCopyWithImpl<StorageEntry>(this as StorageEntry, _$identity);

  /// Serializes this StorageEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageEntry&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.itineraryName, itineraryName) || other.itineraryName == itineraryName)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.downloadedAt, downloadedAt) || other.downloadedAt == downloadedAt)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,itineraryName,sizeBytes,downloadedAt,lastSyncedAt);

@override
String toString() {
  return 'StorageEntry(itineraryId: $itineraryId, itineraryName: $itineraryName, sizeBytes: $sizeBytes, downloadedAt: $downloadedAt, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class $StorageEntryCopyWith<$Res>  {
  factory $StorageEntryCopyWith(StorageEntry value, $Res Function(StorageEntry) _then) = _$StorageEntryCopyWithImpl;
@useResult
$Res call({
 String itineraryId, String itineraryName, int sizeBytes, DateTime downloadedAt, DateTime? lastSyncedAt
});




}
/// @nodoc
class _$StorageEntryCopyWithImpl<$Res>
    implements $StorageEntryCopyWith<$Res> {
  _$StorageEntryCopyWithImpl(this._self, this._then);

  final StorageEntry _self;
  final $Res Function(StorageEntry) _then;

/// Create a copy of StorageEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? itineraryName = null,Object? sizeBytes = null,Object? downloadedAt = null,Object? lastSyncedAt = freezed,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,itineraryName: null == itineraryName ? _self.itineraryName : itineraryName // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,downloadedAt: null == downloadedAt ? _self.downloadedAt : downloadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StorageEntry].
extension StorageEntryPatterns on StorageEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorageEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorageEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorageEntry value)  $default,){
final _that = this;
switch (_that) {
case _StorageEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorageEntry value)?  $default,){
final _that = this;
switch (_that) {
case _StorageEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  String itineraryName,  int sizeBytes,  DateTime downloadedAt,  DateTime? lastSyncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorageEntry() when $default != null:
return $default(_that.itineraryId,_that.itineraryName,_that.sizeBytes,_that.downloadedAt,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  String itineraryName,  int sizeBytes,  DateTime downloadedAt,  DateTime? lastSyncedAt)  $default,) {final _that = this;
switch (_that) {
case _StorageEntry():
return $default(_that.itineraryId,_that.itineraryName,_that.sizeBytes,_that.downloadedAt,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  String itineraryName,  int sizeBytes,  DateTime downloadedAt,  DateTime? lastSyncedAt)?  $default,) {final _that = this;
switch (_that) {
case _StorageEntry() when $default != null:
return $default(_that.itineraryId,_that.itineraryName,_that.sizeBytes,_that.downloadedAt,_that.lastSyncedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorageEntry implements StorageEntry {
  const _StorageEntry({required this.itineraryId, required this.itineraryName, required this.sizeBytes, required this.downloadedAt, this.lastSyncedAt});
  factory _StorageEntry.fromJson(Map<String, dynamic> json) => _$StorageEntryFromJson(json);

@override final  String itineraryId;
@override final  String itineraryName;
@override final  int sizeBytes;
@override final  DateTime downloadedAt;
@override final  DateTime? lastSyncedAt;

/// Create a copy of StorageEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorageEntryCopyWith<_StorageEntry> get copyWith => __$StorageEntryCopyWithImpl<_StorageEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorageEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorageEntry&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.itineraryName, itineraryName) || other.itineraryName == itineraryName)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.downloadedAt, downloadedAt) || other.downloadedAt == downloadedAt)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,itineraryName,sizeBytes,downloadedAt,lastSyncedAt);

@override
String toString() {
  return 'StorageEntry(itineraryId: $itineraryId, itineraryName: $itineraryName, sizeBytes: $sizeBytes, downloadedAt: $downloadedAt, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class _$StorageEntryCopyWith<$Res> implements $StorageEntryCopyWith<$Res> {
  factory _$StorageEntryCopyWith(_StorageEntry value, $Res Function(_StorageEntry) _then) = __$StorageEntryCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, String itineraryName, int sizeBytes, DateTime downloadedAt, DateTime? lastSyncedAt
});




}
/// @nodoc
class __$StorageEntryCopyWithImpl<$Res>
    implements _$StorageEntryCopyWith<$Res> {
  __$StorageEntryCopyWithImpl(this._self, this._then);

  final _StorageEntry _self;
  final $Res Function(_StorageEntry) _then;

/// Create a copy of StorageEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? itineraryName = null,Object? sizeBytes = null,Object? downloadedAt = null,Object? lastSyncedAt = freezed,}) {
  return _then(_StorageEntry(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,itineraryName: null == itineraryName ? _self.itineraryName : itineraryName // ignore: cast_nullable_to_non_nullable
as String,sizeBytes: null == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int,downloadedAt: null == downloadedAt ? _self.downloadedAt : downloadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
