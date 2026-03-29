// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_api_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchApiQuery {

 SearchVertical get vertical; String? get q; String get locale; String get currency; String get timezone; SearchBounds? get bounds; bool get boundsOnly; SearchApiSort get sort; int get pageSize; String? get cursor; SearchApiFlags get flags; Map<String, dynamic>? get verticalParams;
/// Create a copy of SearchApiQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiQueryCopyWith<SearchApiQuery> get copyWith => _$SearchApiQueryCopyWithImpl<SearchApiQuery>(this as SearchApiQuery, _$identity);

  /// Serializes this SearchApiQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiQuery&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.q, q) || other.q == q)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.boundsOnly, boundsOnly) || other.boundsOnly == boundsOnly)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.flags, flags) || other.flags == flags)&&const DeepCollectionEquality().equals(other.verticalParams, verticalParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vertical,q,locale,currency,timezone,bounds,boundsOnly,sort,pageSize,cursor,flags,const DeepCollectionEquality().hash(verticalParams));

@override
String toString() {
  return 'SearchApiQuery(vertical: $vertical, q: $q, locale: $locale, currency: $currency, timezone: $timezone, bounds: $bounds, boundsOnly: $boundsOnly, sort: $sort, pageSize: $pageSize, cursor: $cursor, flags: $flags, verticalParams: $verticalParams)';
}


}

/// @nodoc
abstract mixin class $SearchApiQueryCopyWith<$Res>  {
  factory $SearchApiQueryCopyWith(SearchApiQuery value, $Res Function(SearchApiQuery) _then) = _$SearchApiQueryCopyWithImpl;
@useResult
$Res call({
 SearchVertical vertical, String? q, String locale, String currency, String timezone, SearchBounds? bounds, bool boundsOnly, SearchApiSort sort, int pageSize, String? cursor, SearchApiFlags flags, Map<String, dynamic>? verticalParams
});


$SearchBoundsCopyWith<$Res>? get bounds;$SearchApiFlagsCopyWith<$Res> get flags;

}
/// @nodoc
class _$SearchApiQueryCopyWithImpl<$Res>
    implements $SearchApiQueryCopyWith<$Res> {
  _$SearchApiQueryCopyWithImpl(this._self, this._then);

  final SearchApiQuery _self;
  final $Res Function(SearchApiQuery) _then;

/// Create a copy of SearchApiQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vertical = null,Object? q = freezed,Object? locale = null,Object? currency = null,Object? timezone = null,Object? bounds = freezed,Object? boundsOnly = null,Object? sort = null,Object? pageSize = null,Object? cursor = freezed,Object? flags = null,Object? verticalParams = freezed,}) {
  return _then(_self.copyWith(
vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as SearchVertical,q: freezed == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as SearchBounds?,boundsOnly: null == boundsOnly ? _self.boundsOnly : boundsOnly // ignore: cast_nullable_to_non_nullable
as bool,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SearchApiSort,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as SearchApiFlags,verticalParams: freezed == verticalParams ? _self.verticalParams : verticalParams // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of SearchApiQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchBoundsCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
    return null;
  }

  return $SearchBoundsCopyWith<$Res>(_self.bounds!, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of SearchApiQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiFlagsCopyWith<$Res> get flags {
  
  return $SearchApiFlagsCopyWith<$Res>(_self.flags, (value) {
    return _then(_self.copyWith(flags: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchApiQuery].
extension SearchApiQueryPatterns on SearchApiQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiQuery value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiQuery value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchVertical vertical,  String? q,  String locale,  String currency,  String timezone,  SearchBounds? bounds,  bool boundsOnly,  SearchApiSort sort,  int pageSize,  String? cursor,  SearchApiFlags flags,  Map<String, dynamic>? verticalParams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiQuery() when $default != null:
return $default(_that.vertical,_that.q,_that.locale,_that.currency,_that.timezone,_that.bounds,_that.boundsOnly,_that.sort,_that.pageSize,_that.cursor,_that.flags,_that.verticalParams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchVertical vertical,  String? q,  String locale,  String currency,  String timezone,  SearchBounds? bounds,  bool boundsOnly,  SearchApiSort sort,  int pageSize,  String? cursor,  SearchApiFlags flags,  Map<String, dynamic>? verticalParams)  $default,) {final _that = this;
switch (_that) {
case _SearchApiQuery():
return $default(_that.vertical,_that.q,_that.locale,_that.currency,_that.timezone,_that.bounds,_that.boundsOnly,_that.sort,_that.pageSize,_that.cursor,_that.flags,_that.verticalParams);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchVertical vertical,  String? q,  String locale,  String currency,  String timezone,  SearchBounds? bounds,  bool boundsOnly,  SearchApiSort sort,  int pageSize,  String? cursor,  SearchApiFlags flags,  Map<String, dynamic>? verticalParams)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiQuery() when $default != null:
return $default(_that.vertical,_that.q,_that.locale,_that.currency,_that.timezone,_that.bounds,_that.boundsOnly,_that.sort,_that.pageSize,_that.cursor,_that.flags,_that.verticalParams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiQuery extends SearchApiQuery {
  const _SearchApiQuery({required this.vertical, this.q, this.locale = 'en', this.currency = 'USD', this.timezone = 'UTC', this.bounds, this.boundsOnly = false, this.sort = SearchApiSort.relevance, this.pageSize = 20, this.cursor, this.flags = const SearchApiFlags(), final  Map<String, dynamic>? verticalParams}): _verticalParams = verticalParams,super._();
  factory _SearchApiQuery.fromJson(Map<String, dynamic> json) => _$SearchApiQueryFromJson(json);

@override final  SearchVertical vertical;
@override final  String? q;
@override@JsonKey() final  String locale;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String timezone;
@override final  SearchBounds? bounds;
@override@JsonKey() final  bool boundsOnly;
@override@JsonKey() final  SearchApiSort sort;
@override@JsonKey() final  int pageSize;
@override final  String? cursor;
@override@JsonKey() final  SearchApiFlags flags;
 final  Map<String, dynamic>? _verticalParams;
@override Map<String, dynamic>? get verticalParams {
  final value = _verticalParams;
  if (value == null) return null;
  if (_verticalParams is EqualUnmodifiableMapView) return _verticalParams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SearchApiQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiQueryCopyWith<_SearchApiQuery> get copyWith => __$SearchApiQueryCopyWithImpl<_SearchApiQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiQuery&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.q, q) || other.q == q)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.boundsOnly, boundsOnly) || other.boundsOnly == boundsOnly)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.flags, flags) || other.flags == flags)&&const DeepCollectionEquality().equals(other._verticalParams, _verticalParams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vertical,q,locale,currency,timezone,bounds,boundsOnly,sort,pageSize,cursor,flags,const DeepCollectionEquality().hash(_verticalParams));

@override
String toString() {
  return 'SearchApiQuery(vertical: $vertical, q: $q, locale: $locale, currency: $currency, timezone: $timezone, bounds: $bounds, boundsOnly: $boundsOnly, sort: $sort, pageSize: $pageSize, cursor: $cursor, flags: $flags, verticalParams: $verticalParams)';
}


}

/// @nodoc
abstract mixin class _$SearchApiQueryCopyWith<$Res> implements $SearchApiQueryCopyWith<$Res> {
  factory _$SearchApiQueryCopyWith(_SearchApiQuery value, $Res Function(_SearchApiQuery) _then) = __$SearchApiQueryCopyWithImpl;
@override @useResult
$Res call({
 SearchVertical vertical, String? q, String locale, String currency, String timezone, SearchBounds? bounds, bool boundsOnly, SearchApiSort sort, int pageSize, String? cursor, SearchApiFlags flags, Map<String, dynamic>? verticalParams
});


@override $SearchBoundsCopyWith<$Res>? get bounds;@override $SearchApiFlagsCopyWith<$Res> get flags;

}
/// @nodoc
class __$SearchApiQueryCopyWithImpl<$Res>
    implements _$SearchApiQueryCopyWith<$Res> {
  __$SearchApiQueryCopyWithImpl(this._self, this._then);

  final _SearchApiQuery _self;
  final $Res Function(_SearchApiQuery) _then;

/// Create a copy of SearchApiQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vertical = null,Object? q = freezed,Object? locale = null,Object? currency = null,Object? timezone = null,Object? bounds = freezed,Object? boundsOnly = null,Object? sort = null,Object? pageSize = null,Object? cursor = freezed,Object? flags = null,Object? verticalParams = freezed,}) {
  return _then(_SearchApiQuery(
vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as SearchVertical,q: freezed == q ? _self.q : q // ignore: cast_nullable_to_non_nullable
as String?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,bounds: freezed == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as SearchBounds?,boundsOnly: null == boundsOnly ? _self.boundsOnly : boundsOnly // ignore: cast_nullable_to_non_nullable
as bool,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SearchApiSort,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as SearchApiFlags,verticalParams: freezed == verticalParams ? _self._verticalParams : verticalParams // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of SearchApiQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchBoundsCopyWith<$Res>? get bounds {
    if (_self.bounds == null) {
    return null;
  }

  return $SearchBoundsCopyWith<$Res>(_self.bounds!, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of SearchApiQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiFlagsCopyWith<$Res> get flags {
  
  return $SearchApiFlagsCopyWith<$Res>(_self.flags, (value) {
    return _then(_self.copyWith(flags: value));
  });
}
}


/// @nodoc
mixin _$SearchBounds {

 double get north; double get south; double get east; double get west;
/// Create a copy of SearchBounds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchBoundsCopyWith<SearchBounds> get copyWith => _$SearchBoundsCopyWithImpl<SearchBounds>(this as SearchBounds, _$identity);

  /// Serializes this SearchBounds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchBounds&&(identical(other.north, north) || other.north == north)&&(identical(other.south, south) || other.south == south)&&(identical(other.east, east) || other.east == east)&&(identical(other.west, west) || other.west == west));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,north,south,east,west);

@override
String toString() {
  return 'SearchBounds(north: $north, south: $south, east: $east, west: $west)';
}


}

/// @nodoc
abstract mixin class $SearchBoundsCopyWith<$Res>  {
  factory $SearchBoundsCopyWith(SearchBounds value, $Res Function(SearchBounds) _then) = _$SearchBoundsCopyWithImpl;
@useResult
$Res call({
 double north, double south, double east, double west
});




}
/// @nodoc
class _$SearchBoundsCopyWithImpl<$Res>
    implements $SearchBoundsCopyWith<$Res> {
  _$SearchBoundsCopyWithImpl(this._self, this._then);

  final SearchBounds _self;
  final $Res Function(SearchBounds) _then;

/// Create a copy of SearchBounds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? north = null,Object? south = null,Object? east = null,Object? west = null,}) {
  return _then(_self.copyWith(
north: null == north ? _self.north : north // ignore: cast_nullable_to_non_nullable
as double,south: null == south ? _self.south : south // ignore: cast_nullable_to_non_nullable
as double,east: null == east ? _self.east : east // ignore: cast_nullable_to_non_nullable
as double,west: null == west ? _self.west : west // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchBounds].
extension SearchBoundsPatterns on SearchBounds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchBounds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchBounds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchBounds value)  $default,){
final _that = this;
switch (_that) {
case _SearchBounds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchBounds value)?  $default,){
final _that = this;
switch (_that) {
case _SearchBounds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double north,  double south,  double east,  double west)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchBounds() when $default != null:
return $default(_that.north,_that.south,_that.east,_that.west);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double north,  double south,  double east,  double west)  $default,) {final _that = this;
switch (_that) {
case _SearchBounds():
return $default(_that.north,_that.south,_that.east,_that.west);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double north,  double south,  double east,  double west)?  $default,) {final _that = this;
switch (_that) {
case _SearchBounds() when $default != null:
return $default(_that.north,_that.south,_that.east,_that.west);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchBounds extends SearchBounds {
  const _SearchBounds({required this.north, required this.south, required this.east, required this.west}): super._();
  factory _SearchBounds.fromJson(Map<String, dynamic> json) => _$SearchBoundsFromJson(json);

@override final  double north;
@override final  double south;
@override final  double east;
@override final  double west;

/// Create a copy of SearchBounds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchBoundsCopyWith<_SearchBounds> get copyWith => __$SearchBoundsCopyWithImpl<_SearchBounds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchBoundsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchBounds&&(identical(other.north, north) || other.north == north)&&(identical(other.south, south) || other.south == south)&&(identical(other.east, east) || other.east == east)&&(identical(other.west, west) || other.west == west));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,north,south,east,west);

@override
String toString() {
  return 'SearchBounds(north: $north, south: $south, east: $east, west: $west)';
}


}

/// @nodoc
abstract mixin class _$SearchBoundsCopyWith<$Res> implements $SearchBoundsCopyWith<$Res> {
  factory _$SearchBoundsCopyWith(_SearchBounds value, $Res Function(_SearchBounds) _then) = __$SearchBoundsCopyWithImpl;
@override @useResult
$Res call({
 double north, double south, double east, double west
});




}
/// @nodoc
class __$SearchBoundsCopyWithImpl<$Res>
    implements _$SearchBoundsCopyWith<$Res> {
  __$SearchBoundsCopyWithImpl(this._self, this._then);

  final _SearchBounds _self;
  final $Res Function(_SearchBounds) _then;

/// Create a copy of SearchBounds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? north = null,Object? south = null,Object? east = null,Object? west = null,}) {
  return _then(_SearchBounds(
north: null == north ? _self.north : north // ignore: cast_nullable_to_non_nullable
as double,south: null == south ? _self.south : south // ignore: cast_nullable_to_non_nullable
as double,east: null == east ? _self.east : east // ignore: cast_nullable_to_non_nullable
as double,west: null == west ? _self.west : west // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SearchApiFlags {

 bool get debug; bool get strict; bool get skipCache; bool get includeExplain;
/// Create a copy of SearchApiFlags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiFlagsCopyWith<SearchApiFlags> get copyWith => _$SearchApiFlagsCopyWithImpl<SearchApiFlags>(this as SearchApiFlags, _$identity);

  /// Serializes this SearchApiFlags to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiFlags&&(identical(other.debug, debug) || other.debug == debug)&&(identical(other.strict, strict) || other.strict == strict)&&(identical(other.skipCache, skipCache) || other.skipCache == skipCache)&&(identical(other.includeExplain, includeExplain) || other.includeExplain == includeExplain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debug,strict,skipCache,includeExplain);

@override
String toString() {
  return 'SearchApiFlags(debug: $debug, strict: $strict, skipCache: $skipCache, includeExplain: $includeExplain)';
}


}

/// @nodoc
abstract mixin class $SearchApiFlagsCopyWith<$Res>  {
  factory $SearchApiFlagsCopyWith(SearchApiFlags value, $Res Function(SearchApiFlags) _then) = _$SearchApiFlagsCopyWithImpl;
@useResult
$Res call({
 bool debug, bool strict, bool skipCache, bool includeExplain
});




}
/// @nodoc
class _$SearchApiFlagsCopyWithImpl<$Res>
    implements $SearchApiFlagsCopyWith<$Res> {
  _$SearchApiFlagsCopyWithImpl(this._self, this._then);

  final SearchApiFlags _self;
  final $Res Function(SearchApiFlags) _then;

/// Create a copy of SearchApiFlags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debug = null,Object? strict = null,Object? skipCache = null,Object? includeExplain = null,}) {
  return _then(_self.copyWith(
debug: null == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as bool,strict: null == strict ? _self.strict : strict // ignore: cast_nullable_to_non_nullable
as bool,skipCache: null == skipCache ? _self.skipCache : skipCache // ignore: cast_nullable_to_non_nullable
as bool,includeExplain: null == includeExplain ? _self.includeExplain : includeExplain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchApiFlags].
extension SearchApiFlagsPatterns on SearchApiFlags {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiFlags value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiFlags() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiFlags value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiFlags():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiFlags value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiFlags() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool debug,  bool strict,  bool skipCache,  bool includeExplain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiFlags() when $default != null:
return $default(_that.debug,_that.strict,_that.skipCache,_that.includeExplain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool debug,  bool strict,  bool skipCache,  bool includeExplain)  $default,) {final _that = this;
switch (_that) {
case _SearchApiFlags():
return $default(_that.debug,_that.strict,_that.skipCache,_that.includeExplain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool debug,  bool strict,  bool skipCache,  bool includeExplain)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiFlags() when $default != null:
return $default(_that.debug,_that.strict,_that.skipCache,_that.includeExplain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiFlags implements SearchApiFlags {
  const _SearchApiFlags({this.debug = false, this.strict = false, this.skipCache = false, this.includeExplain = false});
  factory _SearchApiFlags.fromJson(Map<String, dynamic> json) => _$SearchApiFlagsFromJson(json);

@override@JsonKey() final  bool debug;
@override@JsonKey() final  bool strict;
@override@JsonKey() final  bool skipCache;
@override@JsonKey() final  bool includeExplain;

/// Create a copy of SearchApiFlags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiFlagsCopyWith<_SearchApiFlags> get copyWith => __$SearchApiFlagsCopyWithImpl<_SearchApiFlags>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiFlagsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiFlags&&(identical(other.debug, debug) || other.debug == debug)&&(identical(other.strict, strict) || other.strict == strict)&&(identical(other.skipCache, skipCache) || other.skipCache == skipCache)&&(identical(other.includeExplain, includeExplain) || other.includeExplain == includeExplain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debug,strict,skipCache,includeExplain);

@override
String toString() {
  return 'SearchApiFlags(debug: $debug, strict: $strict, skipCache: $skipCache, includeExplain: $includeExplain)';
}


}

/// @nodoc
abstract mixin class _$SearchApiFlagsCopyWith<$Res> implements $SearchApiFlagsCopyWith<$Res> {
  factory _$SearchApiFlagsCopyWith(_SearchApiFlags value, $Res Function(_SearchApiFlags) _then) = __$SearchApiFlagsCopyWithImpl;
@override @useResult
$Res call({
 bool debug, bool strict, bool skipCache, bool includeExplain
});




}
/// @nodoc
class __$SearchApiFlagsCopyWithImpl<$Res>
    implements _$SearchApiFlagsCopyWith<$Res> {
  __$SearchApiFlagsCopyWithImpl(this._self, this._then);

  final _SearchApiFlags _self;
  final $Res Function(_SearchApiFlags) _then;

/// Create a copy of SearchApiFlags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debug = null,Object? strict = null,Object? skipCache = null,Object? includeExplain = null,}) {
  return _then(_SearchApiFlags(
debug: null == debug ? _self.debug : debug // ignore: cast_nullable_to_non_nullable
as bool,strict: null == strict ? _self.strict : strict // ignore: cast_nullable_to_non_nullable
as bool,skipCache: null == skipCache ? _self.skipCache : skipCache // ignore: cast_nullable_to_non_nullable
as bool,includeExplain: null == includeExplain ? _self.includeExplain : includeExplain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SearchApiResponse {

 List<SearchApiItem> get items; SearchApiPage get page; SearchApiMeta get meta;
/// Create a copy of SearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiResponseCopyWith<SearchApiResponse> get copyWith => _$SearchApiResponseCopyWithImpl<SearchApiResponse>(this as SearchApiResponse, _$identity);

  /// Serializes this SearchApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,meta);

@override
String toString() {
  return 'SearchApiResponse(items: $items, page: $page, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SearchApiResponseCopyWith<$Res>  {
  factory $SearchApiResponseCopyWith(SearchApiResponse value, $Res Function(SearchApiResponse) _then) = _$SearchApiResponseCopyWithImpl;
@useResult
$Res call({
 List<SearchApiItem> items, SearchApiPage page, SearchApiMeta meta
});


$SearchApiPageCopyWith<$Res> get page;$SearchApiMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$SearchApiResponseCopyWithImpl<$Res>
    implements $SearchApiResponseCopyWith<$Res> {
  _$SearchApiResponseCopyWithImpl(this._self, this._then);

  final SearchApiResponse _self;
  final $Res Function(SearchApiResponse) _then;

/// Create a copy of SearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? meta = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SearchApiItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as SearchApiPage,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as SearchApiMeta,
  ));
}
/// Create a copy of SearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiPageCopyWith<$Res> get page {
  
  return $SearchApiPageCopyWith<$Res>(_self.page, (value) {
    return _then(_self.copyWith(page: value));
  });
}/// Create a copy of SearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiMetaCopyWith<$Res> get meta {
  
  return $SearchApiMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchApiResponse].
extension SearchApiResponsePatterns on SearchApiResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchApiItem> items,  SearchApiPage page,  SearchApiMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiResponse() when $default != null:
return $default(_that.items,_that.page,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchApiItem> items,  SearchApiPage page,  SearchApiMeta meta)  $default,) {final _that = this;
switch (_that) {
case _SearchApiResponse():
return $default(_that.items,_that.page,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchApiItem> items,  SearchApiPage page,  SearchApiMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiResponse() when $default != null:
return $default(_that.items,_that.page,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiResponse implements SearchApiResponse {
  const _SearchApiResponse({required final  List<SearchApiItem> items, required this.page, required this.meta}): _items = items;
  factory _SearchApiResponse.fromJson(Map<String, dynamic> json) => _$SearchApiResponseFromJson(json);

 final  List<SearchApiItem> _items;
@override List<SearchApiItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  SearchApiPage page;
@override final  SearchApiMeta meta;

/// Create a copy of SearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiResponseCopyWith<_SearchApiResponse> get copyWith => __$SearchApiResponseCopyWithImpl<_SearchApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,meta);

@override
String toString() {
  return 'SearchApiResponse(items: $items, page: $page, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$SearchApiResponseCopyWith<$Res> implements $SearchApiResponseCopyWith<$Res> {
  factory _$SearchApiResponseCopyWith(_SearchApiResponse value, $Res Function(_SearchApiResponse) _then) = __$SearchApiResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SearchApiItem> items, SearchApiPage page, SearchApiMeta meta
});


@override $SearchApiPageCopyWith<$Res> get page;@override $SearchApiMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$SearchApiResponseCopyWithImpl<$Res>
    implements _$SearchApiResponseCopyWith<$Res> {
  __$SearchApiResponseCopyWithImpl(this._self, this._then);

  final _SearchApiResponse _self;
  final $Res Function(_SearchApiResponse) _then;

/// Create a copy of SearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? meta = null,}) {
  return _then(_SearchApiResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SearchApiItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as SearchApiPage,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as SearchApiMeta,
  ));
}

/// Create a copy of SearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiPageCopyWith<$Res> get page {
  
  return $SearchApiPageCopyWith<$Res>(_self.page, (value) {
    return _then(_self.copyWith(page: value));
  });
}/// Create a copy of SearchApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiMetaCopyWith<$Res> get meta {
  
  return $SearchApiMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$SearchApiItem {

 String get id; SearchVertical get vertical; String get title; String? get subtitle; String? get imageUrl; double? get price; String? get currency; double? get rating; int? get reviewCount; double? get lat; double? get lng; String? get address; List<String> get provenance; Map<String, dynamic>? get details; SearchApiSavePayload? get savePayload; Map<String, dynamic>? get explain;
/// Create a copy of SearchApiItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiItemCopyWith<SearchApiItem> get copyWith => _$SearchApiItemCopyWithImpl<SearchApiItem>(this as SearchApiItem, _$identity);

  /// Serializes this SearchApiItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiItem&&(identical(other.id, id) || other.id == id)&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.provenance, provenance)&&const DeepCollectionEquality().equals(other.details, details)&&(identical(other.savePayload, savePayload) || other.savePayload == savePayload)&&const DeepCollectionEquality().equals(other.explain, explain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vertical,title,subtitle,imageUrl,price,currency,rating,reviewCount,lat,lng,address,const DeepCollectionEquality().hash(provenance),const DeepCollectionEquality().hash(details),savePayload,const DeepCollectionEquality().hash(explain));

@override
String toString() {
  return 'SearchApiItem(id: $id, vertical: $vertical, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, price: $price, currency: $currency, rating: $rating, reviewCount: $reviewCount, lat: $lat, lng: $lng, address: $address, provenance: $provenance, details: $details, savePayload: $savePayload, explain: $explain)';
}


}

/// @nodoc
abstract mixin class $SearchApiItemCopyWith<$Res>  {
  factory $SearchApiItemCopyWith(SearchApiItem value, $Res Function(SearchApiItem) _then) = _$SearchApiItemCopyWithImpl;
@useResult
$Res call({
 String id, SearchVertical vertical, String title, String? subtitle, String? imageUrl, double? price, String? currency, double? rating, int? reviewCount, double? lat, double? lng, String? address, List<String> provenance, Map<String, dynamic>? details, SearchApiSavePayload? savePayload, Map<String, dynamic>? explain
});


$SearchApiSavePayloadCopyWith<$Res>? get savePayload;

}
/// @nodoc
class _$SearchApiItemCopyWithImpl<$Res>
    implements $SearchApiItemCopyWith<$Res> {
  _$SearchApiItemCopyWithImpl(this._self, this._then);

  final SearchApiItem _self;
  final $Res Function(SearchApiItem) _then;

/// Create a copy of SearchApiItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vertical = null,Object? title = null,Object? subtitle = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? currency = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? lat = freezed,Object? lng = freezed,Object? address = freezed,Object? provenance = null,Object? details = freezed,Object? savePayload = freezed,Object? explain = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as SearchVertical,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as List<String>,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,savePayload: freezed == savePayload ? _self.savePayload : savePayload // ignore: cast_nullable_to_non_nullable
as SearchApiSavePayload?,explain: freezed == explain ? _self.explain : explain // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of SearchApiItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiSavePayloadCopyWith<$Res>? get savePayload {
    if (_self.savePayload == null) {
    return null;
  }

  return $SearchApiSavePayloadCopyWith<$Res>(_self.savePayload!, (value) {
    return _then(_self.copyWith(savePayload: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchApiItem].
extension SearchApiItemPatterns on SearchApiItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiItem value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiItem value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SearchVertical vertical,  String title,  String? subtitle,  String? imageUrl,  double? price,  String? currency,  double? rating,  int? reviewCount,  double? lat,  double? lng,  String? address,  List<String> provenance,  Map<String, dynamic>? details,  SearchApiSavePayload? savePayload,  Map<String, dynamic>? explain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiItem() when $default != null:
return $default(_that.id,_that.vertical,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.currency,_that.rating,_that.reviewCount,_that.lat,_that.lng,_that.address,_that.provenance,_that.details,_that.savePayload,_that.explain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SearchVertical vertical,  String title,  String? subtitle,  String? imageUrl,  double? price,  String? currency,  double? rating,  int? reviewCount,  double? lat,  double? lng,  String? address,  List<String> provenance,  Map<String, dynamic>? details,  SearchApiSavePayload? savePayload,  Map<String, dynamic>? explain)  $default,) {final _that = this;
switch (_that) {
case _SearchApiItem():
return $default(_that.id,_that.vertical,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.currency,_that.rating,_that.reviewCount,_that.lat,_that.lng,_that.address,_that.provenance,_that.details,_that.savePayload,_that.explain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SearchVertical vertical,  String title,  String? subtitle,  String? imageUrl,  double? price,  String? currency,  double? rating,  int? reviewCount,  double? lat,  double? lng,  String? address,  List<String> provenance,  Map<String, dynamic>? details,  SearchApiSavePayload? savePayload,  Map<String, dynamic>? explain)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiItem() when $default != null:
return $default(_that.id,_that.vertical,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.currency,_that.rating,_that.reviewCount,_that.lat,_that.lng,_that.address,_that.provenance,_that.details,_that.savePayload,_that.explain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiItem implements SearchApiItem {
  const _SearchApiItem({required this.id, required this.vertical, required this.title, this.subtitle, this.imageUrl, this.price, this.currency, this.rating, this.reviewCount, this.lat, this.lng, this.address, final  List<String> provenance = const [], final  Map<String, dynamic>? details, this.savePayload, final  Map<String, dynamic>? explain}): _provenance = provenance,_details = details,_explain = explain;
  factory _SearchApiItem.fromJson(Map<String, dynamic> json) => _$SearchApiItemFromJson(json);

@override final  String id;
@override final  SearchVertical vertical;
@override final  String title;
@override final  String? subtitle;
@override final  String? imageUrl;
@override final  double? price;
@override final  String? currency;
@override final  double? rating;
@override final  int? reviewCount;
@override final  double? lat;
@override final  double? lng;
@override final  String? address;
 final  List<String> _provenance;
@override@JsonKey() List<String> get provenance {
  if (_provenance is EqualUnmodifiableListView) return _provenance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_provenance);
}

 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  SearchApiSavePayload? savePayload;
 final  Map<String, dynamic>? _explain;
@override Map<String, dynamic>? get explain {
  final value = _explain;
  if (value == null) return null;
  if (_explain is EqualUnmodifiableMapView) return _explain;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SearchApiItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiItemCopyWith<_SearchApiItem> get copyWith => __$SearchApiItemCopyWithImpl<_SearchApiItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiItem&&(identical(other.id, id) || other.id == id)&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._provenance, _provenance)&&const DeepCollectionEquality().equals(other._details, _details)&&(identical(other.savePayload, savePayload) || other.savePayload == savePayload)&&const DeepCollectionEquality().equals(other._explain, _explain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vertical,title,subtitle,imageUrl,price,currency,rating,reviewCount,lat,lng,address,const DeepCollectionEquality().hash(_provenance),const DeepCollectionEquality().hash(_details),savePayload,const DeepCollectionEquality().hash(_explain));

@override
String toString() {
  return 'SearchApiItem(id: $id, vertical: $vertical, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, price: $price, currency: $currency, rating: $rating, reviewCount: $reviewCount, lat: $lat, lng: $lng, address: $address, provenance: $provenance, details: $details, savePayload: $savePayload, explain: $explain)';
}


}

/// @nodoc
abstract mixin class _$SearchApiItemCopyWith<$Res> implements $SearchApiItemCopyWith<$Res> {
  factory _$SearchApiItemCopyWith(_SearchApiItem value, $Res Function(_SearchApiItem) _then) = __$SearchApiItemCopyWithImpl;
@override @useResult
$Res call({
 String id, SearchVertical vertical, String title, String? subtitle, String? imageUrl, double? price, String? currency, double? rating, int? reviewCount, double? lat, double? lng, String? address, List<String> provenance, Map<String, dynamic>? details, SearchApiSavePayload? savePayload, Map<String, dynamic>? explain
});


@override $SearchApiSavePayloadCopyWith<$Res>? get savePayload;

}
/// @nodoc
class __$SearchApiItemCopyWithImpl<$Res>
    implements _$SearchApiItemCopyWith<$Res> {
  __$SearchApiItemCopyWithImpl(this._self, this._then);

  final _SearchApiItem _self;
  final $Res Function(_SearchApiItem) _then;

/// Create a copy of SearchApiItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vertical = null,Object? title = null,Object? subtitle = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? currency = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? lat = freezed,Object? lng = freezed,Object? address = freezed,Object? provenance = null,Object? details = freezed,Object? savePayload = freezed,Object? explain = freezed,}) {
  return _then(_SearchApiItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as SearchVertical,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,provenance: null == provenance ? _self._provenance : provenance // ignore: cast_nullable_to_non_nullable
as List<String>,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,savePayload: freezed == savePayload ? _self.savePayload : savePayload // ignore: cast_nullable_to_non_nullable
as SearchApiSavePayload?,explain: freezed == explain ? _self._explain : explain // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of SearchApiItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiSavePayloadCopyWith<$Res>? get savePayload {
    if (_self.savePayload == null) {
    return null;
  }

  return $SearchApiSavePayloadCopyWith<$Res>(_self.savePayload!, (value) {
    return _then(_self.copyWith(savePayload: value));
  });
}
}


/// @nodoc
mixin _$SearchApiSavePayload {

 String get id; String get vertical; String get title; String get dedupeKey; Map<String, dynamic>? get details;
/// Create a copy of SearchApiSavePayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiSavePayloadCopyWith<SearchApiSavePayload> get copyWith => _$SearchApiSavePayloadCopyWithImpl<SearchApiSavePayload>(this as SearchApiSavePayload, _$identity);

  /// Serializes this SearchApiSavePayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiSavePayload&&(identical(other.id, id) || other.id == id)&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.title, title) || other.title == title)&&(identical(other.dedupeKey, dedupeKey) || other.dedupeKey == dedupeKey)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vertical,title,dedupeKey,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'SearchApiSavePayload(id: $id, vertical: $vertical, title: $title, dedupeKey: $dedupeKey, details: $details)';
}


}

/// @nodoc
abstract mixin class $SearchApiSavePayloadCopyWith<$Res>  {
  factory $SearchApiSavePayloadCopyWith(SearchApiSavePayload value, $Res Function(SearchApiSavePayload) _then) = _$SearchApiSavePayloadCopyWithImpl;
@useResult
$Res call({
 String id, String vertical, String title, String dedupeKey, Map<String, dynamic>? details
});




}
/// @nodoc
class _$SearchApiSavePayloadCopyWithImpl<$Res>
    implements $SearchApiSavePayloadCopyWith<$Res> {
  _$SearchApiSavePayloadCopyWithImpl(this._self, this._then);

  final SearchApiSavePayload _self;
  final $Res Function(SearchApiSavePayload) _then;

/// Create a copy of SearchApiSavePayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vertical = null,Object? title = null,Object? dedupeKey = null,Object? details = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dedupeKey: null == dedupeKey ? _self.dedupeKey : dedupeKey // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchApiSavePayload].
extension SearchApiSavePayloadPatterns on SearchApiSavePayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiSavePayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiSavePayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiSavePayload value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiSavePayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiSavePayload value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiSavePayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vertical,  String title,  String dedupeKey,  Map<String, dynamic>? details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiSavePayload() when $default != null:
return $default(_that.id,_that.vertical,_that.title,_that.dedupeKey,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vertical,  String title,  String dedupeKey,  Map<String, dynamic>? details)  $default,) {final _that = this;
switch (_that) {
case _SearchApiSavePayload():
return $default(_that.id,_that.vertical,_that.title,_that.dedupeKey,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vertical,  String title,  String dedupeKey,  Map<String, dynamic>? details)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiSavePayload() when $default != null:
return $default(_that.id,_that.vertical,_that.title,_that.dedupeKey,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiSavePayload implements SearchApiSavePayload {
  const _SearchApiSavePayload({required this.id, required this.vertical, required this.title, required this.dedupeKey, final  Map<String, dynamic>? details}): _details = details;
  factory _SearchApiSavePayload.fromJson(Map<String, dynamic> json) => _$SearchApiSavePayloadFromJson(json);

@override final  String id;
@override final  String vertical;
@override final  String title;
@override final  String dedupeKey;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SearchApiSavePayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiSavePayloadCopyWith<_SearchApiSavePayload> get copyWith => __$SearchApiSavePayloadCopyWithImpl<_SearchApiSavePayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiSavePayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiSavePayload&&(identical(other.id, id) || other.id == id)&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.title, title) || other.title == title)&&(identical(other.dedupeKey, dedupeKey) || other.dedupeKey == dedupeKey)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vertical,title,dedupeKey,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'SearchApiSavePayload(id: $id, vertical: $vertical, title: $title, dedupeKey: $dedupeKey, details: $details)';
}


}

/// @nodoc
abstract mixin class _$SearchApiSavePayloadCopyWith<$Res> implements $SearchApiSavePayloadCopyWith<$Res> {
  factory _$SearchApiSavePayloadCopyWith(_SearchApiSavePayload value, $Res Function(_SearchApiSavePayload) _then) = __$SearchApiSavePayloadCopyWithImpl;
@override @useResult
$Res call({
 String id, String vertical, String title, String dedupeKey, Map<String, dynamic>? details
});




}
/// @nodoc
class __$SearchApiSavePayloadCopyWithImpl<$Res>
    implements _$SearchApiSavePayloadCopyWith<$Res> {
  __$SearchApiSavePayloadCopyWithImpl(this._self, this._then);

  final _SearchApiSavePayload _self;
  final $Res Function(_SearchApiSavePayload) _then;

/// Create a copy of SearchApiSavePayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vertical = null,Object? title = null,Object? dedupeKey = null,Object? details = freezed,}) {
  return _then(_SearchApiSavePayload(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dedupeKey: null == dedupeKey ? _self.dedupeKey : dedupeKey // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$SearchApiPage {

 String? get cursor; bool get hasMore; int get pageSize; int? get totalCount;
/// Create a copy of SearchApiPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiPageCopyWith<SearchApiPage> get copyWith => _$SearchApiPageCopyWithImpl<SearchApiPage>(this as SearchApiPage, _$identity);

  /// Serializes this SearchApiPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiPage&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cursor,hasMore,pageSize,totalCount);

@override
String toString() {
  return 'SearchApiPage(cursor: $cursor, hasMore: $hasMore, pageSize: $pageSize, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $SearchApiPageCopyWith<$Res>  {
  factory $SearchApiPageCopyWith(SearchApiPage value, $Res Function(SearchApiPage) _then) = _$SearchApiPageCopyWithImpl;
@useResult
$Res call({
 String? cursor, bool hasMore, int pageSize, int? totalCount
});




}
/// @nodoc
class _$SearchApiPageCopyWithImpl<$Res>
    implements $SearchApiPageCopyWith<$Res> {
  _$SearchApiPageCopyWithImpl(this._self, this._then);

  final SearchApiPage _self;
  final $Res Function(SearchApiPage) _then;

/// Create a copy of SearchApiPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cursor = freezed,Object? hasMore = null,Object? pageSize = null,Object? totalCount = freezed,}) {
  return _then(_self.copyWith(
cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchApiPage].
extension SearchApiPagePatterns on SearchApiPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiPage value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiPage value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cursor,  bool hasMore,  int pageSize,  int? totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiPage() when $default != null:
return $default(_that.cursor,_that.hasMore,_that.pageSize,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cursor,  bool hasMore,  int pageSize,  int? totalCount)  $default,) {final _that = this;
switch (_that) {
case _SearchApiPage():
return $default(_that.cursor,_that.hasMore,_that.pageSize,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cursor,  bool hasMore,  int pageSize,  int? totalCount)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiPage() when $default != null:
return $default(_that.cursor,_that.hasMore,_that.pageSize,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiPage implements SearchApiPage {
  const _SearchApiPage({this.cursor, required this.hasMore, required this.pageSize, this.totalCount});
  factory _SearchApiPage.fromJson(Map<String, dynamic> json) => _$SearchApiPageFromJson(json);

@override final  String? cursor;
@override final  bool hasMore;
@override final  int pageSize;
@override final  int? totalCount;

/// Create a copy of SearchApiPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiPageCopyWith<_SearchApiPage> get copyWith => __$SearchApiPageCopyWithImpl<_SearchApiPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiPage&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cursor,hasMore,pageSize,totalCount);

@override
String toString() {
  return 'SearchApiPage(cursor: $cursor, hasMore: $hasMore, pageSize: $pageSize, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$SearchApiPageCopyWith<$Res> implements $SearchApiPageCopyWith<$Res> {
  factory _$SearchApiPageCopyWith(_SearchApiPage value, $Res Function(_SearchApiPage) _then) = __$SearchApiPageCopyWithImpl;
@override @useResult
$Res call({
 String? cursor, bool hasMore, int pageSize, int? totalCount
});




}
/// @nodoc
class __$SearchApiPageCopyWithImpl<$Res>
    implements _$SearchApiPageCopyWith<$Res> {
  __$SearchApiPageCopyWithImpl(this._self, this._then);

  final _SearchApiPage _self;
  final $Res Function(_SearchApiPage) _then;

/// Create a copy of SearchApiPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cursor = freezed,Object? hasMore = null,Object? pageSize = null,Object? totalCount = freezed,}) {
  return _then(_SearchApiPage(
cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SearchApiMeta {

 String get requestId; int get tookMs; List<SearchApiProviderMeta> get providers; SearchApiRankingMeta? get ranking;
/// Create a copy of SearchApiMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiMetaCopyWith<SearchApiMeta> get copyWith => _$SearchApiMetaCopyWithImpl<SearchApiMeta>(this as SearchApiMeta, _$identity);

  /// Serializes this SearchApiMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiMeta&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.tookMs, tookMs) || other.tookMs == tookMs)&&const DeepCollectionEquality().equals(other.providers, providers)&&(identical(other.ranking, ranking) || other.ranking == ranking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,tookMs,const DeepCollectionEquality().hash(providers),ranking);

@override
String toString() {
  return 'SearchApiMeta(requestId: $requestId, tookMs: $tookMs, providers: $providers, ranking: $ranking)';
}


}

/// @nodoc
abstract mixin class $SearchApiMetaCopyWith<$Res>  {
  factory $SearchApiMetaCopyWith(SearchApiMeta value, $Res Function(SearchApiMeta) _then) = _$SearchApiMetaCopyWithImpl;
@useResult
$Res call({
 String requestId, int tookMs, List<SearchApiProviderMeta> providers, SearchApiRankingMeta? ranking
});


$SearchApiRankingMetaCopyWith<$Res>? get ranking;

}
/// @nodoc
class _$SearchApiMetaCopyWithImpl<$Res>
    implements $SearchApiMetaCopyWith<$Res> {
  _$SearchApiMetaCopyWithImpl(this._self, this._then);

  final SearchApiMeta _self;
  final $Res Function(SearchApiMeta) _then;

/// Create a copy of SearchApiMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? tookMs = null,Object? providers = null,Object? ranking = freezed,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,tookMs: null == tookMs ? _self.tookMs : tookMs // ignore: cast_nullable_to_non_nullable
as int,providers: null == providers ? _self.providers : providers // ignore: cast_nullable_to_non_nullable
as List<SearchApiProviderMeta>,ranking: freezed == ranking ? _self.ranking : ranking // ignore: cast_nullable_to_non_nullable
as SearchApiRankingMeta?,
  ));
}
/// Create a copy of SearchApiMeta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiRankingMetaCopyWith<$Res>? get ranking {
    if (_self.ranking == null) {
    return null;
  }

  return $SearchApiRankingMetaCopyWith<$Res>(_self.ranking!, (value) {
    return _then(_self.copyWith(ranking: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchApiMeta].
extension SearchApiMetaPatterns on SearchApiMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiMeta value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiMeta value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  int tookMs,  List<SearchApiProviderMeta> providers,  SearchApiRankingMeta? ranking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiMeta() when $default != null:
return $default(_that.requestId,_that.tookMs,_that.providers,_that.ranking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  int tookMs,  List<SearchApiProviderMeta> providers,  SearchApiRankingMeta? ranking)  $default,) {final _that = this;
switch (_that) {
case _SearchApiMeta():
return $default(_that.requestId,_that.tookMs,_that.providers,_that.ranking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  int tookMs,  List<SearchApiProviderMeta> providers,  SearchApiRankingMeta? ranking)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiMeta() when $default != null:
return $default(_that.requestId,_that.tookMs,_that.providers,_that.ranking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiMeta implements SearchApiMeta {
  const _SearchApiMeta({required this.requestId, required this.tookMs, required final  List<SearchApiProviderMeta> providers, this.ranking}): _providers = providers;
  factory _SearchApiMeta.fromJson(Map<String, dynamic> json) => _$SearchApiMetaFromJson(json);

@override final  String requestId;
@override final  int tookMs;
 final  List<SearchApiProviderMeta> _providers;
@override List<SearchApiProviderMeta> get providers {
  if (_providers is EqualUnmodifiableListView) return _providers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providers);
}

@override final  SearchApiRankingMeta? ranking;

/// Create a copy of SearchApiMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiMetaCopyWith<_SearchApiMeta> get copyWith => __$SearchApiMetaCopyWithImpl<_SearchApiMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiMeta&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.tookMs, tookMs) || other.tookMs == tookMs)&&const DeepCollectionEquality().equals(other._providers, _providers)&&(identical(other.ranking, ranking) || other.ranking == ranking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,tookMs,const DeepCollectionEquality().hash(_providers),ranking);

@override
String toString() {
  return 'SearchApiMeta(requestId: $requestId, tookMs: $tookMs, providers: $providers, ranking: $ranking)';
}


}

/// @nodoc
abstract mixin class _$SearchApiMetaCopyWith<$Res> implements $SearchApiMetaCopyWith<$Res> {
  factory _$SearchApiMetaCopyWith(_SearchApiMeta value, $Res Function(_SearchApiMeta) _then) = __$SearchApiMetaCopyWithImpl;
@override @useResult
$Res call({
 String requestId, int tookMs, List<SearchApiProviderMeta> providers, SearchApiRankingMeta? ranking
});


@override $SearchApiRankingMetaCopyWith<$Res>? get ranking;

}
/// @nodoc
class __$SearchApiMetaCopyWithImpl<$Res>
    implements _$SearchApiMetaCopyWith<$Res> {
  __$SearchApiMetaCopyWithImpl(this._self, this._then);

  final _SearchApiMeta _self;
  final $Res Function(_SearchApiMeta) _then;

/// Create a copy of SearchApiMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? tookMs = null,Object? providers = null,Object? ranking = freezed,}) {
  return _then(_SearchApiMeta(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,tookMs: null == tookMs ? _self.tookMs : tookMs // ignore: cast_nullable_to_non_nullable
as int,providers: null == providers ? _self._providers : providers // ignore: cast_nullable_to_non_nullable
as List<SearchApiProviderMeta>,ranking: freezed == ranking ? _self.ranking : ranking // ignore: cast_nullable_to_non_nullable
as SearchApiRankingMeta?,
  ));
}

/// Create a copy of SearchApiMeta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchApiRankingMetaCopyWith<$Res>? get ranking {
    if (_self.ranking == null) {
    return null;
  }

  return $SearchApiRankingMetaCopyWith<$Res>(_self.ranking!, (value) {
    return _then(_self.copyWith(ranking: value));
  });
}
}


/// @nodoc
mixin _$SearchApiProviderMeta {

 String get name; String get status; int get tookMs; int get itemCount; String? get cache; String? get error;
/// Create a copy of SearchApiProviderMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiProviderMetaCopyWith<SearchApiProviderMeta> get copyWith => _$SearchApiProviderMetaCopyWithImpl<SearchApiProviderMeta>(this as SearchApiProviderMeta, _$identity);

  /// Serializes this SearchApiProviderMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiProviderMeta&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.tookMs, tookMs) || other.tookMs == tookMs)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,status,tookMs,itemCount,cache,error);

@override
String toString() {
  return 'SearchApiProviderMeta(name: $name, status: $status, tookMs: $tookMs, itemCount: $itemCount, cache: $cache, error: $error)';
}


}

/// @nodoc
abstract mixin class $SearchApiProviderMetaCopyWith<$Res>  {
  factory $SearchApiProviderMetaCopyWith(SearchApiProviderMeta value, $Res Function(SearchApiProviderMeta) _then) = _$SearchApiProviderMetaCopyWithImpl;
@useResult
$Res call({
 String name, String status, int tookMs, int itemCount, String? cache, String? error
});




}
/// @nodoc
class _$SearchApiProviderMetaCopyWithImpl<$Res>
    implements $SearchApiProviderMetaCopyWith<$Res> {
  _$SearchApiProviderMetaCopyWithImpl(this._self, this._then);

  final SearchApiProviderMeta _self;
  final $Res Function(SearchApiProviderMeta) _then;

/// Create a copy of SearchApiProviderMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? status = null,Object? tookMs = null,Object? itemCount = null,Object? cache = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tookMs: null == tookMs ? _self.tookMs : tookMs // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,cache: freezed == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchApiProviderMeta].
extension SearchApiProviderMetaPatterns on SearchApiProviderMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiProviderMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiProviderMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiProviderMeta value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiProviderMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiProviderMeta value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiProviderMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String status,  int tookMs,  int itemCount,  String? cache,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiProviderMeta() when $default != null:
return $default(_that.name,_that.status,_that.tookMs,_that.itemCount,_that.cache,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String status,  int tookMs,  int itemCount,  String? cache,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SearchApiProviderMeta():
return $default(_that.name,_that.status,_that.tookMs,_that.itemCount,_that.cache,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String status,  int tookMs,  int itemCount,  String? cache,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiProviderMeta() when $default != null:
return $default(_that.name,_that.status,_that.tookMs,_that.itemCount,_that.cache,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiProviderMeta implements SearchApiProviderMeta {
  const _SearchApiProviderMeta({required this.name, required this.status, required this.tookMs, required this.itemCount, this.cache, this.error});
  factory _SearchApiProviderMeta.fromJson(Map<String, dynamic> json) => _$SearchApiProviderMetaFromJson(json);

@override final  String name;
@override final  String status;
@override final  int tookMs;
@override final  int itemCount;
@override final  String? cache;
@override final  String? error;

/// Create a copy of SearchApiProviderMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiProviderMetaCopyWith<_SearchApiProviderMeta> get copyWith => __$SearchApiProviderMetaCopyWithImpl<_SearchApiProviderMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiProviderMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiProviderMeta&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.tookMs, tookMs) || other.tookMs == tookMs)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,status,tookMs,itemCount,cache,error);

@override
String toString() {
  return 'SearchApiProviderMeta(name: $name, status: $status, tookMs: $tookMs, itemCount: $itemCount, cache: $cache, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SearchApiProviderMetaCopyWith<$Res> implements $SearchApiProviderMetaCopyWith<$Res> {
  factory _$SearchApiProviderMetaCopyWith(_SearchApiProviderMeta value, $Res Function(_SearchApiProviderMeta) _then) = __$SearchApiProviderMetaCopyWithImpl;
@override @useResult
$Res call({
 String name, String status, int tookMs, int itemCount, String? cache, String? error
});




}
/// @nodoc
class __$SearchApiProviderMetaCopyWithImpl<$Res>
    implements _$SearchApiProviderMetaCopyWith<$Res> {
  __$SearchApiProviderMetaCopyWithImpl(this._self, this._then);

  final _SearchApiProviderMeta _self;
  final $Res Function(_SearchApiProviderMeta) _then;

/// Create a copy of SearchApiProviderMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? status = null,Object? tookMs = null,Object? itemCount = null,Object? cache = freezed,Object? error = freezed,}) {
  return _then(_SearchApiProviderMeta(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tookMs: null == tookMs ? _self.tookMs : tookMs // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,cache: freezed == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SearchApiRankingMeta {

 String get strategy; Map<String, double> get weights;
/// Create a copy of SearchApiRankingMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiRankingMetaCopyWith<SearchApiRankingMeta> get copyWith => _$SearchApiRankingMetaCopyWithImpl<SearchApiRankingMeta>(this as SearchApiRankingMeta, _$identity);

  /// Serializes this SearchApiRankingMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiRankingMeta&&(identical(other.strategy, strategy) || other.strategy == strategy)&&const DeepCollectionEquality().equals(other.weights, weights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strategy,const DeepCollectionEquality().hash(weights));

@override
String toString() {
  return 'SearchApiRankingMeta(strategy: $strategy, weights: $weights)';
}


}

/// @nodoc
abstract mixin class $SearchApiRankingMetaCopyWith<$Res>  {
  factory $SearchApiRankingMetaCopyWith(SearchApiRankingMeta value, $Res Function(SearchApiRankingMeta) _then) = _$SearchApiRankingMetaCopyWithImpl;
@useResult
$Res call({
 String strategy, Map<String, double> weights
});




}
/// @nodoc
class _$SearchApiRankingMetaCopyWithImpl<$Res>
    implements $SearchApiRankingMetaCopyWith<$Res> {
  _$SearchApiRankingMetaCopyWithImpl(this._self, this._then);

  final SearchApiRankingMeta _self;
  final $Res Function(SearchApiRankingMeta) _then;

/// Create a copy of SearchApiRankingMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? strategy = null,Object? weights = null,}) {
  return _then(_self.copyWith(
strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as String,weights: null == weights ? _self.weights : weights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchApiRankingMeta].
extension SearchApiRankingMetaPatterns on SearchApiRankingMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiRankingMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiRankingMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiRankingMeta value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiRankingMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiRankingMeta value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiRankingMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String strategy,  Map<String, double> weights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiRankingMeta() when $default != null:
return $default(_that.strategy,_that.weights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String strategy,  Map<String, double> weights)  $default,) {final _that = this;
switch (_that) {
case _SearchApiRankingMeta():
return $default(_that.strategy,_that.weights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String strategy,  Map<String, double> weights)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiRankingMeta() when $default != null:
return $default(_that.strategy,_that.weights);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiRankingMeta implements SearchApiRankingMeta {
  const _SearchApiRankingMeta({required this.strategy, final  Map<String, double> weights = const {}}): _weights = weights;
  factory _SearchApiRankingMeta.fromJson(Map<String, dynamic> json) => _$SearchApiRankingMetaFromJson(json);

@override final  String strategy;
 final  Map<String, double> _weights;
@override@JsonKey() Map<String, double> get weights {
  if (_weights is EqualUnmodifiableMapView) return _weights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_weights);
}


/// Create a copy of SearchApiRankingMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiRankingMetaCopyWith<_SearchApiRankingMeta> get copyWith => __$SearchApiRankingMetaCopyWithImpl<_SearchApiRankingMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiRankingMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiRankingMeta&&(identical(other.strategy, strategy) || other.strategy == strategy)&&const DeepCollectionEquality().equals(other._weights, _weights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strategy,const DeepCollectionEquality().hash(_weights));

@override
String toString() {
  return 'SearchApiRankingMeta(strategy: $strategy, weights: $weights)';
}


}

/// @nodoc
abstract mixin class _$SearchApiRankingMetaCopyWith<$Res> implements $SearchApiRankingMetaCopyWith<$Res> {
  factory _$SearchApiRankingMetaCopyWith(_SearchApiRankingMeta value, $Res Function(_SearchApiRankingMeta) _then) = __$SearchApiRankingMetaCopyWithImpl;
@override @useResult
$Res call({
 String strategy, Map<String, double> weights
});




}
/// @nodoc
class __$SearchApiRankingMetaCopyWithImpl<$Res>
    implements _$SearchApiRankingMetaCopyWith<$Res> {
  __$SearchApiRankingMetaCopyWithImpl(this._self, this._then);

  final _SearchApiRankingMeta _self;
  final $Res Function(_SearchApiRankingMeta) _then;

/// Create a copy of SearchApiRankingMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? strategy = null,Object? weights = null,}) {
  return _then(_SearchApiRankingMeta(
strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as String,weights: null == weights ? _self._weights : weights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}


/// @nodoc
mixin _$SearchApiError {

 String get code; String get message; List<SearchApiErrorDetail> get details;
/// Create a copy of SearchApiError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiErrorCopyWith<SearchApiError> get copyWith => _$SearchApiErrorCopyWithImpl<SearchApiError>(this as SearchApiError, _$identity);

  /// Serializes this SearchApiError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'SearchApiError(code: $code, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class $SearchApiErrorCopyWith<$Res>  {
  factory $SearchApiErrorCopyWith(SearchApiError value, $Res Function(SearchApiError) _then) = _$SearchApiErrorCopyWithImpl;
@useResult
$Res call({
 String code, String message, List<SearchApiErrorDetail> details
});




}
/// @nodoc
class _$SearchApiErrorCopyWithImpl<$Res>
    implements $SearchApiErrorCopyWith<$Res> {
  _$SearchApiErrorCopyWithImpl(this._self, this._then);

  final SearchApiError _self;
  final $Res Function(SearchApiError) _then;

/// Create a copy of SearchApiError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? details = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as List<SearchApiErrorDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchApiError].
extension SearchApiErrorPatterns on SearchApiError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiError value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiError value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message,  List<SearchApiErrorDetail> details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiError() when $default != null:
return $default(_that.code,_that.message,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message,  List<SearchApiErrorDetail> details)  $default,) {final _that = this;
switch (_that) {
case _SearchApiError():
return $default(_that.code,_that.message,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message,  List<SearchApiErrorDetail> details)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiError() when $default != null:
return $default(_that.code,_that.message,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiError implements SearchApiError {
  const _SearchApiError({required this.code, required this.message, final  List<SearchApiErrorDetail> details = const []}): _details = details;
  factory _SearchApiError.fromJson(Map<String, dynamic> json) => _$SearchApiErrorFromJson(json);

@override final  String code;
@override final  String message;
 final  List<SearchApiErrorDetail> _details;
@override@JsonKey() List<SearchApiErrorDetail> get details {
  if (_details is EqualUnmodifiableListView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_details);
}


/// Create a copy of SearchApiError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiErrorCopyWith<_SearchApiError> get copyWith => __$SearchApiErrorCopyWithImpl<_SearchApiError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'SearchApiError(code: $code, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class _$SearchApiErrorCopyWith<$Res> implements $SearchApiErrorCopyWith<$Res> {
  factory _$SearchApiErrorCopyWith(_SearchApiError value, $Res Function(_SearchApiError) _then) = __$SearchApiErrorCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, List<SearchApiErrorDetail> details
});




}
/// @nodoc
class __$SearchApiErrorCopyWithImpl<$Res>
    implements _$SearchApiErrorCopyWith<$Res> {
  __$SearchApiErrorCopyWithImpl(this._self, this._then);

  final _SearchApiError _self;
  final $Res Function(_SearchApiError) _then;

/// Create a copy of SearchApiError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? details = null,}) {
  return _then(_SearchApiError(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: null == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as List<SearchApiErrorDetail>,
  ));
}


}


/// @nodoc
mixin _$SearchApiErrorDetail {

 String get field; String get message;
/// Create a copy of SearchApiErrorDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchApiErrorDetailCopyWith<SearchApiErrorDetail> get copyWith => _$SearchApiErrorDetailCopyWithImpl<SearchApiErrorDetail>(this as SearchApiErrorDetail, _$identity);

  /// Serializes this SearchApiErrorDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchApiErrorDetail&&(identical(other.field, field) || other.field == field)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,field,message);

@override
String toString() {
  return 'SearchApiErrorDetail(field: $field, message: $message)';
}


}

/// @nodoc
abstract mixin class $SearchApiErrorDetailCopyWith<$Res>  {
  factory $SearchApiErrorDetailCopyWith(SearchApiErrorDetail value, $Res Function(SearchApiErrorDetail) _then) = _$SearchApiErrorDetailCopyWithImpl;
@useResult
$Res call({
 String field, String message
});




}
/// @nodoc
class _$SearchApiErrorDetailCopyWithImpl<$Res>
    implements $SearchApiErrorDetailCopyWith<$Res> {
  _$SearchApiErrorDetailCopyWithImpl(this._self, this._then);

  final SearchApiErrorDetail _self;
  final $Res Function(SearchApiErrorDetail) _then;

/// Create a copy of SearchApiErrorDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? field = null,Object? message = null,}) {
  return _then(_self.copyWith(
field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchApiErrorDetail].
extension SearchApiErrorDetailPatterns on SearchApiErrorDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchApiErrorDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchApiErrorDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchApiErrorDetail value)  $default,){
final _that = this;
switch (_that) {
case _SearchApiErrorDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchApiErrorDetail value)?  $default,){
final _that = this;
switch (_that) {
case _SearchApiErrorDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String field,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchApiErrorDetail() when $default != null:
return $default(_that.field,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String field,  String message)  $default,) {final _that = this;
switch (_that) {
case _SearchApiErrorDetail():
return $default(_that.field,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String field,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SearchApiErrorDetail() when $default != null:
return $default(_that.field,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchApiErrorDetail implements SearchApiErrorDetail {
  const _SearchApiErrorDetail({required this.field, required this.message});
  factory _SearchApiErrorDetail.fromJson(Map<String, dynamic> json) => _$SearchApiErrorDetailFromJson(json);

@override final  String field;
@override final  String message;

/// Create a copy of SearchApiErrorDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchApiErrorDetailCopyWith<_SearchApiErrorDetail> get copyWith => __$SearchApiErrorDetailCopyWithImpl<_SearchApiErrorDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchApiErrorDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchApiErrorDetail&&(identical(other.field, field) || other.field == field)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,field,message);

@override
String toString() {
  return 'SearchApiErrorDetail(field: $field, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SearchApiErrorDetailCopyWith<$Res> implements $SearchApiErrorDetailCopyWith<$Res> {
  factory _$SearchApiErrorDetailCopyWith(_SearchApiErrorDetail value, $Res Function(_SearchApiErrorDetail) _then) = __$SearchApiErrorDetailCopyWithImpl;
@override @useResult
$Res call({
 String field, String message
});




}
/// @nodoc
class __$SearchApiErrorDetailCopyWithImpl<$Res>
    implements _$SearchApiErrorDetailCopyWith<$Res> {
  __$SearchApiErrorDetailCopyWithImpl(this._self, this._then);

  final _SearchApiErrorDetail _self;
  final $Res Function(_SearchApiErrorDetail) _then;

/// Create a copy of SearchApiErrorDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? field = null,Object? message = null,}) {
  return _then(_SearchApiErrorDetail(
field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
