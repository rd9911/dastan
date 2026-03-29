// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PropertyItem {

/// Internal ID
 String get id;/// Provider/vendor ID (e.g., "booking", "expedia")
 String get providerId;/// External property ID from the provider
 String get externalId;/// Property name
 String get name;/// Property type
 PropertyType get type;/// Location description
 String get location;/// Coordinates
 double get latitude; double get longitude;/// Star rating (1-5)
 int? get starRating;/// Review score (0-10)
 double? get reviewScore;/// Number of reviews
 int? get reviewCount;/// Thumbnail image URL
 String? get thumbnailUrl;/// Gallery image URLs
 List<String> get imageUrls;/// Amenities list
 List<String> get amenities;/// Room options matrix
 List<RoomOption> get roomMatrix;/// Policies (cancellation, payment)
 Policies? get policies;/// Distance to POI in meters (if POI was specified)
 int? get distanceToPoi;/// ETA to POI in minutes (if calculated)
 int? get etaToPoi;/// Vendor booking URL
 String? get vendorUrl;
/// Create a copy of PropertyItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyItemCopyWith<PropertyItem> get copyWith => _$PropertyItemCopyWithImpl<PropertyItem>(this as PropertyItem, _$identity);

  /// Serializes this PropertyItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyItem&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.starRating, starRating) || other.starRating == starRating)&&(identical(other.reviewScore, reviewScore) || other.reviewScore == reviewScore)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&const DeepCollectionEquality().equals(other.roomMatrix, roomMatrix)&&(identical(other.policies, policies) || other.policies == policies)&&(identical(other.distanceToPoi, distanceToPoi) || other.distanceToPoi == distanceToPoi)&&(identical(other.etaToPoi, etaToPoi) || other.etaToPoi == etaToPoi)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,providerId,externalId,name,type,location,latitude,longitude,starRating,reviewScore,reviewCount,thumbnailUrl,const DeepCollectionEquality().hash(imageUrls),const DeepCollectionEquality().hash(amenities),const DeepCollectionEquality().hash(roomMatrix),policies,distanceToPoi,etaToPoi,vendorUrl]);

@override
String toString() {
  return 'PropertyItem(id: $id, providerId: $providerId, externalId: $externalId, name: $name, type: $type, location: $location, latitude: $latitude, longitude: $longitude, starRating: $starRating, reviewScore: $reviewScore, reviewCount: $reviewCount, thumbnailUrl: $thumbnailUrl, imageUrls: $imageUrls, amenities: $amenities, roomMatrix: $roomMatrix, policies: $policies, distanceToPoi: $distanceToPoi, etaToPoi: $etaToPoi, vendorUrl: $vendorUrl)';
}


}

/// @nodoc
abstract mixin class $PropertyItemCopyWith<$Res>  {
  factory $PropertyItemCopyWith(PropertyItem value, $Res Function(PropertyItem) _then) = _$PropertyItemCopyWithImpl;
@useResult
$Res call({
 String id, String providerId, String externalId, String name, PropertyType type, String location, double latitude, double longitude, int? starRating, double? reviewScore, int? reviewCount, String? thumbnailUrl, List<String> imageUrls, List<String> amenities, List<RoomOption> roomMatrix, Policies? policies, int? distanceToPoi, int? etaToPoi, String? vendorUrl
});


$PoliciesCopyWith<$Res>? get policies;

}
/// @nodoc
class _$PropertyItemCopyWithImpl<$Res>
    implements $PropertyItemCopyWith<$Res> {
  _$PropertyItemCopyWithImpl(this._self, this._then);

  final PropertyItem _self;
  final $Res Function(PropertyItem) _then;

/// Create a copy of PropertyItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? type = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? starRating = freezed,Object? reviewScore = freezed,Object? reviewCount = freezed,Object? thumbnailUrl = freezed,Object? imageUrls = null,Object? amenities = null,Object? roomMatrix = null,Object? policies = freezed,Object? distanceToPoi = freezed,Object? etaToPoi = freezed,Object? vendorUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PropertyType,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,starRating: freezed == starRating ? _self.starRating : starRating // ignore: cast_nullable_to_non_nullable
as int?,reviewScore: freezed == reviewScore ? _self.reviewScore : reviewScore // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<String>,roomMatrix: null == roomMatrix ? _self.roomMatrix : roomMatrix // ignore: cast_nullable_to_non_nullable
as List<RoomOption>,policies: freezed == policies ? _self.policies : policies // ignore: cast_nullable_to_non_nullable
as Policies?,distanceToPoi: freezed == distanceToPoi ? _self.distanceToPoi : distanceToPoi // ignore: cast_nullable_to_non_nullable
as int?,etaToPoi: freezed == etaToPoi ? _self.etaToPoi : etaToPoi // ignore: cast_nullable_to_non_nullable
as int?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PropertyItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PoliciesCopyWith<$Res>? get policies {
    if (_self.policies == null) {
    return null;
  }

  return $PoliciesCopyWith<$Res>(_self.policies!, (value) {
    return _then(_self.copyWith(policies: value));
  });
}
}


/// Adds pattern-matching-related methods to [PropertyItem].
extension PropertyItemPatterns on PropertyItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyItem value)  $default,){
final _that = this;
switch (_that) {
case _PropertyItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyItem value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  PropertyType type,  String location,  double latitude,  double longitude,  int? starRating,  double? reviewScore,  int? reviewCount,  String? thumbnailUrl,  List<String> imageUrls,  List<String> amenities,  List<RoomOption> roomMatrix,  Policies? policies,  int? distanceToPoi,  int? etaToPoi,  String? vendorUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyItem() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.type,_that.location,_that.latitude,_that.longitude,_that.starRating,_that.reviewScore,_that.reviewCount,_that.thumbnailUrl,_that.imageUrls,_that.amenities,_that.roomMatrix,_that.policies,_that.distanceToPoi,_that.etaToPoi,_that.vendorUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String providerId,  String externalId,  String name,  PropertyType type,  String location,  double latitude,  double longitude,  int? starRating,  double? reviewScore,  int? reviewCount,  String? thumbnailUrl,  List<String> imageUrls,  List<String> amenities,  List<RoomOption> roomMatrix,  Policies? policies,  int? distanceToPoi,  int? etaToPoi,  String? vendorUrl)  $default,) {final _that = this;
switch (_that) {
case _PropertyItem():
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.type,_that.location,_that.latitude,_that.longitude,_that.starRating,_that.reviewScore,_that.reviewCount,_that.thumbnailUrl,_that.imageUrls,_that.amenities,_that.roomMatrix,_that.policies,_that.distanceToPoi,_that.etaToPoi,_that.vendorUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String providerId,  String externalId,  String name,  PropertyType type,  String location,  double latitude,  double longitude,  int? starRating,  double? reviewScore,  int? reviewCount,  String? thumbnailUrl,  List<String> imageUrls,  List<String> amenities,  List<RoomOption> roomMatrix,  Policies? policies,  int? distanceToPoi,  int? etaToPoi,  String? vendorUrl)?  $default,) {final _that = this;
switch (_that) {
case _PropertyItem() when $default != null:
return $default(_that.id,_that.providerId,_that.externalId,_that.name,_that.type,_that.location,_that.latitude,_that.longitude,_that.starRating,_that.reviewScore,_that.reviewCount,_that.thumbnailUrl,_that.imageUrls,_that.amenities,_that.roomMatrix,_that.policies,_that.distanceToPoi,_that.etaToPoi,_that.vendorUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyItem implements PropertyItem {
  const _PropertyItem({required this.id, required this.providerId, required this.externalId, required this.name, required this.type, required this.location, required this.latitude, required this.longitude, this.starRating, this.reviewScore, this.reviewCount, this.thumbnailUrl, final  List<String> imageUrls = const [], final  List<String> amenities = const [], final  List<RoomOption> roomMatrix = const [], this.policies, this.distanceToPoi, this.etaToPoi, this.vendorUrl}): _imageUrls = imageUrls,_amenities = amenities,_roomMatrix = roomMatrix;
  factory _PropertyItem.fromJson(Map<String, dynamic> json) => _$PropertyItemFromJson(json);

/// Internal ID
@override final  String id;
/// Provider/vendor ID (e.g., "booking", "expedia")
@override final  String providerId;
/// External property ID from the provider
@override final  String externalId;
/// Property name
@override final  String name;
/// Property type
@override final  PropertyType type;
/// Location description
@override final  String location;
/// Coordinates
@override final  double latitude;
@override final  double longitude;
/// Star rating (1-5)
@override final  int? starRating;
/// Review score (0-10)
@override final  double? reviewScore;
/// Number of reviews
@override final  int? reviewCount;
/// Thumbnail image URL
@override final  String? thumbnailUrl;
/// Gallery image URLs
 final  List<String> _imageUrls;
/// Gallery image URLs
@override@JsonKey() List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

/// Amenities list
 final  List<String> _amenities;
/// Amenities list
@override@JsonKey() List<String> get amenities {
  if (_amenities is EqualUnmodifiableListView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenities);
}

/// Room options matrix
 final  List<RoomOption> _roomMatrix;
/// Room options matrix
@override@JsonKey() List<RoomOption> get roomMatrix {
  if (_roomMatrix is EqualUnmodifiableListView) return _roomMatrix;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roomMatrix);
}

/// Policies (cancellation, payment)
@override final  Policies? policies;
/// Distance to POI in meters (if POI was specified)
@override final  int? distanceToPoi;
/// ETA to POI in minutes (if calculated)
@override final  int? etaToPoi;
/// Vendor booking URL
@override final  String? vendorUrl;

/// Create a copy of PropertyItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyItemCopyWith<_PropertyItem> get copyWith => __$PropertyItemCopyWithImpl<_PropertyItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyItem&&(identical(other.id, id) || other.id == id)&&(identical(other.providerId, providerId) || other.providerId == providerId)&&(identical(other.externalId, externalId) || other.externalId == externalId)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.starRating, starRating) || other.starRating == starRating)&&(identical(other.reviewScore, reviewScore) || other.reviewScore == reviewScore)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&const DeepCollectionEquality().equals(other._roomMatrix, _roomMatrix)&&(identical(other.policies, policies) || other.policies == policies)&&(identical(other.distanceToPoi, distanceToPoi) || other.distanceToPoi == distanceToPoi)&&(identical(other.etaToPoi, etaToPoi) || other.etaToPoi == etaToPoi)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,providerId,externalId,name,type,location,latitude,longitude,starRating,reviewScore,reviewCount,thumbnailUrl,const DeepCollectionEquality().hash(_imageUrls),const DeepCollectionEquality().hash(_amenities),const DeepCollectionEquality().hash(_roomMatrix),policies,distanceToPoi,etaToPoi,vendorUrl]);

@override
String toString() {
  return 'PropertyItem(id: $id, providerId: $providerId, externalId: $externalId, name: $name, type: $type, location: $location, latitude: $latitude, longitude: $longitude, starRating: $starRating, reviewScore: $reviewScore, reviewCount: $reviewCount, thumbnailUrl: $thumbnailUrl, imageUrls: $imageUrls, amenities: $amenities, roomMatrix: $roomMatrix, policies: $policies, distanceToPoi: $distanceToPoi, etaToPoi: $etaToPoi, vendorUrl: $vendorUrl)';
}


}

/// @nodoc
abstract mixin class _$PropertyItemCopyWith<$Res> implements $PropertyItemCopyWith<$Res> {
  factory _$PropertyItemCopyWith(_PropertyItem value, $Res Function(_PropertyItem) _then) = __$PropertyItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String providerId, String externalId, String name, PropertyType type, String location, double latitude, double longitude, int? starRating, double? reviewScore, int? reviewCount, String? thumbnailUrl, List<String> imageUrls, List<String> amenities, List<RoomOption> roomMatrix, Policies? policies, int? distanceToPoi, int? etaToPoi, String? vendorUrl
});


@override $PoliciesCopyWith<$Res>? get policies;

}
/// @nodoc
class __$PropertyItemCopyWithImpl<$Res>
    implements _$PropertyItemCopyWith<$Res> {
  __$PropertyItemCopyWithImpl(this._self, this._then);

  final _PropertyItem _self;
  final $Res Function(_PropertyItem) _then;

/// Create a copy of PropertyItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providerId = null,Object? externalId = null,Object? name = null,Object? type = null,Object? location = null,Object? latitude = null,Object? longitude = null,Object? starRating = freezed,Object? reviewScore = freezed,Object? reviewCount = freezed,Object? thumbnailUrl = freezed,Object? imageUrls = null,Object? amenities = null,Object? roomMatrix = null,Object? policies = freezed,Object? distanceToPoi = freezed,Object? etaToPoi = freezed,Object? vendorUrl = freezed,}) {
  return _then(_PropertyItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providerId: null == providerId ? _self.providerId : providerId // ignore: cast_nullable_to_non_nullable
as String,externalId: null == externalId ? _self.externalId : externalId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PropertyType,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,starRating: freezed == starRating ? _self.starRating : starRating // ignore: cast_nullable_to_non_nullable
as int?,reviewScore: freezed == reviewScore ? _self.reviewScore : reviewScore // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<String>,roomMatrix: null == roomMatrix ? _self._roomMatrix : roomMatrix // ignore: cast_nullable_to_non_nullable
as List<RoomOption>,policies: freezed == policies ? _self.policies : policies // ignore: cast_nullable_to_non_nullable
as Policies?,distanceToPoi: freezed == distanceToPoi ? _self.distanceToPoi : distanceToPoi // ignore: cast_nullable_to_non_nullable
as int?,etaToPoi: freezed == etaToPoi ? _self.etaToPoi : etaToPoi // ignore: cast_nullable_to_non_nullable
as int?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PropertyItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PoliciesCopyWith<$Res>? get policies {
    if (_self.policies == null) {
    return null;
  }

  return $PoliciesCopyWith<$Res>(_self.policies!, (value) {
    return _then(_self.copyWith(policies: value));
  });
}
}


/// @nodoc
mixin _$RoomOption {

/// Room ID
 String get id;/// Room name/description
 String get name;/// Board plan (e.g., "Room Only", "Breakfast", "Half Board", "Full Board")
 String get boardPlan;/// Maximum occupancy
 int get maxOccupancy;/// Bed configuration description
 String? get bedConfig;/// Price breakdown for this room
 PriceBreakdown get price;/// Number of rooms available
 int? get availability;/// Is this option refundable?
 bool get refundable;/// Cancellation deadline (if refundable)
 DateTime? get cancellationDeadline;
/// Create a copy of RoomOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomOptionCopyWith<RoomOption> get copyWith => _$RoomOptionCopyWithImpl<RoomOption>(this as RoomOption, _$identity);

  /// Serializes this RoomOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.boardPlan, boardPlan) || other.boardPlan == boardPlan)&&(identical(other.maxOccupancy, maxOccupancy) || other.maxOccupancy == maxOccupancy)&&(identical(other.bedConfig, bedConfig) || other.bedConfig == bedConfig)&&(identical(other.price, price) || other.price == price)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.cancellationDeadline, cancellationDeadline) || other.cancellationDeadline == cancellationDeadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,boardPlan,maxOccupancy,bedConfig,price,availability,refundable,cancellationDeadline);

@override
String toString() {
  return 'RoomOption(id: $id, name: $name, boardPlan: $boardPlan, maxOccupancy: $maxOccupancy, bedConfig: $bedConfig, price: $price, availability: $availability, refundable: $refundable, cancellationDeadline: $cancellationDeadline)';
}


}

/// @nodoc
abstract mixin class $RoomOptionCopyWith<$Res>  {
  factory $RoomOptionCopyWith(RoomOption value, $Res Function(RoomOption) _then) = _$RoomOptionCopyWithImpl;
@useResult
$Res call({
 String id, String name, String boardPlan, int maxOccupancy, String? bedConfig, PriceBreakdown price, int? availability, bool refundable, DateTime? cancellationDeadline
});


$PriceBreakdownCopyWith<$Res> get price;

}
/// @nodoc
class _$RoomOptionCopyWithImpl<$Res>
    implements $RoomOptionCopyWith<$Res> {
  _$RoomOptionCopyWithImpl(this._self, this._then);

  final RoomOption _self;
  final $Res Function(RoomOption) _then;

/// Create a copy of RoomOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? boardPlan = null,Object? maxOccupancy = null,Object? bedConfig = freezed,Object? price = null,Object? availability = freezed,Object? refundable = null,Object? cancellationDeadline = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,boardPlan: null == boardPlan ? _self.boardPlan : boardPlan // ignore: cast_nullable_to_non_nullable
as String,maxOccupancy: null == maxOccupancy ? _self.maxOccupancy : maxOccupancy // ignore: cast_nullable_to_non_nullable
as int,bedConfig: freezed == bedConfig ? _self.bedConfig : bedConfig // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as PriceBreakdown,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as int?,refundable: null == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as bool,cancellationDeadline: freezed == cancellationDeadline ? _self.cancellationDeadline : cancellationDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of RoomOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceBreakdownCopyWith<$Res> get price {
  
  return $PriceBreakdownCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomOption].
extension RoomOptionPatterns on RoomOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomOption value)  $default,){
final _that = this;
switch (_that) {
case _RoomOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomOption value)?  $default,){
final _that = this;
switch (_that) {
case _RoomOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String boardPlan,  int maxOccupancy,  String? bedConfig,  PriceBreakdown price,  int? availability,  bool refundable,  DateTime? cancellationDeadline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomOption() when $default != null:
return $default(_that.id,_that.name,_that.boardPlan,_that.maxOccupancy,_that.bedConfig,_that.price,_that.availability,_that.refundable,_that.cancellationDeadline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String boardPlan,  int maxOccupancy,  String? bedConfig,  PriceBreakdown price,  int? availability,  bool refundable,  DateTime? cancellationDeadline)  $default,) {final _that = this;
switch (_that) {
case _RoomOption():
return $default(_that.id,_that.name,_that.boardPlan,_that.maxOccupancy,_that.bedConfig,_that.price,_that.availability,_that.refundable,_that.cancellationDeadline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String boardPlan,  int maxOccupancy,  String? bedConfig,  PriceBreakdown price,  int? availability,  bool refundable,  DateTime? cancellationDeadline)?  $default,) {final _that = this;
switch (_that) {
case _RoomOption() when $default != null:
return $default(_that.id,_that.name,_that.boardPlan,_that.maxOccupancy,_that.bedConfig,_that.price,_that.availability,_that.refundable,_that.cancellationDeadline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomOption implements RoomOption {
  const _RoomOption({required this.id, required this.name, required this.boardPlan, required this.maxOccupancy, this.bedConfig, required this.price, this.availability, this.refundable = false, this.cancellationDeadline});
  factory _RoomOption.fromJson(Map<String, dynamic> json) => _$RoomOptionFromJson(json);

/// Room ID
@override final  String id;
/// Room name/description
@override final  String name;
/// Board plan (e.g., "Room Only", "Breakfast", "Half Board", "Full Board")
@override final  String boardPlan;
/// Maximum occupancy
@override final  int maxOccupancy;
/// Bed configuration description
@override final  String? bedConfig;
/// Price breakdown for this room
@override final  PriceBreakdown price;
/// Number of rooms available
@override final  int? availability;
/// Is this option refundable?
@override@JsonKey() final  bool refundable;
/// Cancellation deadline (if refundable)
@override final  DateTime? cancellationDeadline;

/// Create a copy of RoomOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomOptionCopyWith<_RoomOption> get copyWith => __$RoomOptionCopyWithImpl<_RoomOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.boardPlan, boardPlan) || other.boardPlan == boardPlan)&&(identical(other.maxOccupancy, maxOccupancy) || other.maxOccupancy == maxOccupancy)&&(identical(other.bedConfig, bedConfig) || other.bedConfig == bedConfig)&&(identical(other.price, price) || other.price == price)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.refundable, refundable) || other.refundable == refundable)&&(identical(other.cancellationDeadline, cancellationDeadline) || other.cancellationDeadline == cancellationDeadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,boardPlan,maxOccupancy,bedConfig,price,availability,refundable,cancellationDeadline);

@override
String toString() {
  return 'RoomOption(id: $id, name: $name, boardPlan: $boardPlan, maxOccupancy: $maxOccupancy, bedConfig: $bedConfig, price: $price, availability: $availability, refundable: $refundable, cancellationDeadline: $cancellationDeadline)';
}


}

/// @nodoc
abstract mixin class _$RoomOptionCopyWith<$Res> implements $RoomOptionCopyWith<$Res> {
  factory _$RoomOptionCopyWith(_RoomOption value, $Res Function(_RoomOption) _then) = __$RoomOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String boardPlan, int maxOccupancy, String? bedConfig, PriceBreakdown price, int? availability, bool refundable, DateTime? cancellationDeadline
});


@override $PriceBreakdownCopyWith<$Res> get price;

}
/// @nodoc
class __$RoomOptionCopyWithImpl<$Res>
    implements _$RoomOptionCopyWith<$Res> {
  __$RoomOptionCopyWithImpl(this._self, this._then);

  final _RoomOption _self;
  final $Res Function(_RoomOption) _then;

/// Create a copy of RoomOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? boardPlan = null,Object? maxOccupancy = null,Object? bedConfig = freezed,Object? price = null,Object? availability = freezed,Object? refundable = null,Object? cancellationDeadline = freezed,}) {
  return _then(_RoomOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,boardPlan: null == boardPlan ? _self.boardPlan : boardPlan // ignore: cast_nullable_to_non_nullable
as String,maxOccupancy: null == maxOccupancy ? _self.maxOccupancy : maxOccupancy // ignore: cast_nullable_to_non_nullable
as int,bedConfig: freezed == bedConfig ? _self.bedConfig : bedConfig // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as PriceBreakdown,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as int?,refundable: null == refundable ? _self.refundable : refundable // ignore: cast_nullable_to_non_nullable
as bool,cancellationDeadline: freezed == cancellationDeadline ? _self.cancellationDeadline : cancellationDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of RoomOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceBreakdownCopyWith<$Res> get price {
  
  return $PriceBreakdownCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// @nodoc
mixin _$PriceBreakdown {

/// Base price before taxes/fees
 double get basePrice;/// Taxes amount
 double get taxes;/// Fees amount (resort fee, cleaning fee, etc.)
 double get fees;/// Total price including taxes and fees
 double get total;/// Currency code
 String get currency;/// Price per night (for display)
 double? get pricePerNight;/// Number of nights
 int? get nights;
/// Create a copy of PriceBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceBreakdownCopyWith<PriceBreakdown> get copyWith => _$PriceBreakdownCopyWithImpl<PriceBreakdown>(this as PriceBreakdown, _$identity);

  /// Serializes this PriceBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceBreakdown&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.taxes, taxes) || other.taxes == taxes)&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.total, total) || other.total == total)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.nights, nights) || other.nights == nights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,basePrice,taxes,fees,total,currency,pricePerNight,nights);

@override
String toString() {
  return 'PriceBreakdown(basePrice: $basePrice, taxes: $taxes, fees: $fees, total: $total, currency: $currency, pricePerNight: $pricePerNight, nights: $nights)';
}


}

/// @nodoc
abstract mixin class $PriceBreakdownCopyWith<$Res>  {
  factory $PriceBreakdownCopyWith(PriceBreakdown value, $Res Function(PriceBreakdown) _then) = _$PriceBreakdownCopyWithImpl;
@useResult
$Res call({
 double basePrice, double taxes, double fees, double total, String currency, double? pricePerNight, int? nights
});




}
/// @nodoc
class _$PriceBreakdownCopyWithImpl<$Res>
    implements $PriceBreakdownCopyWith<$Res> {
  _$PriceBreakdownCopyWithImpl(this._self, this._then);

  final PriceBreakdown _self;
  final $Res Function(PriceBreakdown) _then;

/// Create a copy of PriceBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? basePrice = null,Object? taxes = null,Object? fees = null,Object? total = null,Object? currency = null,Object? pricePerNight = freezed,Object? nights = freezed,}) {
  return _then(_self.copyWith(
basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,taxes: null == taxes ? _self.taxes : taxes // ignore: cast_nullable_to_non_nullable
as double,fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,pricePerNight: freezed == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double?,nights: freezed == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceBreakdown].
extension PriceBreakdownPatterns on PriceBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _PriceBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _PriceBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double basePrice,  double taxes,  double fees,  double total,  String currency,  double? pricePerNight,  int? nights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceBreakdown() when $default != null:
return $default(_that.basePrice,_that.taxes,_that.fees,_that.total,_that.currency,_that.pricePerNight,_that.nights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double basePrice,  double taxes,  double fees,  double total,  String currency,  double? pricePerNight,  int? nights)  $default,) {final _that = this;
switch (_that) {
case _PriceBreakdown():
return $default(_that.basePrice,_that.taxes,_that.fees,_that.total,_that.currency,_that.pricePerNight,_that.nights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double basePrice,  double taxes,  double fees,  double total,  String currency,  double? pricePerNight,  int? nights)?  $default,) {final _that = this;
switch (_that) {
case _PriceBreakdown() when $default != null:
return $default(_that.basePrice,_that.taxes,_that.fees,_that.total,_that.currency,_that.pricePerNight,_that.nights);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceBreakdown implements PriceBreakdown {
  const _PriceBreakdown({required this.basePrice, this.taxes = 0, this.fees = 0, required this.total, required this.currency, this.pricePerNight, this.nights});
  factory _PriceBreakdown.fromJson(Map<String, dynamic> json) => _$PriceBreakdownFromJson(json);

/// Base price before taxes/fees
@override final  double basePrice;
/// Taxes amount
@override@JsonKey() final  double taxes;
/// Fees amount (resort fee, cleaning fee, etc.)
@override@JsonKey() final  double fees;
/// Total price including taxes and fees
@override final  double total;
/// Currency code
@override final  String currency;
/// Price per night (for display)
@override final  double? pricePerNight;
/// Number of nights
@override final  int? nights;

/// Create a copy of PriceBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceBreakdownCopyWith<_PriceBreakdown> get copyWith => __$PriceBreakdownCopyWithImpl<_PriceBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceBreakdown&&(identical(other.basePrice, basePrice) || other.basePrice == basePrice)&&(identical(other.taxes, taxes) || other.taxes == taxes)&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.total, total) || other.total == total)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.pricePerNight, pricePerNight) || other.pricePerNight == pricePerNight)&&(identical(other.nights, nights) || other.nights == nights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,basePrice,taxes,fees,total,currency,pricePerNight,nights);

@override
String toString() {
  return 'PriceBreakdown(basePrice: $basePrice, taxes: $taxes, fees: $fees, total: $total, currency: $currency, pricePerNight: $pricePerNight, nights: $nights)';
}


}

/// @nodoc
abstract mixin class _$PriceBreakdownCopyWith<$Res> implements $PriceBreakdownCopyWith<$Res> {
  factory _$PriceBreakdownCopyWith(_PriceBreakdown value, $Res Function(_PriceBreakdown) _then) = __$PriceBreakdownCopyWithImpl;
@override @useResult
$Res call({
 double basePrice, double taxes, double fees, double total, String currency, double? pricePerNight, int? nights
});




}
/// @nodoc
class __$PriceBreakdownCopyWithImpl<$Res>
    implements _$PriceBreakdownCopyWith<$Res> {
  __$PriceBreakdownCopyWithImpl(this._self, this._then);

  final _PriceBreakdown _self;
  final $Res Function(_PriceBreakdown) _then;

/// Create a copy of PriceBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? basePrice = null,Object? taxes = null,Object? fees = null,Object? total = null,Object? currency = null,Object? pricePerNight = freezed,Object? nights = freezed,}) {
  return _then(_PriceBreakdown(
basePrice: null == basePrice ? _self.basePrice : basePrice // ignore: cast_nullable_to_non_nullable
as double,taxes: null == taxes ? _self.taxes : taxes // ignore: cast_nullable_to_non_nullable
as double,fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,pricePerNight: freezed == pricePerNight ? _self.pricePerNight : pricePerNight // ignore: cast_nullable_to_non_nullable
as double?,nights: freezed == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Policies {

/// Cancellation policy
 CancellationPolicy? get cancellation;/// Payment policy
 PaymentPolicy? get payment;/// House rules (check-in time, check-out time, etc.)
 HouseRules? get houseRules;
/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoliciesCopyWith<Policies> get copyWith => _$PoliciesCopyWithImpl<Policies>(this as Policies, _$identity);

  /// Serializes this Policies to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Policies&&(identical(other.cancellation, cancellation) || other.cancellation == cancellation)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.houseRules, houseRules) || other.houseRules == houseRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cancellation,payment,houseRules);

@override
String toString() {
  return 'Policies(cancellation: $cancellation, payment: $payment, houseRules: $houseRules)';
}


}

/// @nodoc
abstract mixin class $PoliciesCopyWith<$Res>  {
  factory $PoliciesCopyWith(Policies value, $Res Function(Policies) _then) = _$PoliciesCopyWithImpl;
@useResult
$Res call({
 CancellationPolicy? cancellation, PaymentPolicy? payment, HouseRules? houseRules
});


$CancellationPolicyCopyWith<$Res>? get cancellation;$PaymentPolicyCopyWith<$Res>? get payment;$HouseRulesCopyWith<$Res>? get houseRules;

}
/// @nodoc
class _$PoliciesCopyWithImpl<$Res>
    implements $PoliciesCopyWith<$Res> {
  _$PoliciesCopyWithImpl(this._self, this._then);

  final Policies _self;
  final $Res Function(Policies) _then;

/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cancellation = freezed,Object? payment = freezed,Object? houseRules = freezed,}) {
  return _then(_self.copyWith(
cancellation: freezed == cancellation ? _self.cancellation : cancellation // ignore: cast_nullable_to_non_nullable
as CancellationPolicy?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentPolicy?,houseRules: freezed == houseRules ? _self.houseRules : houseRules // ignore: cast_nullable_to_non_nullable
as HouseRules?,
  ));
}
/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CancellationPolicyCopyWith<$Res>? get cancellation {
    if (_self.cancellation == null) {
    return null;
  }

  return $CancellationPolicyCopyWith<$Res>(_self.cancellation!, (value) {
    return _then(_self.copyWith(cancellation: value));
  });
}/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentPolicyCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentPolicyCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseRulesCopyWith<$Res>? get houseRules {
    if (_self.houseRules == null) {
    return null;
  }

  return $HouseRulesCopyWith<$Res>(_self.houseRules!, (value) {
    return _then(_self.copyWith(houseRules: value));
  });
}
}


/// Adds pattern-matching-related methods to [Policies].
extension PoliciesPatterns on Policies {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Policies value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Policies() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Policies value)  $default,){
final _that = this;
switch (_that) {
case _Policies():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Policies value)?  $default,){
final _that = this;
switch (_that) {
case _Policies() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CancellationPolicy? cancellation,  PaymentPolicy? payment,  HouseRules? houseRules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Policies() when $default != null:
return $default(_that.cancellation,_that.payment,_that.houseRules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CancellationPolicy? cancellation,  PaymentPolicy? payment,  HouseRules? houseRules)  $default,) {final _that = this;
switch (_that) {
case _Policies():
return $default(_that.cancellation,_that.payment,_that.houseRules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CancellationPolicy? cancellation,  PaymentPolicy? payment,  HouseRules? houseRules)?  $default,) {final _that = this;
switch (_that) {
case _Policies() when $default != null:
return $default(_that.cancellation,_that.payment,_that.houseRules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Policies implements Policies {
  const _Policies({this.cancellation, this.payment, this.houseRules});
  factory _Policies.fromJson(Map<String, dynamic> json) => _$PoliciesFromJson(json);

/// Cancellation policy
@override final  CancellationPolicy? cancellation;
/// Payment policy
@override final  PaymentPolicy? payment;
/// House rules (check-in time, check-out time, etc.)
@override final  HouseRules? houseRules;

/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoliciesCopyWith<_Policies> get copyWith => __$PoliciesCopyWithImpl<_Policies>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PoliciesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Policies&&(identical(other.cancellation, cancellation) || other.cancellation == cancellation)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.houseRules, houseRules) || other.houseRules == houseRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cancellation,payment,houseRules);

@override
String toString() {
  return 'Policies(cancellation: $cancellation, payment: $payment, houseRules: $houseRules)';
}


}

/// @nodoc
abstract mixin class _$PoliciesCopyWith<$Res> implements $PoliciesCopyWith<$Res> {
  factory _$PoliciesCopyWith(_Policies value, $Res Function(_Policies) _then) = __$PoliciesCopyWithImpl;
@override @useResult
$Res call({
 CancellationPolicy? cancellation, PaymentPolicy? payment, HouseRules? houseRules
});


@override $CancellationPolicyCopyWith<$Res>? get cancellation;@override $PaymentPolicyCopyWith<$Res>? get payment;@override $HouseRulesCopyWith<$Res>? get houseRules;

}
/// @nodoc
class __$PoliciesCopyWithImpl<$Res>
    implements _$PoliciesCopyWith<$Res> {
  __$PoliciesCopyWithImpl(this._self, this._then);

  final _Policies _self;
  final $Res Function(_Policies) _then;

/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cancellation = freezed,Object? payment = freezed,Object? houseRules = freezed,}) {
  return _then(_Policies(
cancellation: freezed == cancellation ? _self.cancellation : cancellation // ignore: cast_nullable_to_non_nullable
as CancellationPolicy?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentPolicy?,houseRules: freezed == houseRules ? _self.houseRules : houseRules // ignore: cast_nullable_to_non_nullable
as HouseRules?,
  ));
}

/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CancellationPolicyCopyWith<$Res>? get cancellation {
    if (_self.cancellation == null) {
    return null;
  }

  return $CancellationPolicyCopyWith<$Res>(_self.cancellation!, (value) {
    return _then(_self.copyWith(cancellation: value));
  });
}/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentPolicyCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PaymentPolicyCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Policies
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HouseRulesCopyWith<$Res>? get houseRules {
    if (_self.houseRules == null) {
    return null;
  }

  return $HouseRulesCopyWith<$Res>(_self.houseRules!, (value) {
    return _then(_self.copyWith(houseRules: value));
  });
}
}


/// @nodoc
mixin _$CancellationPolicy {

/// Is free cancellation available?
 bool get freeCancellation;/// Deadline for free cancellation (local time)
 DateTime? get deadline;/// Penalty amount if cancelled after deadline
 double? get penaltyAmount;/// Penalty as percentage of total
 double? get penaltyPercentage;/// Human-readable description
 String? get description;
/// Create a copy of CancellationPolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CancellationPolicyCopyWith<CancellationPolicy> get copyWith => _$CancellationPolicyCopyWithImpl<CancellationPolicy>(this as CancellationPolicy, _$identity);

  /// Serializes this CancellationPolicy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CancellationPolicy&&(identical(other.freeCancellation, freeCancellation) || other.freeCancellation == freeCancellation)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.penaltyAmount, penaltyAmount) || other.penaltyAmount == penaltyAmount)&&(identical(other.penaltyPercentage, penaltyPercentage) || other.penaltyPercentage == penaltyPercentage)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,freeCancellation,deadline,penaltyAmount,penaltyPercentage,description);

@override
String toString() {
  return 'CancellationPolicy(freeCancellation: $freeCancellation, deadline: $deadline, penaltyAmount: $penaltyAmount, penaltyPercentage: $penaltyPercentage, description: $description)';
}


}

/// @nodoc
abstract mixin class $CancellationPolicyCopyWith<$Res>  {
  factory $CancellationPolicyCopyWith(CancellationPolicy value, $Res Function(CancellationPolicy) _then) = _$CancellationPolicyCopyWithImpl;
@useResult
$Res call({
 bool freeCancellation, DateTime? deadline, double? penaltyAmount, double? penaltyPercentage, String? description
});




}
/// @nodoc
class _$CancellationPolicyCopyWithImpl<$Res>
    implements $CancellationPolicyCopyWith<$Res> {
  _$CancellationPolicyCopyWithImpl(this._self, this._then);

  final CancellationPolicy _self;
  final $Res Function(CancellationPolicy) _then;

/// Create a copy of CancellationPolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? freeCancellation = null,Object? deadline = freezed,Object? penaltyAmount = freezed,Object? penaltyPercentage = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
freeCancellation: null == freeCancellation ? _self.freeCancellation : freeCancellation // ignore: cast_nullable_to_non_nullable
as bool,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,penaltyAmount: freezed == penaltyAmount ? _self.penaltyAmount : penaltyAmount // ignore: cast_nullable_to_non_nullable
as double?,penaltyPercentage: freezed == penaltyPercentage ? _self.penaltyPercentage : penaltyPercentage // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CancellationPolicy].
extension CancellationPolicyPatterns on CancellationPolicy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CancellationPolicy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CancellationPolicy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CancellationPolicy value)  $default,){
final _that = this;
switch (_that) {
case _CancellationPolicy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CancellationPolicy value)?  $default,){
final _that = this;
switch (_that) {
case _CancellationPolicy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool freeCancellation,  DateTime? deadline,  double? penaltyAmount,  double? penaltyPercentage,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CancellationPolicy() when $default != null:
return $default(_that.freeCancellation,_that.deadline,_that.penaltyAmount,_that.penaltyPercentage,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool freeCancellation,  DateTime? deadline,  double? penaltyAmount,  double? penaltyPercentage,  String? description)  $default,) {final _that = this;
switch (_that) {
case _CancellationPolicy():
return $default(_that.freeCancellation,_that.deadline,_that.penaltyAmount,_that.penaltyPercentage,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool freeCancellation,  DateTime? deadline,  double? penaltyAmount,  double? penaltyPercentage,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _CancellationPolicy() when $default != null:
return $default(_that.freeCancellation,_that.deadline,_that.penaltyAmount,_that.penaltyPercentage,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CancellationPolicy implements CancellationPolicy {
  const _CancellationPolicy({this.freeCancellation = false, this.deadline, this.penaltyAmount, this.penaltyPercentage, this.description});
  factory _CancellationPolicy.fromJson(Map<String, dynamic> json) => _$CancellationPolicyFromJson(json);

/// Is free cancellation available?
@override@JsonKey() final  bool freeCancellation;
/// Deadline for free cancellation (local time)
@override final  DateTime? deadline;
/// Penalty amount if cancelled after deadline
@override final  double? penaltyAmount;
/// Penalty as percentage of total
@override final  double? penaltyPercentage;
/// Human-readable description
@override final  String? description;

/// Create a copy of CancellationPolicy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancellationPolicyCopyWith<_CancellationPolicy> get copyWith => __$CancellationPolicyCopyWithImpl<_CancellationPolicy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CancellationPolicyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancellationPolicy&&(identical(other.freeCancellation, freeCancellation) || other.freeCancellation == freeCancellation)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.penaltyAmount, penaltyAmount) || other.penaltyAmount == penaltyAmount)&&(identical(other.penaltyPercentage, penaltyPercentage) || other.penaltyPercentage == penaltyPercentage)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,freeCancellation,deadline,penaltyAmount,penaltyPercentage,description);

@override
String toString() {
  return 'CancellationPolicy(freeCancellation: $freeCancellation, deadline: $deadline, penaltyAmount: $penaltyAmount, penaltyPercentage: $penaltyPercentage, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CancellationPolicyCopyWith<$Res> implements $CancellationPolicyCopyWith<$Res> {
  factory _$CancellationPolicyCopyWith(_CancellationPolicy value, $Res Function(_CancellationPolicy) _then) = __$CancellationPolicyCopyWithImpl;
@override @useResult
$Res call({
 bool freeCancellation, DateTime? deadline, double? penaltyAmount, double? penaltyPercentage, String? description
});




}
/// @nodoc
class __$CancellationPolicyCopyWithImpl<$Res>
    implements _$CancellationPolicyCopyWith<$Res> {
  __$CancellationPolicyCopyWithImpl(this._self, this._then);

  final _CancellationPolicy _self;
  final $Res Function(_CancellationPolicy) _then;

/// Create a copy of CancellationPolicy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? freeCancellation = null,Object? deadline = freezed,Object? penaltyAmount = freezed,Object? penaltyPercentage = freezed,Object? description = freezed,}) {
  return _then(_CancellationPolicy(
freeCancellation: null == freeCancellation ? _self.freeCancellation : freeCancellation // ignore: cast_nullable_to_non_nullable
as bool,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,penaltyAmount: freezed == penaltyAmount ? _self.penaltyAmount : penaltyAmount // ignore: cast_nullable_to_non_nullable
as double?,penaltyPercentage: freezed == penaltyPercentage ? _self.penaltyPercentage : penaltyPercentage // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaymentPolicy {

/// Requires prepayment?
 bool get prepay;/// Can pay at property?
 bool get payAtProperty;/// Accepted payment methods
 List<String> get acceptedMethods;/// Deposit required?
 double? get depositAmount;
/// Create a copy of PaymentPolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentPolicyCopyWith<PaymentPolicy> get copyWith => _$PaymentPolicyCopyWithImpl<PaymentPolicy>(this as PaymentPolicy, _$identity);

  /// Serializes this PaymentPolicy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentPolicy&&(identical(other.prepay, prepay) || other.prepay == prepay)&&(identical(other.payAtProperty, payAtProperty) || other.payAtProperty == payAtProperty)&&const DeepCollectionEquality().equals(other.acceptedMethods, acceptedMethods)&&(identical(other.depositAmount, depositAmount) || other.depositAmount == depositAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prepay,payAtProperty,const DeepCollectionEquality().hash(acceptedMethods),depositAmount);

@override
String toString() {
  return 'PaymentPolicy(prepay: $prepay, payAtProperty: $payAtProperty, acceptedMethods: $acceptedMethods, depositAmount: $depositAmount)';
}


}

/// @nodoc
abstract mixin class $PaymentPolicyCopyWith<$Res>  {
  factory $PaymentPolicyCopyWith(PaymentPolicy value, $Res Function(PaymentPolicy) _then) = _$PaymentPolicyCopyWithImpl;
@useResult
$Res call({
 bool prepay, bool payAtProperty, List<String> acceptedMethods, double? depositAmount
});




}
/// @nodoc
class _$PaymentPolicyCopyWithImpl<$Res>
    implements $PaymentPolicyCopyWith<$Res> {
  _$PaymentPolicyCopyWithImpl(this._self, this._then);

  final PaymentPolicy _self;
  final $Res Function(PaymentPolicy) _then;

/// Create a copy of PaymentPolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prepay = null,Object? payAtProperty = null,Object? acceptedMethods = null,Object? depositAmount = freezed,}) {
  return _then(_self.copyWith(
prepay: null == prepay ? _self.prepay : prepay // ignore: cast_nullable_to_non_nullable
as bool,payAtProperty: null == payAtProperty ? _self.payAtProperty : payAtProperty // ignore: cast_nullable_to_non_nullable
as bool,acceptedMethods: null == acceptedMethods ? _self.acceptedMethods : acceptedMethods // ignore: cast_nullable_to_non_nullable
as List<String>,depositAmount: freezed == depositAmount ? _self.depositAmount : depositAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentPolicy].
extension PaymentPolicyPatterns on PaymentPolicy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentPolicy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentPolicy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentPolicy value)  $default,){
final _that = this;
switch (_that) {
case _PaymentPolicy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentPolicy value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentPolicy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool prepay,  bool payAtProperty,  List<String> acceptedMethods,  double? depositAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentPolicy() when $default != null:
return $default(_that.prepay,_that.payAtProperty,_that.acceptedMethods,_that.depositAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool prepay,  bool payAtProperty,  List<String> acceptedMethods,  double? depositAmount)  $default,) {final _that = this;
switch (_that) {
case _PaymentPolicy():
return $default(_that.prepay,_that.payAtProperty,_that.acceptedMethods,_that.depositAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool prepay,  bool payAtProperty,  List<String> acceptedMethods,  double? depositAmount)?  $default,) {final _that = this;
switch (_that) {
case _PaymentPolicy() when $default != null:
return $default(_that.prepay,_that.payAtProperty,_that.acceptedMethods,_that.depositAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentPolicy implements PaymentPolicy {
  const _PaymentPolicy({this.prepay = false, this.payAtProperty = false, final  List<String> acceptedMethods = const [], this.depositAmount}): _acceptedMethods = acceptedMethods;
  factory _PaymentPolicy.fromJson(Map<String, dynamic> json) => _$PaymentPolicyFromJson(json);

/// Requires prepayment?
@override@JsonKey() final  bool prepay;
/// Can pay at property?
@override@JsonKey() final  bool payAtProperty;
/// Accepted payment methods
 final  List<String> _acceptedMethods;
/// Accepted payment methods
@override@JsonKey() List<String> get acceptedMethods {
  if (_acceptedMethods is EqualUnmodifiableListView) return _acceptedMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acceptedMethods);
}

/// Deposit required?
@override final  double? depositAmount;

/// Create a copy of PaymentPolicy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentPolicyCopyWith<_PaymentPolicy> get copyWith => __$PaymentPolicyCopyWithImpl<_PaymentPolicy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentPolicyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentPolicy&&(identical(other.prepay, prepay) || other.prepay == prepay)&&(identical(other.payAtProperty, payAtProperty) || other.payAtProperty == payAtProperty)&&const DeepCollectionEquality().equals(other._acceptedMethods, _acceptedMethods)&&(identical(other.depositAmount, depositAmount) || other.depositAmount == depositAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prepay,payAtProperty,const DeepCollectionEquality().hash(_acceptedMethods),depositAmount);

@override
String toString() {
  return 'PaymentPolicy(prepay: $prepay, payAtProperty: $payAtProperty, acceptedMethods: $acceptedMethods, depositAmount: $depositAmount)';
}


}

/// @nodoc
abstract mixin class _$PaymentPolicyCopyWith<$Res> implements $PaymentPolicyCopyWith<$Res> {
  factory _$PaymentPolicyCopyWith(_PaymentPolicy value, $Res Function(_PaymentPolicy) _then) = __$PaymentPolicyCopyWithImpl;
@override @useResult
$Res call({
 bool prepay, bool payAtProperty, List<String> acceptedMethods, double? depositAmount
});




}
/// @nodoc
class __$PaymentPolicyCopyWithImpl<$Res>
    implements _$PaymentPolicyCopyWith<$Res> {
  __$PaymentPolicyCopyWithImpl(this._self, this._then);

  final _PaymentPolicy _self;
  final $Res Function(_PaymentPolicy) _then;

/// Create a copy of PaymentPolicy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prepay = null,Object? payAtProperty = null,Object? acceptedMethods = null,Object? depositAmount = freezed,}) {
  return _then(_PaymentPolicy(
prepay: null == prepay ? _self.prepay : prepay // ignore: cast_nullable_to_non_nullable
as bool,payAtProperty: null == payAtProperty ? _self.payAtProperty : payAtProperty // ignore: cast_nullable_to_non_nullable
as bool,acceptedMethods: null == acceptedMethods ? _self._acceptedMethods : acceptedMethods // ignore: cast_nullable_to_non_nullable
as List<String>,depositAmount: freezed == depositAmount ? _self.depositAmount : depositAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$HouseRules {

/// Check-in time (e.g., "15:00")
 String? get checkInTime;/// Check-out time (e.g., "11:00")
 String? get checkOutTime;/// Pets allowed?
 bool get petsAllowed;/// Smoking allowed?
 bool get smokingAllowed;/// Parties/events allowed?
 bool get partiesAllowed;/// Additional rules
 List<String> get additionalRules;
/// Create a copy of HouseRules
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HouseRulesCopyWith<HouseRules> get copyWith => _$HouseRulesCopyWithImpl<HouseRules>(this as HouseRules, _$identity);

  /// Serializes this HouseRules to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HouseRules&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.petsAllowed, petsAllowed) || other.petsAllowed == petsAllowed)&&(identical(other.smokingAllowed, smokingAllowed) || other.smokingAllowed == smokingAllowed)&&(identical(other.partiesAllowed, partiesAllowed) || other.partiesAllowed == partiesAllowed)&&const DeepCollectionEquality().equals(other.additionalRules, additionalRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkInTime,checkOutTime,petsAllowed,smokingAllowed,partiesAllowed,const DeepCollectionEquality().hash(additionalRules));

@override
String toString() {
  return 'HouseRules(checkInTime: $checkInTime, checkOutTime: $checkOutTime, petsAllowed: $petsAllowed, smokingAllowed: $smokingAllowed, partiesAllowed: $partiesAllowed, additionalRules: $additionalRules)';
}


}

/// @nodoc
abstract mixin class $HouseRulesCopyWith<$Res>  {
  factory $HouseRulesCopyWith(HouseRules value, $Res Function(HouseRules) _then) = _$HouseRulesCopyWithImpl;
@useResult
$Res call({
 String? checkInTime, String? checkOutTime, bool petsAllowed, bool smokingAllowed, bool partiesAllowed, List<String> additionalRules
});




}
/// @nodoc
class _$HouseRulesCopyWithImpl<$Res>
    implements $HouseRulesCopyWith<$Res> {
  _$HouseRulesCopyWithImpl(this._self, this._then);

  final HouseRules _self;
  final $Res Function(HouseRules) _then;

/// Create a copy of HouseRules
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? petsAllowed = null,Object? smokingAllowed = null,Object? partiesAllowed = null,Object? additionalRules = null,}) {
  return _then(_self.copyWith(
checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,petsAllowed: null == petsAllowed ? _self.petsAllowed : petsAllowed // ignore: cast_nullable_to_non_nullable
as bool,smokingAllowed: null == smokingAllowed ? _self.smokingAllowed : smokingAllowed // ignore: cast_nullable_to_non_nullable
as bool,partiesAllowed: null == partiesAllowed ? _self.partiesAllowed : partiesAllowed // ignore: cast_nullable_to_non_nullable
as bool,additionalRules: null == additionalRules ? _self.additionalRules : additionalRules // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [HouseRules].
extension HouseRulesPatterns on HouseRules {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HouseRules value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HouseRules() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HouseRules value)  $default,){
final _that = this;
switch (_that) {
case _HouseRules():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HouseRules value)?  $default,){
final _that = this;
switch (_that) {
case _HouseRules() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? checkInTime,  String? checkOutTime,  bool petsAllowed,  bool smokingAllowed,  bool partiesAllowed,  List<String> additionalRules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HouseRules() when $default != null:
return $default(_that.checkInTime,_that.checkOutTime,_that.petsAllowed,_that.smokingAllowed,_that.partiesAllowed,_that.additionalRules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? checkInTime,  String? checkOutTime,  bool petsAllowed,  bool smokingAllowed,  bool partiesAllowed,  List<String> additionalRules)  $default,) {final _that = this;
switch (_that) {
case _HouseRules():
return $default(_that.checkInTime,_that.checkOutTime,_that.petsAllowed,_that.smokingAllowed,_that.partiesAllowed,_that.additionalRules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? checkInTime,  String? checkOutTime,  bool petsAllowed,  bool smokingAllowed,  bool partiesAllowed,  List<String> additionalRules)?  $default,) {final _that = this;
switch (_that) {
case _HouseRules() when $default != null:
return $default(_that.checkInTime,_that.checkOutTime,_that.petsAllowed,_that.smokingAllowed,_that.partiesAllowed,_that.additionalRules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HouseRules implements HouseRules {
  const _HouseRules({this.checkInTime, this.checkOutTime, this.petsAllowed = false, this.smokingAllowed = false, this.partiesAllowed = false, final  List<String> additionalRules = const []}): _additionalRules = additionalRules;
  factory _HouseRules.fromJson(Map<String, dynamic> json) => _$HouseRulesFromJson(json);

/// Check-in time (e.g., "15:00")
@override final  String? checkInTime;
/// Check-out time (e.g., "11:00")
@override final  String? checkOutTime;
/// Pets allowed?
@override@JsonKey() final  bool petsAllowed;
/// Smoking allowed?
@override@JsonKey() final  bool smokingAllowed;
/// Parties/events allowed?
@override@JsonKey() final  bool partiesAllowed;
/// Additional rules
 final  List<String> _additionalRules;
/// Additional rules
@override@JsonKey() List<String> get additionalRules {
  if (_additionalRules is EqualUnmodifiableListView) return _additionalRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_additionalRules);
}


/// Create a copy of HouseRules
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HouseRulesCopyWith<_HouseRules> get copyWith => __$HouseRulesCopyWithImpl<_HouseRules>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HouseRulesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HouseRules&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.petsAllowed, petsAllowed) || other.petsAllowed == petsAllowed)&&(identical(other.smokingAllowed, smokingAllowed) || other.smokingAllowed == smokingAllowed)&&(identical(other.partiesAllowed, partiesAllowed) || other.partiesAllowed == partiesAllowed)&&const DeepCollectionEquality().equals(other._additionalRules, _additionalRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkInTime,checkOutTime,petsAllowed,smokingAllowed,partiesAllowed,const DeepCollectionEquality().hash(_additionalRules));

@override
String toString() {
  return 'HouseRules(checkInTime: $checkInTime, checkOutTime: $checkOutTime, petsAllowed: $petsAllowed, smokingAllowed: $smokingAllowed, partiesAllowed: $partiesAllowed, additionalRules: $additionalRules)';
}


}

/// @nodoc
abstract mixin class _$HouseRulesCopyWith<$Res> implements $HouseRulesCopyWith<$Res> {
  factory _$HouseRulesCopyWith(_HouseRules value, $Res Function(_HouseRules) _then) = __$HouseRulesCopyWithImpl;
@override @useResult
$Res call({
 String? checkInTime, String? checkOutTime, bool petsAllowed, bool smokingAllowed, bool partiesAllowed, List<String> additionalRules
});




}
/// @nodoc
class __$HouseRulesCopyWithImpl<$Res>
    implements _$HouseRulesCopyWith<$Res> {
  __$HouseRulesCopyWithImpl(this._self, this._then);

  final _HouseRules _self;
  final $Res Function(_HouseRules) _then;

/// Create a copy of HouseRules
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkInTime = freezed,Object? checkOutTime = freezed,Object? petsAllowed = null,Object? smokingAllowed = null,Object? partiesAllowed = null,Object? additionalRules = null,}) {
  return _then(_HouseRules(
checkInTime: freezed == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as String?,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as String?,petsAllowed: null == petsAllowed ? _self.petsAllowed : petsAllowed // ignore: cast_nullable_to_non_nullable
as bool,smokingAllowed: null == smokingAllowed ? _self.smokingAllowed : smokingAllowed // ignore: cast_nullable_to_non_nullable
as bool,partiesAllowed: null == partiesAllowed ? _self.partiesAllowed : partiesAllowed // ignore: cast_nullable_to_non_nullable
as bool,additionalRules: null == additionalRules ? _self._additionalRules : additionalRules // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
