// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accommodation_prefill_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccommodationPrefillResult {

/// Prefilled place (city/region)
 String? get place;/// Prefilled check-in date
 DateTime? get checkIn;/// Prefilled check-out date
 DateTime? get checkOut;/// Prefilled guest configuration
 RoomGuests? get guests;/// Whether Smart Dates were derived from transport context
 bool get hasSmartDates;/// Smart Dates details (for chip display)
 String? get smartDatesDescription;
/// Create a copy of AccommodationPrefillResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccommodationPrefillResultCopyWith<AccommodationPrefillResult> get copyWith => _$AccommodationPrefillResultCopyWithImpl<AccommodationPrefillResult>(this as AccommodationPrefillResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccommodationPrefillResult&&(identical(other.place, place) || other.place == place)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&const DeepCollectionEquality().equals(other.guests, guests)&&(identical(other.hasSmartDates, hasSmartDates) || other.hasSmartDates == hasSmartDates)&&(identical(other.smartDatesDescription, smartDatesDescription) || other.smartDatesDescription == smartDatesDescription));
}


@override
int get hashCode => Object.hash(runtimeType,place,checkIn,checkOut,const DeepCollectionEquality().hash(guests),hasSmartDates,smartDatesDescription);

@override
String toString() {
  return 'AccommodationPrefillResult(place: $place, checkIn: $checkIn, checkOut: $checkOut, guests: $guests, hasSmartDates: $hasSmartDates, smartDatesDescription: $smartDatesDescription)';
}


}

/// @nodoc
abstract mixin class $AccommodationPrefillResultCopyWith<$Res>  {
  factory $AccommodationPrefillResultCopyWith(AccommodationPrefillResult value, $Res Function(AccommodationPrefillResult) _then) = _$AccommodationPrefillResultCopyWithImpl;
@useResult
$Res call({
 String? place, DateTime? checkIn, DateTime? checkOut, RoomGuests? guests, bool hasSmartDates, String? smartDatesDescription
});




}
/// @nodoc
class _$AccommodationPrefillResultCopyWithImpl<$Res>
    implements $AccommodationPrefillResultCopyWith<$Res> {
  _$AccommodationPrefillResultCopyWithImpl(this._self, this._then);

  final AccommodationPrefillResult _self;
  final $Res Function(AccommodationPrefillResult) _then;

/// Create a copy of AccommodationPrefillResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? place = freezed,Object? checkIn = freezed,Object? checkOut = freezed,Object? guests = freezed,Object? hasSmartDates = null,Object? smartDatesDescription = freezed,}) {
  return _then(_self.copyWith(
place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime?,guests: freezed == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as RoomGuests?,hasSmartDates: null == hasSmartDates ? _self.hasSmartDates : hasSmartDates // ignore: cast_nullable_to_non_nullable
as bool,smartDatesDescription: freezed == smartDatesDescription ? _self.smartDatesDescription : smartDatesDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccommodationPrefillResult].
extension AccommodationPrefillResultPatterns on AccommodationPrefillResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccommodationPrefillResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccommodationPrefillResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccommodationPrefillResult value)  $default,){
final _that = this;
switch (_that) {
case _AccommodationPrefillResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccommodationPrefillResult value)?  $default,){
final _that = this;
switch (_that) {
case _AccommodationPrefillResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? place,  DateTime? checkIn,  DateTime? checkOut,  RoomGuests? guests,  bool hasSmartDates,  String? smartDatesDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccommodationPrefillResult() when $default != null:
return $default(_that.place,_that.checkIn,_that.checkOut,_that.guests,_that.hasSmartDates,_that.smartDatesDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? place,  DateTime? checkIn,  DateTime? checkOut,  RoomGuests? guests,  bool hasSmartDates,  String? smartDatesDescription)  $default,) {final _that = this;
switch (_that) {
case _AccommodationPrefillResult():
return $default(_that.place,_that.checkIn,_that.checkOut,_that.guests,_that.hasSmartDates,_that.smartDatesDescription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? place,  DateTime? checkIn,  DateTime? checkOut,  RoomGuests? guests,  bool hasSmartDates,  String? smartDatesDescription)?  $default,) {final _that = this;
switch (_that) {
case _AccommodationPrefillResult() when $default != null:
return $default(_that.place,_that.checkIn,_that.checkOut,_that.guests,_that.hasSmartDates,_that.smartDatesDescription);case _:
  return null;

}
}

}

/// @nodoc


class _AccommodationPrefillResult implements AccommodationPrefillResult {
  const _AccommodationPrefillResult({this.place, this.checkIn, this.checkOut, final  RoomGuests? guests, this.hasSmartDates = false, this.smartDatesDescription}): _guests = guests;
  

/// Prefilled place (city/region)
@override final  String? place;
/// Prefilled check-in date
@override final  DateTime? checkIn;
/// Prefilled check-out date
@override final  DateTime? checkOut;
/// Prefilled guest configuration
 final  RoomGuests? _guests;
/// Prefilled guest configuration
@override RoomGuests? get guests {
  final value = _guests;
  if (value == null) return null;
  if (_guests is EqualUnmodifiableMapView) return _guests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Whether Smart Dates were derived from transport context
@override@JsonKey() final  bool hasSmartDates;
/// Smart Dates details (for chip display)
@override final  String? smartDatesDescription;

/// Create a copy of AccommodationPrefillResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccommodationPrefillResultCopyWith<_AccommodationPrefillResult> get copyWith => __$AccommodationPrefillResultCopyWithImpl<_AccommodationPrefillResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccommodationPrefillResult&&(identical(other.place, place) || other.place == place)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&const DeepCollectionEquality().equals(other._guests, _guests)&&(identical(other.hasSmartDates, hasSmartDates) || other.hasSmartDates == hasSmartDates)&&(identical(other.smartDatesDescription, smartDatesDescription) || other.smartDatesDescription == smartDatesDescription));
}


@override
int get hashCode => Object.hash(runtimeType,place,checkIn,checkOut,const DeepCollectionEquality().hash(_guests),hasSmartDates,smartDatesDescription);

@override
String toString() {
  return 'AccommodationPrefillResult(place: $place, checkIn: $checkIn, checkOut: $checkOut, guests: $guests, hasSmartDates: $hasSmartDates, smartDatesDescription: $smartDatesDescription)';
}


}

/// @nodoc
abstract mixin class _$AccommodationPrefillResultCopyWith<$Res> implements $AccommodationPrefillResultCopyWith<$Res> {
  factory _$AccommodationPrefillResultCopyWith(_AccommodationPrefillResult value, $Res Function(_AccommodationPrefillResult) _then) = __$AccommodationPrefillResultCopyWithImpl;
@override @useResult
$Res call({
 String? place, DateTime? checkIn, DateTime? checkOut, RoomGuests? guests, bool hasSmartDates, String? smartDatesDescription
});




}
/// @nodoc
class __$AccommodationPrefillResultCopyWithImpl<$Res>
    implements _$AccommodationPrefillResultCopyWith<$Res> {
  __$AccommodationPrefillResultCopyWithImpl(this._self, this._then);

  final _AccommodationPrefillResult _self;
  final $Res Function(_AccommodationPrefillResult) _then;

/// Create a copy of AccommodationPrefillResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? place = freezed,Object? checkIn = freezed,Object? checkOut = freezed,Object? guests = freezed,Object? hasSmartDates = null,Object? smartDatesDescription = freezed,}) {
  return _then(_AccommodationPrefillResult(
place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime?,guests: freezed == guests ? _self._guests : guests // ignore: cast_nullable_to_non_nullable
as RoomGuests?,hasSmartDates: null == hasSmartDates ? _self.hasSmartDates : hasSmartDates // ignore: cast_nullable_to_non_nullable
as bool,smartDatesDescription: freezed == smartDatesDescription ? _self.smartDatesDescription : smartDatesDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
