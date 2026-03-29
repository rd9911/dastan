// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collab_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItineraryMember {

 String get userId; String get email; MemberRole get role; DateTime get joinedAt; DateTime? get lastSeenAt; String? get displayName; String? get avatarUrl;
/// Create a copy of ItineraryMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraryMemberCopyWith<ItineraryMember> get copyWith => _$ItineraryMemberCopyWithImpl<ItineraryMember>(this as ItineraryMember, _$identity);

  /// Serializes this ItineraryMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItineraryMember&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,email,role,joinedAt,lastSeenAt,displayName,avatarUrl);

@override
String toString() {
  return 'ItineraryMember(userId: $userId, email: $email, role: $role, joinedAt: $joinedAt, lastSeenAt: $lastSeenAt, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ItineraryMemberCopyWith<$Res>  {
  factory $ItineraryMemberCopyWith(ItineraryMember value, $Res Function(ItineraryMember) _then) = _$ItineraryMemberCopyWithImpl;
@useResult
$Res call({
 String userId, String email, MemberRole role, DateTime joinedAt, DateTime? lastSeenAt, String? displayName, String? avatarUrl
});




}
/// @nodoc
class _$ItineraryMemberCopyWithImpl<$Res>
    implements $ItineraryMemberCopyWith<$Res> {
  _$ItineraryMemberCopyWithImpl(this._self, this._then);

  final ItineraryMember _self;
  final $Res Function(ItineraryMember) _then;

/// Create a copy of ItineraryMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? role = null,Object? joinedAt = null,Object? lastSeenAt = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MemberRole,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ItineraryMember].
extension ItineraryMemberPatterns on ItineraryMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItineraryMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItineraryMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItineraryMember value)  $default,){
final _that = this;
switch (_that) {
case _ItineraryMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItineraryMember value)?  $default,){
final _that = this;
switch (_that) {
case _ItineraryMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String email,  MemberRole role,  DateTime joinedAt,  DateTime? lastSeenAt,  String? displayName,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItineraryMember() when $default != null:
return $default(_that.userId,_that.email,_that.role,_that.joinedAt,_that.lastSeenAt,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String email,  MemberRole role,  DateTime joinedAt,  DateTime? lastSeenAt,  String? displayName,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ItineraryMember():
return $default(_that.userId,_that.email,_that.role,_that.joinedAt,_that.lastSeenAt,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String email,  MemberRole role,  DateTime joinedAt,  DateTime? lastSeenAt,  String? displayName,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ItineraryMember() when $default != null:
return $default(_that.userId,_that.email,_that.role,_that.joinedAt,_that.lastSeenAt,_that.displayName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItineraryMember implements ItineraryMember {
  const _ItineraryMember({required this.userId, required this.email, required this.role, required this.joinedAt, this.lastSeenAt, this.displayName, this.avatarUrl});
  factory _ItineraryMember.fromJson(Map<String, dynamic> json) => _$ItineraryMemberFromJson(json);

@override final  String userId;
@override final  String email;
@override final  MemberRole role;
@override final  DateTime joinedAt;
@override final  DateTime? lastSeenAt;
@override final  String? displayName;
@override final  String? avatarUrl;

/// Create a copy of ItineraryMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItineraryMemberCopyWith<_ItineraryMember> get copyWith => __$ItineraryMemberCopyWithImpl<_ItineraryMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItineraryMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItineraryMember&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,email,role,joinedAt,lastSeenAt,displayName,avatarUrl);

@override
String toString() {
  return 'ItineraryMember(userId: $userId, email: $email, role: $role, joinedAt: $joinedAt, lastSeenAt: $lastSeenAt, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ItineraryMemberCopyWith<$Res> implements $ItineraryMemberCopyWith<$Res> {
  factory _$ItineraryMemberCopyWith(_ItineraryMember value, $Res Function(_ItineraryMember) _then) = __$ItineraryMemberCopyWithImpl;
@override @useResult
$Res call({
 String userId, String email, MemberRole role, DateTime joinedAt, DateTime? lastSeenAt, String? displayName, String? avatarUrl
});




}
/// @nodoc
class __$ItineraryMemberCopyWithImpl<$Res>
    implements _$ItineraryMemberCopyWith<$Res> {
  __$ItineraryMemberCopyWithImpl(this._self, this._then);

  final _ItineraryMember _self;
  final $Res Function(_ItineraryMember) _then;

/// Create a copy of ItineraryMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? role = null,Object? joinedAt = null,Object? lastSeenAt = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_ItineraryMember(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MemberRole,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InviteRequest {

 String get itineraryId; List<String> get emails; MemberRole get role; String? get message;
/// Create a copy of InviteRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteRequestCopyWith<InviteRequest> get copyWith => _$InviteRequestCopyWithImpl<InviteRequest>(this as InviteRequest, _$identity);

  /// Serializes this InviteRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&const DeepCollectionEquality().equals(other.emails, emails)&&(identical(other.role, role) || other.role == role)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,const DeepCollectionEquality().hash(emails),role,message);

@override
String toString() {
  return 'InviteRequest(itineraryId: $itineraryId, emails: $emails, role: $role, message: $message)';
}


}

/// @nodoc
abstract mixin class $InviteRequestCopyWith<$Res>  {
  factory $InviteRequestCopyWith(InviteRequest value, $Res Function(InviteRequest) _then) = _$InviteRequestCopyWithImpl;
@useResult
$Res call({
 String itineraryId, List<String> emails, MemberRole role, String? message
});




}
/// @nodoc
class _$InviteRequestCopyWithImpl<$Res>
    implements $InviteRequestCopyWith<$Res> {
  _$InviteRequestCopyWithImpl(this._self, this._then);

  final InviteRequest _self;
  final $Res Function(InviteRequest) _then;

/// Create a copy of InviteRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? emails = null,Object? role = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,emails: null == emails ? _self.emails : emails // ignore: cast_nullable_to_non_nullable
as List<String>,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MemberRole,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InviteRequest].
extension InviteRequestPatterns on InviteRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InviteRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InviteRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InviteRequest value)  $default,){
final _that = this;
switch (_that) {
case _InviteRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InviteRequest value)?  $default,){
final _that = this;
switch (_that) {
case _InviteRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  List<String> emails,  MemberRole role,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InviteRequest() when $default != null:
return $default(_that.itineraryId,_that.emails,_that.role,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  List<String> emails,  MemberRole role,  String? message)  $default,) {final _that = this;
switch (_that) {
case _InviteRequest():
return $default(_that.itineraryId,_that.emails,_that.role,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  List<String> emails,  MemberRole role,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _InviteRequest() when $default != null:
return $default(_that.itineraryId,_that.emails,_that.role,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InviteRequest implements InviteRequest {
  const _InviteRequest({required this.itineraryId, required final  List<String> emails, required this.role, this.message}): _emails = emails;
  factory _InviteRequest.fromJson(Map<String, dynamic> json) => _$InviteRequestFromJson(json);

@override final  String itineraryId;
 final  List<String> _emails;
@override List<String> get emails {
  if (_emails is EqualUnmodifiableListView) return _emails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emails);
}

@override final  MemberRole role;
@override final  String? message;

/// Create a copy of InviteRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InviteRequestCopyWith<_InviteRequest> get copyWith => __$InviteRequestCopyWithImpl<_InviteRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InviteRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InviteRequest&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&const DeepCollectionEquality().equals(other._emails, _emails)&&(identical(other.role, role) || other.role == role)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,const DeepCollectionEquality().hash(_emails),role,message);

@override
String toString() {
  return 'InviteRequest(itineraryId: $itineraryId, emails: $emails, role: $role, message: $message)';
}


}

/// @nodoc
abstract mixin class _$InviteRequestCopyWith<$Res> implements $InviteRequestCopyWith<$Res> {
  factory _$InviteRequestCopyWith(_InviteRequest value, $Res Function(_InviteRequest) _then) = __$InviteRequestCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, List<String> emails, MemberRole role, String? message
});




}
/// @nodoc
class __$InviteRequestCopyWithImpl<$Res>
    implements _$InviteRequestCopyWith<$Res> {
  __$InviteRequestCopyWithImpl(this._self, this._then);

  final _InviteRequest _self;
  final $Res Function(_InviteRequest) _then;

/// Create a copy of InviteRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? emails = null,Object? role = null,Object? message = freezed,}) {
  return _then(_InviteRequest(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,emails: null == emails ? _self._emails : emails // ignore: cast_nullable_to_non_nullable
as List<String>,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MemberRole,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InviteAccept {

 String get inviteToken;
/// Create a copy of InviteAccept
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteAcceptCopyWith<InviteAccept> get copyWith => _$InviteAcceptCopyWithImpl<InviteAccept>(this as InviteAccept, _$identity);

  /// Serializes this InviteAccept to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteAccept&&(identical(other.inviteToken, inviteToken) || other.inviteToken == inviteToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteToken);

@override
String toString() {
  return 'InviteAccept(inviteToken: $inviteToken)';
}


}

/// @nodoc
abstract mixin class $InviteAcceptCopyWith<$Res>  {
  factory $InviteAcceptCopyWith(InviteAccept value, $Res Function(InviteAccept) _then) = _$InviteAcceptCopyWithImpl;
@useResult
$Res call({
 String inviteToken
});




}
/// @nodoc
class _$InviteAcceptCopyWithImpl<$Res>
    implements $InviteAcceptCopyWith<$Res> {
  _$InviteAcceptCopyWithImpl(this._self, this._then);

  final InviteAccept _self;
  final $Res Function(InviteAccept) _then;

/// Create a copy of InviteAccept
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inviteToken = null,}) {
  return _then(_self.copyWith(
inviteToken: null == inviteToken ? _self.inviteToken : inviteToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InviteAccept].
extension InviteAcceptPatterns on InviteAccept {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InviteAccept value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InviteAccept() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InviteAccept value)  $default,){
final _that = this;
switch (_that) {
case _InviteAccept():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InviteAccept value)?  $default,){
final _that = this;
switch (_that) {
case _InviteAccept() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String inviteToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InviteAccept() when $default != null:
return $default(_that.inviteToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String inviteToken)  $default,) {final _that = this;
switch (_that) {
case _InviteAccept():
return $default(_that.inviteToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String inviteToken)?  $default,) {final _that = this;
switch (_that) {
case _InviteAccept() when $default != null:
return $default(_that.inviteToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InviteAccept implements InviteAccept {
  const _InviteAccept({required this.inviteToken});
  factory _InviteAccept.fromJson(Map<String, dynamic> json) => _$InviteAcceptFromJson(json);

@override final  String inviteToken;

/// Create a copy of InviteAccept
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InviteAcceptCopyWith<_InviteAccept> get copyWith => __$InviteAcceptCopyWithImpl<_InviteAccept>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InviteAcceptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InviteAccept&&(identical(other.inviteToken, inviteToken) || other.inviteToken == inviteToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inviteToken);

@override
String toString() {
  return 'InviteAccept(inviteToken: $inviteToken)';
}


}

/// @nodoc
abstract mixin class _$InviteAcceptCopyWith<$Res> implements $InviteAcceptCopyWith<$Res> {
  factory _$InviteAcceptCopyWith(_InviteAccept value, $Res Function(_InviteAccept) _then) = __$InviteAcceptCopyWithImpl;
@override @useResult
$Res call({
 String inviteToken
});




}
/// @nodoc
class __$InviteAcceptCopyWithImpl<$Res>
    implements _$InviteAcceptCopyWith<$Res> {
  __$InviteAcceptCopyWithImpl(this._self, this._then);

  final _InviteAccept _self;
  final $Res Function(_InviteAccept) _then;

/// Create a copy of InviteAccept
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inviteToken = null,}) {
  return _then(_InviteAccept(
inviteToken: null == inviteToken ? _self.inviteToken : inviteToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Invite {

 String get id; String get itineraryId; String get email; MemberRole get role; String get token; InviteStatus get status; DateTime get createdAt; DateTime? get acceptedAt; String? get invitedByUserId; String? get message;
/// Create a copy of Invite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteCopyWith<Invite> get copyWith => _$InviteCopyWithImpl<Invite>(this as Invite, _$identity);

  /// Serializes this Invite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invite&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.token, token) || other.token == token)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.invitedByUserId, invitedByUserId) || other.invitedByUserId == invitedByUserId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryId,email,role,token,status,createdAt,acceptedAt,invitedByUserId,message);

@override
String toString() {
  return 'Invite(id: $id, itineraryId: $itineraryId, email: $email, role: $role, token: $token, status: $status, createdAt: $createdAt, acceptedAt: $acceptedAt, invitedByUserId: $invitedByUserId, message: $message)';
}


}

/// @nodoc
abstract mixin class $InviteCopyWith<$Res>  {
  factory $InviteCopyWith(Invite value, $Res Function(Invite) _then) = _$InviteCopyWithImpl;
@useResult
$Res call({
 String id, String itineraryId, String email, MemberRole role, String token, InviteStatus status, DateTime createdAt, DateTime? acceptedAt, String? invitedByUserId, String? message
});




}
/// @nodoc
class _$InviteCopyWithImpl<$Res>
    implements $InviteCopyWith<$Res> {
  _$InviteCopyWithImpl(this._self, this._then);

  final Invite _self;
  final $Res Function(Invite) _then;

/// Create a copy of Invite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itineraryId = null,Object? email = null,Object? role = null,Object? token = null,Object? status = null,Object? createdAt = null,Object? acceptedAt = freezed,Object? invitedByUserId = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MemberRole,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InviteStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,invitedByUserId: freezed == invitedByUserId ? _self.invitedByUserId : invitedByUserId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Invite].
extension InvitePatterns on Invite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Invite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Invite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Invite value)  $default,){
final _that = this;
switch (_that) {
case _Invite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Invite value)?  $default,){
final _that = this;
switch (_that) {
case _Invite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String itineraryId,  String email,  MemberRole role,  String token,  InviteStatus status,  DateTime createdAt,  DateTime? acceptedAt,  String? invitedByUserId,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Invite() when $default != null:
return $default(_that.id,_that.itineraryId,_that.email,_that.role,_that.token,_that.status,_that.createdAt,_that.acceptedAt,_that.invitedByUserId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String itineraryId,  String email,  MemberRole role,  String token,  InviteStatus status,  DateTime createdAt,  DateTime? acceptedAt,  String? invitedByUserId,  String? message)  $default,) {final _that = this;
switch (_that) {
case _Invite():
return $default(_that.id,_that.itineraryId,_that.email,_that.role,_that.token,_that.status,_that.createdAt,_that.acceptedAt,_that.invitedByUserId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String itineraryId,  String email,  MemberRole role,  String token,  InviteStatus status,  DateTime createdAt,  DateTime? acceptedAt,  String? invitedByUserId,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _Invite() when $default != null:
return $default(_that.id,_that.itineraryId,_that.email,_that.role,_that.token,_that.status,_that.createdAt,_that.acceptedAt,_that.invitedByUserId,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Invite implements Invite {
  const _Invite({required this.id, required this.itineraryId, required this.email, required this.role, required this.token, required this.status, required this.createdAt, this.acceptedAt, this.invitedByUserId, this.message});
  factory _Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);

@override final  String id;
@override final  String itineraryId;
@override final  String email;
@override final  MemberRole role;
@override final  String token;
@override final  InviteStatus status;
@override final  DateTime createdAt;
@override final  DateTime? acceptedAt;
@override final  String? invitedByUserId;
@override final  String? message;

/// Create a copy of Invite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InviteCopyWith<_Invite> get copyWith => __$InviteCopyWithImpl<_Invite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InviteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invite&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.token, token) || other.token == token)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt)&&(identical(other.invitedByUserId, invitedByUserId) || other.invitedByUserId == invitedByUserId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryId,email,role,token,status,createdAt,acceptedAt,invitedByUserId,message);

@override
String toString() {
  return 'Invite(id: $id, itineraryId: $itineraryId, email: $email, role: $role, token: $token, status: $status, createdAt: $createdAt, acceptedAt: $acceptedAt, invitedByUserId: $invitedByUserId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$InviteCopyWith<$Res> implements $InviteCopyWith<$Res> {
  factory _$InviteCopyWith(_Invite value, $Res Function(_Invite) _then) = __$InviteCopyWithImpl;
@override @useResult
$Res call({
 String id, String itineraryId, String email, MemberRole role, String token, InviteStatus status, DateTime createdAt, DateTime? acceptedAt, String? invitedByUserId, String? message
});




}
/// @nodoc
class __$InviteCopyWithImpl<$Res>
    implements _$InviteCopyWith<$Res> {
  __$InviteCopyWithImpl(this._self, this._then);

  final _Invite _self;
  final $Res Function(_Invite) _then;

/// Create a copy of Invite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itineraryId = null,Object? email = null,Object? role = null,Object? token = null,Object? status = null,Object? createdAt = null,Object? acceptedAt = freezed,Object? invitedByUserId = freezed,Object? message = freezed,}) {
  return _then(_Invite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MemberRole,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InviteStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedAt: freezed == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,invitedByUserId: freezed == invitedByUserId ? _self.invitedByUserId : invitedByUserId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AclCheck {

 String get itineraryId; String get userId; AclAction get action;
/// Create a copy of AclCheck
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AclCheckCopyWith<AclCheck> get copyWith => _$AclCheckCopyWithImpl<AclCheck>(this as AclCheck, _$identity);

  /// Serializes this AclCheck to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AclCheck&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,userId,action);

@override
String toString() {
  return 'AclCheck(itineraryId: $itineraryId, userId: $userId, action: $action)';
}


}

/// @nodoc
abstract mixin class $AclCheckCopyWith<$Res>  {
  factory $AclCheckCopyWith(AclCheck value, $Res Function(AclCheck) _then) = _$AclCheckCopyWithImpl;
@useResult
$Res call({
 String itineraryId, String userId, AclAction action
});




}
/// @nodoc
class _$AclCheckCopyWithImpl<$Res>
    implements $AclCheckCopyWith<$Res> {
  _$AclCheckCopyWithImpl(this._self, this._then);

  final AclCheck _self;
  final $Res Function(AclCheck) _then;

/// Create a copy of AclCheck
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itineraryId = null,Object? userId = null,Object? action = null,}) {
  return _then(_self.copyWith(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AclAction,
  ));
}

}


/// Adds pattern-matching-related methods to [AclCheck].
extension AclCheckPatterns on AclCheck {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AclCheck value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AclCheck() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AclCheck value)  $default,){
final _that = this;
switch (_that) {
case _AclCheck():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AclCheck value)?  $default,){
final _that = this;
switch (_that) {
case _AclCheck() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itineraryId,  String userId,  AclAction action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AclCheck() when $default != null:
return $default(_that.itineraryId,_that.userId,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itineraryId,  String userId,  AclAction action)  $default,) {final _that = this;
switch (_that) {
case _AclCheck():
return $default(_that.itineraryId,_that.userId,_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itineraryId,  String userId,  AclAction action)?  $default,) {final _that = this;
switch (_that) {
case _AclCheck() when $default != null:
return $default(_that.itineraryId,_that.userId,_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AclCheck implements AclCheck {
  const _AclCheck({required this.itineraryId, required this.userId, required this.action});
  factory _AclCheck.fromJson(Map<String, dynamic> json) => _$AclCheckFromJson(json);

@override final  String itineraryId;
@override final  String userId;
@override final  AclAction action;

/// Create a copy of AclCheck
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AclCheckCopyWith<_AclCheck> get copyWith => __$AclCheckCopyWithImpl<_AclCheck>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AclCheckToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AclCheck&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itineraryId,userId,action);

@override
String toString() {
  return 'AclCheck(itineraryId: $itineraryId, userId: $userId, action: $action)';
}


}

/// @nodoc
abstract mixin class _$AclCheckCopyWith<$Res> implements $AclCheckCopyWith<$Res> {
  factory _$AclCheckCopyWith(_AclCheck value, $Res Function(_AclCheck) _then) = __$AclCheckCopyWithImpl;
@override @useResult
$Res call({
 String itineraryId, String userId, AclAction action
});




}
/// @nodoc
class __$AclCheckCopyWithImpl<$Res>
    implements _$AclCheckCopyWith<$Res> {
  __$AclCheckCopyWithImpl(this._self, this._then);

  final _AclCheck _self;
  final $Res Function(_AclCheck) _then;

/// Create a copy of AclCheck
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itineraryId = null,Object? userId = null,Object? action = null,}) {
  return _then(_AclCheck(
itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as AclAction,
  ));
}


}


/// @nodoc
mixin _$ActivityEvent {

 String get id; String get itineraryId; ActivityType get type; String get actorId; String? get targetId; Map<String, dynamic>? get details; DateTime get createdAt;
/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityEventCopyWith<ActivityEvent> get copyWith => _$ActivityEventCopyWithImpl<ActivityEvent>(this as ActivityEvent, _$identity);

  /// Serializes this ActivityEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.type, type) || other.type == type)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&const DeepCollectionEquality().equals(other.details, details)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryId,type,actorId,targetId,const DeepCollectionEquality().hash(details),createdAt);

@override
String toString() {
  return 'ActivityEvent(id: $id, itineraryId: $itineraryId, type: $type, actorId: $actorId, targetId: $targetId, details: $details, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ActivityEventCopyWith<$Res>  {
  factory $ActivityEventCopyWith(ActivityEvent value, $Res Function(ActivityEvent) _then) = _$ActivityEventCopyWithImpl;
@useResult
$Res call({
 String id, String itineraryId, ActivityType type, String actorId, String? targetId, Map<String, dynamic>? details, DateTime createdAt
});




}
/// @nodoc
class _$ActivityEventCopyWithImpl<$Res>
    implements $ActivityEventCopyWith<$Res> {
  _$ActivityEventCopyWithImpl(this._self, this._then);

  final ActivityEvent _self;
  final $Res Function(ActivityEvent) _then;

/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itineraryId = null,Object? type = null,Object? actorId = null,Object? targetId = freezed,Object? details = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ActivityType,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityEvent].
extension ActivityEventPatterns on ActivityEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityEvent value)  $default,){
final _that = this;
switch (_that) {
case _ActivityEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityEvent value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String itineraryId,  ActivityType type,  String actorId,  String? targetId,  Map<String, dynamic>? details,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityEvent() when $default != null:
return $default(_that.id,_that.itineraryId,_that.type,_that.actorId,_that.targetId,_that.details,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String itineraryId,  ActivityType type,  String actorId,  String? targetId,  Map<String, dynamic>? details,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ActivityEvent():
return $default(_that.id,_that.itineraryId,_that.type,_that.actorId,_that.targetId,_that.details,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String itineraryId,  ActivityType type,  String actorId,  String? targetId,  Map<String, dynamic>? details,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ActivityEvent() when $default != null:
return $default(_that.id,_that.itineraryId,_that.type,_that.actorId,_that.targetId,_that.details,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityEvent implements ActivityEvent {
  const _ActivityEvent({required this.id, required this.itineraryId, required this.type, required this.actorId, this.targetId, final  Map<String, dynamic>? details, required this.createdAt}): _details = details;
  factory _ActivityEvent.fromJson(Map<String, dynamic> json) => _$ActivityEventFromJson(json);

@override final  String id;
@override final  String itineraryId;
@override final  ActivityType type;
@override final  String actorId;
@override final  String? targetId;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime createdAt;

/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityEventCopyWith<_ActivityEvent> get copyWith => __$ActivityEventCopyWithImpl<_ActivityEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.itineraryId, itineraryId) || other.itineraryId == itineraryId)&&(identical(other.type, type) || other.type == type)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&const DeepCollectionEquality().equals(other._details, _details)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itineraryId,type,actorId,targetId,const DeepCollectionEquality().hash(_details),createdAt);

@override
String toString() {
  return 'ActivityEvent(id: $id, itineraryId: $itineraryId, type: $type, actorId: $actorId, targetId: $targetId, details: $details, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ActivityEventCopyWith<$Res> implements $ActivityEventCopyWith<$Res> {
  factory _$ActivityEventCopyWith(_ActivityEvent value, $Res Function(_ActivityEvent) _then) = __$ActivityEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String itineraryId, ActivityType type, String actorId, String? targetId, Map<String, dynamic>? details, DateTime createdAt
});




}
/// @nodoc
class __$ActivityEventCopyWithImpl<$Res>
    implements _$ActivityEventCopyWith<$Res> {
  __$ActivityEventCopyWithImpl(this._self, this._then);

  final _ActivityEvent _self;
  final $Res Function(_ActivityEvent) _then;

/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itineraryId = null,Object? type = null,Object? actorId = null,Object? targetId = freezed,Object? details = freezed,Object? createdAt = null,}) {
  return _then(_ActivityEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itineraryId: null == itineraryId ? _self.itineraryId : itineraryId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ActivityType,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AclResult {

 bool get allowed; String? get reason;
/// Create a copy of AclResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AclResultCopyWith<AclResult> get copyWith => _$AclResultCopyWithImpl<AclResult>(this as AclResult, _$identity);

  /// Serializes this AclResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AclResult&&(identical(other.allowed, allowed) || other.allowed == allowed)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowed,reason);

@override
String toString() {
  return 'AclResult(allowed: $allowed, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $AclResultCopyWith<$Res>  {
  factory $AclResultCopyWith(AclResult value, $Res Function(AclResult) _then) = _$AclResultCopyWithImpl;
@useResult
$Res call({
 bool allowed, String? reason
});




}
/// @nodoc
class _$AclResultCopyWithImpl<$Res>
    implements $AclResultCopyWith<$Res> {
  _$AclResultCopyWithImpl(this._self, this._then);

  final AclResult _self;
  final $Res Function(AclResult) _then;

/// Create a copy of AclResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowed = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AclResult].
extension AclResultPatterns on AclResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AclResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AclResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AclResult value)  $default,){
final _that = this;
switch (_that) {
case _AclResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AclResult value)?  $default,){
final _that = this;
switch (_that) {
case _AclResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool allowed,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AclResult() when $default != null:
return $default(_that.allowed,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool allowed,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _AclResult():
return $default(_that.allowed,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool allowed,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _AclResult() when $default != null:
return $default(_that.allowed,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AclResult implements AclResult {
  const _AclResult({required this.allowed, this.reason});
  factory _AclResult.fromJson(Map<String, dynamic> json) => _$AclResultFromJson(json);

@override final  bool allowed;
@override final  String? reason;

/// Create a copy of AclResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AclResultCopyWith<_AclResult> get copyWith => __$AclResultCopyWithImpl<_AclResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AclResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AclResult&&(identical(other.allowed, allowed) || other.allowed == allowed)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowed,reason);

@override
String toString() {
  return 'AclResult(allowed: $allowed, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$AclResultCopyWith<$Res> implements $AclResultCopyWith<$Res> {
  factory _$AclResultCopyWith(_AclResult value, $Res Function(_AclResult) _then) = __$AclResultCopyWithImpl;
@override @useResult
$Res call({
 bool allowed, String? reason
});




}
/// @nodoc
class __$AclResultCopyWithImpl<$Res>
    implements _$AclResultCopyWith<$Res> {
  __$AclResultCopyWithImpl(this._self, this._then);

  final _AclResult _self;
  final $Res Function(_AclResult) _then;

/// Create a copy of AclResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowed = null,Object? reason = freezed,}) {
  return _then(_AclResult(
allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
