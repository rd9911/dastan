// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventsResult {

 String get id; EventType get type; String get name; String get location; DateTime get eventDate; double get price; String get currency; String? get description; String? get imageUrl; String? get vendorUrl;
/// Create a copy of EventsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventsResultCopyWith<EventsResult> get copyWith => _$EventsResultCopyWithImpl<EventsResult>(this as EventsResult, _$identity);

  /// Serializes this EventsResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsResult&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,location,eventDate,price,currency,description,imageUrl,vendorUrl);

@override
String toString() {
  return 'EventsResult(id: $id, type: $type, name: $name, location: $location, eventDate: $eventDate, price: $price, currency: $currency, description: $description, imageUrl: $imageUrl, vendorUrl: $vendorUrl)';
}


}

/// @nodoc
abstract mixin class $EventsResultCopyWith<$Res>  {
  factory $EventsResultCopyWith(EventsResult value, $Res Function(EventsResult) _then) = _$EventsResultCopyWithImpl;
@useResult
$Res call({
 String id, EventType type, String name, String location, DateTime eventDate, double price, String currency, String? description, String? imageUrl, String? vendorUrl
});




}
/// @nodoc
class _$EventsResultCopyWithImpl<$Res>
    implements $EventsResultCopyWith<$Res> {
  _$EventsResultCopyWithImpl(this._self, this._then);

  final EventsResult _self;
  final $Res Function(EventsResult) _then;

/// Create a copy of EventsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? name = null,Object? location = null,Object? eventDate = null,Object? price = null,Object? currency = null,Object? description = freezed,Object? imageUrl = freezed,Object? vendorUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EventType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventsResult].
extension EventsResultPatterns on EventsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventsResult value)  $default,){
final _that = this;
switch (_that) {
case _EventsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventsResult value)?  $default,){
final _that = this;
switch (_that) {
case _EventsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EventType type,  String name,  String location,  DateTime eventDate,  double price,  String currency,  String? description,  String? imageUrl,  String? vendorUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventsResult() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.location,_that.eventDate,_that.price,_that.currency,_that.description,_that.imageUrl,_that.vendorUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EventType type,  String name,  String location,  DateTime eventDate,  double price,  String currency,  String? description,  String? imageUrl,  String? vendorUrl)  $default,) {final _that = this;
switch (_that) {
case _EventsResult():
return $default(_that.id,_that.type,_that.name,_that.location,_that.eventDate,_that.price,_that.currency,_that.description,_that.imageUrl,_that.vendorUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EventType type,  String name,  String location,  DateTime eventDate,  double price,  String currency,  String? description,  String? imageUrl,  String? vendorUrl)?  $default,) {final _that = this;
switch (_that) {
case _EventsResult() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.location,_that.eventDate,_that.price,_that.currency,_that.description,_that.imageUrl,_that.vendorUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventsResult implements EventsResult {
  const _EventsResult({required this.id, required this.type, required this.name, required this.location, required this.eventDate, required this.price, required this.currency, this.description, this.imageUrl, this.vendorUrl});
  factory _EventsResult.fromJson(Map<String, dynamic> json) => _$EventsResultFromJson(json);

@override final  String id;
@override final  EventType type;
@override final  String name;
@override final  String location;
@override final  DateTime eventDate;
@override final  double price;
@override final  String currency;
@override final  String? description;
@override final  String? imageUrl;
@override final  String? vendorUrl;

/// Create a copy of EventsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventsResultCopyWith<_EventsResult> get copyWith => __$EventsResultCopyWithImpl<_EventsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventsResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventsResult&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vendorUrl, vendorUrl) || other.vendorUrl == vendorUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,location,eventDate,price,currency,description,imageUrl,vendorUrl);

@override
String toString() {
  return 'EventsResult(id: $id, type: $type, name: $name, location: $location, eventDate: $eventDate, price: $price, currency: $currency, description: $description, imageUrl: $imageUrl, vendorUrl: $vendorUrl)';
}


}

/// @nodoc
abstract mixin class _$EventsResultCopyWith<$Res> implements $EventsResultCopyWith<$Res> {
  factory _$EventsResultCopyWith(_EventsResult value, $Res Function(_EventsResult) _then) = __$EventsResultCopyWithImpl;
@override @useResult
$Res call({
 String id, EventType type, String name, String location, DateTime eventDate, double price, String currency, String? description, String? imageUrl, String? vendorUrl
});




}
/// @nodoc
class __$EventsResultCopyWithImpl<$Res>
    implements _$EventsResultCopyWith<$Res> {
  __$EventsResultCopyWithImpl(this._self, this._then);

  final _EventsResult _self;
  final $Res Function(_EventsResult) _then;

/// Create a copy of EventsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? name = null,Object? location = null,Object? eventDate = null,Object? price = null,Object? currency = null,Object? description = freezed,Object? imageUrl = freezed,Object? vendorUrl = freezed,}) {
  return _then(_EventsResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EventType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,vendorUrl: freezed == vendorUrl ? _self.vendorUrl : vendorUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
