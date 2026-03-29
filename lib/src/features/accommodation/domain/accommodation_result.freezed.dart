// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accommodation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccommodationResult {

 String get id;/// Provider ID (e.g., "mock", "booking")
 String get providerId;/// External ID for detail lookup
 String get externalId; AccommodationType get type; String get name; String get location; DateTime get checkIn; DateTime get checkOut; double get pricePerNight; String get currency; int? get rating; String? get imageUrl; String? get vendorUrl;
/// Create a copy of AccommodationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccommodationResultCopyWith<AccommodationResult> get copyWith => _$AccommodationResultCopyWithImpl<AccommodationResult>(this as AccommodationResult, _$identity);

  /// Serializes this AccommodationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccommodationResult&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,type,name,location,checkIn,checkOut,pricePerNight,currency,rating,imageUrl,vendorUrl);

@override
String toString() {
  return 'AccommodationResult(id: $id, providerId: $providerId, externalId: $externalId, type: $type, name: $name, location: $location, checkIn: $checkIn, checkOut: $checkOut, pricePerNight: $pricePerNight, currency: $currency, rating: $rating, imageUrl: $imageUrl, vendorUrl: $vendorUrl)';
}


}

/// @nodoc
abstract mixin class $AccommodationResultCopyWith<$Res>  {
  factory $AccommodationResultCopyWith(AccommodationResult value, $Res Function(AccommodationResult) _then) = _$AccommodationResultCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, AccommodationType type, String name, String location, DateTime checkIn, DateTime checkOut, double pricePerNight, String currency, int? rating, String? imageUrl, String? vendorUrl
});




}
/// @nodoc
class _$AccommodationResultCopyWithImpl<$Res>
    implements $AccommodationResultCopyWith<$Res> {
  _$AccommodationResultCopyWithImpl(this._self, this._then);

  final AccommodationResult _self;
  final $Res Function(AccommodationResult) _then;

/// Create a copy of AccommodationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? type = null,Object? name = null,Object? location = null,Object? checkIn = null,Object? checkOut = null,Object? pricePerNight = null,Object? currency = null,Object? rating = freezed,Object? imageUrl = freezed,Object? vendorUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccommodationType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,checkIn: null == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime,checkOut: null == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccommodationResult].
extension AccommodationResultPatterns on AccommodationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccommodationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccommodationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccommodationResult value)  $default,){
final _that = this;
switch (_that) {
case _AccommodationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccommodationResult value)?  $default,){
final _that = this;
switch (_that) {
case _AccommodationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  AccommodationType type,  String name,  String location,  DateTime checkIn,  DateTime checkOut,  double pricePerNight,  String currency,  int? rating,  String? imageUrl,  String? vendorUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccommodationResult() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.type,_that.name,_that.location,_that.checkIn,_that.checkOut,_that.pricePerNight,_that.currency,_that.rating,_that.imageUrl,_that.vendorUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  AccommodationType type,  String name,  String location,  DateTime checkIn,  DateTime checkOut,  double pricePerNight,  String currency,  int? rating,  String? imageUrl,  String? vendorUrl)  $default,) {final _that = this;
switch (_that) {
case _AccommodationResult():
return $default(_that.id,_that.providerId,_that.externalId,_that.type,_that.name,_that.location,_that.checkIn,_that.checkOut,_that.pricePerNight,_that.currency,_that.rating,_that.imageUrl,_that.vendorUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  AccommodationType type,  String name,  String location,  DateTime checkIn,  DateTime checkOut,  double pricePerNight,  String currency,  int? rating,  String? imageUrl,  String? vendorUrl)?  $default,) {final _that = this;
switch (_that) {
case _AccommodationResult() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.type,_that.name,_that.location,_that.checkIn,_that.checkOut,_that.pricePerNight,_that.currency,_that.rating,_that.imageUrl,_that.vendorUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccommodationResult implements AccommodationResult {
  const _AccommodationResult({required this.id, required this.providerId, required this.externalId, required this.type, required this.name, required this.location, required this.checkIn, required this.checkOut, required this.pricePerNight, required this.currency, this.rating, this.imageUrl, this.vendorUrl});
  factory _AccommodationResult.fromJson(Map<String, dynamic> json) => _$AccommodationResultFromJson(json);

@override final  String id;
/// Provider ID (e.g., "mock", "booking")
@override final  String providerId;
/// External ID for detail lookup
@override final  String externalId;
@override final  AccommodationType type;
@override final  String name;
@override final  String location;
@override final  DateTime checkIn;
@override final  DateTime checkOut;
@override final  double pricePerNight;
@override final  String currency;
@override final  int? rating;
@override final  String? imageUrl;
@override final  String? vendorUrl;

/// Create a copy of AccommodationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccommodationResultCopyWith<_AccommodationResult> get copyWith => __$AccommodationResultCopyWithImpl<_AccommodationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccommodationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccommodationResult&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,providerId,externalId,type,name,location,checkIn,checkOut,pricePerNight,currency,rating,imageUrl,vendorUrl);

@override
String toString() {
  return 'AccommodationResult(id: $id, providerId: $providerId, externalId: $externalId, type: $type, name: $name, location: $location, checkIn: $checkIn, checkOut: $checkOut, pricePerNight: $pricePerNight, currency: $currency, rating: $rating, imageUrl: $imageUrl, vendorUrl: $vendorUrl)';
}


}

/// @nodoc
abstract mixin class _$AccommodationResultCopyWith<$Res> implements $AccommodationResultCopyWith<$Res> {
  factory _$AccommodationResultCopyWith(_AccommodationResult value, $Res Function(_AccommodationResult) _then) = __$AccommodationResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, AccommodationType type, String name, String location, DateTime checkIn, DateTime checkOut, double pricePerNight, String currency, int? rating, String? imageUrl, String? vendorUrl
});




}
/// @nodoc
class __$AccommodationResultCopyWithImpl<$Res>
    implements _$AccommodationResultCopyWith<$Res> {
  __$AccommodationResultCopyWithImpl(this._self, this._then);

  final _AccommodationResult _self;
  final $Res Function(_AccommodationResult) _then;

/// Create a copy of AccommodationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? type = null,Object? name = null,Object? location = null,Object? checkIn = null,Object? checkOut = null,Object? pricePerNight = null,Object? currency = null,Object? rating = freezed,Object? imageUrl = freezed,Object? vendorUrl = freezed,}) {
  return _then(_AccommodationResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccommodationType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,checkIn: null == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime,checkOut: null == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime,pricePerNight: null == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
