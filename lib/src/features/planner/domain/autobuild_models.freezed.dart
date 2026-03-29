// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autobuild_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AutoBuildPreferences {

@TimeOfDayConverter() TimeOfDay get startTime; AutoBuildPace get pace; List<ItinerarySection> get prioritizeSections;// Constraints
 bool get respectOpeningHours; bool get minimizeTravelTime;
/// Create a copy of AutoBuildPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AutoBuildPreferencesCopyWith<AutoBuildPreferences> get copyWith => _$AutoBuildPreferencesCopyWithImpl<AutoBuildPreferences>(this as AutoBuildPreferences, _$identity);

  /// Serializes this AutoBuildPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AutoBuildPreferences&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.pace, pace) || other.pace == pace)&&const DeepCollectionEquality().equals(other.prioritizeSections, prioritizeSections)&&(identical(other.respectOpeningHours, respectOpeningHours) || other.respectOpeningHours == respectOpeningHours)&&(identical(other.minimizeTravelTime, minimizeTravelTime) || other.minimizeTravelTime == minimizeTravelTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,pace,const DeepCollectionEquality().hash(prioritizeSections),respectOpeningHours,minimizeTravelTime);

@override
String toString() {
  return 'AutoBuildPreferences(startTime: $startTime, pace: $pace, prioritizeSections: $prioritizeSections, respectOpeningHours: $respectOpeningHours, minimizeTravelTime: $minimizeTravelTime)';
}


}

/// @nodoc
abstract mixin class $AutoBuildPreferencesCopyWith<$Res>  {
  factory $AutoBuildPreferencesCopyWith(AutoBuildPreferences value, $Res Function(AutoBuildPreferences) _then) = _$AutoBuildPreferencesCopyWithImpl;
@useResult
$Res call({
@TimeOfDayConverter() TimeOfDay startTime, AutoBuildPace pace, List<ItinerarySection> prioritizeSections, bool respectOpeningHours, bool minimizeTravelTime
});




}
/// @nodoc
class _$AutoBuildPreferencesCopyWithImpl<$Res>
    implements $AutoBuildPreferencesCopyWith<$Res> {
  _$AutoBuildPreferencesCopyWithImpl(this._self, this._then);

  final AutoBuildPreferences _self;
  final $Res Function(AutoBuildPreferences) _then;

/// Create a copy of AutoBuildPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? pace = null,Object? prioritizeSections = null,Object? respectOpeningHours = null,Object? minimizeTravelTime = null,}) {
  return _then(_self.copyWith(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,pace: null == pace ? _self.pace : pace // ignore: cast_nullable_to_non_nullable
as AutoBuildPace,prioritizeSections: null == prioritizeSections ? _self.prioritizeSections : prioritizeSections // ignore: cast_nullable_to_non_nullable
as List<ItinerarySection>,respectOpeningHours: null == respectOpeningHours ? _self.respectOpeningHours : respectOpeningHours // ignore: cast_nullable_to_non_nullable
as bool,minimizeTravelTime: null == minimizeTravelTime ? _self.minimizeTravelTime : minimizeTravelTime // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AutoBuildPreferences].
extension AutoBuildPreferencesPatterns on AutoBuildPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AutoBuildPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AutoBuildPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AutoBuildPreferences value)  $default,){
final _that = this;
switch (_that) {
case _AutoBuildPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AutoBuildPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _AutoBuildPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@TimeOfDayConverter()  TimeOfDay startTime,  AutoBuildPace pace,  List<ItinerarySection> prioritizeSections,  bool respectOpeningHours,  bool minimizeTravelTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AutoBuildPreferences() when $default != null:
return $default(_that.startTime,_that.pace,_that.prioritizeSections,_that.respectOpeningHours,_that.minimizeTravelTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@TimeOfDayConverter()  TimeOfDay startTime,  AutoBuildPace pace,  List<ItinerarySection> prioritizeSections,  bool respectOpeningHours,  bool minimizeTravelTime)  $default,) {final _that = this;
switch (_that) {
case _AutoBuildPreferences():
return $default(_that.startTime,_that.pace,_that.prioritizeSections,_that.respectOpeningHours,_that.minimizeTravelTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@TimeOfDayConverter()  TimeOfDay startTime,  AutoBuildPace pace,  List<ItinerarySection> prioritizeSections,  bool respectOpeningHours,  bool minimizeTravelTime)?  $default,) {final _that = this;
switch (_that) {
case _AutoBuildPreferences() when $default != null:
return $default(_that.startTime,_that.pace,_that.prioritizeSections,_that.respectOpeningHours,_that.minimizeTravelTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AutoBuildPreferences implements AutoBuildPreferences {
  const _AutoBuildPreferences({@TimeOfDayConverter() this.startTime = const TimeOfDay(hour: 9, minute: 0), this.pace = AutoBuildPace.normal, final  List<ItinerarySection> prioritizeSections = const [], this.respectOpeningHours = true, this.minimizeTravelTime = true}): _prioritizeSections = prioritizeSections;
  factory _AutoBuildPreferences.fromJson(Map<String, dynamic> json) => _$AutoBuildPreferencesFromJson(json);

@override@JsonKey()@TimeOfDayConverter() final  TimeOfDay startTime;
@override@JsonKey() final  AutoBuildPace pace;
 final  List<ItinerarySection> _prioritizeSections;
@override@JsonKey() List<ItinerarySection> get prioritizeSections {
  if (_prioritizeSections is EqualUnmodifiableListView) return _prioritizeSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prioritizeSections);
}

// Constraints
@override@JsonKey() final  bool respectOpeningHours;
@override@JsonKey() final  bool minimizeTravelTime;

/// Create a copy of AutoBuildPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AutoBuildPreferencesCopyWith<_AutoBuildPreferences> get copyWith => __$AutoBuildPreferencesCopyWithImpl<_AutoBuildPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AutoBuildPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AutoBuildPreferences&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.pace, pace) || other.pace == pace)&&const DeepCollectionEquality().equals(other._prioritizeSections, _prioritizeSections)&&(identical(other.respectOpeningHours, respectOpeningHours) || other.respectOpeningHours == respectOpeningHours)&&(identical(other.minimizeTravelTime, minimizeTravelTime) || other.minimizeTravelTime == minimizeTravelTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,pace,const DeepCollectionEquality().hash(_prioritizeSections),respectOpeningHours,minimizeTravelTime);

@override
String toString() {
  return 'AutoBuildPreferences(startTime: $startTime, pace: $pace, prioritizeSections: $prioritizeSections, respectOpeningHours: $respectOpeningHours, minimizeTravelTime: $minimizeTravelTime)';
}


}

/// @nodoc
abstract mixin class _$AutoBuildPreferencesCopyWith<$Res> implements $AutoBuildPreferencesCopyWith<$Res> {
  factory _$AutoBuildPreferencesCopyWith(_AutoBuildPreferences value, $Res Function(_AutoBuildPreferences) _then) = __$AutoBuildPreferencesCopyWithImpl;
@override @useResult
$Res call({
@TimeOfDayConverter() TimeOfDay startTime, AutoBuildPace pace, List<ItinerarySection> prioritizeSections, bool respectOpeningHours, bool minimizeTravelTime
});




}
/// @nodoc
class __$AutoBuildPreferencesCopyWithImpl<$Res>
    implements _$AutoBuildPreferencesCopyWith<$Res> {
  __$AutoBuildPreferencesCopyWithImpl(this._self, this._then);

  final _AutoBuildPreferences _self;
  final $Res Function(_AutoBuildPreferences) _then;

/// Create a copy of AutoBuildPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? pace = null,Object? prioritizeSections = null,Object? respectOpeningHours = null,Object? minimizeTravelTime = null,}) {
  return _then(_AutoBuildPreferences(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,pace: null == pace ? _self.pace : pace // ignore: cast_nullable_to_non_nullable
as AutoBuildPace,prioritizeSections: null == prioritizeSections ? _self._prioritizeSections : prioritizeSections // ignore: cast_nullable_to_non_nullable
as List<ItinerarySection>,respectOpeningHours: null == respectOpeningHours ? _self.respectOpeningHours : respectOpeningHours // ignore: cast_nullable_to_non_nullable
as bool,minimizeTravelTime: null == minimizeTravelTime ? _self.minimizeTravelTime : minimizeTravelTime // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AutoBuildRequest {

 String get itineraryId; DateTime get date; List<SavedItem> get candidates; AutoBuildPreferences get preferences;
/// Create a copy of AutoBuildRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AutoBuildRequestCopyWith<AutoBuildRequest> get copyWith => _$AutoBuildRequestCopyWithImpl<AutoBuildRequest>(this as AutoBuildRequest, _$identity);

  /// Serializes this AutoBuildRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AutoBuildRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.candidates, candidates)&&(identical(other.preferences, preferences) || other.preferences == preferences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,date,const DeepCollectionEquality().hash(candidates),preferences);

@override
String toString() {
  return 'AutoBuildRequest(itineraryId: $itineraryId, date: $date, candidates: $candidates, preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class $AutoBuildRequestCopyWith<$Res>  {
  factory $AutoBuildRequestCopyWith(AutoBuildRequest value, $Res Function(AutoBuildRequest) _then) = _$AutoBuildRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, DateTime date, List<SavedItem> candidates, AutoBuildPreferences preferences
});


$AutoBuildPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class _$AutoBuildRequestCopyWithImpl<$Res>
    implements $AutoBuildRequestCopyWith<$Res> {
  _$AutoBuildRequestCopyWithImpl(this._self, this._then);

  final AutoBuildRequest _self;
  final $Res Function(AutoBuildRequest) _then;

/// Create a copy of AutoBuildRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? date = null,Object? candidates = null,Object? preferences = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,candidates: null == candidates ? _self.candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<SavedItem>,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as AutoBuildPreferences,
  ));
}
/// Create a copy of AutoBuildRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AutoBuildPreferencesCopyWith<$Res> get preferences {
  
  return $AutoBuildPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [AutoBuildRequest].
extension AutoBuildRequestPatterns on AutoBuildRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AutoBuildRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AutoBuildRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AutoBuildRequest value)  $default,){
final _that = this;
switch (_that) {
case _AutoBuildRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AutoBuildRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AutoBuildRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  DateTime date,  List<SavedItem> candidates,  AutoBuildPreferences preferences)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AutoBuildRequest() when $default != null:
return $default(_that.itineraryId,_that.date,_that.candidates,_that.preferences);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  DateTime date,  List<SavedItem> candidates,  AutoBuildPreferences preferences)  $default,) {final _that = this;
switch (_that) {
case _AutoBuildRequest():
return $default(_that.itineraryId,_that.date,_that.candidates,_that.preferences);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  DateTime date,  List<SavedItem> candidates,  AutoBuildPreferences preferences)?  $default,) {final _that = this;
switch (_that) {
case _AutoBuildRequest() when $default != null:
return $default(_that.itineraryId,_that.date,_that.candidates,_that.preferences);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AutoBuildRequest implements AutoBuildRequest {
  const _AutoBuildRequest({required this.itineraryId, required this.date, required final  List<SavedItem> candidates, this.preferences = const AutoBuildPreferences()}): _candidates = candidates;
  factory _AutoBuildRequest.fromJson(Map<String, dynamic> json) => _$AutoBuildRequestFromJson(json);

@override final  String itineraryId;
@override final  DateTime date;
 final  List<SavedItem> _candidates;
@override List<SavedItem> get candidates {
  if (_candidates is EqualUnmodifiableListView) return _candidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_candidates);
}

@override@JsonKey() final  AutoBuildPreferences preferences;

/// Create a copy of AutoBuildRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AutoBuildRequestCopyWith<_AutoBuildRequest> get copyWith => __$AutoBuildRequestCopyWithImpl<_AutoBuildRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AutoBuildRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AutoBuildRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._candidates, _candidates)&&(identical(other.preferences, preferences) || other.preferences == preferences));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,date,const DeepCollectionEquality().hash(_candidates),preferences);

@override
String toString() {
  return 'AutoBuildRequest(itineraryId: $itineraryId, date: $date, candidates: $candidates, preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class _$AutoBuildRequestCopyWith<$Res> implements $AutoBuildRequestCopyWith<$Res> {
  factory _$AutoBuildRequestCopyWith(_AutoBuildRequest value, $Res Function(_AutoBuildRequest) _then) = __$AutoBuildRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, DateTime date, List<SavedItem> candidates, AutoBuildPreferences preferences
});


@override $AutoBuildPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class __$AutoBuildRequestCopyWithImpl<$Res>
    implements _$AutoBuildRequestCopyWith<$Res> {
  __$AutoBuildRequestCopyWithImpl(this._self, this._then);

  final _AutoBuildRequest _self;
  final $Res Function(_AutoBuildRequest) _then;

/// Create a copy of AutoBuildRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? date = null,Object? candidates = null,Object? preferences = null,}) {
  return _then(_AutoBuildRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<SavedItem>,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as AutoBuildPreferences,
  ));
}

/// Create a copy of AutoBuildRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AutoBuildPreferencesCopyWith<$Res> get preferences {
  
  return $AutoBuildPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}

// dart format on
