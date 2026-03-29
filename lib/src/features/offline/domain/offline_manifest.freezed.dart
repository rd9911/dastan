// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_manifest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfflineBundleManifest {

 String get itineraryId; int get version; DateTime get createdAt; Map<ItinerarySection, List<SavedItem>> get sections; List<DayPlan> get dayPlans; List<BundleAsset> get assets; List<SearchIndexEntry> get searchIndex; Map<String, dynamic> get metadata;
/// Create a copy of OfflineBundleManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineBundleManifestCopyWith<OfflineBundleManifest> get copyWith => _$OfflineBundleManifestCopyWithImpl<OfflineBundleManifest>(this as OfflineBundleManifest, _$identity);

  /// Serializes this OfflineBundleManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineBundleManifest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.sections, sections)&&const DeepCollectionEquality().equals(other.dayPlans, dayPlans)&&const DeepCollectionEquality().equals(other.assets, assets)&&const DeepCollectionEquality().equals(other.searchIndex, searchIndex)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,version,createdAt,const DeepCollectionEquality().hash(sections),const DeepCollectionEquality().hash(dayPlans),const DeepCollectionEquality().hash(assets),const DeepCollectionEquality().hash(searchIndex),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'OfflineBundleManifest(itineraryId: $itineraryId, version: $version, createdAt: $createdAt, sections: $sections, dayPlans: $dayPlans, assets: $assets, searchIndex: $searchIndex, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $OfflineBundleManifestCopyWith<$Res>  {
  factory $OfflineBundleManifestCopyWith(OfflineBundleManifest value, $Res Function(OfflineBundleManifest) _then) = _$OfflineBundleManifestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, int version, DateTime createdAt, Map<ItinerarySection, List<SavedItem>> sections, List<DayPlan> dayPlans, List<BundleAsset> assets, List<SearchIndexEntry> searchIndex, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$OfflineBundleManifestCopyWithImpl<$Res>
    implements $OfflineBundleManifestCopyWith<$Res> {
  _$OfflineBundleManifestCopyWithImpl(this._self, this._then);

  final OfflineBundleManifest _self;
  final $Res Function(OfflineBundleManifest) _then;

/// Create a copy of OfflineBundleManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? version = null,Object? createdAt = null,Object? sections = null,Object? dayPlans = null,Object? assets = null,Object? searchIndex = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as Map<ItinerarySection, List<SavedItem>>,dayPlans: null == dayPlans ? _self.dayPlans : dayPlans // ignore: cast_nullable_to_non_nullable
as List<DayPlan>,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as List<BundleAsset>,searchIndex: null == searchIndex ? _self.searchIndex : searchIndex // ignore: cast_nullable_to_non_nullable
as List<SearchIndexEntry>,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [OfflineBundleManifest].
extension OfflineBundleManifestPatterns on OfflineBundleManifest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfflineBundleManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfflineBundleManifest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfflineBundleManifest value)  $default,){
final _that = this;
switch (_that) {
case _OfflineBundleManifest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfflineBundleManifest value)?  $default,){
final _that = this;
switch (_that) {
case _OfflineBundleManifest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  int version,  DateTime createdAt,  Map<ItinerarySection, List<SavedItem>> sections,  List<DayPlan> dayPlans,  List<BundleAsset> assets,  List<SearchIndexEntry> searchIndex,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfflineBundleManifest() when $default != null:
return $default(_that.itineraryId,_that.version,_that.createdAt,_that.sections,_that.dayPlans,_that.assets,_that.searchIndex,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  int version,  DateTime createdAt,  Map<ItinerarySection, List<SavedItem>> sections,  List<DayPlan> dayPlans,  List<BundleAsset> assets,  List<SearchIndexEntry> searchIndex,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _OfflineBundleManifest():
return $default(_that.itineraryId,_that.version,_that.createdAt,_that.sections,_that.dayPlans,_that.assets,_that.searchIndex,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  int version,  DateTime createdAt,  Map<ItinerarySection, List<SavedItem>> sections,  List<DayPlan> dayPlans,  List<BundleAsset> assets,  List<SearchIndexEntry> searchIndex,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _OfflineBundleManifest() when $default != null:
return $default(_that.itineraryId,_that.version,_that.createdAt,_that.sections,_that.dayPlans,_that.assets,_that.searchIndex,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _OfflineBundleManifest extends OfflineBundleManifest {
  const _OfflineBundleManifest({required this.itineraryId, required this.version, required this.createdAt, required final  Map<ItinerarySection, List<SavedItem>> sections, required final  List<DayPlan> dayPlans, required final  List<BundleAsset> assets, required final  List<SearchIndexEntry> searchIndex, required final  Map<String, dynamic> metadata}): _sections = sections,_dayPlans = dayPlans,_assets = assets,_searchIndex = searchIndex,_metadata = metadata,super._();
  factory _OfflineBundleManifest.fromJson(Map<String, dynamic> json) => _$OfflineBundleManifestFromJson(json);

@override final  String itineraryId;
@override final  int version;
@override final  DateTime createdAt;
 final  Map<ItinerarySection, List<SavedItem>> _sections;
@override Map<ItinerarySection, List<SavedItem>> get sections {
  if (_sections is EqualUnmodifiableMapView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sections);
}

 final  List<DayPlan> _dayPlans;
@override List<DayPlan> get dayPlans {
  if (_dayPlans is EqualUnmodifiableListView) return _dayPlans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dayPlans);
}

 final  List<BundleAsset> _assets;
@override List<BundleAsset> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

 final  List<SearchIndexEntry> _searchIndex;
@override List<SearchIndexEntry> get searchIndex {
  if (_searchIndex is EqualUnmodifiableListView) return _searchIndex;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchIndex);
}

 final  Map<String, dynamic> _metadata;
@override Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of OfflineBundleManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfflineBundleManifestCopyWith<_OfflineBundleManifest> get copyWith => __$OfflineBundleManifestCopyWithImpl<_OfflineBundleManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfflineBundleManifestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfflineBundleManifest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._sections, _sections)&&const DeepCollectionEquality().equals(other._dayPlans, _dayPlans)&&const DeepCollectionEquality().equals(other._assets, _assets)&&const DeepCollectionEquality().equals(other._searchIndex, _searchIndex)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,version,createdAt,const DeepCollectionEquality().hash(_sections),const DeepCollectionEquality().hash(_dayPlans),const DeepCollectionEquality().hash(_assets),const DeepCollectionEquality().hash(_searchIndex),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'OfflineBundleManifest(itineraryId: $itineraryId, version: $version, createdAt: $createdAt, sections: $sections, dayPlans: $dayPlans, assets: $assets, searchIndex: $searchIndex, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$OfflineBundleManifestCopyWith<$Res> implements $OfflineBundleManifestCopyWith<$Res> {
  factory _$OfflineBundleManifestCopyWith(_OfflineBundleManifest value, $Res Function(_OfflineBundleManifest) _then) = __$OfflineBundleManifestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, int version, DateTime createdAt, Map<ItinerarySection, List<SavedItem>> sections, List<DayPlan> dayPlans, List<BundleAsset> assets, List<SearchIndexEntry> searchIndex, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$OfflineBundleManifestCopyWithImpl<$Res>
    implements _$OfflineBundleManifestCopyWith<$Res> {
  __$OfflineBundleManifestCopyWithImpl(this._self, this._then);

  final _OfflineBundleManifest _self;
  final $Res Function(_OfflineBundleManifest) _then;

/// Create a copy of OfflineBundleManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? version = null,Object? createdAt = null,Object? sections = null,Object? dayPlans = null,Object? assets = null,Object? searchIndex = null,Object? metadata = null,}) {
  return _then(_OfflineBundleManifest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as Map<ItinerarySection, List<SavedItem>>,dayPlans: null == dayPlans ? _self._dayPlans : dayPlans // ignore: cast_nullable_to_non_nullable
as List<DayPlan>,assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<BundleAsset>,searchIndex: null == searchIndex ? _self._searchIndex : searchIndex // ignore: cast_nullable_to_non_nullable
as List<SearchIndexEntry>,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$BundleAsset {

 String get path; String get originalUrl; String get sha256; BundleAssetKind get kind;
/// Create a copy of BundleAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BundleAssetCopyWith<BundleAsset> get copyWith => _$BundleAssetCopyWithImpl<BundleAsset>(this as BundleAsset, _$identity);

  /// Serializes this BundleAsset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BundleAsset&&(identical(other.path, path) || other.path == path)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,originalUrl,sha256,kind);

@override
String toString() {
  return 'BundleAsset(path: $path, originalUrl: $originalUrl, sha256: $sha256, kind: $kind)';
}


}

/// @nodoc
abstract mixin class $BundleAssetCopyWith<$Res>  {
  factory $BundleAssetCopyWith(BundleAsset value, $Res Function(BundleAsset) _then) = _$BundleAssetCopyWithImpl;
@useResult
$Res call({
 String path, String originalUrl, String sha256, BundleAssetKind kind
});




}
/// @nodoc
class _$BundleAssetCopyWithImpl<$Res>
    implements $BundleAssetCopyWith<$Res> {
  _$BundleAssetCopyWithImpl(this._self, this._then);

  final BundleAsset _self;
  final $Res Function(BundleAsset) _then;

/// Create a copy of BundleAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? originalUrl = null,Object? sha256 = null,Object? kind = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as BundleAssetKind,
  ));
}

}


/// Adds pattern-matching-related methods to [BundleAsset].
extension BundleAssetPatterns on BundleAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BundleAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BundleAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BundleAsset value)  $default,){
final _that = this;
switch (_that) {
case _BundleAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BundleAsset value)?  $default,){
final _that = this;
switch (_that) {
case _BundleAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String originalUrl,  String sha256,  BundleAssetKind kind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BundleAsset() when $default != null:
return $default(_that.path,_that.originalUrl,_that.sha256,_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String originalUrl,  String sha256,  BundleAssetKind kind)  $default,) {final _that = this;
switch (_that) {
case _BundleAsset():
return $default(_that.path,_that.originalUrl,_that.sha256,_that.kind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String originalUrl,  String sha256,  BundleAssetKind kind)?  $default,) {final _that = this;
switch (_that) {
case _BundleAsset() when $default != null:
return $default(_that.path,_that.originalUrl,_that.sha256,_that.kind);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BundleAsset implements BundleAsset {
  const _BundleAsset({required this.path, required this.originalUrl, required this.sha256, required this.kind});
  factory _BundleAsset.fromJson(Map<String, dynamic> json) => _$BundleAssetFromJson(json);

@override final  String path;
@override final  String originalUrl;
@override final  String sha256;
@override final  BundleAssetKind kind;

/// Create a copy of BundleAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BundleAssetCopyWith<_BundleAsset> get copyWith => __$BundleAssetCopyWithImpl<_BundleAsset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BundleAssetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BundleAsset&&(identical(other.path, path) || other.path == path)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.sha256, sha256) || other.sha256 == sha256)&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path,originalUrl,sha256,kind);

@override
String toString() {
  return 'BundleAsset(path: $path, originalUrl: $originalUrl, sha256: $sha256, kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$BundleAssetCopyWith<$Res> implements $BundleAssetCopyWith<$Res> {
  factory _$BundleAssetCopyWith(_BundleAsset value, $Res Function(_BundleAsset) _then) = __$BundleAssetCopyWithImpl;
@override @useResult
$Res call({
 String path, String originalUrl, String sha256, BundleAssetKind kind
});




}
/// @nodoc
class __$BundleAssetCopyWithImpl<$Res>
    implements _$BundleAssetCopyWith<$Res> {
  __$BundleAssetCopyWithImpl(this._self, this._then);

  final _BundleAsset _self;
  final $Res Function(_BundleAsset) _then;

/// Create a copy of BundleAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? originalUrl = null,Object? sha256 = null,Object? kind = null,}) {
  return _then(_BundleAsset(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,sha256: null == sha256 ? _self.sha256 : sha256 // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as BundleAssetKind,
  ));
}


}


/// @nodoc
mixin _$SearchIndexEntry {

 String get tokenId; List<String> get itemIds;
/// Create a copy of SearchIndexEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchIndexEntryCopyWith<SearchIndexEntry> get copyWith => _$SearchIndexEntryCopyWithImpl<SearchIndexEntry>(this as SearchIndexEntry, _$identity);

  /// Serializes this SearchIndexEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchIndexEntry&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other.itemIds, itemIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,const DeepCollectionEquality().hash(itemIds));

@override
String toString() {
  return 'SearchIndexEntry(tokenId: $tokenId, itemIds: $itemIds)';
}


}

/// @nodoc
abstract mixin class $SearchIndexEntryCopyWith<$Res>  {
  factory $SearchIndexEntryCopyWith(SearchIndexEntry value, $Res Function(SearchIndexEntry) _then) = _$SearchIndexEntryCopyWithImpl;
@useResult
$Res call({
 String tokenId, List<String> itemIds
});




}
/// @nodoc
class _$SearchIndexEntryCopyWithImpl<$Res>
    implements $SearchIndexEntryCopyWith<$Res> {
  _$SearchIndexEntryCopyWithImpl(this._self, this._then);

  final SearchIndexEntry _self;
  final $Res Function(SearchIndexEntry) _then;

/// Create a copy of SearchIndexEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tokenId = null,Object? itemIds = null,}) {
  return _then(_self.copyWith(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,itemIds: null == itemIds ? _self.itemIds : itemIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchIndexEntry].
extension SearchIndexEntryPatterns on SearchIndexEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchIndexEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchIndexEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchIndexEntry value)  $default,){
final _that = this;
switch (_that) {
case _SearchIndexEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchIndexEntry value)?  $default,){
final _that = this;
switch (_that) {
case _SearchIndexEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tokenId,  List<String> itemIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchIndexEntry() when $default != null:
return $default(_that.tokenId,_that.itemIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tokenId,  List<String> itemIds)  $default,) {final _that = this;
switch (_that) {
case _SearchIndexEntry():
return $default(_that.tokenId,_that.itemIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tokenId,  List<String> itemIds)?  $default,) {final _that = this;
switch (_that) {
case _SearchIndexEntry() when $default != null:
return $default(_that.tokenId,_that.itemIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchIndexEntry implements SearchIndexEntry {
  const _SearchIndexEntry({required this.tokenId, required final  List<String> itemIds}): _itemIds = itemIds;
  factory _SearchIndexEntry.fromJson(Map<String, dynamic> json) => _$SearchIndexEntryFromJson(json);

@override final  String tokenId;
 final  List<String> _itemIds;
@override List<String> get itemIds {
  if (_itemIds is EqualUnmodifiableListView) return _itemIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemIds);
}


/// Create a copy of SearchIndexEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchIndexEntryCopyWith<_SearchIndexEntry> get copyWith => __$SearchIndexEntryCopyWithImpl<_SearchIndexEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchIndexEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchIndexEntry&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&const DeepCollectionEquality().equals(other._itemIds, _itemIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tokenId,const DeepCollectionEquality().hash(_itemIds));

@override
String toString() {
  return 'SearchIndexEntry(tokenId: $tokenId, itemIds: $itemIds)';
}


}

/// @nodoc
abstract mixin class _$SearchIndexEntryCopyWith<$Res> implements $SearchIndexEntryCopyWith<$Res> {
  factory _$SearchIndexEntryCopyWith(_SearchIndexEntry value, $Res Function(_SearchIndexEntry) _then) = __$SearchIndexEntryCopyWithImpl;
@override @useResult
$Res call({
 String tokenId, List<String> itemIds
});




}
/// @nodoc
class __$SearchIndexEntryCopyWithImpl<$Res>
    implements _$SearchIndexEntryCopyWith<$Res> {
  __$SearchIndexEntryCopyWithImpl(this._self, this._then);

  final _SearchIndexEntry _self;
  final $Res Function(_SearchIndexEntry) _then;

/// Create a copy of SearchIndexEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tokenId = null,Object? itemIds = null,}) {
  return _then(_SearchIndexEntry(
tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,itemIds: null == itemIds ? _self._itemIds : itemIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
