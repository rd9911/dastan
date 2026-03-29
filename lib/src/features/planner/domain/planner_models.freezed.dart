// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planner_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DayPlan {

 String get itineraryId; DateTime get date; List<DayPlanEntry> get entries; int get version; DateTime? get updatedAt;
/// Create a copy of DayPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayPlanCopyWith<DayPlan> get copyWith => _$DayPlanCopyWithImpl<DayPlan>(this as DayPlan, _$identity);

  /// Serializes this DayPlan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayPlan&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.version, version) || other.version == version)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,date,const DeepCollectionEquality().hash(entries),version,updatedAt);

@override
String toString() {
  return 'DayPlan(itineraryId: $itineraryId, date: $date, entries: $entries, version: $version, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DayPlanCopyWith<$Res>  {
  factory $DayPlanCopyWith(DayPlan value, $Res Function(DayPlan) _then) = _$DayPlanCopyWithImpl;
@useResult
$Res call({
 String itineraryId, DateTime date, List<DayPlanEntry> entries, int version, DateTime? updatedAt
});




}
/// @nodoc
class _$DayPlanCopyWithImpl<$Res>
    implements $DayPlanCopyWith<$Res> {
  _$DayPlanCopyWithImpl(this._self, this._then);

  final DayPlan _self;
  final $Res Function(DayPlan) _then;

/// Create a copy of DayPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? date = null,Object? entries = null,Object? version = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<DayPlanEntry>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DayPlan].
extension DayPlanPatterns on DayPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayPlan value)  $default,){
final _that = this;
switch (_that) {
case _DayPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayPlan value)?  $default,){
final _that = this;
switch (_that) {
case _DayPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  DateTime date,  List<DayPlanEntry> entries,  int version,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayPlan() when $default != null:
return $default(_that.itineraryId,_that.date,_that.entries,_that.version,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  DateTime date,  List<DayPlanEntry> entries,  int version,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DayPlan():
return $default(_that.itineraryId,_that.date,_that.entries,_that.version,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  DateTime date,  List<DayPlanEntry> entries,  int version,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DayPlan() when $default != null:
return $default(_that.itineraryId,_that.date,_that.entries,_that.version,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayPlan implements DayPlan {
  const _DayPlan({required this.itineraryId, required this.date, final  List<DayPlanEntry> entries = const [], this.version = 1, this.updatedAt}): _entries = entries;
  factory _DayPlan.fromJson(Map<String, dynamic> json) => _$DayPlanFromJson(json);

@override final  String itineraryId;
@override final  DateTime date;
 final  List<DayPlanEntry> _entries;
@override@JsonKey() List<DayPlanEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  int version;
@override final  DateTime? updatedAt;

/// Create a copy of DayPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayPlanCopyWith<_DayPlan> get copyWith => __$DayPlanCopyWithImpl<_DayPlan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayPlanToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayPlan&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.version, version) || other.version == version)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,date,const DeepCollectionEquality().hash(_entries),version,updatedAt);

@override
String toString() {
  return 'DayPlan(itineraryId: $itineraryId, date: $date, entries: $entries, version: $version, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DayPlanCopyWith<$Res> implements $DayPlanCopyWith<$Res> {
  factory _$DayPlanCopyWith(_DayPlan value, $Res Function(_DayPlan) _then) = __$DayPlanCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, DateTime date, List<DayPlanEntry> entries, int version, DateTime? updatedAt
});




}
/// @nodoc
class __$DayPlanCopyWithImpl<$Res>
    implements _$DayPlanCopyWith<$Res> {
  __$DayPlanCopyWithImpl(this._self, this._then);

  final _DayPlan _self;
  final $Res Function(_DayPlan) _then;

/// Create a copy of DayPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? date = null,Object? entries = null,Object? version = null,Object? updatedAt = freezed,}) {
  return _then(_DayPlan(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<DayPlanEntry>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DayPlanEntry {

 String get id; String? get savedItemId; String get title; PlanEntryType get type; DateTime? get startTime; DateTime? get endTime; int get durationMinutes;// Commute info (to get TO this entry)
 TravelMode get commuteMode; int? get commuteDurationMinutes;// Buffer
 int? get bufferBeforeMinutes; String? get notes;
/// Create a copy of DayPlanEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayPlanEntryCopyWith<DayPlanEntry> get copyWith => _$DayPlanEntryCopyWithImpl<DayPlanEntry>(this as DayPlanEntry, _$identity);

  /// Serializes this DayPlanEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayPlanEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.savedItemId, savedItemId) || other.savedItemId == savedItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.commuteMode, commuteMode) || other.commuteMode == commuteMode)&&(identical(other.commuteDurationMinutes, commuteDurationMinutes) || other.commuteDurationMinutes == commuteDurationMinutes)&&(identical(other.bufferBeforeMinutes, bufferBeforeMinutes) || other.bufferBeforeMinutes == bufferBeforeMinutes)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,savedItemId,title,type,startTime,endTime,durationMinutes,commuteMode,commuteDurationMinutes,bufferBeforeMinutes,notes);

@override
String toString() {
  return 'DayPlanEntry(id: $id, savedItemId: $savedItemId, title: $title, type: $type, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, commuteMode: $commuteMode, commuteDurationMinutes: $commuteDurationMinutes, bufferBeforeMinutes: $bufferBeforeMinutes, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $DayPlanEntryCopyWith<$Res>  {
  factory $DayPlanEntryCopyWith(DayPlanEntry value, $Res Function(DayPlanEntry) _then) = _$DayPlanEntryCopyWithImpl;
@useResult
$Res call({
 String id, String? savedItemId, String title, PlanEntryType type, DateTime? startTime, DateTime? endTime, int durationMinutes, TravelMode commuteMode, int? commuteDurationMinutes, int? bufferBeforeMinutes, String? notes
});




}
/// @nodoc
class _$DayPlanEntryCopyWithImpl<$Res>
    implements $DayPlanEntryCopyWith<$Res> {
  _$DayPlanEntryCopyWithImpl(this._self, this._then);

  final DayPlanEntry _self;
  final $Res Function(DayPlanEntry) _then;

/// Create a copy of DayPlanEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? savedItemId = freezed,Object? title = null,Object? type = null,Object? startTime = freezed,Object? endTime = freezed,Object? durationMinutes = null,Object? commuteMode = null,Object? commuteDurationMinutes = freezed,Object? bufferBeforeMinutes = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,savedItemId: freezed == savedItemId ? _self.savedItemId : savedItemId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PlanEntryType,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,commuteMode: null == commuteMode ? _self.commuteMode : commuteMode // ignore: cast_nullable_to_non_nullable
as TravelMode,commuteDurationMinutes: freezed == commuteDurationMinutes ? _self.commuteDurationMinutes : commuteDurationMinutes // ignore: cast_nullable_to_non_nullable
as int?,bufferBeforeMinutes: freezed == bufferBeforeMinutes ? _self.bufferBeforeMinutes : bufferBeforeMinutes // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DayPlanEntry].
extension DayPlanEntryPatterns on DayPlanEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayPlanEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayPlanEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayPlanEntry value)  $default,){
final _that = this;
switch (_that) {
case _DayPlanEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayPlanEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DayPlanEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? savedItemId,  String title,  PlanEntryType type,  DateTime? startTime,  DateTime? endTime,  int durationMinutes,  TravelMode commuteMode,  int? commuteDurationMinutes,  int? bufferBeforeMinutes,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayPlanEntry() when $default != null:
return $default(_that.id,_that.savedItemId,_that.title,_that.type,_that.startTime,_that.endTime,_that.durationMinutes,_that.commuteMode,_that.commuteDurationMinutes,_that.bufferBeforeMinutes,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? savedItemId,  String title,  PlanEntryType type,  DateTime? startTime,  DateTime? endTime,  int durationMinutes,  TravelMode commuteMode,  int? commuteDurationMinutes,  int? bufferBeforeMinutes,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _DayPlanEntry():
return $default(_that.id,_that.savedItemId,_that.title,_that.type,_that.startTime,_that.endTime,_that.durationMinutes,_that.commuteMode,_that.commuteDurationMinutes,_that.bufferBeforeMinutes,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? savedItemId,  String title,  PlanEntryType type,  DateTime? startTime,  DateTime? endTime,  int durationMinutes,  TravelMode commuteMode,  int? commuteDurationMinutes,  int? bufferBeforeMinutes,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _DayPlanEntry() when $default != null:
return $default(_that.id,_that.savedItemId,_that.title,_that.type,_that.startTime,_that.endTime,_that.durationMinutes,_that.commuteMode,_that.commuteDurationMinutes,_that.bufferBeforeMinutes,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayPlanEntry implements DayPlanEntry {
  const _DayPlanEntry({required this.id, this.savedItemId, required this.title, this.type = PlanEntryType.fixed, this.startTime, this.endTime, this.durationMinutes = 60, this.commuteMode = TravelMode.none, this.commuteDurationMinutes, this.bufferBeforeMinutes, this.notes});
  factory _DayPlanEntry.fromJson(Map<String, dynamic> json) => _$DayPlanEntryFromJson(json);

@override final  String id;
@override final  String? savedItemId;
@override final  String title;
@override@JsonKey() final  PlanEntryType type;
@override final  DateTime? startTime;
@override final  DateTime? endTime;
@override@JsonKey() final  int durationMinutes;
// Commute info (to get TO this entry)
@override@JsonKey() final  TravelMode commuteMode;
@override final  int? commuteDurationMinutes;
// Buffer
@override final  int? bufferBeforeMinutes;
@override final  String? notes;

/// Create a copy of DayPlanEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayPlanEntryCopyWith<_DayPlanEntry> get copyWith => __$DayPlanEntryCopyWithImpl<_DayPlanEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayPlanEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayPlanEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.savedItemId, savedItemId) || other.savedItemId == savedItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.commuteMode, commuteMode) || other.commuteMode == commuteMode)&&(identical(other.commuteDurationMinutes, commuteDurationMinutes) || other.commuteDurationMinutes == commuteDurationMinutes)&&(identical(other.bufferBeforeMinutes, bufferBeforeMinutes) || other.bufferBeforeMinutes == bufferBeforeMinutes)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,savedItemId,title,type,startTime,endTime,durationMinutes,commuteMode,commuteDurationMinutes,bufferBeforeMinutes,notes);

@override
String toString() {
  return 'DayPlanEntry(id: $id, savedItemId: $savedItemId, title: $title, type: $type, startTime: $startTime, endTime: $endTime, durationMinutes: $durationMinutes, commuteMode: $commuteMode, commuteDurationMinutes: $commuteDurationMinutes, bufferBeforeMinutes: $bufferBeforeMinutes, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$DayPlanEntryCopyWith<$Res> implements $DayPlanEntryCopyWith<$Res> {
  factory _$DayPlanEntryCopyWith(_DayPlanEntry value, $Res Function(_DayPlanEntry) _then) = __$DayPlanEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String? savedItemId, String title, PlanEntryType type, DateTime? startTime, DateTime? endTime, int durationMinutes, TravelMode commuteMode, int? commuteDurationMinutes, int? bufferBeforeMinutes, String? notes
});




}
/// @nodoc
class __$DayPlanEntryCopyWithImpl<$Res>
    implements _$DayPlanEntryCopyWith<$Res> {
  __$DayPlanEntryCopyWithImpl(this._self, this._then);

  final _DayPlanEntry _self;
  final $Res Function(_DayPlanEntry) _then;

/// Create a copy of DayPlanEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? savedItemId = freezed,Object? title = null,Object? type = null,Object? startTime = freezed,Object? endTime = freezed,Object? durationMinutes = null,Object? commuteMode = null,Object? commuteDurationMinutes = freezed,Object? bufferBeforeMinutes = freezed,Object? notes = freezed,}) {
  return _then(_DayPlanEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,savedItemId: freezed == savedItemId ? _self.savedItemId : savedItemId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PlanEntryType,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,commuteMode: null == commuteMode ? _self.commuteMode : commuteMode // ignore: cast_nullable_to_non_nullable
as TravelMode,commuteDurationMinutes: freezed == commuteDurationMinutes ? _self.commuteDurationMinutes : commuteDurationMinutes // ignore: cast_nullable_to_non_nullable
as int?,bufferBeforeMinutes: freezed == bufferBeforeMinutes ? _self.bufferBeforeMinutes : bufferBeforeMinutes // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
