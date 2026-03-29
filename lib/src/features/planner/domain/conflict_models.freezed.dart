// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conflict_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConflictSuggestion {

 String get id; String get label; String get description; ConflictFixAction get action; Map<String, dynamic>? get params;
/// Create a copy of ConflictSuggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictSuggestionCopyWith<ConflictSuggestion> get copyWith => _$ConflictSuggestionCopyWithImpl<ConflictSuggestion>(this as ConflictSuggestion, _$identity);

  /// Serializes this ConflictSuggestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConflictSuggestion&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other.params, params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,description,action,const DeepCollectionEquality().hash(params));

@override
String toString() {
  return 'ConflictSuggestion(id: $id, label: $label, description: $description, action: $action, params: $params)';
}


}

/// @nodoc
abstract mixin class $ConflictSuggestionCopyWith<$Res>  {
  factory $ConflictSuggestionCopyWith(ConflictSuggestion value, $Res Function(ConflictSuggestion) _then) = _$ConflictSuggestionCopyWithImpl;
@useResult
$Res call({
 String id, String label, String description, ConflictFixAction action, Map<String, dynamic>? params
});




}
/// @nodoc
class _$ConflictSuggestionCopyWithImpl<$Res>
    implements $ConflictSuggestionCopyWith<$Res> {
  _$ConflictSuggestionCopyWithImpl(this._self, this._then);

  final ConflictSuggestion _self;
  final $Res Function(ConflictSuggestion) _then;

/// Create a copy of ConflictSuggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? description = null,Object? action = null,Object? params = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ConflictFixAction,params: freezed == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConflictSuggestion].
extension ConflictSuggestionPatterns on ConflictSuggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConflictSuggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConflictSuggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConflictSuggestion value)  $default,){
final _that = this;
switch (_that) {
case _ConflictSuggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConflictSuggestion value)?  $default,){
final _that = this;
switch (_that) {
case _ConflictSuggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String description,  ConflictFixAction action,  Map<String, dynamic>? params)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConflictSuggestion() when $default != null:
return $default(_that.id,_that.label,_that.description,_that.action,_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String description,  ConflictFixAction action,  Map<String, dynamic>? params)  $default,) {final _that = this;
switch (_that) {
case _ConflictSuggestion():
return $default(_that.id,_that.label,_that.description,_that.action,_that.params);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String description,  ConflictFixAction action,  Map<String, dynamic>? params)?  $default,) {final _that = this;
switch (_that) {
case _ConflictSuggestion() when $default != null:
return $default(_that.id,_that.label,_that.description,_that.action,_that.params);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConflictSuggestion implements ConflictSuggestion {
  const _ConflictSuggestion({required this.id, required this.label, required this.description, required this.action, final  Map<String, dynamic>? params}): _params = params;
  factory _ConflictSuggestion.fromJson(Map<String, dynamic> json) => _$ConflictSuggestionFromJson(json);

@override final  String id;
@override final  String label;
@override final  String description;
@override final  ConflictFixAction action;
 final  Map<String, dynamic>? _params;
@override Map<String, dynamic>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ConflictSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConflictSuggestionCopyWith<_ConflictSuggestion> get copyWith => __$ConflictSuggestionCopyWithImpl<_ConflictSuggestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConflictSuggestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConflictSuggestion&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other._params, _params));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,description,action,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'ConflictSuggestion(id: $id, label: $label, description: $description, action: $action, params: $params)';
}


}

/// @nodoc
abstract mixin class _$ConflictSuggestionCopyWith<$Res> implements $ConflictSuggestionCopyWith<$Res> {
  factory _$ConflictSuggestionCopyWith(_ConflictSuggestion value, $Res Function(_ConflictSuggestion) _then) = __$ConflictSuggestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String description, ConflictFixAction action, Map<String, dynamic>? params
});




}
/// @nodoc
class __$ConflictSuggestionCopyWithImpl<$Res>
    implements _$ConflictSuggestionCopyWith<$Res> {
  __$ConflictSuggestionCopyWithImpl(this._self, this._then);

  final _ConflictSuggestion _self;
  final $Res Function(_ConflictSuggestion) _then;

/// Create a copy of ConflictSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? description = null,Object? action = null,Object? params = freezed,}) {
  return _then(_ConflictSuggestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as ConflictFixAction,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$Conflict {

 String get id; ConflictType get type; List<String> get entryIds; String get message; List<ConflictSuggestion> get suggestions; DateTime? get detectedAt;
/// Create a copy of Conflict
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConflictCopyWith<Conflict> get copyWith => _$ConflictCopyWithImpl<Conflict>(this as Conflict, _$identity);

  /// Serializes this Conflict to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conflict&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.entryIds, entryIds)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.suggestions, suggestions)&&(identical(other.detectedAt, detectedAt) || other.detectedAt == detectedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(entryIds),message,const DeepCollectionEquality().hash(suggestions),detectedAt);

@override
String toString() {
  return 'Conflict(id: $id, type: $type, entryIds: $entryIds, message: $message, suggestions: $suggestions, detectedAt: $detectedAt)';
}


}

/// @nodoc
abstract mixin class $ConflictCopyWith<$Res>  {
  factory $ConflictCopyWith(Conflict value, $Res Function(Conflict) _then) = _$ConflictCopyWithImpl;
@useResult
$Res call({
 String id, ConflictType type, List<String> entryIds, String message, List<ConflictSuggestion> suggestions, DateTime? detectedAt
});




}
/// @nodoc
class _$ConflictCopyWithImpl<$Res>
    implements $ConflictCopyWith<$Res> {
  _$ConflictCopyWithImpl(this._self, this._then);

  final Conflict _self;
  final $Res Function(Conflict) _then;

/// Create a copy of Conflict
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? entryIds = null,Object? message = null,Object? suggestions = null,Object? detectedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConflictType,entryIds: null == entryIds ? _self.entryIds : entryIds // ignore: cast_nullable_to_non_nullable
as List<String>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<ConflictSuggestion>,detectedAt: freezed == detectedAt ? _self.detectedAt : detectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Conflict].
extension ConflictPatterns on Conflict {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conflict value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conflict() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conflict value)  $default,){
final _that = this;
switch (_that) {
case _Conflict():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conflict value)?  $default,){
final _that = this;
switch (_that) {
case _Conflict() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ConflictType type,  List<String> entryIds,  String message,  List<ConflictSuggestion> suggestions,  DateTime? detectedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conflict() when $default != null:
return $default(_that.id,_that.type,_that.entryIds,_that.message,_that.suggestions,_that.detectedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ConflictType type,  List<String> entryIds,  String message,  List<ConflictSuggestion> suggestions,  DateTime? detectedAt)  $default,) {final _that = this;
switch (_that) {
case _Conflict():
return $default(_that.id,_that.type,_that.entryIds,_that.message,_that.suggestions,_that.detectedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ConflictType type,  List<String> entryIds,  String message,  List<ConflictSuggestion> suggestions,  DateTime? detectedAt)?  $default,) {final _that = this;
switch (_that) {
case _Conflict() when $default != null:
return $default(_that.id,_that.type,_that.entryIds,_that.message,_that.suggestions,_that.detectedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conflict implements Conflict {
  const _Conflict({required this.id, required this.type, required final  List<String> entryIds, required this.message, required final  List<ConflictSuggestion> suggestions, this.detectedAt}): _entryIds = entryIds,_suggestions = suggestions;
  factory _Conflict.fromJson(Map<String, dynamic> json) => _$ConflictFromJson(json);

@override final  String id;
@override final  ConflictType type;
 final  List<String> _entryIds;
@override List<String> get entryIds {
  if (_entryIds is EqualUnmodifiableListView) return _entryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entryIds);
}

@override final  String message;
 final  List<ConflictSuggestion> _suggestions;
@override List<ConflictSuggestion> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}

@override final  DateTime? detectedAt;

/// Create a copy of Conflict
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConflictCopyWith<_Conflict> get copyWith => __$ConflictCopyWithImpl<_Conflict>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConflictToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conflict&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._entryIds, _entryIds)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions)&&(identical(other.detectedAt, detectedAt) || other.detectedAt == detectedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(_entryIds),message,const DeepCollectionEquality().hash(_suggestions),detectedAt);

@override
String toString() {
  return 'Conflict(id: $id, type: $type, entryIds: $entryIds, message: $message, suggestions: $suggestions, detectedAt: $detectedAt)';
}


}

/// @nodoc
abstract mixin class _$ConflictCopyWith<$Res> implements $ConflictCopyWith<$Res> {
  factory _$ConflictCopyWith(_Conflict value, $Res Function(_Conflict) _then) = __$ConflictCopyWithImpl;
@override @useResult
$Res call({
 String id, ConflictType type, List<String> entryIds, String message, List<ConflictSuggestion> suggestions, DateTime? detectedAt
});




}
/// @nodoc
class __$ConflictCopyWithImpl<$Res>
    implements _$ConflictCopyWith<$Res> {
  __$ConflictCopyWithImpl(this._self, this._then);

  final _Conflict _self;
  final $Res Function(_Conflict) _then;

/// Create a copy of Conflict
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? entryIds = null,Object? message = null,Object? suggestions = null,Object? detectedAt = freezed,}) {
  return _then(_Conflict(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ConflictType,entryIds: null == entryIds ? _self._entryIds : entryIds // ignore: cast_nullable_to_non_nullable
as List<String>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<ConflictSuggestion>,detectedAt: freezed == detectedAt ? _self.detectedAt : detectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
