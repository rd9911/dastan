// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transport_search_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransportSearchRequest {

 String get itineraryId; TripType get tripType; List<TransportSearchLeg> get legs; Map<String, int> get passengers; TransportFilters? get filters;
/// Create a copy of TransportSearchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportSearchRequestCopyWith<TransportSearchRequest> get copyWith => _$TransportSearchRequestCopyWithImpl<TransportSearchRequest>(this as TransportSearchRequest, _$identity);

  /// Serializes this TransportSearchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.tripType, tripType) || other.tripType == tripType)&&const DeepCollectionEquality().equals(other.legs, legs)&&const DeepCollectionEquality().equals(other.passengers, passengers)&&(identical(other.filters, filters) || other.filters == filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,tripType,const DeepCollectionEquality().hash(legs),const DeepCollectionEquality().hash(passengers),filters);

@override
String toString() {
  return 'TransportSearchRequest(itineraryId: $itineraryId, tripType: $tripType, legs: $legs, passengers: $passengers, filters: $filters)';
}


}

/// @nodoc
abstract mixin class $TransportSearchRequestCopyWith<$Res>  {
  factory $TransportSearchRequestCopyWith(TransportSearchRequest value, $Res Function(TransportSearchRequest) _then) = _$TransportSearchRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, TripType tripType, List<TransportSearchLeg> legs, Map<String, int> passengers, TransportFilters? filters
});


$TransportFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class _$TransportSearchRequestCopyWithImpl<$Res>
    implements $TransportSearchRequestCopyWith<$Res> {
  _$TransportSearchRequestCopyWithImpl(this._self, this._then);

  final TransportSearchRequest _self;
  final $Res Function(TransportSearchRequest) _then;

/// Create a copy of TransportSearchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? tripType = null,Object? legs = null,Object? passengers = null,Object? filters = freezed,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,tripType: null == tripType ? _self.tripType : tripType // ignore: cast_nullable_to_non_nullable
as TripType,legs: null == legs ? _self.legs : legs // ignore: cast_nullable_to_non_nullable
as List<TransportSearchLeg>,passengers: null == passengers ? _self.passengers : passengers // ignore: cast_nullable_to_non_nullable
as Map<String, int>,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as TransportFilters?,
  ));
}
/// Create a copy of TransportSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransportFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $TransportFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransportSearchRequest].
extension TransportSearchRequestPatterns on TransportSearchRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportSearchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportSearchRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportSearchRequest value)  $default,){
final _that = this;
switch (_that) {
case _TransportSearchRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportSearchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TransportSearchRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  TripType tripType,  List<TransportSearchLeg> legs,  Map<String, int> passengers,  TransportFilters? filters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.tripType,_that.legs,_that.passengers,_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  TripType tripType,  List<TransportSearchLeg> legs,  Map<String, int> passengers,  TransportFilters? filters)  $default,) {final _that = this;
switch (_that) {
case _TransportSearchRequest():
return $default(_that.itineraryId,_that.tripType,_that.legs,_that.passengers,_that.filters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  TripType tripType,  List<TransportSearchLeg> legs,  Map<String, int> passengers,  TransportFilters? filters)?  $default,) {final _that = this;
switch (_that) {
case _TransportSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.tripType,_that.legs,_that.passengers,_that.filters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportSearchRequest implements TransportSearchRequest {
  const _TransportSearchRequest({required this.itineraryId, required this.tripType, required final  List<TransportSearchLeg> legs, final  Map<String, int> passengers = const {'adults' : 1}, this.filters}): _legs = legs,_passengers = passengers;
  factory _TransportSearchRequest.fromJson(Map<String, dynamic> json) => _$TransportSearchRequestFromJson(json);

@override final  String itineraryId;
@override final  TripType tripType;
 final  List<TransportSearchLeg> _legs;
@override List<TransportSearchLeg> get legs {
  if (_legs is EqualUnmodifiableListView) return _legs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_legs);
}

 final  Map<String, int> _passengers;
@override@JsonKey() Map<String, int> get passengers {
  if (_passengers is EqualUnmodifiableMapView) return _passengers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_passengers);
}

@override final  TransportFilters? filters;

/// Create a copy of TransportSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportSearchRequestCopyWith<_TransportSearchRequest> get copyWith => __$TransportSearchRequestCopyWithImpl<_TransportSearchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportSearchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.tripType, tripType) || other.tripType == tripType)&&const DeepCollectionEquality().equals(other._legs, _legs)&&const DeepCollectionEquality().equals(other._passengers, _passengers)&&(identical(other.filters, filters) || other.filters == filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,tripType,const DeepCollectionEquality().hash(_legs),const DeepCollectionEquality().hash(_passengers),filters);

@override
String toString() {
  return 'TransportSearchRequest(itineraryId: $itineraryId, tripType: $tripType, legs: $legs, passengers: $passengers, filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$TransportSearchRequestCopyWith<$Res> implements $TransportSearchRequestCopyWith<$Res> {
  factory _$TransportSearchRequestCopyWith(_TransportSearchRequest value, $Res Function(_TransportSearchRequest) _then) = __$TransportSearchRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, TripType tripType, List<TransportSearchLeg> legs, Map<String, int> passengers, TransportFilters? filters
});


@override $TransportFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class __$TransportSearchRequestCopyWithImpl<$Res>
    implements _$TransportSearchRequestCopyWith<$Res> {
  __$TransportSearchRequestCopyWithImpl(this._self, this._then);

  final _TransportSearchRequest _self;
  final $Res Function(_TransportSearchRequest) _then;

/// Create a copy of TransportSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? tripType = null,Object? legs = null,Object? passengers = null,Object? filters = freezed,}) {
  return _then(_TransportSearchRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,tripType: null == tripType ? _self.tripType : tripType // ignore: cast_nullable_to_non_nullable
as TripType,legs: null == legs ? _self._legs : legs // ignore: cast_nullable_to_non_nullable
as List<TransportSearchLeg>,passengers: null == passengers ? _self._passengers : passengers // ignore: cast_nullable_to_non_nullable
as Map<String, int>,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as TransportFilters?,
  ));
}

/// Create a copy of TransportSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransportFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $TransportFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// @nodoc
mixin _$TransportSearchLeg {

 String get origin; String get destination; DateTime get departDate; DateTime? get returnDate;// Only used for roundTrip logic if needed, usually legs are linear
 TransportMode get mode;
/// Create a copy of TransportSearchLeg
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportSearchLegCopyWith<TransportSearchLeg> get copyWith => _$TransportSearchLegCopyWithImpl<TransportSearchLeg>(this as TransportSearchLeg, _$identity);

  /// Serializes this TransportSearchLeg to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportSearchLeg&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departDate, departDate) || other.departDate == departDate)&&(identical(other.returnDate, returnDate) || other.returnDate == returnDate)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,origin,destination,departDate,returnDate,mode);

@override
String toString() {
  return 'TransportSearchLeg(origin: $origin, destination: $destination, departDate: $departDate, returnDate: $returnDate, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $TransportSearchLegCopyWith<$Res>  {
  factory $TransportSearchLegCopyWith(TransportSearchLeg value, $Res Function(TransportSearchLeg) _then) = _$TransportSearchLegCopyWithImpl;
@useResult
$Res call({
 String origin, String destination, DateTime departDate, DateTime? returnDate, TransportMode mode
});




}
/// @nodoc
class _$TransportSearchLegCopyWithImpl<$Res>
    implements $TransportSearchLegCopyWith<$Res> {
  _$TransportSearchLegCopyWithImpl(this._self, this._then);

  final TransportSearchLeg _self;
  final $Res Function(TransportSearchLeg) _then;

/// Create a copy of TransportSearchLeg
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? origin = null,Object? destination = null,Object? departDate = null,Object? returnDate = freezed,Object? mode = null,}) {
  return _then(_self.copyWith(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departDate: null == departDate ? _self.departDate : departDate // ignore: cast_nullable_to_non_nullable
as DateTime,returnDate: freezed == returnDate ? _self.returnDate : returnDate // ignore: cast_nullable_to_non_nullable
as DateTime?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TransportMode,
  ));
}

}


/// Adds pattern-matching-related methods to [TransportSearchLeg].
extension TransportSearchLegPatterns on TransportSearchLeg {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportSearchLeg value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportSearchLeg() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportSearchLeg value)  $default,){
final _that = this;
switch (_that) {
case _TransportSearchLeg():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportSearchLeg value)?  $default,){
final _that = this;
switch (_that) {
case _TransportSearchLeg() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String origin,  String destination,  DateTime departDate,  DateTime? returnDate,  TransportMode mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportSearchLeg() when $default != null:
return $default(_that.origin,_that.destination,_that.departDate,_that.returnDate,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String origin,  String destination,  DateTime departDate,  DateTime? returnDate,  TransportMode mode)  $default,) {final _that = this;
switch (_that) {
case _TransportSearchLeg():
return $default(_that.origin,_that.destination,_that.departDate,_that.returnDate,_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String origin,  String destination,  DateTime departDate,  DateTime? returnDate,  TransportMode mode)?  $default,) {final _that = this;
switch (_that) {
case _TransportSearchLeg() when $default != null:
return $default(_that.origin,_that.destination,_that.departDate,_that.returnDate,_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportSearchLeg implements TransportSearchLeg {
  const _TransportSearchLeg({required this.origin, required this.destination, required this.departDate, this.returnDate, this.mode = TransportMode.any});
  factory _TransportSearchLeg.fromJson(Map<String, dynamic> json) => _$TransportSearchLegFromJson(json);

@override final  String origin;
@override final  String destination;
@override final  DateTime departDate;
@override final  DateTime? returnDate;
// Only used for roundTrip logic if needed, usually legs are linear
@override@JsonKey() final  TransportMode mode;

/// Create a copy of TransportSearchLeg
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportSearchLegCopyWith<_TransportSearchLeg> get copyWith => __$TransportSearchLegCopyWithImpl<_TransportSearchLeg>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportSearchLegToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportSearchLeg&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departDate, departDate) || other.departDate == departDate)&&(identical(other.returnDate, returnDate) || other.returnDate == returnDate)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,origin,destination,departDate,returnDate,mode);

@override
String toString() {
  return 'TransportSearchLeg(origin: $origin, destination: $destination, departDate: $departDate, returnDate: $returnDate, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$TransportSearchLegCopyWith<$Res> implements $TransportSearchLegCopyWith<$Res> {
  factory _$TransportSearchLegCopyWith(_TransportSearchLeg value, $Res Function(_TransportSearchLeg) _then) = __$TransportSearchLegCopyWithImpl;
@override @useResult
$Res call({
 String origin, String destination, DateTime departDate, DateTime? returnDate, TransportMode mode
});




}
/// @nodoc
class __$TransportSearchLegCopyWithImpl<$Res>
    implements _$TransportSearchLegCopyWith<$Res> {
  __$TransportSearchLegCopyWithImpl(this._self, this._then);

  final _TransportSearchLeg _self;
  final $Res Function(_TransportSearchLeg) _then;

/// Create a copy of TransportSearchLeg
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? origin = null,Object? destination = null,Object? departDate = null,Object? returnDate = freezed,Object? mode = null,}) {
  return _then(_TransportSearchLeg(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departDate: null == departDate ? _self.departDate : departDate // ignore: cast_nullable_to_non_nullable
as DateTime,returnDate: freezed == returnDate ? _self.returnDate : returnDate // ignore: cast_nullable_to_non_nullable
as DateTime?,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TransportMode,
  ));
}


}


/// @nodoc
mixin _$TransportFilters {

 int? get maxStops; String? get cabinClass; bool? get refundableOnly;
/// Create a copy of TransportFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportFiltersCopyWith<TransportFilters> get copyWith => _$TransportFiltersCopyWithImpl<TransportFilters>(this as TransportFilters, _$identity);

  /// Serializes this TransportFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportFilters&&(identical(other.maxStops, maxStops) || other.maxStops == maxStops)&&(identical(other.cabinClass, cabinClass) || other.cabinClass == cabinClass)&&(identical(other.refundableOnly, refundableOnly) || other.refundableOnly == refundableOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxStops,cabinClass,refundableOnly);

@override
String toString() {
  return 'TransportFilters(maxStops: $maxStops, cabinClass: $cabinClass, refundableOnly: $refundableOnly)';
}


}

/// @nodoc
abstract mixin class $TransportFiltersCopyWith<$Res>  {
  factory $TransportFiltersCopyWith(TransportFilters value, $Res Function(TransportFilters) _then) = _$TransportFiltersCopyWithImpl;
@useResult
$Res call({
 int? maxStops, String? cabinClass, bool? refundableOnly
});




}
/// @nodoc
class _$TransportFiltersCopyWithImpl<$Res>
    implements $TransportFiltersCopyWith<$Res> {
  _$TransportFiltersCopyWithImpl(this._self, this._then);

  final TransportFilters _self;
  final $Res Function(TransportFilters) _then;

/// Create a copy of TransportFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxStops = freezed,Object? cabinClass = freezed,Object? refundableOnly = freezed,}) {
  return _then(_self.copyWith(
maxStops: freezed == maxStops ? _self.maxStops : maxStops // ignore: cast_nullable_to_non_nullable
as int?,cabinClass: freezed == cabinClass ? _self.cabinClass : cabinClass // ignore: cast_nullable_to_non_nullable
as String?,refundableOnly: freezed == refundableOnly ? _self.refundableOnly : refundableOnly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransportFilters].
extension TransportFiltersPatterns on TransportFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportFilters value)  $default,){
final _that = this;
switch (_that) {
case _TransportFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportFilters value)?  $default,){
final _that = this;
switch (_that) {
case _TransportFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? maxStops,  String? cabinClass,  bool? refundableOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportFilters() when $default != null:
return $default(_that.maxStops,_that.cabinClass,_that.refundableOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? maxStops,  String? cabinClass,  bool? refundableOnly)  $default,) {final _that = this;
switch (_that) {
case _TransportFilters():
return $default(_that.maxStops,_that.cabinClass,_that.refundableOnly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? maxStops,  String? cabinClass,  bool? refundableOnly)?  $default,) {final _that = this;
switch (_that) {
case _TransportFilters() when $default != null:
return $default(_that.maxStops,_that.cabinClass,_that.refundableOnly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportFilters implements TransportFilters {
  const _TransportFilters({this.maxStops, this.cabinClass, this.refundableOnly});
  factory _TransportFilters.fromJson(Map<String, dynamic> json) => _$TransportFiltersFromJson(json);

@override final  int? maxStops;
@override final  String? cabinClass;
@override final  bool? refundableOnly;

/// Create a copy of TransportFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportFiltersCopyWith<_TransportFilters> get copyWith => __$TransportFiltersCopyWithImpl<_TransportFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportFilters&&(identical(other.maxStops, maxStops) || other.maxStops == maxStops)&&(identical(other.cabinClass, cabinClass) || other.cabinClass == cabinClass)&&(identical(other.refundableOnly, refundableOnly) || other.refundableOnly == refundableOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxStops,cabinClass,refundableOnly);

@override
String toString() {
  return 'TransportFilters(maxStops: $maxStops, cabinClass: $cabinClass, refundableOnly: $refundableOnly)';
}


}

/// @nodoc
abstract mixin class _$TransportFiltersCopyWith<$Res> implements $TransportFiltersCopyWith<$Res> {
  factory _$TransportFiltersCopyWith(_TransportFilters value, $Res Function(_TransportFilters) _then) = __$TransportFiltersCopyWithImpl;
@override @useResult
$Res call({
 int? maxStops, String? cabinClass, bool? refundableOnly
});




}
/// @nodoc
class __$TransportFiltersCopyWithImpl<$Res>
    implements _$TransportFiltersCopyWith<$Res> {
  __$TransportFiltersCopyWithImpl(this._self, this._then);

  final _TransportFilters _self;
  final $Res Function(_TransportFilters) _then;

/// Create a copy of TransportFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxStops = freezed,Object? cabinClass = freezed,Object? refundableOnly = freezed,}) {
  return _then(_TransportFilters(
maxStops: freezed == maxStops ? _self.maxStops : maxStops // ignore: cast_nullable_to_non_nullable
as int?,cabinClass: freezed == cabinClass ? _self.cabinClass : cabinClass // ignore: cast_nullable_to_non_nullable
as String?,refundableOnly: freezed == refundableOnly ? _self.refundableOnly : refundableOnly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
