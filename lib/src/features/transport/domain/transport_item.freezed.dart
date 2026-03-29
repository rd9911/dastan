// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transport_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransportItem {

 String get id; List<TransportProvider> get providers; List<TransportSegment> get segments; Price get price; Duration get totalDuration; DateTime get departure; DateTime get arrival; TransportMode get mode; String? get bookingUrl;
/// Create a copy of TransportItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportItemCopyWith<TransportItem> get copyWith => _$TransportItemCopyWithImpl<TransportItem>(this as TransportItem, _$identity);

  /// Serializes this TransportItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportItem&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.providers, providers)&&const DeepCollectionEquality().equals(other.segments, segments)&&(identical(other.price, price) || other.price == price)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.departure, departure) || other.departure == departure)&&(identical(other.arrival, arrival) || other.arrival == arrival)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.bookingUrl, bookingUrl) || other.bookingUrl == bookingUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(providers),const DeepCollectionEquality().hash(segments),price,totalDuration,departure,arrival,mode,bookingUrl);

@override
String toString() {
  return 'TransportItem(id: $id, providers: $providers, segments: $segments, price: $price, totalDuration: $totalDuration, departure: $departure, arrival: $arrival, mode: $mode, bookingUrl: $bookingUrl)';
}


}

/// @nodoc
abstract mixin class $TransportItemCopyWith<$Res>  {
  factory $TransportItemCopyWith(TransportItem value, $Res Function(TransportItem) _then) = _$TransportItemCopyWithImpl;
@useResult
$Res call({
 String id, List<TransportProvider> providers, List<TransportSegment> segments, Price price, Duration totalDuration, DateTime departure, DateTime arrival, TransportMode mode, String? bookingUrl
});


$PriceCopyWith<$Res> get price;

}
/// @nodoc
class _$TransportItemCopyWithImpl<$Res>
    implements $TransportItemCopyWith<$Res> {
  _$TransportItemCopyWithImpl(this._self, this._then);

  final TransportItem _self;
  final $Res Function(TransportItem) _then;

/// Create a copy of TransportItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? providers = null,Object? segments = null,Object? price = null,Object? totalDuration = null,Object? departure = null,Object? arrival = null,Object? mode = null,Object? bookingUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providers: null == providers ? _self.providers : providers // ignore: cast_nullable_to_non_nullable
as List<TransportProvider>,segments: null == segments ? _self.segments : segments // ignore: cast_nullable_to_non_nullable
as List<TransportSegment>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Price,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,departure: null == departure ? _self.departure : departure // ignore: cast_nullable_to_non_nullable
as DateTime,arrival: null == arrival ? _self.arrival : arrival // ignore: cast_nullable_to_non_nullable
as DateTime,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TransportMode,bookingUrl: freezed == bookingUrl ? _self.bookingUrl : bookingUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TransportItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceCopyWith<$Res> get price {
  
  return $PriceCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransportItem].
extension TransportItemPatterns on TransportItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportItem value)  $default,){
final _that = this;
switch (_that) {
case _TransportItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportItem value)?  $default,){
final _that = this;
switch (_that) {
case _TransportItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<TransportProvider> providers,  List<TransportSegment> segments,  Price price,  Duration totalDuration,  DateTime departure,  DateTime arrival,  TransportMode mode,  String? bookingUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportItem() when $default != null:
return $default(_that.id,_that.providers,_that.segments,_that.price,_that.totalDuration,_that.departure,_that.arrival,_that.mode,_that.bookingUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<TransportProvider> providers,  List<TransportSegment> segments,  Price price,  Duration totalDuration,  DateTime departure,  DateTime arrival,  TransportMode mode,  String? bookingUrl)  $default,) {final _that = this;
switch (_that) {
case _TransportItem():
return $default(_that.id,_that.providers,_that.segments,_that.price,_that.totalDuration,_that.departure,_that.arrival,_that.mode,_that.bookingUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<TransportProvider> providers,  List<TransportSegment> segments,  Price price,  Duration totalDuration,  DateTime departure,  DateTime arrival,  TransportMode mode,  String? bookingUrl)?  $default,) {final _that = this;
switch (_that) {
case _TransportItem() when $default != null:
return $default(_that.id,_that.providers,_that.segments,_that.price,_that.totalDuration,_that.departure,_that.arrival,_that.mode,_that.bookingUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportItem implements TransportItem {
  const _TransportItem({required this.id, required final  List<TransportProvider> providers, required final  List<TransportSegment> segments, required this.price, required this.totalDuration, required this.departure, required this.arrival, required this.mode, this.bookingUrl}): _providers = providers,_segments = segments;
  factory _TransportItem.fromJson(Map<String, dynamic> json) => _$TransportItemFromJson(json);

@override final  String id;
 final  List<TransportProvider> _providers;
@override List<TransportProvider> get providers {
  if (_providers is EqualUnmodifiableListView) return _providers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providers);
}

 final  List<TransportSegment> _segments;
@override List<TransportSegment> get segments {
  if (_segments is EqualUnmodifiableListView) return _segments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_segments);
}

@override final  Price price;
@override final  Duration totalDuration;
@override final  DateTime departure;
@override final  DateTime arrival;
@override final  TransportMode mode;
@override final  String? bookingUrl;

/// Create a copy of TransportItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportItemCopyWith<_TransportItem> get copyWith => __$TransportItemCopyWithImpl<_TransportItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportItem&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._providers, _providers)&&const DeepCollectionEquality().equals(other._segments, _segments)&&(identical(other.price, price) || other.price == price)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&(identical(other.departure, departure) || other.departure == departure)&&(identical(other.arrival, arrival) || other.arrival == arrival)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.bookingUrl, bookingUrl) || other.bookingUrl == bookingUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_providers),const DeepCollectionEquality().hash(_segments),price,totalDuration,departure,arrival,mode,bookingUrl);

@override
String toString() {
  return 'TransportItem(id: $id, providers: $providers, segments: $segments, price: $price, totalDuration: $totalDuration, departure: $departure, arrival: $arrival, mode: $mode, bookingUrl: $bookingUrl)';
}


}

/// @nodoc
abstract mixin class _$TransportItemCopyWith<$Res> implements $TransportItemCopyWith<$Res> {
  factory _$TransportItemCopyWith(_TransportItem value, $Res Function(_TransportItem) _then) = __$TransportItemCopyWithImpl;
@override @useResult
$Res call({
 String id, List<TransportProvider> providers, List<TransportSegment> segments, Price price, Duration totalDuration, DateTime departure, DateTime arrival, TransportMode mode, String? bookingUrl
});


@override $PriceCopyWith<$Res> get price;

}
/// @nodoc
class __$TransportItemCopyWithImpl<$Res>
    implements _$TransportItemCopyWith<$Res> {
  __$TransportItemCopyWithImpl(this._self, this._then);

  final _TransportItem _self;
  final $Res Function(_TransportItem) _then;

/// Create a copy of TransportItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? providers = null,Object? segments = null,Object? price = null,Object? totalDuration = null,Object? departure = null,Object? arrival = null,Object? mode = null,Object? bookingUrl = freezed,}) {
  return _then(_TransportItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,providers: null == providers ? _self._providers : providers // ignore: cast_nullable_to_non_nullable
as List<TransportProvider>,segments: null == segments ? _self._segments : segments // ignore: cast_nullable_to_non_nullable
as List<TransportSegment>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Price,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,departure: null == departure ? _self.departure : departure // ignore: cast_nullable_to_non_nullable
as DateTime,arrival: null == arrival ? _self.arrival : arrival // ignore: cast_nullable_to_non_nullable
as DateTime,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TransportMode,bookingUrl: freezed == bookingUrl ? _self.bookingUrl : bookingUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TransportItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceCopyWith<$Res> get price {
  
  return $PriceCopyWith<$Res>(_self.price, (value) {
    return _then(_self.copyWith(price: value));
  });
}
}


/// @nodoc
mixin _$TransportProvider {

 String get name; String? get logoUrl; String? get code;
/// Create a copy of TransportProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportProviderCopyWith<TransportProvider> get copyWith => _$TransportProviderCopyWithImpl<TransportProvider>(this as TransportProvider, _$identity);

  /// Serializes this TransportProvider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportProvider&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,logoUrl,code);

@override
String toString() {
  return 'TransportProvider(name: $name, logoUrl: $logoUrl, code: $code)';
}


}

/// @nodoc
abstract mixin class $TransportProviderCopyWith<$Res>  {
  factory $TransportProviderCopyWith(TransportProvider value, $Res Function(TransportProvider) _then) = _$TransportProviderCopyWithImpl;
@useResult
$Res call({
 String name, String? logoUrl, String? code
});




}
/// @nodoc
class _$TransportProviderCopyWithImpl<$Res>
    implements $TransportProviderCopyWith<$Res> {
  _$TransportProviderCopyWithImpl(this._self, this._then);

  final TransportProvider _self;
  final $Res Function(TransportProvider) _then;

/// Create a copy of TransportProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? logoUrl = freezed,Object? code = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TransportProvider].
extension TransportProviderPatterns on TransportProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportProvider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportProvider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportProvider value)  $default,){
final _that = this;
switch (_that) {
case _TransportProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportProvider value)?  $default,){
final _that = this;
switch (_that) {
case _TransportProvider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? logoUrl,  String? code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportProvider() when $default != null:
return $default(_that.name,_that.logoUrl,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? logoUrl,  String? code)  $default,) {final _that = this;
switch (_that) {
case _TransportProvider():
return $default(_that.name,_that.logoUrl,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? logoUrl,  String? code)?  $default,) {final _that = this;
switch (_that) {
case _TransportProvider() when $default != null:
return $default(_that.name,_that.logoUrl,_that.code);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportProvider implements TransportProvider {
  const _TransportProvider({required this.name, required this.logoUrl, required this.code});
  factory _TransportProvider.fromJson(Map<String, dynamic> json) => _$TransportProviderFromJson(json);

@override final  String name;
@override final  String? logoUrl;
@override final  String? code;

/// Create a copy of TransportProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportProviderCopyWith<_TransportProvider> get copyWith => __$TransportProviderCopyWithImpl<_TransportProvider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportProvider&&(identical(other.name, name) || other.name == name)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,logoUrl,code);

@override
String toString() {
  return 'TransportProvider(name: $name, logoUrl: $logoUrl, code: $code)';
}


}

/// @nodoc
abstract mixin class _$TransportProviderCopyWith<$Res> implements $TransportProviderCopyWith<$Res> {
  factory _$TransportProviderCopyWith(_TransportProvider value, $Res Function(_TransportProvider) _then) = __$TransportProviderCopyWithImpl;
@override @useResult
$Res call({
 String name, String? logoUrl, String? code
});




}
/// @nodoc
class __$TransportProviderCopyWithImpl<$Res>
    implements _$TransportProviderCopyWith<$Res> {
  __$TransportProviderCopyWithImpl(this._self, this._then);

  final _TransportProvider _self;
  final $Res Function(_TransportProvider) _then;

/// Create a copy of TransportProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? logoUrl = freezed,Object? code = freezed,}) {
  return _then(_TransportProvider(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TransportSegment {

 String get origin; String get destination; DateTime get departure; DateTime get arrival; Duration get duration; String get carrier;// Carrier name or code
 String get transportIdentifier;// Flight number, Train number
 TransportMode get mode;
/// Create a copy of TransportSegment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportSegmentCopyWith<TransportSegment> get copyWith => _$TransportSegmentCopyWithImpl<TransportSegment>(this as TransportSegment, _$identity);

  /// Serializes this TransportSegment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransportSegment&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departure, departure) || other.departure == departure)&&(identical(other.arrival, arrival) || other.arrival == arrival)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.carrier, carrier) || other.carrier == carrier)&&(identical(other.transportIdentifier, transportIdentifier) || other.transportIdentifier == transportIdentifier)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,origin,destination,departure,arrival,duration,carrier,transportIdentifier,mode);

@override
String toString() {
  return 'TransportSegment(origin: $origin, destination: $destination, departure: $departure, arrival: $arrival, duration: $duration, carrier: $carrier, transportIdentifier: $transportIdentifier, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $TransportSegmentCopyWith<$Res>  {
  factory $TransportSegmentCopyWith(TransportSegment value, $Res Function(TransportSegment) _then) = _$TransportSegmentCopyWithImpl;
@useResult
$Res call({
 String origin, String destination, DateTime departure, DateTime arrival, Duration duration, String carrier, String transportIdentifier, TransportMode mode
});




}
/// @nodoc
class _$TransportSegmentCopyWithImpl<$Res>
    implements $TransportSegmentCopyWith<$Res> {
  _$TransportSegmentCopyWithImpl(this._self, this._then);

  final TransportSegment _self;
  final $Res Function(TransportSegment) _then;

/// Create a copy of TransportSegment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? origin = null,Object? destination = null,Object? departure = null,Object? arrival = null,Object? duration = null,Object? carrier = null,Object? transportIdentifier = null,Object? mode = null,}) {
  return _then(_self.copyWith(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departure: null == departure ? _self.departure : departure // ignore: cast_nullable_to_non_nullable
as DateTime,arrival: null == arrival ? _self.arrival : arrival // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,carrier: null == carrier ? _self.carrier : carrier // ignore: cast_nullable_to_non_nullable
as String,transportIdentifier: null == transportIdentifier ? _self.transportIdentifier : transportIdentifier // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TransportMode,
  ));
}

}


/// Adds pattern-matching-related methods to [TransportSegment].
extension TransportSegmentPatterns on TransportSegment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransportSegment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransportSegment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransportSegment value)  $default,){
final _that = this;
switch (_that) {
case _TransportSegment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransportSegment value)?  $default,){
final _that = this;
switch (_that) {
case _TransportSegment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String origin,  String destination,  DateTime departure,  DateTime arrival,  Duration duration,  String carrier,  String transportIdentifier,  TransportMode mode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransportSegment() when $default != null:
return $default(_that.origin,_that.destination,_that.departure,_that.arrival,_that.duration,_that.carrier,_that.transportIdentifier,_that.mode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String origin,  String destination,  DateTime departure,  DateTime arrival,  Duration duration,  String carrier,  String transportIdentifier,  TransportMode mode)  $default,) {final _that = this;
switch (_that) {
case _TransportSegment():
return $default(_that.origin,_that.destination,_that.departure,_that.arrival,_that.duration,_that.carrier,_that.transportIdentifier,_that.mode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String origin,  String destination,  DateTime departure,  DateTime arrival,  Duration duration,  String carrier,  String transportIdentifier,  TransportMode mode)?  $default,) {final _that = this;
switch (_that) {
case _TransportSegment() when $default != null:
return $default(_that.origin,_that.destination,_that.departure,_that.arrival,_that.duration,_that.carrier,_that.transportIdentifier,_that.mode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransportSegment implements TransportSegment {
  const _TransportSegment({required this.origin, required this.destination, required this.departure, required this.arrival, required this.duration, required this.carrier, required this.transportIdentifier, required this.mode});
  factory _TransportSegment.fromJson(Map<String, dynamic> json) => _$TransportSegmentFromJson(json);

@override final  String origin;
@override final  String destination;
@override final  DateTime departure;
@override final  DateTime arrival;
@override final  Duration duration;
@override final  String carrier;
// Carrier name or code
@override final  String transportIdentifier;
// Flight number, Train number
@override final  TransportMode mode;

/// Create a copy of TransportSegment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportSegmentCopyWith<_TransportSegment> get copyWith => __$TransportSegmentCopyWithImpl<_TransportSegment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportSegmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransportSegment&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.departure, departure) || other.departure == departure)&&(identical(other.arrival, arrival) || other.arrival == arrival)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.carrier, carrier) || other.carrier == carrier)&&(identical(other.transportIdentifier, transportIdentifier) || other.transportIdentifier == transportIdentifier)&&(identical(other.mode, mode) || other.mode == mode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,origin,destination,departure,arrival,duration,carrier,transportIdentifier,mode);

@override
String toString() {
  return 'TransportSegment(origin: $origin, destination: $destination, departure: $departure, arrival: $arrival, duration: $duration, carrier: $carrier, transportIdentifier: $transportIdentifier, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$TransportSegmentCopyWith<$Res> implements $TransportSegmentCopyWith<$Res> {
  factory _$TransportSegmentCopyWith(_TransportSegment value, $Res Function(_TransportSegment) _then) = __$TransportSegmentCopyWithImpl;
@override @useResult
$Res call({
 String origin, String destination, DateTime departure, DateTime arrival, Duration duration, String carrier, String transportIdentifier, TransportMode mode
});




}
/// @nodoc
class __$TransportSegmentCopyWithImpl<$Res>
    implements _$TransportSegmentCopyWith<$Res> {
  __$TransportSegmentCopyWithImpl(this._self, this._then);

  final _TransportSegment _self;
  final $Res Function(_TransportSegment) _then;

/// Create a copy of TransportSegment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? origin = null,Object? destination = null,Object? departure = null,Object? arrival = null,Object? duration = null,Object? carrier = null,Object? transportIdentifier = null,Object? mode = null,}) {
  return _then(_TransportSegment(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,departure: null == departure ? _self.departure : departure // ignore: cast_nullable_to_non_nullable
as DateTime,arrival: null == arrival ? _self.arrival : arrival // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,carrier: null == carrier ? _self.carrier : carrier // ignore: cast_nullable_to_non_nullable
as String,transportIdentifier: null == transportIdentifier ? _self.transportIdentifier : transportIdentifier // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TransportMode,
  ));
}


}


/// @nodoc
mixin _$Price {

 double get amount; String get currency;
/// Create a copy of Price
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceCopyWith<Price> get copyWith => _$PriceCopyWithImpl<Price>(this as Price, _$identity);

  /// Serializes this Price to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Price&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency);

@override
String toString() {
  return 'Price(amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $PriceCopyWith<$Res>  {
  factory $PriceCopyWith(Price value, $Res Function(Price) _then) = _$PriceCopyWithImpl;
@useResult
$Res call({
 double amount, String currency
});




}
/// @nodoc
class _$PriceCopyWithImpl<$Res>
    implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._self, this._then);

  final Price _self;
  final $Res Function(Price) _then;

/// Create a copy of Price
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? currency = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Price].
extension PricePatterns on Price {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Price value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Price() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Price value)  $default,){
final _that = this;
switch (_that) {
case _Price():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Price value)?  $default,){
final _that = this;
switch (_that) {
case _Price() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Price() when $default != null:
return $default(_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String currency)  $default,) {final _that = this;
switch (_that) {
case _Price():
return $default(_that.amount,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _Price() when $default != null:
return $default(_that.amount,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Price implements Price {
  const _Price({required this.amount, required this.currency});
  factory _Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

@override final  double amount;
@override final  String currency;

/// Create a copy of Price
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceCopyWith<_Price> get copyWith => __$PriceCopyWithImpl<_Price>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Price&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency);

@override
String toString() {
  return 'Price(amount: $amount, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$PriceCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$PriceCopyWith(_Price value, $Res Function(_Price) _then) = __$PriceCopyWithImpl;
@override @useResult
$Res call({
 double amount, String currency
});




}
/// @nodoc
class __$PriceCopyWithImpl<$Res>
    implements _$PriceCopyWith<$Res> {
  __$PriceCopyWithImpl(this._self, this._then);

  final _Price _self;
  final $Res Function(_Price) _then;

/// Create a copy of Price
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? currency = null,}) {
  return _then(_Price(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
