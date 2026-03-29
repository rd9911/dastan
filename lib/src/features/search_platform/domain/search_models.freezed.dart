// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchContext {

 String? get itineraryId; String get locale; String get currency; String get timezone; SearchPrefs? get userPrefs;
/// Create a copy of SearchContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchContextCopyWith<SearchContext> get copyWith => _$SearchContextCopyWithImpl<SearchContext>(this as SearchContext, _$identity);

  /// Serializes this SearchContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchContext&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.userPrefs, userPrefs) || other.userPrefs == userPrefs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,locale,currency,timezone,userPrefs);

@override
String toString() {
  return 'SearchContext(itineraryId: $itineraryId, locale: $locale, currency: $currency, timezone: $timezone, userPrefs: $userPrefs)';
}


}

/// @nodoc
abstract mixin class $SearchContextCopyWith<$Res>  {
  factory $SearchContextCopyWith(SearchContext value, $Res Function(SearchContext) _then) = _$SearchContextCopyWithImpl;
@useResult
$Res call({
 String? itineraryId, String locale, String currency, String timezone, SearchPrefs? userPrefs
});


$SearchPrefsCopyWith<$Res>? get userPrefs;

}
/// @nodoc
class _$SearchContextCopyWithImpl<$Res>
    implements $SearchContextCopyWith<$Res> {
  _$SearchContextCopyWithImpl(this._self, this._then);

  final SearchContext _self;
  final $Res Function(SearchContext) _then;

/// Create a copy of SearchContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = freezed,Object? locale = null,Object? currency = null,Object? timezone = null,Object? userPrefs = freezed,}) {
  return _then(_self.copyWith(
itineraryId: freezed == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,userPrefs: freezed == userPrefs ? _self.userPrefs : userPrefs // ignore: cast_nullable_to_non_nullable
as SearchPrefs?,
  ));
}
/// Create a copy of SearchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchPrefsCopyWith<$Res>? get userPrefs {
    if (_self.userPrefs == null) {
    return null;
  }

  return $SearchPrefsCopyWith<$Res>(_self.userPrefs!, (value) {
    return _then(_self.copyWith(userPrefs: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchContext].
extension SearchContextPatterns on SearchContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchContext value)  $default,){
final _that = this;
switch (_that) {
case _SearchContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchContext value)?  $default,){
final _that = this;
switch (_that) {
case _SearchContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? itineraryId,  String locale,  String currency,  String timezone,  SearchPrefs? userPrefs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchContext() when $default != null:
return $default(_that.itineraryId,_that.locale,_that.currency,_that.timezone,_that.userPrefs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? itineraryId,  String locale,  String currency,  String timezone,  SearchPrefs? userPrefs)  $default,) {final _that = this;
switch (_that) {
case _SearchContext():
return $default(_that.itineraryId,_that.locale,_that.currency,_that.timezone,_that.userPrefs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? itineraryId,  String locale,  String currency,  String timezone,  SearchPrefs? userPrefs)?  $default,) {final _that = this;
switch (_that) {
case _SearchContext() when $default != null:
return $default(_that.itineraryId,_that.locale,_that.currency,_that.timezone,_that.userPrefs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchContext implements SearchContext {
  const _SearchContext({this.itineraryId, this.locale = 'en', this.currency = 'USD', this.timezone = 'UTC', this.userPrefs});
  factory _SearchContext.fromJson(Map<String, dynamic> json) => _$SearchContextFromJson(json);

@override final  String? itineraryId;
@override@JsonKey() final  String locale;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String timezone;
@override final  SearchPrefs? userPrefs;

/// Create a copy of SearchContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchContextCopyWith<_SearchContext> get copyWith => __$SearchContextCopyWithImpl<_SearchContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchContext&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.userPrefs, userPrefs) || other.userPrefs == userPrefs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,locale,currency,timezone,userPrefs);

@override
String toString() {
  return 'SearchContext(itineraryId: $itineraryId, locale: $locale, currency: $currency, timezone: $timezone, userPrefs: $userPrefs)';
}


}

/// @nodoc
abstract mixin class _$SearchContextCopyWith<$Res> implements $SearchContextCopyWith<$Res> {
  factory _$SearchContextCopyWith(_SearchContext value, $Res Function(_SearchContext) _then) = __$SearchContextCopyWithImpl;
@override @useResult
$Res call({
 String? itineraryId, String locale, String currency, String timezone, SearchPrefs? userPrefs
});


@override $SearchPrefsCopyWith<$Res>? get userPrefs;

}
/// @nodoc
class __$SearchContextCopyWithImpl<$Res>
    implements _$SearchContextCopyWith<$Res> {
  __$SearchContextCopyWithImpl(this._self, this._then);

  final _SearchContext _self;
  final $Res Function(_SearchContext) _then;

/// Create a copy of SearchContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = freezed,Object? locale = null,Object? currency = null,Object? timezone = null,Object? userPrefs = freezed,}) {
  return _then(_SearchContext(
itineraryId: freezed == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String?,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,userPrefs: freezed == userPrefs ? _self.userPrefs : userPrefs // ignore: cast_nullable_to_non_nullable
as SearchPrefs?,
  ));
}

/// Create a copy of SearchContext
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchPrefsCopyWith<$Res>? get userPrefs {
    if (_self.userPrefs == null) {
    return null;
  }

  return $SearchPrefsCopyWith<$Res>(_self.userPrefs!, (value) {
    return _then(_self.copyWith(userPrefs: value));
  });
}
}


/// @nodoc
mixin _$SearchPrefs {

 bool get preferCheapest; bool get preferFastest; bool get preferNearby; bool get preferHighRated; List<String> get dietaryFilters; List<String> get accessibilityNeeds;
/// Create a copy of SearchPrefs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchPrefsCopyWith<SearchPrefs> get copyWith => _$SearchPrefsCopyWithImpl<SearchPrefs>(this as SearchPrefs, _$identity);

  /// Serializes this SearchPrefs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchPrefs&&(identical(other.preferCheapest, preferCheapest) || other.preferCheapest == preferCheapest)&&(identical(other.preferFastest, preferFastest) || other.preferFastest == preferFastest)&&(identical(other.preferNearby, preferNearby) || other.preferNearby == preferNearby)&&(identical(other.preferHighRated, preferHighRated) || other.preferHighRated == preferHighRated)&&const DeepCollectionEquality().equals(other.dietaryFilters, dietaryFilters)&&const DeepCollectionEquality().equals(other.accessibilityNeeds, accessibilityNeeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,preferCheapest,preferFastest,preferNearby,preferHighRated,const DeepCollectionEquality().hash(dietaryFilters),const DeepCollectionEquality().hash(accessibilityNeeds));

@override
String toString() {
  return 'SearchPrefs(preferCheapest: $preferCheapest, preferFastest: $preferFastest, preferNearby: $preferNearby, preferHighRated: $preferHighRated, dietaryFilters: $dietaryFilters, accessibilityNeeds: $accessibilityNeeds)';
}


}

/// @nodoc
abstract mixin class $SearchPrefsCopyWith<$Res>  {
  factory $SearchPrefsCopyWith(SearchPrefs value, $Res Function(SearchPrefs) _then) = _$SearchPrefsCopyWithImpl;
@useResult
$Res call({
 bool preferCheapest, bool preferFastest, bool preferNearby, bool preferHighRated, List<String> dietaryFilters, List<String> accessibilityNeeds
});




}
/// @nodoc
class _$SearchPrefsCopyWithImpl<$Res>
    implements $SearchPrefsCopyWith<$Res> {
  _$SearchPrefsCopyWithImpl(this._self, this._then);

  final SearchPrefs _self;
  final $Res Function(SearchPrefs) _then;

/// Create a copy of SearchPrefs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preferCheapest = null,Object? preferFastest = null,Object? preferNearby = null,Object? preferHighRated = null,Object? dietaryFilters = null,Object? accessibilityNeeds = null,}) {
  return _then(_self.copyWith(
preferCheapest: null == preferCheapest ? _self.preferCheapest : preferCheapest // ignore: cast_nullable_to_non_nullable
as bool,preferFastest: null == preferFastest ? _self.preferFastest : preferFastest // ignore: cast_nullable_to_non_nullable
as bool,preferNearby: null == preferNearby ? _self.preferNearby : preferNearby // ignore: cast_nullable_to_non_nullable
as bool,preferHighRated: null == preferHighRated ? _self.preferHighRated : preferHighRated // ignore: cast_nullable_to_non_nullable
as bool,dietaryFilters: null == dietaryFilters ? _self.dietaryFilters : dietaryFilters // ignore: cast_nullable_to_non_nullable
as List<String>,accessibilityNeeds: null == accessibilityNeeds ? _self.accessibilityNeeds : accessibilityNeeds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchPrefs].
extension SearchPrefsPatterns on SearchPrefs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchPrefs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchPrefs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchPrefs value)  $default,){
final _that = this;
switch (_that) {
case _SearchPrefs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchPrefs value)?  $default,){
final _that = this;
switch (_that) {
case _SearchPrefs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool preferCheapest,  bool preferFastest,  bool preferNearby,  bool preferHighRated,  List<String> dietaryFilters,  List<String> accessibilityNeeds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchPrefs() when $default != null:
return $default(_that.preferCheapest,_that.preferFastest,_that.preferNearby,_that.preferHighRated,_that.dietaryFilters,_that.accessibilityNeeds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool preferCheapest,  bool preferFastest,  bool preferNearby,  bool preferHighRated,  List<String> dietaryFilters,  List<String> accessibilityNeeds)  $default,) {final _that = this;
switch (_that) {
case _SearchPrefs():
return $default(_that.preferCheapest,_that.preferFastest,_that.preferNearby,_that.preferHighRated,_that.dietaryFilters,_that.accessibilityNeeds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool preferCheapest,  bool preferFastest,  bool preferNearby,  bool preferHighRated,  List<String> dietaryFilters,  List<String> accessibilityNeeds)?  $default,) {final _that = this;
switch (_that) {
case _SearchPrefs() when $default != null:
return $default(_that.preferCheapest,_that.preferFastest,_that.preferNearby,_that.preferHighRated,_that.dietaryFilters,_that.accessibilityNeeds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchPrefs implements SearchPrefs {
  const _SearchPrefs({this.preferCheapest = false, this.preferFastest = false, this.preferNearby = false, this.preferHighRated = false, final  List<String> dietaryFilters = const [], final  List<String> accessibilityNeeds = const []}): _dietaryFilters = dietaryFilters,_accessibilityNeeds = accessibilityNeeds;
  factory _SearchPrefs.fromJson(Map<String, dynamic> json) => _$SearchPrefsFromJson(json);

@override@JsonKey() final  bool preferCheapest;
@override@JsonKey() final  bool preferFastest;
@override@JsonKey() final  bool preferNearby;
@override@JsonKey() final  bool preferHighRated;
 final  List<String> _dietaryFilters;
@override@JsonKey() List<String> get dietaryFilters {
  if (_dietaryFilters is EqualUnmodifiableListView) return _dietaryFilters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dietaryFilters);
}

 final  List<String> _accessibilityNeeds;
@override@JsonKey() List<String> get accessibilityNeeds {
  if (_accessibilityNeeds is EqualUnmodifiableListView) return _accessibilityNeeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accessibilityNeeds);
}


/// Create a copy of SearchPrefs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchPrefsCopyWith<_SearchPrefs> get copyWith => __$SearchPrefsCopyWithImpl<_SearchPrefs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchPrefsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchPrefs&&(identical(other.preferCheapest, preferCheapest) || other.preferCheapest == preferCheapest)&&(identical(other.preferFastest, preferFastest) || other.preferFastest == preferFastest)&&(identical(other.preferNearby, preferNearby) || other.preferNearby == preferNearby)&&(identical(other.preferHighRated, preferHighRated) || other.preferHighRated == preferHighRated)&&const DeepCollectionEquality().equals(other._dietaryFilters, _dietaryFilters)&&const DeepCollectionEquality().equals(other._accessibilityNeeds, _accessibilityNeeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,preferCheapest,preferFastest,preferNearby,preferHighRated,const DeepCollectionEquality().hash(_dietaryFilters),const DeepCollectionEquality().hash(_accessibilityNeeds));

@override
String toString() {
  return 'SearchPrefs(preferCheapest: $preferCheapest, preferFastest: $preferFastest, preferNearby: $preferNearby, preferHighRated: $preferHighRated, dietaryFilters: $dietaryFilters, accessibilityNeeds: $accessibilityNeeds)';
}


}

/// @nodoc
abstract mixin class _$SearchPrefsCopyWith<$Res> implements $SearchPrefsCopyWith<$Res> {
  factory _$SearchPrefsCopyWith(_SearchPrefs value, $Res Function(_SearchPrefs) _then) = __$SearchPrefsCopyWithImpl;
@override @useResult
$Res call({
 bool preferCheapest, bool preferFastest, bool preferNearby, bool preferHighRated, List<String> dietaryFilters, List<String> accessibilityNeeds
});




}
/// @nodoc
class __$SearchPrefsCopyWithImpl<$Res>
    implements _$SearchPrefsCopyWith<$Res> {
  __$SearchPrefsCopyWithImpl(this._self, this._then);

  final _SearchPrefs _self;
  final $Res Function(_SearchPrefs) _then;

/// Create a copy of SearchPrefs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preferCheapest = null,Object? preferFastest = null,Object? preferNearby = null,Object? preferHighRated = null,Object? dietaryFilters = null,Object? accessibilityNeeds = null,}) {
  return _then(_SearchPrefs(
preferCheapest: null == preferCheapest ? _self.preferCheapest : preferCheapest // ignore: cast_nullable_to_non_nullable
as bool,preferFastest: null == preferFastest ? _self.preferFastest : preferFastest // ignore: cast_nullable_to_non_nullable
as bool,preferNearby: null == preferNearby ? _self.preferNearby : preferNearby // ignore: cast_nullable_to_non_nullable
as bool,preferHighRated: null == preferHighRated ? _self.preferHighRated : preferHighRated // ignore: cast_nullable_to_non_nullable
as bool,dietaryFilters: null == dietaryFilters ? _self._dietaryFilters : dietaryFilters // ignore: cast_nullable_to_non_nullable
as List<String>,accessibilityNeeds: null == accessibilityNeeds ? _self._accessibilityNeeds : accessibilityNeeds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SearchQuery {

 SearchVertical get vertical; SearchContext get context; Map<String, dynamic> get params; int get page; int get pageSize; String? get cursor; SearchFlags get flags;
/// Create a copy of SearchQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchQueryCopyWith<SearchQuery> get copyWith => _$SearchQueryCopyWithImpl<SearchQuery>(this as SearchQuery, _$identity);

  /// Serializes this SearchQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchQuery&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.context, context) || other.context == context)&&const DeepCollectionEquality().equals(other.params, params)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.flags, flags) || other.flags == flags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vertical,context,const DeepCollectionEquality().hash(params),page,pageSize,cursor,flags);

@override
String toString() {
  return 'SearchQuery(vertical: $vertical, context: $context, params: $params, page: $page, pageSize: $pageSize, cursor: $cursor, flags: $flags)';
}


}

/// @nodoc
abstract mixin class $SearchQueryCopyWith<$Res>  {
  factory $SearchQueryCopyWith(SearchQuery value, $Res Function(SearchQuery) _then) = _$SearchQueryCopyWithImpl;
@useResult
$Res call({
 SearchVertical vertical, SearchContext context, Map<String, dynamic> params, int page, int pageSize, String? cursor, SearchFlags flags
});


$SearchContextCopyWith<$Res> get context;$SearchFlagsCopyWith<$Res> get flags;

}
/// @nodoc
class _$SearchQueryCopyWithImpl<$Res>
    implements $SearchQueryCopyWith<$Res> {
  _$SearchQueryCopyWithImpl(this._self, this._then);

  final SearchQuery _self;
  final $Res Function(SearchQuery) _then;

/// Create a copy of SearchQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vertical = null,Object? context = null,Object? params = null,Object? page = null,Object? pageSize = null,Object? cursor = freezed,Object? flags = null,}) {
  return _then(_self.copyWith(
vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as SearchVertical,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as SearchContext,params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as SearchFlags,
  ));
}
/// Create a copy of SearchQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchContextCopyWith<$Res> get context {
  
  return $SearchContextCopyWith<$Res>(_self.context, (value) {
    return _then(_self.copyWith(context: value));
  });
}/// Create a copy of SearchQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchFlagsCopyWith<$Res> get flags {
  
  return $SearchFlagsCopyWith<$Res>(_self.flags, (value) {
    return _then(_self.copyWith(flags: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchQuery].
extension SearchQueryPatterns on SearchQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchQuery value)  $default,){
final _that = this;
switch (_that) {
case _SearchQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchQuery value)?  $default,){
final _that = this;
switch (_that) {
case _SearchQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchVertical vertical,  SearchContext context,  Map<String, dynamic> params,  int page,  int pageSize,  String? cursor,  SearchFlags flags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchQuery() when $default != null:
return $default(_that.vertical,_that.context,_that.params,_that.page,_that.pageSize,_that.cursor,_that.flags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchVertical vertical,  SearchContext context,  Map<String, dynamic> params,  int page,  int pageSize,  String? cursor,  SearchFlags flags)  $default,) {final _that = this;
switch (_that) {
case _SearchQuery():
return $default(_that.vertical,_that.context,_that.params,_that.page,_that.pageSize,_that.cursor,_that.flags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchVertical vertical,  SearchContext context,  Map<String, dynamic> params,  int page,  int pageSize,  String? cursor,  SearchFlags flags)?  $default,) {final _that = this;
switch (_that) {
case _SearchQuery() when $default != null:
return $default(_that.vertical,_that.context,_that.params,_that.page,_that.pageSize,_that.cursor,_that.flags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchQuery extends SearchQuery {
  const _SearchQuery({required this.vertical, required this.context, required final  Map<String, dynamic> params, this.page = 0, this.pageSize = 20, this.cursor, this.flags = const SearchFlags()}): _params = params,super._();
  factory _SearchQuery.fromJson(Map<String, dynamic> json) => _$SearchQueryFromJson(json);

@override final  SearchVertical vertical;
@override final  SearchContext context;
 final  Map<String, dynamic> _params;
@override Map<String, dynamic> get params {
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_params);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override final  String? cursor;
@override@JsonKey() final  SearchFlags flags;

/// Create a copy of SearchQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchQueryCopyWith<_SearchQuery> get copyWith => __$SearchQueryCopyWithImpl<_SearchQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchQuery&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.context, context) || other.context == context)&&const DeepCollectionEquality().equals(other._params, _params)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.cursor, cursor) || other.cursor == cursor)&&(identical(other.flags, flags) || other.flags == flags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vertical,context,const DeepCollectionEquality().hash(_params),page,pageSize,cursor,flags);

@override
String toString() {
  return 'SearchQuery(vertical: $vertical, context: $context, params: $params, page: $page, pageSize: $pageSize, cursor: $cursor, flags: $flags)';
}


}

/// @nodoc
abstract mixin class _$SearchQueryCopyWith<$Res> implements $SearchQueryCopyWith<$Res> {
  factory _$SearchQueryCopyWith(_SearchQuery value, $Res Function(_SearchQuery) _then) = __$SearchQueryCopyWithImpl;
@override @useResult
$Res call({
 SearchVertical vertical, SearchContext context, Map<String, dynamic> params, int page, int pageSize, String? cursor, SearchFlags flags
});


@override $SearchContextCopyWith<$Res> get context;@override $SearchFlagsCopyWith<$Res> get flags;

}
/// @nodoc
class __$SearchQueryCopyWithImpl<$Res>
    implements _$SearchQueryCopyWith<$Res> {
  __$SearchQueryCopyWithImpl(this._self, this._then);

  final _SearchQuery _self;
  final $Res Function(_SearchQuery) _then;

/// Create a copy of SearchQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vertical = null,Object? context = null,Object? params = null,Object? page = null,Object? pageSize = null,Object? cursor = freezed,Object? flags = null,}) {
  return _then(_SearchQuery(
vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as SearchVertical,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as SearchContext,params: null == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,cursor: freezed == cursor ? _self.cursor : cursor // ignore: cast_nullable_to_non_nullable
as String?,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as SearchFlags,
  ));
}

/// Create a copy of SearchQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchContextCopyWith<$Res> get context {
  
  return $SearchContextCopyWith<$Res>(_self.context, (value) {
    return _then(_self.copyWith(context: value));
  });
}/// Create a copy of SearchQuery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchFlagsCopyWith<$Res> get flags {
  
  return $SearchFlagsCopyWith<$Res>(_self.flags, (value) {
    return _then(_self.copyWith(flags: value));
  });
}
}


/// @nodoc
mixin _$SearchFlags {

 bool get debugRanking; bool get skipCache; bool get includeProvenance; List<String> get enabledProviders; List<String> get disabledProviders;
/// Create a copy of SearchFlags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFlagsCopyWith<SearchFlags> get copyWith => _$SearchFlagsCopyWithImpl<SearchFlags>(this as SearchFlags, _$identity);

  /// Serializes this SearchFlags to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFlags&&(identical(other.debugRanking, debugRanking) || other.debugRanking == debugRanking)&&(identical(other.skipCache, skipCache) || other.skipCache == skipCache)&&(identical(other.includeProvenance, includeProvenance) || other.includeProvenance == includeProvenance)&&const DeepCollectionEquality().equals(other.enabledProviders, enabledProviders)&&const DeepCollectionEquality().equals(other.disabledProviders, disabledProviders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debugRanking,skipCache,includeProvenance,const DeepCollectionEquality().hash(enabledProviders),const DeepCollectionEquality().hash(disabledProviders));

@override
String toString() {
  return 'SearchFlags(debugRanking: $debugRanking, skipCache: $skipCache, includeProvenance: $includeProvenance, enabledProviders: $enabledProviders, disabledProviders: $disabledProviders)';
}


}

/// @nodoc
abstract mixin class $SearchFlagsCopyWith<$Res>  {
  factory $SearchFlagsCopyWith(SearchFlags value, $Res Function(SearchFlags) _then) = _$SearchFlagsCopyWithImpl;
@useResult
$Res call({
 bool debugRanking, bool skipCache, bool includeProvenance, List<String> enabledProviders, List<String> disabledProviders
});




}
/// @nodoc
class _$SearchFlagsCopyWithImpl<$Res>
    implements $SearchFlagsCopyWith<$Res> {
  _$SearchFlagsCopyWithImpl(this._self, this._then);

  final SearchFlags _self;
  final $Res Function(SearchFlags) _then;

/// Create a copy of SearchFlags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? debugRanking = null,Object? skipCache = null,Object? includeProvenance = null,Object? enabledProviders = null,Object? disabledProviders = null,}) {
  return _then(_self.copyWith(
debugRanking: null == debugRanking ? _self.debugRanking : debugRanking // ignore: cast_nullable_to_non_nullable
as bool,skipCache: null == skipCache ? _self.skipCache : skipCache // ignore: cast_nullable_to_non_nullable
as bool,includeProvenance: null == includeProvenance ? _self.includeProvenance : includeProvenance // ignore: cast_nullable_to_non_nullable
as bool,enabledProviders: null == enabledProviders ? _self.enabledProviders : enabledProviders // ignore: cast_nullable_to_non_nullable
as List<String>,disabledProviders: null == disabledProviders ? _self.disabledProviders : disabledProviders // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchFlags].
extension SearchFlagsPatterns on SearchFlags {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchFlags value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchFlags() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchFlags value)  $default,){
final _that = this;
switch (_that) {
case _SearchFlags():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchFlags value)?  $default,){
final _that = this;
switch (_that) {
case _SearchFlags() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool debugRanking,  bool skipCache,  bool includeProvenance,  List<String> enabledProviders,  List<String> disabledProviders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchFlags() when $default != null:
return $default(_that.debugRanking,_that.skipCache,_that.includeProvenance,_that.enabledProviders,_that.disabledProviders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool debugRanking,  bool skipCache,  bool includeProvenance,  List<String> enabledProviders,  List<String> disabledProviders)  $default,) {final _that = this;
switch (_that) {
case _SearchFlags():
return $default(_that.debugRanking,_that.skipCache,_that.includeProvenance,_that.enabledProviders,_that.disabledProviders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool debugRanking,  bool skipCache,  bool includeProvenance,  List<String> enabledProviders,  List<String> disabledProviders)?  $default,) {final _that = this;
switch (_that) {
case _SearchFlags() when $default != null:
return $default(_that.debugRanking,_that.skipCache,_that.includeProvenance,_that.enabledProviders,_that.disabledProviders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchFlags implements SearchFlags {
  const _SearchFlags({this.debugRanking = false, this.skipCache = false, this.includeProvenance = false, final  List<String> enabledProviders = const [], final  List<String> disabledProviders = const []}): _enabledProviders = enabledProviders,_disabledProviders = disabledProviders;
  factory _SearchFlags.fromJson(Map<String, dynamic> json) => _$SearchFlagsFromJson(json);

@override@JsonKey() final  bool debugRanking;
@override@JsonKey() final  bool skipCache;
@override@JsonKey() final  bool includeProvenance;
 final  List<String> _enabledProviders;
@override@JsonKey() List<String> get enabledProviders {
  if (_enabledProviders is EqualUnmodifiableListView) return _enabledProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_enabledProviders);
}

 final  List<String> _disabledProviders;
@override@JsonKey() List<String> get disabledProviders {
  if (_disabledProviders is EqualUnmodifiableListView) return _disabledProviders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disabledProviders);
}


/// Create a copy of SearchFlags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchFlagsCopyWith<_SearchFlags> get copyWith => __$SearchFlagsCopyWithImpl<_SearchFlags>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchFlagsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchFlags&&(identical(other.debugRanking, debugRanking) || other.debugRanking == debugRanking)&&(identical(other.skipCache, skipCache) || other.skipCache == skipCache)&&(identical(other.includeProvenance, includeProvenance) || other.includeProvenance == includeProvenance)&&const DeepCollectionEquality().equals(other._enabledProviders, _enabledProviders)&&const DeepCollectionEquality().equals(other._disabledProviders, _disabledProviders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,debugRanking,skipCache,includeProvenance,const DeepCollectionEquality().hash(_enabledProviders),const DeepCollectionEquality().hash(_disabledProviders));

@override
String toString() {
  return 'SearchFlags(debugRanking: $debugRanking, skipCache: $skipCache, includeProvenance: $includeProvenance, enabledProviders: $enabledProviders, disabledProviders: $disabledProviders)';
}


}

/// @nodoc
abstract mixin class _$SearchFlagsCopyWith<$Res> implements $SearchFlagsCopyWith<$Res> {
  factory _$SearchFlagsCopyWith(_SearchFlags value, $Res Function(_SearchFlags) _then) = __$SearchFlagsCopyWithImpl;
@override @useResult
$Res call({
 bool debugRanking, bool skipCache, bool includeProvenance, List<String> enabledProviders, List<String> disabledProviders
});




}
/// @nodoc
class __$SearchFlagsCopyWithImpl<$Res>
    implements _$SearchFlagsCopyWith<$Res> {
  __$SearchFlagsCopyWithImpl(this._self, this._then);

  final _SearchFlags _self;
  final $Res Function(_SearchFlags) _then;

/// Create a copy of SearchFlags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? debugRanking = null,Object? skipCache = null,Object? includeProvenance = null,Object? enabledProviders = null,Object? disabledProviders = null,}) {
  return _then(_SearchFlags(
debugRanking: null == debugRanking ? _self.debugRanking : debugRanking // ignore: cast_nullable_to_non_nullable
as bool,skipCache: null == skipCache ? _self.skipCache : skipCache // ignore: cast_nullable_to_non_nullable
as bool,includeProvenance: null == includeProvenance ? _self.includeProvenance : includeProvenance // ignore: cast_nullable_to_non_nullable
as bool,enabledProviders: null == enabledProviders ? _self._enabledProviders : enabledProviders // ignore: cast_nullable_to_non_nullable
as List<String>,disabledProviders: null == disabledProviders ? _self._disabledProviders : disabledProviders // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SearchResponse {

 List<SearchResultItem> get items; int get page; int get pageSize; int get totalItems; String? get nextCursor; String? get prevCursor; SearchMeta get meta;
/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResponseCopyWith<SearchResponse> get copyWith => _$SearchResponseCopyWithImpl<SearchResponse>(this as SearchResponse, _$identity);

  /// Serializes this SearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.prevCursor, prevCursor) || other.prevCursor == prevCursor)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),page,pageSize,totalItems,nextCursor,prevCursor,meta);

@override
String toString() {
  return 'SearchResponse(items: $items, page: $page, pageSize: $pageSize, totalItems: $totalItems, nextCursor: $nextCursor, prevCursor: $prevCursor, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SearchResponseCopyWith<$Res>  {
  factory $SearchResponseCopyWith(SearchResponse value, $Res Function(SearchResponse) _then) = _$SearchResponseCopyWithImpl;
@useResult
$Res call({
 List<SearchResultItem> items, int page, int pageSize, int totalItems, String? nextCursor, String? prevCursor, SearchMeta meta
});


$SearchMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$SearchResponseCopyWithImpl<$Res>
    implements $SearchResponseCopyWith<$Res> {
  _$SearchResponseCopyWithImpl(this._self, this._then);

  final SearchResponse _self;
  final $Res Function(SearchResponse) _then;

/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? page = null,Object? pageSize = null,Object? totalItems = null,Object? nextCursor = freezed,Object? prevCursor = freezed,Object? meta = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,prevCursor: freezed == prevCursor ? _self.prevCursor : prevCursor // ignore: cast_nullable_to_non_nullable
as String?,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as SearchMeta,
  ));
}
/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchMetaCopyWith<$Res> get meta {
  
  return $SearchMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchResponse].
extension SearchResponsePatterns on SearchResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchResultItem> items,  int page,  int pageSize,  int totalItems,  String? nextCursor,  String? prevCursor,  SearchMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResponse() when $default != null:
return $default(_that.items,_that.page,_that.pageSize,_that.totalItems,_that.nextCursor,_that.prevCursor,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchResultItem> items,  int page,  int pageSize,  int totalItems,  String? nextCursor,  String? prevCursor,  SearchMeta meta)  $default,) {final _that = this;
switch (_that) {
case _SearchResponse():
return $default(_that.items,_that.page,_that.pageSize,_that.totalItems,_that.nextCursor,_that.prevCursor,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchResultItem> items,  int page,  int pageSize,  int totalItems,  String? nextCursor,  String? prevCursor,  SearchMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _SearchResponse() when $default != null:
return $default(_that.items,_that.page,_that.pageSize,_that.totalItems,_that.nextCursor,_that.prevCursor,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResponse implements SearchResponse {
  const _SearchResponse({required final  List<SearchResultItem> items, required this.page, required this.pageSize, required this.totalItems, this.nextCursor, this.prevCursor, required this.meta}): _items = items;
  factory _SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);

 final  List<SearchResultItem> _items;
@override List<SearchResultItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int page;
@override final  int pageSize;
@override final  int totalItems;
@override final  String? nextCursor;
@override final  String? prevCursor;
@override final  SearchMeta meta;

/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResponseCopyWith<_SearchResponse> get copyWith => __$SearchResponseCopyWithImpl<_SearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.prevCursor, prevCursor) || other.prevCursor == prevCursor)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,pageSize,totalItems,nextCursor,prevCursor,meta);

@override
String toString() {
  return 'SearchResponse(items: $items, page: $page, pageSize: $pageSize, totalItems: $totalItems, nextCursor: $nextCursor, prevCursor: $prevCursor, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$SearchResponseCopyWith<$Res> implements $SearchResponseCopyWith<$Res> {
  factory _$SearchResponseCopyWith(_SearchResponse value, $Res Function(_SearchResponse) _then) = __$SearchResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SearchResultItem> items, int page, int pageSize, int totalItems, String? nextCursor, String? prevCursor, SearchMeta meta
});


@override $SearchMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$SearchResponseCopyWithImpl<$Res>
    implements _$SearchResponseCopyWith<$Res> {
  __$SearchResponseCopyWithImpl(this._self, this._then);

  final _SearchResponse _self;
  final $Res Function(_SearchResponse) _then;

/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? pageSize = null,Object? totalItems = null,Object? nextCursor = freezed,Object? prevCursor = freezed,Object? meta = null,}) {
  return _then(_SearchResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,prevCursor: freezed == prevCursor ? _self.prevCursor : prevCursor // ignore: cast_nullable_to_non_nullable
as String?,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as SearchMeta,
  ));
}

/// Create a copy of SearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchMetaCopyWith<$Res> get meta {
  
  return $SearchMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$SearchResultItem {

 String get id; String get dedupeKey; SearchVertical get vertical; String get title; String? get subtitle; String? get imageUrl; double? get price; String? get priceCurrency; double? get rating; int? get reviewCount; double? get latitude; double? get longitude; Map<String, dynamic>? get details; List<String> get provenance; Map<String, dynamic>? get rankingExplain;
/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultItemCopyWith<SearchResultItem> get copyWith => _$SearchResultItemCopyWithImpl<SearchResultItem>(this as SearchResultItem, _$identity);

  /// Serializes this SearchResultItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultItem&&(identical(other.id, id) || other.id == id)&&(identical(other.dedupeKey, dedupeKey) || other.dedupeKey == dedupeKey)&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.details, details)&&const DeepCollectionEquality().equals(other.provenance, provenance)&&const DeepCollectionEquality().equals(other.rankingExplain, rankingExplain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dedupeKey,vertical,title,subtitle,imageUrl,price,priceCurrency,rating,reviewCount,latitude,longitude,const DeepCollectionEquality().hash(details),const DeepCollectionEquality().hash(provenance),const DeepCollectionEquality().hash(rankingExplain));

@override
String toString() {
  return 'SearchResultItem(id: $id, dedupeKey: $dedupeKey, vertical: $vertical, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, price: $price, priceCurrency: $priceCurrency, rating: $rating, reviewCount: $reviewCount, latitude: $latitude, longitude: $longitude, details: $details, provenance: $provenance, rankingExplain: $rankingExplain)';
}


}

/// @nodoc
abstract mixin class $SearchResultItemCopyWith<$Res>  {
  factory $SearchResultItemCopyWith(SearchResultItem value, $Res Function(SearchResultItem) _then) = _$SearchResultItemCopyWithImpl;
@useResult
$Res call({
 String id, String dedupeKey, SearchVertical vertical, String title, String? subtitle, String? imageUrl, double? price, String? priceCurrency, double? rating, int? reviewCount, double? latitude, double? longitude, Map<String, dynamic>? details, List<String> provenance, Map<String, dynamic>? rankingExplain
});




}
/// @nodoc
class _$SearchResultItemCopyWithImpl<$Res>
    implements $SearchResultItemCopyWith<$Res> {
  _$SearchResultItemCopyWithImpl(this._self, this._then);

  final SearchResultItem _self;
  final $Res Function(SearchResultItem) _then;

/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dedupeKey = null,Object? vertical = null,Object? title = null,Object? subtitle = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? details = freezed,Object? provenance = null,Object? rankingExplain = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dedupeKey: null == dedupeKey ? _self.dedupeKey : dedupeKey // ignore: cast_nullable_to_non_nullable
as String,vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as SearchVertical,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceCurrency: freezed == priceCurrency ? _self.priceCurrency : priceCurrency // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as List<String>,rankingExplain: freezed == rankingExplain ? _self.rankingExplain : rankingExplain // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResultItem].
extension SearchResultItemPatterns on SearchResultItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultItem value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultItem value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String dedupeKey,  SearchVertical vertical,  String title,  String? subtitle,  String? imageUrl,  double? price,  String? priceCurrency,  double? rating,  int? reviewCount,  double? latitude,  double? longitude,  Map<String, dynamic>? details,  List<String> provenance,  Map<String, dynamic>? rankingExplain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
return $default(_that.id,_that.dedupeKey,_that.vertical,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.priceCurrency,_that.rating,_that.reviewCount,_that.latitude,_that.longitude,_that.details,_that.provenance,_that.rankingExplain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String dedupeKey,  SearchVertical vertical,  String title,  String? subtitle,  String? imageUrl,  double? price,  String? priceCurrency,  double? rating,  int? reviewCount,  double? latitude,  double? longitude,  Map<String, dynamic>? details,  List<String> provenance,  Map<String, dynamic>? rankingExplain)  $default,) {final _that = this;
switch (_that) {
case _SearchResultItem():
return $default(_that.id,_that.dedupeKey,_that.vertical,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.priceCurrency,_that.rating,_that.reviewCount,_that.latitude,_that.longitude,_that.details,_that.provenance,_that.rankingExplain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String dedupeKey,  SearchVertical vertical,  String title,  String? subtitle,  String? imageUrl,  double? price,  String? priceCurrency,  double? rating,  int? reviewCount,  double? latitude,  double? longitude,  Map<String, dynamic>? details,  List<String> provenance,  Map<String, dynamic>? rankingExplain)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
return $default(_that.id,_that.dedupeKey,_that.vertical,_that.title,_that.subtitle,_that.imageUrl,_that.price,_that.priceCurrency,_that.rating,_that.reviewCount,_that.latitude,_that.longitude,_that.details,_that.provenance,_that.rankingExplain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResultItem implements SearchResultItem {
  const _SearchResultItem({required this.id, required this.dedupeKey, required this.vertical, required this.title, this.subtitle, this.imageUrl, this.price, this.priceCurrency, this.rating, this.reviewCount, this.latitude, this.longitude, final  Map<String, dynamic>? details, final  List<String> provenance = const [], final  Map<String, dynamic>? rankingExplain}): _details = details,_provenance = provenance,_rankingExplain = rankingExplain;
  factory _SearchResultItem.fromJson(Map<String, dynamic> json) => _$SearchResultItemFromJson(json);

@override final  String id;
@override final  String dedupeKey;
@override final  SearchVertical vertical;
@override final  String title;
@override final  String? subtitle;
@override final  String? imageUrl;
@override final  double? price;
@override final  String? priceCurrency;
@override final  double? rating;
@override final  int? reviewCount;
@override final  double? latitude;
@override final  double? longitude;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<String> _provenance;
@override@JsonKey() List<String> get provenance {
  if (_provenance is EqualUnmodifiableListView) return _provenance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_provenance);
}

 final  Map<String, dynamic>? _rankingExplain;
@override Map<String, dynamic>? get rankingExplain {
  final value = _rankingExplain;
  if (value == null) return null;
  if (_rankingExplain is EqualUnmodifiableMapView) return _rankingExplain;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultItemCopyWith<_SearchResultItem> get copyWith => __$SearchResultItemCopyWithImpl<_SearchResultItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultItem&&(identical(other.id, id) || other.id == id)&&(identical(other.dedupeKey, dedupeKey) || other.dedupeKey == dedupeKey)&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceCurrency, priceCurrency) || other.priceCurrency == priceCurrency)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._details, _details)&&const DeepCollectionEquality().equals(other._provenance, _provenance)&&const DeepCollectionEquality().equals(other._rankingExplain, _rankingExplain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dedupeKey,vertical,title,subtitle,imageUrl,price,priceCurrency,rating,reviewCount,latitude,longitude,const DeepCollectionEquality().hash(_details),const DeepCollectionEquality().hash(_provenance),const DeepCollectionEquality().hash(_rankingExplain));

@override
String toString() {
  return 'SearchResultItem(id: $id, dedupeKey: $dedupeKey, vertical: $vertical, title: $title, subtitle: $subtitle, imageUrl: $imageUrl, price: $price, priceCurrency: $priceCurrency, rating: $rating, reviewCount: $reviewCount, latitude: $latitude, longitude: $longitude, details: $details, provenance: $provenance, rankingExplain: $rankingExplain)';
}


}

/// @nodoc
abstract mixin class _$SearchResultItemCopyWith<$Res> implements $SearchResultItemCopyWith<$Res> {
  factory _$SearchResultItemCopyWith(_SearchResultItem value, $Res Function(_SearchResultItem) _then) = __$SearchResultItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String dedupeKey, SearchVertical vertical, String title, String? subtitle, String? imageUrl, double? price, String? priceCurrency, double? rating, int? reviewCount, double? latitude, double? longitude, Map<String, dynamic>? details, List<String> provenance, Map<String, dynamic>? rankingExplain
});




}
/// @nodoc
class __$SearchResultItemCopyWithImpl<$Res>
    implements _$SearchResultItemCopyWith<$Res> {
  __$SearchResultItemCopyWithImpl(this._self, this._then);

  final _SearchResultItem _self;
  final $Res Function(_SearchResultItem) _then;

/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dedupeKey = null,Object? vertical = null,Object? title = null,Object? subtitle = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? priceCurrency = freezed,Object? rating = freezed,Object? reviewCount = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? details = freezed,Object? provenance = null,Object? rankingExplain = freezed,}) {
  return _then(_SearchResultItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dedupeKey: null == dedupeKey ? _self.dedupeKey : dedupeKey // ignore: cast_nullable_to_non_nullable
as String,vertical: null == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as SearchVertical,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceCurrency: freezed == priceCurrency ? _self.priceCurrency : priceCurrency // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: freezed == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,provenance: null == provenance ? _self._provenance : provenance // ignore: cast_nullable_to_non_nullable
as List<String>,rankingExplain: freezed == rankingExplain ? _self._rankingExplain : rankingExplain // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$SearchMeta {

 String get searchRequestId; int get tookMs; List<ProviderMeta> get providers; RankingMeta? get ranking;
/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMetaCopyWith<SearchMeta> get copyWith => _$SearchMetaCopyWithImpl<SearchMeta>(this as SearchMeta, _$identity);

  /// Serializes this SearchMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMeta&&(identical(other.searchRequestId, searchRequestId) || other.searchRequestId == searchRequestId)&&(identical(other.tookMs, tookMs) || other.tookMs == tookMs)&&const DeepCollectionEquality().equals(other.providers, providers)&&(identical(other.ranking, ranking) || other.ranking == ranking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchRequestId,tookMs,const DeepCollectionEquality().hash(providers),ranking);

@override
String toString() {
  return 'SearchMeta(searchRequestId: $searchRequestId, tookMs: $tookMs, providers: $providers, ranking: $ranking)';
}


}

/// @nodoc
abstract mixin class $SearchMetaCopyWith<$Res>  {
  factory $SearchMetaCopyWith(SearchMeta value, $Res Function(SearchMeta) _then) = _$SearchMetaCopyWithImpl;
@useResult
$Res call({
 String searchRequestId, int tookMs, List<ProviderMeta> providers, RankingMeta? ranking
});


$RankingMetaCopyWith<$Res>? get ranking;

}
/// @nodoc
class _$SearchMetaCopyWithImpl<$Res>
    implements $SearchMetaCopyWith<$Res> {
  _$SearchMetaCopyWithImpl(this._self, this._then);

  final SearchMeta _self;
  final $Res Function(SearchMeta) _then;

/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchRequestId = null,Object? tookMs = null,Object? providers = null,Object? ranking = freezed,}) {
  return _then(_self.copyWith(
searchRequestId: null == searchRequestId ? _self.searchRequestId : searchRequestId // ignore: cast_nullable_to_non_nullable
as String,tookMs: null == tookMs ? _self.tookMs : tookMs // ignore: cast_nullable_to_non_nullable
as int,providers: null == providers ? _self.providers : providers // ignore: cast_nullable_to_non_nullable
as List<ProviderMeta>,ranking: freezed == ranking ? _self.ranking : ranking // ignore: cast_nullable_to_non_nullable
as RankingMeta?,
  ));
}
/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RankingMetaCopyWith<$Res>? get ranking {
    if (_self.ranking == null) {
    return null;
  }

  return $RankingMetaCopyWith<$Res>(_self.ranking!, (value) {
    return _then(_self.copyWith(ranking: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchMeta].
extension SearchMetaPatterns on SearchMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchMeta value)  $default,){
final _that = this;
switch (_that) {
case _SearchMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchMeta value)?  $default,){
final _that = this;
switch (_that) {
case _SearchMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchRequestId,  int tookMs,  List<ProviderMeta> providers,  RankingMeta? ranking)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchMeta() when $default != null:
return $default(_that.searchRequestId,_that.tookMs,_that.providers,_that.ranking);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchRequestId,  int tookMs,  List<ProviderMeta> providers,  RankingMeta? ranking)  $default,) {final _that = this;
switch (_that) {
case _SearchMeta():
return $default(_that.searchRequestId,_that.tookMs,_that.providers,_that.ranking);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchRequestId,  int tookMs,  List<ProviderMeta> providers,  RankingMeta? ranking)?  $default,) {final _that = this;
switch (_that) {
case _SearchMeta() when $default != null:
return $default(_that.searchRequestId,_that.tookMs,_that.providers,_that.ranking);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchMeta implements SearchMeta {
  const _SearchMeta({required this.searchRequestId, required this.tookMs, required final  List<ProviderMeta> providers, this.ranking}): _providers = providers;
  factory _SearchMeta.fromJson(Map<String, dynamic> json) => _$SearchMetaFromJson(json);

@override final  String searchRequestId;
@override final  int tookMs;
 final  List<ProviderMeta> _providers;
@override List<ProviderMeta> get providers {
  if (_providers is EqualUnmodifiableListView) return _providers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providers);
}

@override final  RankingMeta? ranking;

/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchMetaCopyWith<_SearchMeta> get copyWith => __$SearchMetaCopyWithImpl<_SearchMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchMeta&&(identical(other.searchRequestId, searchRequestId) || other.searchRequestId == searchRequestId)&&(identical(other.tookMs, tookMs) || other.tookMs == tookMs)&&const DeepCollectionEquality().equals(other._providers, _providers)&&(identical(other.ranking, ranking) || other.ranking == ranking));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchRequestId,tookMs,const DeepCollectionEquality().hash(_providers),ranking);

@override
String toString() {
  return 'SearchMeta(searchRequestId: $searchRequestId, tookMs: $tookMs, providers: $providers, ranking: $ranking)';
}


}

/// @nodoc
abstract mixin class _$SearchMetaCopyWith<$Res> implements $SearchMetaCopyWith<$Res> {
  factory _$SearchMetaCopyWith(_SearchMeta value, $Res Function(_SearchMeta) _then) = __$SearchMetaCopyWithImpl;
@override @useResult
$Res call({
 String searchRequestId, int tookMs, List<ProviderMeta> providers, RankingMeta? ranking
});


@override $RankingMetaCopyWith<$Res>? get ranking;

}
/// @nodoc
class __$SearchMetaCopyWithImpl<$Res>
    implements _$SearchMetaCopyWith<$Res> {
  __$SearchMetaCopyWithImpl(this._self, this._then);

  final _SearchMeta _self;
  final $Res Function(_SearchMeta) _then;

/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchRequestId = null,Object? tookMs = null,Object? providers = null,Object? ranking = freezed,}) {
  return _then(_SearchMeta(
searchRequestId: null == searchRequestId ? _self.searchRequestId : searchRequestId // ignore: cast_nullable_to_non_nullable
as String,tookMs: null == tookMs ? _self.tookMs : tookMs // ignore: cast_nullable_to_non_nullable
as int,providers: null == providers ? _self._providers : providers // ignore: cast_nullable_to_non_nullable
as List<ProviderMeta>,ranking: freezed == ranking ? _self.ranking : ranking // ignore: cast_nullable_to_non_nullable
as RankingMeta?,
  ));
}

/// Create a copy of SearchMeta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RankingMetaCopyWith<$Res>? get ranking {
    if (_self.ranking == null) {
    return null;
  }

  return $RankingMetaCopyWith<$Res>(_self.ranking!, (value) {
    return _then(_self.copyWith(ranking: value));
  });
}
}


/// @nodoc
mixin _$ProviderMeta {

 String get name; ProviderStatus get status; int get tookMs; int get itemCount; CacheStatus? get cache; String? get error;
/// Create a copy of ProviderMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderMetaCopyWith<ProviderMeta> get copyWith => _$ProviderMetaCopyWithImpl<ProviderMeta>(this as ProviderMeta, _$identity);

  /// Serializes this ProviderMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderMeta&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.tookMs, tookMs) || other.tookMs == tookMs)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,status,tookMs,itemCount,cache,error);

@override
String toString() {
  return 'ProviderMeta(name: $name, status: $status, tookMs: $tookMs, itemCount: $itemCount, cache: $cache, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProviderMetaCopyWith<$Res>  {
  factory $ProviderMetaCopyWith(ProviderMeta value, $Res Function(ProviderMeta) _then) = _$ProviderMetaCopyWithImpl;
@useResult
$Res call({
 String name, ProviderStatus status, int tookMs, int itemCount, CacheStatus? cache, String? error
});




}
/// @nodoc
class _$ProviderMetaCopyWithImpl<$Res>
    implements $ProviderMetaCopyWith<$Res> {
  _$ProviderMetaCopyWithImpl(this._self, this._then);

  final ProviderMeta _self;
  final $Res Function(ProviderMeta) _then;

/// Create a copy of ProviderMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? status = null,Object? tookMs = null,Object? itemCount = null,Object? cache = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProviderStatus,tookMs: null == tookMs ? _self.tookMs : tookMs // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,cache: freezed == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as CacheStatus?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderMeta].
extension ProviderMetaPatterns on ProviderMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderMeta value)  $default,){
final _that = this;
switch (_that) {
case _ProviderMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderMeta value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  ProviderStatus status,  int tookMs,  int itemCount,  CacheStatus? cache,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderMeta() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  ProviderStatus status,  int tookMs,  int itemCount,  CacheStatus? cache,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ProviderMeta():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  ProviderStatus status,  int tookMs,  int itemCount,  CacheStatus? cache,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ProviderMeta() when $default != null:
return $default(_that.name,_that.status,_that.tookMs,_that.itemCount,_that.cache,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderMeta implements ProviderMeta {
  const _ProviderMeta({required this.name, required this.status, required this.tookMs, required this.itemCount, this.cache, this.error});
  factory _ProviderMeta.fromJson(Map<String, dynamic> json) => _$ProviderMetaFromJson(json);

@override final  String name;
@override final  ProviderStatus status;
@override final  int tookMs;
@override final  int itemCount;
@override final  CacheStatus? cache;
@override final  String? error;

/// Create a copy of ProviderMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderMetaCopyWith<_ProviderMeta> get copyWith => __$ProviderMetaCopyWithImpl<_ProviderMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderMeta&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.tookMs, tookMs) || other.tookMs == tookMs)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,status,tookMs,itemCount,cache,error);

@override
String toString() {
  return 'ProviderMeta(name: $name, status: $status, tookMs: $tookMs, itemCount: $itemCount, cache: $cache, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProviderMetaCopyWith<$Res> implements $ProviderMetaCopyWith<$Res> {
  factory _$ProviderMetaCopyWith(_ProviderMeta value, $Res Function(_ProviderMeta) _then) = __$ProviderMetaCopyWithImpl;
@override @useResult
$Res call({
 String name, ProviderStatus status, int tookMs, int itemCount, CacheStatus? cache, String? error
});




}
/// @nodoc
class __$ProviderMetaCopyWithImpl<$Res>
    implements _$ProviderMetaCopyWith<$Res> {
  __$ProviderMetaCopyWithImpl(this._self, this._then);

  final _ProviderMeta _self;
  final $Res Function(_ProviderMeta) _then;

/// Create a copy of ProviderMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? status = null,Object? tookMs = null,Object? itemCount = null,Object? cache = freezed,Object? error = freezed,}) {
  return _then(_ProviderMeta(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProviderStatus,tookMs: null == tookMs ? _self.tookMs : tookMs // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,cache: freezed == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as CacheStatus?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RankingMeta {

 RankingStrategy get strategy; Map<String, double> get weights;
/// Create a copy of RankingMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RankingMetaCopyWith<RankingMeta> get copyWith => _$RankingMetaCopyWithImpl<RankingMeta>(this as RankingMeta, _$identity);

  /// Serializes this RankingMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RankingMeta&&(identical(other.strategy, strategy) || other.strategy == strategy)&&const DeepCollectionEquality().equals(other.weights, weights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strategy,const DeepCollectionEquality().hash(weights));

@override
String toString() {
  return 'RankingMeta(strategy: $strategy, weights: $weights)';
}


}

/// @nodoc
abstract mixin class $RankingMetaCopyWith<$Res>  {
  factory $RankingMetaCopyWith(RankingMeta value, $Res Function(RankingMeta) _then) = _$RankingMetaCopyWithImpl;
@useResult
$Res call({
 RankingStrategy strategy, Map<String, double> weights
});




}
/// @nodoc
class _$RankingMetaCopyWithImpl<$Res>
    implements $RankingMetaCopyWith<$Res> {
  _$RankingMetaCopyWithImpl(this._self, this._then);

  final RankingMeta _self;
  final $Res Function(RankingMeta) _then;

/// Create a copy of RankingMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? strategy = null,Object? weights = null,}) {
  return _then(_self.copyWith(
strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as RankingStrategy,weights: null == weights ? _self.weights : weights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [RankingMeta].
extension RankingMetaPatterns on RankingMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RankingMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RankingMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RankingMeta value)  $default,){
final _that = this;
switch (_that) {
case _RankingMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RankingMeta value)?  $default,){
final _that = this;
switch (_that) {
case _RankingMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RankingStrategy strategy,  Map<String, double> weights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RankingMeta() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RankingStrategy strategy,  Map<String, double> weights)  $default,) {final _that = this;
switch (_that) {
case _RankingMeta():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RankingStrategy strategy,  Map<String, double> weights)?  $default,) {final _that = this;
switch (_that) {
case _RankingMeta() when $default != null:
return $default(_that.strategy,_that.weights);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RankingMeta implements RankingMeta {
  const _RankingMeta({required this.strategy, final  Map<String, double> weights = const {}}): _weights = weights;
  factory _RankingMeta.fromJson(Map<String, dynamic> json) => _$RankingMetaFromJson(json);

@override final  RankingStrategy strategy;
 final  Map<String, double> _weights;
@override@JsonKey() Map<String, double> get weights {
  if (_weights is EqualUnmodifiableMapView) return _weights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_weights);
}


/// Create a copy of RankingMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RankingMetaCopyWith<_RankingMeta> get copyWith => __$RankingMetaCopyWithImpl<_RankingMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RankingMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RankingMeta&&(identical(other.strategy, strategy) || other.strategy == strategy)&&const DeepCollectionEquality().equals(other._weights, _weights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strategy,const DeepCollectionEquality().hash(_weights));

@override
String toString() {
  return 'RankingMeta(strategy: $strategy, weights: $weights)';
}


}

/// @nodoc
abstract mixin class _$RankingMetaCopyWith<$Res> implements $RankingMetaCopyWith<$Res> {
  factory _$RankingMetaCopyWith(_RankingMeta value, $Res Function(_RankingMeta) _then) = __$RankingMetaCopyWithImpl;
@override @useResult
$Res call({
 RankingStrategy strategy, Map<String, double> weights
});




}
/// @nodoc
class __$RankingMetaCopyWithImpl<$Res>
    implements _$RankingMetaCopyWith<$Res> {
  __$RankingMetaCopyWithImpl(this._self, this._then);

  final _RankingMeta _self;
  final $Res Function(_RankingMeta) _then;

/// Create a copy of RankingMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? strategy = null,Object? weights = null,}) {
  return _then(_RankingMeta(
strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as RankingStrategy,weights: null == weights ? _self._weights : weights // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
