// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accommodation_search_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccommodationSearchRequest {

/// Active itinerary ID - required for context binding
 String get itineraryId;/// Place to search (city, region, or specific area)
 String get place;/// Check-in date
 DateTime get checkIn;/// Check-out date
 DateTime get checkOut;/// Room configurations with guest ages per room
/// Default: 1 room with 2 adults
 RoomGuests get guests;/// Optional filters
 AccommodationFilters? get filters;/// Optional sort preference
 AccommodationSort get sort;
/// Create a copy of AccommodationSearchRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccommodationSearchRequestCopyWith<AccommodationSearchRequest> get copyWith => _$AccommodationSearchRequestCopyWithImpl<AccommodationSearchRequest>(this as AccommodationSearchRequest, _$identity);

  /// Serializes this AccommodationSearchRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccommodationSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&const DeepCollectionEquality().equals(other.guests, guests)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,checkIn,checkOut,const DeepCollectionEquality().hash(guests),filters,sort);

@override
String toString() {
  return 'AccommodationSearchRequest(itineraryId: $itineraryId, place: $place, checkIn: $checkIn, checkOut: $checkOut, guests: $guests, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $AccommodationSearchRequestCopyWith<$Res>  {
  factory $AccommodationSearchRequestCopyWith(AccommodationSearchRequest value, $Res Function(AccommodationSearchRequest) _then) = _$AccommodationSearchRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, String place, DateTime checkIn, DateTime checkOut, RoomGuests guests, AccommodationFilters? filters, AccommodationSort sort
});


$AccommodationFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class _$AccommodationSearchRequestCopyWithImpl<$Res>
    implements $AccommodationSearchRequestCopyWith<$Res> {
  _$AccommodationSearchRequestCopyWithImpl(this._self, this._then);

  final AccommodationSearchRequest _self;
  final $Res Function(AccommodationSearchRequest) _then;

/// Create a copy of AccommodationSearchRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? place = null,Object? checkIn = null,Object? checkOut = null,Object? guests = null,Object? filters = freezed,Object? sort = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,checkIn: null == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime,checkOut: null == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as RoomGuests,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as AccommodationFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as AccommodationSort,
  ));
}
/// Create a copy of AccommodationSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccommodationFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $AccommodationFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccommodationSearchRequest].
extension AccommodationSearchRequestPatterns on AccommodationSearchRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccommodationSearchRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccommodationSearchRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccommodationSearchRequest value)  $default,){
final _that = this;
switch (_that) {
case _AccommodationSearchRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccommodationSearchRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AccommodationSearchRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  String place,  DateTime checkIn,  DateTime checkOut,  RoomGuests guests,  AccommodationFilters? filters,  AccommodationSort sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccommodationSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.checkIn,_that.checkOut,_that.guests,_that.filters,_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  String place,  DateTime checkIn,  DateTime checkOut,  RoomGuests guests,  AccommodationFilters? filters,  AccommodationSort sort)  $default,) {final _that = this;
switch (_that) {
case _AccommodationSearchRequest():
return $default(_that.itineraryId,_that.place,_that.checkIn,_that.checkOut,_that.guests,_that.filters,_that.sort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  String place,  DateTime checkIn,  DateTime checkOut,  RoomGuests guests,  AccommodationFilters? filters,  AccommodationSort sort)?  $default,) {final _that = this;
switch (_that) {
case _AccommodationSearchRequest() when $default != null:
return $default(_that.itineraryId,_that.place,_that.checkIn,_that.checkOut,_that.guests,_that.filters,_that.sort);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccommodationSearchRequest implements AccommodationSearchRequest {
  const _AccommodationSearchRequest({required this.itineraryId, required this.place, required this.checkIn, required this.checkOut, final  RoomGuests guests = const {0 : [30, 30]}, this.filters, this.sort = AccommodationSort.recommended}): _guests = guests;
  factory _AccommodationSearchRequest.fromJson(Map<String, dynamic> json) => _$AccommodationSearchRequestFromJson(json);

/// Active itinerary ID - required for context binding
@override final  String itineraryId;
/// Place to search (city, region, or specific area)
@override final  String place;
/// Check-in date
@override final  DateTime checkIn;
/// Check-out date
@override final  DateTime checkOut;
/// Room configurations with guest ages per room
/// Default: 1 room with 2 adults
 final  RoomGuests _guests;
/// Room configurations with guest ages per room
/// Default: 1 room with 2 adults
@override@JsonKey() RoomGuests get guests {
  if (_guests is EqualUnmodifiableMapView) return _guests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_guests);
}

/// Optional filters
@override final  AccommodationFilters? filters;
/// Optional sort preference
@override@JsonKey() final  AccommodationSort sort;

/// Create a copy of AccommodationSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccommodationSearchRequestCopyWith<_AccommodationSearchRequest> get copyWith => __$AccommodationSearchRequestCopyWithImpl<_AccommodationSearchRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccommodationSearchRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccommodationSearchRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.place, place) || other.place == place)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut)&&const DeepCollectionEquality().equals(other._guests, _guests)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.sort, sort) || other.sort == sort));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,place,checkIn,checkOut,const DeepCollectionEquality().hash(_guests),filters,sort);

@override
String toString() {
  return 'AccommodationSearchRequest(itineraryId: $itineraryId, place: $place, checkIn: $checkIn, checkOut: $checkOut, guests: $guests, filters: $filters, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$AccommodationSearchRequestCopyWith<$Res> implements $AccommodationSearchRequestCopyWith<$Res> {
  factory _$AccommodationSearchRequestCopyWith(_AccommodationSearchRequest value, $Res Function(_AccommodationSearchRequest) _then) = __$AccommodationSearchRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, String place, DateTime checkIn, DateTime checkOut, RoomGuests guests, AccommodationFilters? filters, AccommodationSort sort
});


@override $AccommodationFiltersCopyWith<$Res>? get filters;

}
/// @nodoc
class __$AccommodationSearchRequestCopyWithImpl<$Res>
    implements _$AccommodationSearchRequestCopyWith<$Res> {
  __$AccommodationSearchRequestCopyWithImpl(this._self, this._then);

  final _AccommodationSearchRequest _self;
  final $Res Function(_AccommodationSearchRequest) _then;

/// Create a copy of AccommodationSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? place = null,Object? checkIn = null,Object? checkOut = null,Object? guests = null,Object? filters = freezed,Object? sort = null,}) {
  return _then(_AccommodationSearchRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,place: null == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String,checkIn: null == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime,checkOut: null == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime,guests: null == guests ? _self._guests : guests // ignore: cast_nullable_to_non_nullable
as RoomGuests,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as AccommodationFilters?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as AccommodationSort,
  ));
}

/// Create a copy of AccommodationSearchRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccommodationFiltersCopyWith<$Res>? get filters {
    if (_self.filters == null) {
    return null;
  }

  return $AccommodationFiltersCopyWith<$Res>(_self.filters!, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// @nodoc
mixin _$AccommodationFilters {

/// Price range (per night)
 double? get minPrice; double? get maxPrice;/// Property types to include
 List<PropertyType>? get propertyTypes;/// Minimum star rating
 int? get minStarRating;/// Minimum review score (0-10)
 double? get minReviewScore;/// Maximum distance to POI in meters
 int? get maxDistanceToPoi;/// POI coordinates for distance filter
 double? get poiLat; double? get poiLng;/// Amenity filters
 bool? get freeCancellation; bool? get payAtProperty; bool? get breakfastIncluded; bool? get wifi; bool? get parking; bool? get pool; bool? get petFriendly; bool? get accessible;
/// Create a copy of AccommodationFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccommodationFiltersCopyWith<AccommodationFilters> get copyWith => _$AccommodationFiltersCopyWithImpl<AccommodationFilters>(this as AccommodationFilters, _$identity);

  /// Serializes this AccommodationFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccommodationFilters&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&const DeepCollectionEquality().equals(other.propertyTypes, propertyTypes)&&(identical(other.minStarRating, minStarRating) || other.minStarRating == minStarRating)&&(identical(other.minReviewScore, minReviewScore) || other.minReviewScore == minReviewScore)&&(identical(other.maxDistanceToPoi, maxDistanceToPoi) || other.maxDistanceToPoi == maxDistanceToPoi)&&(identical(other.poiLat, poiLat) || other.poiLat == poiLat)&&(identical(other.poiLng, poiLng) || other.poiLng == poiLng)&&(identical(other.freeCancellation, freeCancellation) || other.freeCancellation == freeCancellation)&&(identical(other.payAtProperty, payAtProperty) || other.payAtProperty == payAtProperty)&&(identical(other.breakfastIncluded, breakfastIncluded) || other.breakfastIncluded == breakfastIncluded)&&(identical(other.wifi, wifi) || other.wifi == wifi)&&(identical(other.parking, parking) || other.parking == parking)&&(identical(other.pool, pool) || other.pool == pool)&&(identical(other.petFriendly, petFriendly) || other.petFriendly == petFriendly)&&(identical(other.accessible, accessible) || other.accessible == accessible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minPrice,maxPrice,const DeepCollectionEquality().hash(propertyTypes),minStarRating,minReviewScore,maxDistanceToPoi,poiLat,poiLng,freeCancellation,payAtProperty,breakfastIncluded,wifi,parking,pool,petFriendly,accessible);

@override
String toString() {
  return 'AccommodationFilters(minPrice: $minPrice, maxPrice: $maxPrice, propertyTypes: $propertyTypes, minStarRating: $minStarRating, minReviewScore: $minReviewScore, maxDistanceToPoi: $maxDistanceToPoi, poiLat: $poiLat, poiLng: $poiLng, freeCancellation: $freeCancellation, payAtProperty: $payAtProperty, breakfastIncluded: $breakfastIncluded, wifi: $wifi, parking: $parking, pool: $pool, petFriendly: $petFriendly, accessible: $accessible)';
}


}

/// @nodoc
abstract mixin class $AccommodationFiltersCopyWith<$Res>  {
  factory $AccommodationFiltersCopyWith(AccommodationFilters value, $Res Function(AccommodationFilters) _then) = _$AccommodationFiltersCopyWithImpl;
@useResult
$Res call({
 double? minPrice, double? maxPrice, List<PropertyType>? propertyTypes, int? minStarRating, double? minReviewScore, int? maxDistanceToPoi, double? poiLat, double? poiLng, bool? freeCancellation, bool? payAtProperty, bool? breakfastIncluded, bool? wifi, bool? parking, bool? pool, bool? petFriendly, bool? accessible
});




}
/// @nodoc
class _$AccommodationFiltersCopyWithImpl<$Res>
    implements $AccommodationFiltersCopyWith<$Res> {
  _$AccommodationFiltersCopyWithImpl(this._self, this._then);

  final AccommodationFilters _self;
  final $Res Function(AccommodationFilters) _then;

/// Create a copy of AccommodationFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minPrice = freezed,Object? maxPrice = freezed,Object? propertyTypes = freezed,Object? minStarRating = freezed,Object? minReviewScore = freezed,Object? maxDistanceToPoi = freezed,Object? poiLat = freezed,Object? poiLng = freezed,Object? freeCancellation = freezed,Object? payAtProperty = freezed,Object? breakfastIncluded = freezed,Object? wifi = freezed,Object? parking = freezed,Object? pool = freezed,Object? petFriendly = freezed,Object? accessible = freezed,}) {
  return _then(_self.copyWith(
minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,propertyTypes: freezed == propertyTypes ? _self.propertyTypes : propertyTypes // ignore: cast_nullable_to_non_nullable
as List<PropertyType>?,minStarRating: freezed == minStarRating ? _self.minStarRating : minStarRating // ignore: cast_nullable_to_non_nullable
as int?,minReviewScore: freezed == minReviewScore ? _self.minReviewScore : minReviewScore // ignore: cast_nullable_to_non_nullable
as double?,maxDistanceToPoi: freezed == maxDistanceToPoi ? _self.maxDistanceToPoi : maxDistanceToPoi // ignore: cast_nullable_to_non_nullable
as int?,poiLat: freezed == poiLat ? _self.poiLat : poiLat // ignore: cast_nullable_to_non_nullable
as double?,poiLng: freezed == poiLng ? _self.poiLng : poiLng // ignore: cast_nullable_to_non_nullable
as double?,freeCancellation: freezed == freeCancellation ? _self.freeCancellation : freeCancellation // ignore: cast_nullable_to_non_nullable
as bool?,payAtProperty: freezed == payAtProperty ? _self.payAtProperty : payAtProperty // ignore: cast_nullable_to_non_nullable
as bool?,breakfastIncluded: freezed == breakfastIncluded ? _self.breakfastIncluded : breakfastIncluded // ignore: cast_nullable_to_non_nullable
as bool?,wifi: freezed == wifi ? _self.wifi : wifi // ignore: cast_nullable_to_non_nullable
as bool?,parking: freezed == parking ? _self.parking : parking // ignore: cast_nullable_to_non_nullable
as bool?,pool: freezed == pool ? _self.pool : pool // ignore: cast_nullable_to_non_nullable
as bool?,petFriendly: freezed == petFriendly ? _self.petFriendly : petFriendly // ignore: cast_nullable_to_non_nullable
as bool?,accessible: freezed == accessible ? _self.accessible : accessible // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccommodationFilters].
extension AccommodationFiltersPatterns on AccommodationFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccommodationFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccommodationFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccommodationFilters value)  $default,){
final _that = this;
switch (_that) {
case _AccommodationFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccommodationFilters value)?  $default,){
final _that = this;
switch (_that) {
case _AccommodationFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? minPrice,  double? maxPrice,  List<PropertyType>? propertyTypes,  int? minStarRating,  double? minReviewScore,  int? maxDistanceToPoi,  double? poiLat,  double? poiLng,  bool? freeCancellation,  bool? payAtProperty,  bool? breakfastIncluded,  bool? wifi,  bool? parking,  bool? pool,  bool? petFriendly,  bool? accessible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccommodationFilters() when $default != null:
return $default(_that.minPrice,_that.maxPrice,_that.propertyTypes,_that.minStarRating,_that.minReviewScore,_that.maxDistanceToPoi,_that.poiLat,_that.poiLng,_that.freeCancellation,_that.payAtProperty,_that.breakfastIncluded,_that.wifi,_that.parking,_that.pool,_that.petFriendly,_that.accessible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? minPrice,  double? maxPrice,  List<PropertyType>? propertyTypes,  int? minStarRating,  double? minReviewScore,  int? maxDistanceToPoi,  double? poiLat,  double? poiLng,  bool? freeCancellation,  bool? payAtProperty,  bool? breakfastIncluded,  bool? wifi,  bool? parking,  bool? pool,  bool? petFriendly,  bool? accessible)  $default,) {final _that = this;
switch (_that) {
case _AccommodationFilters():
return $default(_that.minPrice,_that.maxPrice,_that.propertyTypes,_that.minStarRating,_that.minReviewScore,_that.maxDistanceToPoi,_that.poiLat,_that.poiLng,_that.freeCancellation,_that.payAtProperty,_that.breakfastIncluded,_that.wifi,_that.parking,_that.pool,_that.petFriendly,_that.accessible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? minPrice,  double? maxPrice,  List<PropertyType>? propertyTypes,  int? minStarRating,  double? minReviewScore,  int? maxDistanceToPoi,  double? poiLat,  double? poiLng,  bool? freeCancellation,  bool? payAtProperty,  bool? breakfastIncluded,  bool? wifi,  bool? parking,  bool? pool,  bool? petFriendly,  bool? accessible)?  $default,) {final _that = this;
switch (_that) {
case _AccommodationFilters() when $default != null:
return $default(_that.minPrice,_that.maxPrice,_that.propertyTypes,_that.minStarRating,_that.minReviewScore,_that.maxDistanceToPoi,_that.poiLat,_that.poiLng,_that.freeCancellation,_that.payAtProperty,_that.breakfastIncluded,_that.wifi,_that.parking,_that.pool,_that.petFriendly,_that.accessible);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccommodationFilters implements AccommodationFilters {
  const _AccommodationFilters({this.minPrice, this.maxPrice, final  List<PropertyType>? propertyTypes, this.minStarRating, this.minReviewScore, this.maxDistanceToPoi, this.poiLat, this.poiLng, this.freeCancellation, this.payAtProperty, this.breakfastIncluded, this.wifi, this.parking, this.pool, this.petFriendly, this.accessible}): _propertyTypes = propertyTypes;
  factory _AccommodationFilters.fromJson(Map<String, dynamic> json) => _$AccommodationFiltersFromJson(json);

/// Price range (per night)
@override final  double? minPrice;
@override final  double? maxPrice;
/// Property types to include
 final  List<PropertyType>? _propertyTypes;
/// Property types to include
@override List<PropertyType>? get propertyTypes {
  final value = _propertyTypes;
  if (value == null) return null;
  if (_propertyTypes is EqualUnmodifiableListView) return _propertyTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Minimum star rating
@override final  int? minStarRating;
/// Minimum review score (0-10)
@override final  double? minReviewScore;
/// Maximum distance to POI in meters
@override final  int? maxDistanceToPoi;
/// POI coordinates for distance filter
@override final  double? poiLat;
@override final  double? poiLng;
/// Amenity filters
@override final  bool? freeCancellation;
@override final  bool? payAtProperty;
@override final  bool? breakfastIncluded;
@override final  bool? wifi;
@override final  bool? parking;
@override final  bool? pool;
@override final  bool? petFriendly;
@override final  bool? accessible;

/// Create a copy of AccommodationFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccommodationFiltersCopyWith<_AccommodationFilters> get copyWith => __$AccommodationFiltersCopyWithImpl<_AccommodationFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccommodationFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccommodationFilters&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&const DeepCollectionEquality().equals(other._propertyTypes, _propertyTypes)&&(identical(other.minStarRating, minStarRating) || other.minStarRating == minStarRating)&&(identical(other.minReviewScore, minReviewScore) || other.minReviewScore == minReviewScore)&&(identical(other.maxDistanceToPoi, maxDistanceToPoi) || other.maxDistanceToPoi == maxDistanceToPoi)&&(identical(other.poiLat, poiLat) || other.poiLat == poiLat)&&(identical(other.poiLng, poiLng) || other.poiLng == poiLng)&&(identical(other.freeCancellation, freeCancellation) || other.freeCancellation == freeCancellation)&&(identical(other.payAtProperty, payAtProperty) || other.payAtProperty == payAtProperty)&&(identical(other.breakfastIncluded, breakfastIncluded) || other.breakfastIncluded == breakfastIncluded)&&(identical(other.wifi, wifi) || other.wifi == wifi)&&(identical(other.parking, parking) || other.parking == parking)&&(identical(other.pool, pool) || other.pool == pool)&&(identical(other.petFriendly, petFriendly) || other.petFriendly == petFriendly)&&(identical(other.accessible, accessible) || other.accessible == accessible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minPrice,maxPrice,const DeepCollectionEquality().hash(_propertyTypes),minStarRating,minReviewScore,maxDistanceToPoi,poiLat,poiLng,freeCancellation,payAtProperty,breakfastIncluded,wifi,parking,pool,petFriendly,accessible);

@override
String toString() {
  return 'AccommodationFilters(minPrice: $minPrice, maxPrice: $maxPrice, propertyTypes: $propertyTypes, minStarRating: $minStarRating, minReviewScore: $minReviewScore, maxDistanceToPoi: $maxDistanceToPoi, poiLat: $poiLat, poiLng: $poiLng, freeCancellation: $freeCancellation, payAtProperty: $payAtProperty, breakfastIncluded: $breakfastIncluded, wifi: $wifi, parking: $parking, pool: $pool, petFriendly: $petFriendly, accessible: $accessible)';
}


}

/// @nodoc
abstract mixin class _$AccommodationFiltersCopyWith<$Res> implements $AccommodationFiltersCopyWith<$Res> {
  factory _$AccommodationFiltersCopyWith(_AccommodationFilters value, $Res Function(_AccommodationFilters) _then) = __$AccommodationFiltersCopyWithImpl;
@override @useResult
$Res call({
 double? minPrice, double? maxPrice, List<PropertyType>? propertyTypes, int? minStarRating, double? minReviewScore, int? maxDistanceToPoi, double? poiLat, double? poiLng, bool? freeCancellation, bool? payAtProperty, bool? breakfastIncluded, bool? wifi, bool? parking, bool? pool, bool? petFriendly, bool? accessible
});




}
/// @nodoc
class __$AccommodationFiltersCopyWithImpl<$Res>
    implements _$AccommodationFiltersCopyWith<$Res> {
  __$AccommodationFiltersCopyWithImpl(this._self, this._then);

  final _AccommodationFilters _self;
  final $Res Function(_AccommodationFilters) _then;

/// Create a copy of AccommodationFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minPrice = freezed,Object? maxPrice = freezed,Object? propertyTypes = freezed,Object? minStarRating = freezed,Object? minReviewScore = freezed,Object? maxDistanceToPoi = freezed,Object? poiLat = freezed,Object? poiLng = freezed,Object? freeCancellation = freezed,Object? payAtProperty = freezed,Object? breakfastIncluded = freezed,Object? wifi = freezed,Object? parking = freezed,Object? pool = freezed,Object? petFriendly = freezed,Object? accessible = freezed,}) {
  return _then(_AccommodationFilters(
minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,propertyTypes: freezed == propertyTypes ? _self._propertyTypes : propertyTypes // ignore: cast_nullable_to_non_nullable
as List<PropertyType>?,minStarRating: freezed == minStarRating ? _self.minStarRating : minStarRating // ignore: cast_nullable_to_non_nullable
as int?,minReviewScore: freezed == minReviewScore ? _self.minReviewScore : minReviewScore // ignore: cast_nullable_to_non_nullable
as double?,maxDistanceToPoi: freezed == maxDistanceToPoi ? _self.maxDistanceToPoi : maxDistanceToPoi // ignore: cast_nullable_to_non_nullable
as int?,poiLat: freezed == poiLat ? _self.poiLat : poiLat // ignore: cast_nullable_to_non_nullable
as double?,poiLng: freezed == poiLng ? _self.poiLng : poiLng // ignore: cast_nullable_to_non_nullable
as double?,freeCancellation: freezed == freeCancellation ? _self.freeCancellation : freeCancellation // ignore: cast_nullable_to_non_nullable
as bool?,payAtProperty: freezed == payAtProperty ? _self.payAtProperty : payAtProperty // ignore: cast_nullable_to_non_nullable
as bool?,breakfastIncluded: freezed == breakfastIncluded ? _self.breakfastIncluded : breakfastIncluded // ignore: cast_nullable_to_non_nullable
as bool?,wifi: freezed == wifi ? _self.wifi : wifi // ignore: cast_nullable_to_non_nullable
as bool?,parking: freezed == parking ? _self.parking : parking // ignore: cast_nullable_to_non_nullable
as bool?,pool: freezed == pool ? _self.pool : pool // ignore: cast_nullable_to_non_nullable
as bool?,petFriendly: freezed == petFriendly ? _self.petFriendly : petFriendly // ignore: cast_nullable_to_non_nullable
as bool?,accessible: freezed == accessible ? _self.accessible : accessible // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
