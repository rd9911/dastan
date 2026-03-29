// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Itinerary {

 String get id; String get title; String? get destination; DateTime? get startDate; DateTime? get endDate; int get travelers; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraryCopyWith<Itinerary> get copyWith => _$ItineraryCopyWithImpl<Itinerary>(this as Itinerary, _$identity);

  /// Serializes this Itinerary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Itinerary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.travelers, travelers) || other.travelers == travelers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,destination,startDate,endDate,travelers,createdAt,updatedAt);

@override
String toString() {
  return 'Itinerary(id: $id, title: $title, destination: $destination, startDate: $startDate, endDate: $endDate, travelers: $travelers, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ItineraryCopyWith<$Res>  {
  factory $ItineraryCopyWith(Itinerary value, $Res Function(Itinerary) _then) = _$ItineraryCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? destination, DateTime? startDate, DateTime? endDate, int travelers, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ItineraryCopyWithImpl<$Res>
    implements $ItineraryCopyWith<$Res> {
  _$ItineraryCopyWithImpl(this._self, this._then);

  final Itinerary _self;
  final $Res Function(Itinerary) _then;

/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? destination = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? travelers = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,travelers: null == travelers ? _self.travelers : travelers // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Itinerary].
extension ItineraryPatterns on Itinerary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Itinerary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Itinerary value)  $default,){
final _that = this;
switch (_that) {
case _Itinerary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Itinerary value)?  $default,){
final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? destination,  DateTime? startDate,  DateTime? endDate,  int travelers,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
return $default(_that.id,_that.title,_that.destination,_that.startDate,_that.endDate,_that.travelers,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? destination,  DateTime? startDate,  DateTime? endDate,  int travelers,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Itinerary():
return $default(_that.id,_that.title,_that.destination,_that.startDate,_that.endDate,_that.travelers,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? destination,  DateTime? startDate,  DateTime? endDate,  int travelers,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
return $default(_that.id,_that.title,_that.destination,_that.startDate,_that.endDate,_that.travelers,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Itinerary implements Itinerary {
  const _Itinerary({required this.id, required this.title, this.destination, this.startDate, this.endDate, this.travelers = 1, required this.createdAt, required this.updatedAt});
  factory _Itinerary.fromJson(Map<String, dynamic> json) => _$ItineraryFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? destination;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  int travelers;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItineraryCopyWith<_Itinerary> get copyWith => __$ItineraryCopyWithImpl<_Itinerary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItineraryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Itinerary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.travelers, travelers) || other.travelers == travelers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,destination,startDate,endDate,travelers,createdAt,updatedAt);

@override
String toString() {
  return 'Itinerary(id: $id, title: $title, destination: $destination, startDate: $startDate, endDate: $endDate, travelers: $travelers, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ItineraryCopyWith<$Res> implements $ItineraryCopyWith<$Res> {
  factory _$ItineraryCopyWith(_Itinerary value, $Res Function(_Itinerary) _then) = __$ItineraryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? destination, DateTime? startDate, DateTime? endDate, int travelers, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ItineraryCopyWithImpl<$Res>
    implements _$ItineraryCopyWith<$Res> {
  __$ItineraryCopyWithImpl(this._self, this._then);

  final _Itinerary _self;
  final $Res Function(_Itinerary) _then;

/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? destination = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? travelers = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Itinerary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,travelers: null == travelers ? _self.travelers : travelers // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
