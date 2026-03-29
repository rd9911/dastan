// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShareConfig {

/// Reduce location precision (e.g., city-level only)
 bool get reduceLocationPrecision;/// Exclude personal notes
 bool get excludeNotes;/// Exclude pricing information
 bool get excludePricing;/// Expiry duration in days (null = no expiry)
 int? get expiryDays;
/// Create a copy of ShareConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareConfigCopyWith<ShareConfig> get copyWith => _$ShareConfigCopyWithImpl<ShareConfig>(this as ShareConfig, _$identity);

  /// Serializes this ShareConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareConfig&&(identical(other.reduceLocationPrecision, reduceLocationPrecision) || other.reduceLocationPrecision == reduceLocationPrecision)&&(identical(other.excludeNotes, excludeNotes) || other.excludeNotes == excludeNotes)&&(identical(other.excludePricing, excludePricing) || other.excludePricing == excludePricing)&&(identical(other.expiryDays, expiryDays) || other.expiryDays == expiryDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reduceLocationPrecision,excludeNotes,excludePricing,expiryDays);

@override
String toString() {
  return 'ShareConfig(reduceLocationPrecision: $reduceLocationPrecision, excludeNotes: $excludeNotes, excludePricing: $excludePricing, expiryDays: $expiryDays)';
}


}

/// @nodoc
abstract mixin class $ShareConfigCopyWith<$Res>  {
  factory $ShareConfigCopyWith(ShareConfig value, $Res Function(ShareConfig) _then) = _$ShareConfigCopyWithImpl;
@useResult
$Res call({
 bool reduceLocationPrecision, bool excludeNotes, bool excludePricing, int? expiryDays
});




}
/// @nodoc
class _$ShareConfigCopyWithImpl<$Res>
    implements $ShareConfigCopyWith<$Res> {
  _$ShareConfigCopyWithImpl(this._self, this._then);

  final ShareConfig _self;
  final $Res Function(ShareConfig) _then;

/// Create a copy of ShareConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reduceLocationPrecision = null,Object? excludeNotes = null,Object? excludePricing = null,Object? expiryDays = freezed,}) {
  return _then(_self.copyWith(
reduceLocationPrecision: null == reduceLocationPrecision ? _self.reduceLocationPrecision : reduceLocationPrecision // ignore: cast_nullable_to_non_nullable
as bool,excludeNotes: null == excludeNotes ? _self.excludeNotes : excludeNotes // ignore: cast_nullable_to_non_nullable
as bool,excludePricing: null == excludePricing ? _self.excludePricing : excludePricing // ignore: cast_nullable_to_non_nullable
as bool,expiryDays: freezed == expiryDays ? _self.expiryDays : expiryDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareConfig].
extension ShareConfigPatterns on ShareConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareConfig value)  $default,){
final _that = this;
switch (_that) {
case _ShareConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ShareConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool reduceLocationPrecision,  bool excludeNotes,  bool excludePricing,  int? expiryDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareConfig() when $default != null:
return $default(_that.reduceLocationPrecision,_that.excludeNotes,_that.excludePricing,_that.expiryDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool reduceLocationPrecision,  bool excludeNotes,  bool excludePricing,  int? expiryDays)  $default,) {final _that = this;
switch (_that) {
case _ShareConfig():
return $default(_that.reduceLocationPrecision,_that.excludeNotes,_that.excludePricing,_that.expiryDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool reduceLocationPrecision,  bool excludeNotes,  bool excludePricing,  int? expiryDays)?  $default,) {final _that = this;
switch (_that) {
case _ShareConfig() when $default != null:
return $default(_that.reduceLocationPrecision,_that.excludeNotes,_that.excludePricing,_that.expiryDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShareConfig implements ShareConfig {
  const _ShareConfig({this.reduceLocationPrecision = false, this.excludeNotes = true, this.excludePricing = false, this.expiryDays});
  factory _ShareConfig.fromJson(Map<String, dynamic> json) => _$ShareConfigFromJson(json);

/// Reduce location precision (e.g., city-level only)
@override@JsonKey() final  bool reduceLocationPrecision;
/// Exclude personal notes
@override@JsonKey() final  bool excludeNotes;
/// Exclude pricing information
@override@JsonKey() final  bool excludePricing;
/// Expiry duration in days (null = no expiry)
@override final  int? expiryDays;

/// Create a copy of ShareConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareConfigCopyWith<_ShareConfig> get copyWith => __$ShareConfigCopyWithImpl<_ShareConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShareConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareConfig&&(identical(other.reduceLocationPrecision, reduceLocationPrecision) || other.reduceLocationPrecision == reduceLocationPrecision)&&(identical(other.excludeNotes, excludeNotes) || other.excludeNotes == excludeNotes)&&(identical(other.excludePricing, excludePricing) || other.excludePricing == excludePricing)&&(identical(other.expiryDays, expiryDays) || other.expiryDays == expiryDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reduceLocationPrecision,excludeNotes,excludePricing,expiryDays);

@override
String toString() {
  return 'ShareConfig(reduceLocationPrecision: $reduceLocationPrecision, excludeNotes: $excludeNotes, excludePricing: $excludePricing, expiryDays: $expiryDays)';
}


}

/// @nodoc
abstract mixin class _$ShareConfigCopyWith<$Res> implements $ShareConfigCopyWith<$Res> {
  factory _$ShareConfigCopyWith(_ShareConfig value, $Res Function(_ShareConfig) _then) = __$ShareConfigCopyWithImpl;
@override @useResult
$Res call({
 bool reduceLocationPrecision, bool excludeNotes, bool excludePricing, int? expiryDays
});




}
/// @nodoc
class __$ShareConfigCopyWithImpl<$Res>
    implements _$ShareConfigCopyWith<$Res> {
  __$ShareConfigCopyWithImpl(this._self, this._then);

  final _ShareConfig _self;
  final $Res Function(_ShareConfig) _then;

/// Create a copy of ShareConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reduceLocationPrecision = null,Object? excludeNotes = null,Object? excludePricing = null,Object? expiryDays = freezed,}) {
  return _then(_ShareConfig(
reduceLocationPrecision: null == reduceLocationPrecision ? _self.reduceLocationPrecision : reduceLocationPrecision // ignore: cast_nullable_to_non_nullable
as bool,excludeNotes: null == excludeNotes ? _self.excludeNotes : excludeNotes // ignore: cast_nullable_to_non_nullable
as bool,excludePricing: null == excludePricing ? _self.excludePricing : excludePricing // ignore: cast_nullable_to_non_nullable
as bool,expiryDays: freezed == expiryDays ? _self.expiryDays : expiryDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ShareLink {

 String get id; String get itineraryId; String get url; DateTime get createdAt; DateTime? get expiresAt; String get revocationToken; ShareConfig get config;
/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareLinkCopyWith<ShareLink> get copyWith => _$ShareLinkCopyWithImpl<ShareLink>(this as ShareLink, _$identity);

  /// Serializes this ShareLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareLink&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.revocationToken, revocationToken) || other.revocationToken == revocationToken)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryId,url,createdAt,expiresAt,revocationToken,config);

@override
String toString() {
  return 'ShareLink(id: $id, itineraryId: $itineraryId, url: $url, createdAt: $createdAt, expiresAt: $expiresAt, revocationToken: $revocationToken, config: $config)';
}


}

/// @nodoc
abstract mixin class $ShareLinkCopyWith<$Res>  {
  factory $ShareLinkCopyWith(ShareLink value, $Res Function(ShareLink) _then) = _$ShareLinkCopyWithImpl;
@useResult
$Res call({
 String id, String itineraryId, String url, DateTime createdAt, DateTime? expiresAt, String revocationToken, ShareConfig config
});


$ShareConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$ShareLinkCopyWithImpl<$Res>
    implements $ShareLinkCopyWith<$Res> {
  _$ShareLinkCopyWithImpl(this._self, this._then);

  final ShareLink _self;
  final $Res Function(ShareLink) _then;

/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itineraryId = null,Object? url = null,Object? createdAt = null,Object? expiresAt = freezed,Object? revocationToken = null,Object? config = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,revocationToken: null == revocationToken ? _self.revocationToken : revocationToken // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ShareConfig,
  ));
}
/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShareConfigCopyWith<$Res> get config {
  
  return $ShareConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShareLink].
extension ShareLinkPatterns on ShareLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareLink value)  $default,){
final _that = this;
switch (_that) {
case _ShareLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareLink value)?  $default,){
final _that = this;
switch (_that) {
case _ShareLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String itineraryId,  String url,  DateTime createdAt,  DateTime? expiresAt,  String revocationToken,  ShareConfig config)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareLink() when $default != null:
return $default(_that.id,_that.itineraryId,_that.url,_that.createdAt,_that.expiresAt,_that.revocationToken,_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String itineraryId,  String url,  DateTime createdAt,  DateTime? expiresAt,  String revocationToken,  ShareConfig config)  $default,) {final _that = this;
switch (_that) {
case _ShareLink():
return $default(_that.id,_that.itineraryId,_that.url,_that.createdAt,_that.expiresAt,_that.revocationToken,_that.config);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String itineraryId,  String url,  DateTime createdAt,  DateTime? expiresAt,  String revocationToken,  ShareConfig config)?  $default,) {final _that = this;
switch (_that) {
case _ShareLink() when $default != null:
return $default(_that.id,_that.itineraryId,_that.url,_that.createdAt,_that.expiresAt,_that.revocationToken,_that.config);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShareLink implements ShareLink {
  const _ShareLink({required this.id, required this.itineraryId, required this.url, required this.createdAt, this.expiresAt, required this.revocationToken, required this.config});
  factory _ShareLink.fromJson(Map<String, dynamic> json) => _$ShareLinkFromJson(json);

@override final  String id;
@override final  String itineraryId;
@override final  String url;
@override final  DateTime createdAt;
@override final  DateTime? expiresAt;
@override final  String revocationToken;
@override final  ShareConfig config;

/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareLinkCopyWith<_ShareLink> get copyWith => __$ShareLinkCopyWithImpl<_ShareLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShareLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareLink&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.url, url) || other.url == url)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.revocationToken, revocationToken) || other.revocationToken == revocationToken)&&(identical(other.config, config) || other.config == config));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryId,url,createdAt,expiresAt,revocationToken,config);

@override
String toString() {
  return 'ShareLink(id: $id, itineraryId: $itineraryId, url: $url, createdAt: $createdAt, expiresAt: $expiresAt, revocationToken: $revocationToken, config: $config)';
}


}

/// @nodoc
abstract mixin class _$ShareLinkCopyWith<$Res> implements $ShareLinkCopyWith<$Res> {
  factory _$ShareLinkCopyWith(_ShareLink value, $Res Function(_ShareLink) _then) = __$ShareLinkCopyWithImpl;
@override @useResult
$Res call({
 String id, String itineraryId, String url, DateTime createdAt, DateTime? expiresAt, String revocationToken, ShareConfig config
});


@override $ShareConfigCopyWith<$Res> get config;

}
/// @nodoc
class __$ShareLinkCopyWithImpl<$Res>
    implements _$ShareLinkCopyWith<$Res> {
  __$ShareLinkCopyWithImpl(this._self, this._then);

  final _ShareLink _self;
  final $Res Function(_ShareLink) _then;

/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itineraryId = null,Object? url = null,Object? createdAt = null,Object? expiresAt = freezed,Object? revocationToken = null,Object? config = null,}) {
  return _then(_ShareLink(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,revocationToken: null == revocationToken ? _self.revocationToken : revocationToken // ignore: cast_nullable_to_non_nullable
as String,config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ShareConfig,
  ));
}

/// Create a copy of ShareLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShareConfigCopyWith<$Res> get config {
  
  return $ShareConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
