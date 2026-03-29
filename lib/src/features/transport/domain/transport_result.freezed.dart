// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transport_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransportResult {

 String get id; TransportMode get mode; String get origin; String get destination; DateTime get departAt; DateTime get arriveAt; double get priceAmount; String get currency; int get durationMinutes; String? get vendor; String? get vendorUrl; String? get originAirportCode; String? get destinationAirportCode; String? get baggage;
/// Create a copy of TransportResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportResultCopyWith<TransportResult> get copyWith => _$TransportResultCopyWithImpl<TransportResult>(this as TransportResult, _$identity);

  /// Serializes this TransportResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportResult&&(identical(other.id, id) || other.id == id)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departAt, departAt) || other.departAt == departAt)&&(identical(other.arriveAt, arriveAt) || other.arriveAt == arriveAt)&&(identical(other.priceAmount, priceAmount) || other.priceAmount == priceAmount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl)&&(identical(other.originAirportCode, originAirportCode) || other.originAirportCode == originAirportCode)&&(identical(other.destinationAirportCode, destinationAirportCode) || other.destinationAirportCode == destinationAirportCode)&&(identical(other.baggage, baggage) || other.baggage == baggage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mode,origin,destination,departAt,arriveAt,priceAmount,currency,durationMinutes,vendor,vendorUrl,originAirportCode,destinationAirportCode,baggage);

@override
String toString() {
  return 'TransportResult(id: $id, mode: $mode, origin: $origin, destination: $destination, departAt: $departAt, arriveAt: $arriveAt, priceAmount: $priceAmount, currency: $currency, durationMinutes: $durationMinutes, vendor: $vendor, vendorUrl: $vendorUrl, originAirportCode: $originAirportCode, destinationAirportCode: $destinationAirportCode, baggage: $baggage)';
}


}

/// @nodoc
abstract mixin class $TransportResultCopyWith<$Res>  {
  factory $TransportResultCopyWith(TransportResult value, $Res Function(TransportResult) _then) = _$TransportResultCopyWithImpl;
@useResult
$Res call({
 String id, TransportMode mode, String origin, String destination, DateTime departAt, DateTime arriveAt, double priceAmount, String currency, int durationMinutes, String? vendor, String? vendorUrl, String? originAirportCode, String? destinationAirportCode, String? baggage
});




}
/// @nodoc
class _$TransportResultCopyWithImpl<$Res>
    implements $TransportResultCopyWith<$Res> {
  _$TransportResultCopyWithImpl(this._self, this._then);

  final TransportResult _self;
  final $Res Function(TransportResult) _then;

/// Create a copy of TransportResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mode = null,Object? origin = null,Object? destination = null,Object? departAt = null,Object? arriveAt = null,Object? priceAmount = null,Object? currency = null,Object? durationMinutes = null,Object? vendor = freezed,Object? vendorUrl = freezed,Object? originAirportCode = freezed,Object? destinationAirportCode = freezed,Object? baggage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TransportMode,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departAt: null == departAt ? _self.departAt : departAt // ignore: cast_nullable_to_non_nullable
as DateTime,arriveAt: null == arriveAt ? _self.arriveAt : arriveAt // ignore: cast_nullable_to_non_nullable
as DateTime,priceAmount: null == priceAmount ? _self.priceAmount : priceAmount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,originAirportCode: freezed == originAirportCode ? _self.originAirportCode : originAirportCode // ignore: cast_nullable_to_non_nullable
as String?,destinationAirportCode: freezed == destinationAirportCode ? _self.destinationAirportCode : destinationAirportCode // ignore: cast_nullable_to_non_nullable
as String?,baggage: freezed == baggage ? _self.baggage : baggage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransportResult].
extension TransportResultPatterns on TransportResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportResult value)  $default,){
final _that = this;
switch (_that) {
case _TransportResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportResult value)?  $default,){
final _that = this;
switch (_that) {
case _TransportResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TransportMode mode,  String origin,  String destination,  DateTime departAt,  DateTime arriveAt,  double priceAmount,  String currency,  int durationMinutes,  String? vendor,  String? vendorUrl,  String? originAirportCode,  String? destinationAirportCode,  String? baggage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportResult() when $default != null:
return $default(_that.id,_that.mode,_that.origin,_that.destination,_that.departAt,_that.arriveAt,_that.priceAmount,_that.currency,_that.durationMinutes,_that.vendor,_that.vendorUrl,_that.originAirportCode,_that.destinationAirportCode,_that.baggage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TransportMode mode,  String origin,  String destination,  DateTime departAt,  DateTime arriveAt,  double priceAmount,  String currency,  int durationMinutes,  String? vendor,  String? vendorUrl,  String? originAirportCode,  String? destinationAirportCode,  String? baggage)  $default,) {final _that = this;
switch (_that) {
case _TransportResult():
return $default(_that.id,_that.mode,_that.origin,_that.destination,_that.departAt,_that.arriveAt,_that.priceAmount,_that.currency,_that.durationMinutes,_that.vendor,_that.vendorUrl,_that.originAirportCode,_that.destinationAirportCode,_that.baggage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TransportMode mode,  String origin,  String destination,  DateTime departAt,  DateTime arriveAt,  double priceAmount,  String currency,  int durationMinutes,  String? vendor,  String? vendorUrl,  String? originAirportCode,  String? destinationAirportCode,  String? baggage)?  $default,) {final _that = this;
switch (_that) {
case _TransportResult() when $default != null:
return $default(_that.id,_that.mode,_that.origin,_that.destination,_that.departAt,_that.arriveAt,_that.priceAmount,_that.currency,_that.durationMinutes,_that.vendor,_that.vendorUrl,_that.originAirportCode,_that.destinationAirportCode,_that.baggage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportResult implements TransportResult {
  const _TransportResult({required this.id, required this.mode, required this.origin, required this.destination, required this.departAt, required this.arriveAt, required this.priceAmount, required this.currency, required this.durationMinutes, this.vendor, this.vendorUrl, this.originAirportCode, this.destinationAirportCode, this.baggage});
  factory _TransportResult.fromJson(Map<String, dynamic> json) => _$TransportResultFromJson(json);

@override final  String id;
@override final  TransportMode mode;
@override final  String origin;
@override final  String destination;
@override final  DateTime departAt;
@override final  DateTime arriveAt;
@override final  double priceAmount;
@override final  String currency;
@override final  int durationMinutes;
@override final  String? vendor;
@override final  String? vendorUrl;
@override final  String? originAirportCode;
@override final  String? destinationAirportCode;
@override final  String? baggage;

/// Create a copy of TransportResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportResultCopyWith<_TransportResult> get copyWith => __$TransportResultCopyWithImpl<_TransportResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportResult&&(identical(other.id, id) || other.id == id)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departAt, departAt) || other.departAt == departAt)&&(identical(other.arriveAt, arriveAt) || other.arriveAt == arriveAt)&&(identical(other.priceAmount, priceAmount) || other.priceAmount == priceAmount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl)&&(identical(other.originAirportCode, originAirportCode) || other.originAirportCode == originAirportCode)&&(identical(other.destinationAirportCode, destinationAirportCode) || other.destinationAirportCode == destinationAirportCode)&&(identical(other.baggage, baggage) || other.baggage == baggage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mode,origin,destination,departAt,arriveAt,priceAmount,currency,durationMinutes,vendor,vendorUrl,originAirportCode,destinationAirportCode,baggage);

@override
String toString() {
  return 'TransportResult(id: $id, mode: $mode, origin: $origin, destination: $destination, departAt: $departAt, arriveAt: $arriveAt, priceAmount: $priceAmount, currency: $currency, durationMinutes: $durationMinutes, vendor: $vendor, vendorUrl: $vendorUrl, originAirportCode: $originAirportCode, destinationAirportCode: $destinationAirportCode, baggage: $baggage)';
}


}

/// @nodoc
abstract mixin class _$TransportResultCopyWith<$Res> implements $TransportResultCopyWith<$Res> {
  factory _$TransportResultCopyWith(_TransportResult value, $Res Function(_TransportResult) _then) = __$TransportResultCopyWithImpl;
@override @useResult
$Res call({
 String id, TransportMode mode, String origin, String destination, DateTime departAt, DateTime arriveAt, double priceAmount, String currency, int durationMinutes, String? vendor, String? vendorUrl, String? originAirportCode, String? destinationAirportCode, String? baggage
});




}
/// @nodoc
class __$TransportResultCopyWithImpl<$Res>
    implements _$TransportResultCopyWith<$Res> {
  __$TransportResultCopyWithImpl(this._self, this._then);

  final _TransportResult _self;
  final $Res Function(_TransportResult) _then;

/// Create a copy of TransportResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mode = null,Object? origin = null,Object? destination = null,Object? departAt = null,Object? arriveAt = null,Object? priceAmount = null,Object? currency = null,Object? durationMinutes = null,Object? vendor = freezed,Object? vendorUrl = freezed,Object? originAirportCode = freezed,Object? destinationAirportCode = freezed,Object? baggage = freezed,}) {
  return _then(_TransportResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TransportMode,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departAt: null == departAt ? _self.departAt : departAt // ignore: cast_nullable_to_non_nullable
as DateTime,arriveAt: null == arriveAt ? _self.arriveAt : arriveAt // ignore: cast_nullable_to_non_nullable
as DateTime,priceAmount: null == priceAmount ? _self.priceAmount : priceAmount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,originAirportCode: freezed == originAirportCode ? _self.originAirportCode : originAirportCode // ignore: cast_nullable_to_non_nullable
as String?,destinationAirportCode: freezed == destinationAirportCode ? _self.destinationAirportCode : destinationAirportCode // ignore: cast_nullable_to_non_nullable
as String?,baggage: freezed == baggage ? _self.baggage : baggage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
