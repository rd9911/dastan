// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminSession {

 String get sessionId; String get userId; String get email; AdminRole get role; DateTime get issuedAt; DateTime get expiresAt; String? get ipAddress; String? get deviceId; bool get requiresReauth; Map<String, dynamic>? get posture;
/// Create a copy of AdminSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminSessionCopyWith<AdminSession> get copyWith => _$AdminSessionCopyWithImpl<AdminSession>(this as AdminSession, _$identity);

  /// Serializes this AdminSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.requiresReauth, requiresReauth) || other.requiresReauth == requiresReauth)&&const DeepCollectionEquality().equals(other.posture, posture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,userId,email,role,issuedAt,expiresAt,ipAddress,deviceId,requiresReauth,const DeepCollectionEquality().hash(posture));

@override
String toString() {
  return 'AdminSession(sessionId: $sessionId, userId: $userId, email: $email, role: $role, issuedAt: $issuedAt, expiresAt: $expiresAt, ipAddress: $ipAddress, deviceId: $deviceId, requiresReauth: $requiresReauth, posture: $posture)';
}


}

/// @nodoc
abstract mixin class $AdminSessionCopyWith<$Res>  {
  factory $AdminSessionCopyWith(AdminSession value, $Res Function(AdminSession) _then) = _$AdminSessionCopyWithImpl;
@useResult
$Res call({
 String sessionId, String userId, String email, AdminRole role, DateTime issuedAt, DateTime expiresAt, String? ipAddress, String? deviceId, bool requiresReauth, Map<String, dynamic>? posture
});




}
/// @nodoc
class _$AdminSessionCopyWithImpl<$Res>
    implements $AdminSessionCopyWith<$Res> {
  _$AdminSessionCopyWithImpl(this._self, this._then);

  final AdminSession _self;
  final $Res Function(AdminSession) _then;

/// Create a copy of AdminSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? userId = null,Object? email = null,Object? role = null,Object? issuedAt = null,Object? expiresAt = null,Object? ipAddress = freezed,Object? deviceId = freezed,Object? requiresReauth = null,Object? posture = freezed,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AdminRole,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,requiresReauth: null == requiresReauth ? _self.requiresReauth : requiresReauth // ignore: cast_nullable_to_non_nullable
as bool,posture: freezed == posture ? _self.posture : posture // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminSession].
extension AdminSessionPatterns on AdminSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminSession value)  $default,){
final _that = this;
switch (_that) {
case _AdminSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminSession value)?  $default,){
final _that = this;
switch (_that) {
case _AdminSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  String userId,  String email,  AdminRole role,  DateTime issuedAt,  DateTime expiresAt,  String? ipAddress,  String? deviceId,  bool requiresReauth,  Map<String, dynamic>? posture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminSession() when $default != null:
return $default(_that.sessionId,_that.userId,_that.email,_that.role,_that.issuedAt,_that.expiresAt,_that.ipAddress,_that.deviceId,_that.requiresReauth,_that.posture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  String userId,  String email,  AdminRole role,  DateTime issuedAt,  DateTime expiresAt,  String? ipAddress,  String? deviceId,  bool requiresReauth,  Map<String, dynamic>? posture)  $default,) {final _that = this;
switch (_that) {
case _AdminSession():
return $default(_that.sessionId,_that.userId,_that.email,_that.role,_that.issuedAt,_that.expiresAt,_that.ipAddress,_that.deviceId,_that.requiresReauth,_that.posture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  String userId,  String email,  AdminRole role,  DateTime issuedAt,  DateTime expiresAt,  String? ipAddress,  String? deviceId,  bool requiresReauth,  Map<String, dynamic>? posture)?  $default,) {final _that = this;
switch (_that) {
case _AdminSession() when $default != null:
return $default(_that.sessionId,_that.userId,_that.email,_that.role,_that.issuedAt,_that.expiresAt,_that.ipAddress,_that.deviceId,_that.requiresReauth,_that.posture);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminSession extends AdminSession {
  const _AdminSession({required this.sessionId, required this.userId, required this.email, required this.role, required this.issuedAt, required this.expiresAt, this.ipAddress, this.deviceId, this.requiresReauth = false, final  Map<String, dynamic>? posture}): _posture = posture,super._();
  factory _AdminSession.fromJson(Map<String, dynamic> json) => _$AdminSessionFromJson(json);

@override final  String sessionId;
@override final  String userId;
@override final  String email;
@override final  AdminRole role;
@override final  DateTime issuedAt;
@override final  DateTime expiresAt;
@override final  String? ipAddress;
@override final  String? deviceId;
@override@JsonKey() final  bool requiresReauth;
 final  Map<String, dynamic>? _posture;
@override Map<String, dynamic>? get posture {
  final value = _posture;
  if (value == null) return null;
  if (_posture is EqualUnmodifiableMapView) return _posture;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AdminSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminSessionCopyWith<_AdminSession> get copyWith => __$AdminSessionCopyWithImpl<_AdminSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.requiresReauth, requiresReauth) || other.requiresReauth == requiresReauth)&&const DeepCollectionEquality().equals(other._posture, _posture));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,userId,email,role,issuedAt,expiresAt,ipAddress,deviceId,requiresReauth,const DeepCollectionEquality().hash(_posture));

@override
String toString() {
  return 'AdminSession(sessionId: $sessionId, userId: $userId, email: $email, role: $role, issuedAt: $issuedAt, expiresAt: $expiresAt, ipAddress: $ipAddress, deviceId: $deviceId, requiresReauth: $requiresReauth, posture: $posture)';
}


}

/// @nodoc
abstract mixin class _$AdminSessionCopyWith<$Res> implements $AdminSessionCopyWith<$Res> {
  factory _$AdminSessionCopyWith(_AdminSession value, $Res Function(_AdminSession) _then) = __$AdminSessionCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, String userId, String email, AdminRole role, DateTime issuedAt, DateTime expiresAt, String? ipAddress, String? deviceId, bool requiresReauth, Map<String, dynamic>? posture
});




}
/// @nodoc
class __$AdminSessionCopyWithImpl<$Res>
    implements _$AdminSessionCopyWith<$Res> {
  __$AdminSessionCopyWithImpl(this._self, this._then);

  final _AdminSession _self;
  final $Res Function(_AdminSession) _then;

/// Create a copy of AdminSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? userId = null,Object? email = null,Object? role = null,Object? issuedAt = null,Object? expiresAt = null,Object? ipAddress = freezed,Object? deviceId = freezed,Object? requiresReauth = null,Object? posture = freezed,}) {
  return _then(_AdminSession(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AdminRole,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,requiresReauth: null == requiresReauth ? _self.requiresReauth : requiresReauth // ignore: cast_nullable_to_non_nullable
as bool,posture: freezed == posture ? _self._posture : posture // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$AdminAction {

 String get id; String get actorId; String get actorEmail; AdminRole get actorRole; AdminActionType get actionType; String get resource; String? get targetId; String? get targetType; String get reason; String? get ticketUrl; Map<String, dynamic>? get details; String? get approvedBy; DateTime? get approvedAt; DateTime get createdAt; String? get previousHash;// For cryptographic chaining
 String? get hash;
/// Create a copy of AdminAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminActionCopyWith<AdminAction> get copyWith => _$AdminActionCopyWithImpl<AdminAction>(this as AdminAction, _$identity);

  /// Serializes this AdminAction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminAction&&(identical(other.id, id) || other.id == id)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.actorEmail, actorEmail) || other.actorEmail == actorEmail)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.resource, resource) || other.resource == resource)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.ticketUrl, ticketUrl) || other.ticketUrl == ticketUrl)&&const DeepCollectionEquality().equals(other.details, details)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.previousHash, previousHash) || other.previousHash == previousHash)&&(identical(other.hash, hash) || other.hash == hash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,actorId,actorEmail,actorRole,actionType,resource,targetId,targetType,reason,ticketUrl,const DeepCollectionEquality().hash(details),approvedBy,approvedAt,createdAt,previousHash,hash);

@override
String toString() {
  return 'AdminAction(id: $id, actorId: $actorId, actorEmail: $actorEmail, actorRole: $actorRole, actionType: $actionType, resource: $resource, targetId: $targetId, targetType: $targetType, reason: $reason, ticketUrl: $ticketUrl, details: $details, approvedBy: $approvedBy, approvedAt: $approvedAt, createdAt: $createdAt, previousHash: $previousHash, hash: $hash)';
}


}

/// @nodoc
abstract mixin class $AdminActionCopyWith<$Res>  {
  factory $AdminActionCopyWith(AdminAction value, $Res Function(AdminAction) _then) = _$AdminActionCopyWithImpl;
@useResult
$Res call({
 String id, String actorId, String actorEmail, AdminRole actorRole, AdminActionType actionType, String resource, String? targetId, String? targetType, String reason, String? ticketUrl, Map<String, dynamic>? details, String? approvedBy, DateTime? approvedAt, DateTime createdAt, String? previousHash, String? hash
});




}
/// @nodoc
class _$AdminActionCopyWithImpl<$Res>
    implements $AdminActionCopyWith<$Res> {
  _$AdminActionCopyWithImpl(this._self, this._then);

  final AdminAction _self;
  final $Res Function(AdminAction) _then;

/// Create a copy of AdminAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? actorId = null,Object? actorEmail = null,Object? actorRole = null,Object? actionType = null,Object? resource = null,Object? targetId = freezed,Object? targetType = freezed,Object? reason = null,Object? ticketUrl = freezed,Object? details = freezed,Object? approvedBy = freezed,Object? approvedAt = freezed,Object? createdAt = null,Object? previousHash = freezed,Object? hash = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,actorEmail: null == actorEmail ? _self.actorEmail : actorEmail // ignore: cast_nullable_to_non_nullable
as String,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as AdminRole,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as AdminActionType,resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as String,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,targetType: freezed == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,ticketUrl: freezed == ticketUrl ? _self.ticketUrl : ticketUrl // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,previousHash: freezed == previousHash ? _self.previousHash : previousHash // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminAction].
extension AdminActionPatterns on AdminAction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminAction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminAction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminAction value)  $default,){
final _that = this;
switch (_that) {
case _AdminAction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminAction value)?  $default,){
final _that = this;
switch (_that) {
case _AdminAction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String actorId,  String actorEmail,  AdminRole actorRole,  AdminActionType actionType,  String resource,  String? targetId,  String? targetType,  String reason,  String? ticketUrl,  Map<String, dynamic>? details,  String? approvedBy,  DateTime? approvedAt,  DateTime createdAt,  String? previousHash,  String? hash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminAction() when $default != null:
return $default(_that.id,_that.actorId,_that.actorEmail,_that.actorRole,_that.actionType,_that.resource,_that.targetId,_that.targetType,_that.reason,_that.ticketUrl,_that.details,_that.approvedBy,_that.approvedAt,_that.createdAt,_that.previousHash,_that.hash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String actorId,  String actorEmail,  AdminRole actorRole,  AdminActionType actionType,  String resource,  String? targetId,  String? targetType,  String reason,  String? ticketUrl,  Map<String, dynamic>? details,  String? approvedBy,  DateTime? approvedAt,  DateTime createdAt,  String? previousHash,  String? hash)  $default,) {final _that = this;
switch (_that) {
case _AdminAction():
return $default(_that.id,_that.actorId,_that.actorEmail,_that.actorRole,_that.actionType,_that.resource,_that.targetId,_that.targetType,_that.reason,_that.ticketUrl,_that.details,_that.approvedBy,_that.approvedAt,_that.createdAt,_that.previousHash,_that.hash);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String actorId,  String actorEmail,  AdminRole actorRole,  AdminActionType actionType,  String resource,  String? targetId,  String? targetType,  String reason,  String? ticketUrl,  Map<String, dynamic>? details,  String? approvedBy,  DateTime? approvedAt,  DateTime createdAt,  String? previousHash,  String? hash)?  $default,) {final _that = this;
switch (_that) {
case _AdminAction() when $default != null:
return $default(_that.id,_that.actorId,_that.actorEmail,_that.actorRole,_that.actionType,_that.resource,_that.targetId,_that.targetType,_that.reason,_that.ticketUrl,_that.details,_that.approvedBy,_that.approvedAt,_that.createdAt,_that.previousHash,_that.hash);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminAction implements AdminAction {
  const _AdminAction({required this.id, required this.actorId, required this.actorEmail, required this.actorRole, required this.actionType, required this.resource, this.targetId, this.targetType, required this.reason, this.ticketUrl, final  Map<String, dynamic>? details, this.approvedBy, this.approvedAt, required this.createdAt, this.previousHash, this.hash}): _details = details;
  factory _AdminAction.fromJson(Map<String, dynamic> json) => _$AdminActionFromJson(json);

@override final  String id;
@override final  String actorId;
@override final  String actorEmail;
@override final  AdminRole actorRole;
@override final  AdminActionType actionType;
@override final  String resource;
@override final  String? targetId;
@override final  String? targetType;
@override final  String reason;
@override final  String? ticketUrl;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? approvedBy;
@override final  DateTime? approvedAt;
@override final  DateTime createdAt;
@override final  String? previousHash;
// For cryptographic chaining
@override final  String? hash;

/// Create a copy of AdminAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminActionCopyWith<_AdminAction> get copyWith => __$AdminActionCopyWithImpl<_AdminAction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminActionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminAction&&(identical(other.id, id) || other.id == id)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.actorEmail, actorEmail) || other.actorEmail == actorEmail)&&(identical(other.actorRole, actorRole) || other.actorRole == actorRole)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.resource, resource) || other.resource == resource)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.ticketUrl, ticketUrl) || other.ticketUrl == ticketUrl)&&const DeepCollectionEquality().equals(other._details, _details)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.previousHash, previousHash) || other.previousHash == previousHash)&&(identical(other.hash, hash) || other.hash == hash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,actorId,actorEmail,actorRole,actionType,resource,targetId,targetType,reason,ticketUrl,const DeepCollectionEquality().hash(_details),approvedBy,approvedAt,createdAt,previousHash,hash);

@override
String toString() {
  return 'AdminAction(id: $id, actorId: $actorId, actorEmail: $actorEmail, actorRole: $actorRole, actionType: $actionType, resource: $resource, targetId: $targetId, targetType: $targetType, reason: $reason, ticketUrl: $ticketUrl, details: $details, approvedBy: $approvedBy, approvedAt: $approvedAt, createdAt: $createdAt, previousHash: $previousHash, hash: $hash)';
}


}

/// @nodoc
abstract mixin class _$AdminActionCopyWith<$Res> implements $AdminActionCopyWith<$Res> {
  factory _$AdminActionCopyWith(_AdminAction value, $Res Function(_AdminAction) _then) = __$AdminActionCopyWithImpl;
@override @useResult
$Res call({
 String id, String actorId, String actorEmail, AdminRole actorRole, AdminActionType actionType, String resource, String? targetId, String? targetType, String reason, String? ticketUrl, Map<String, dynamic>? details, String? approvedBy, DateTime? approvedAt, DateTime createdAt, String? previousHash, String? hash
});




}
/// @nodoc
class __$AdminActionCopyWithImpl<$Res>
    implements _$AdminActionCopyWith<$Res> {
  __$AdminActionCopyWithImpl(this._self, this._then);

  final _AdminAction _self;
  final $Res Function(_AdminAction) _then;

/// Create a copy of AdminAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? actorId = null,Object? actorEmail = null,Object? actorRole = null,Object? actionType = null,Object? resource = null,Object? targetId = freezed,Object? targetType = freezed,Object? reason = null,Object? ticketUrl = freezed,Object? details = freezed,Object? approvedBy = freezed,Object? approvedAt = freezed,Object? createdAt = null,Object? previousHash = freezed,Object? hash = freezed,}) {
  return _then(_AdminAction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,actorEmail: null == actorEmail ? _self.actorEmail : actorEmail // ignore: cast_nullable_to_non_nullable
as String,actorRole: null == actorRole ? _self.actorRole : actorRole // ignore: cast_nullable_to_non_nullable
as AdminRole,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as AdminActionType,resource: null == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as String,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,targetType: freezed == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,ticketUrl: freezed == ticketUrl ? _self.ticketUrl : ticketUrl // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,previousHash: freezed == previousHash ? _self.previousHash : previousHash // ignore: cast_nullable_to_non_nullable
as String?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PolicyDecision {

 bool get allowed; String? get reason; bool get requiresApproval; bool get requiresJustification; bool get requiresIpAllowlist;
/// Create a copy of PolicyDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PolicyDecisionCopyWith<PolicyDecision> get copyWith => _$PolicyDecisionCopyWithImpl<PolicyDecision>(this as PolicyDecision, _$identity);

  /// Serializes this PolicyDecision to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicyDecision&&(identical(other.allowed, allowed) || other.allowed == allowed)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requiresApproval, requiresApproval) || other.requiresApproval == requiresApproval)&&(identical(other.requiresJustification, requiresJustification) || other.requiresJustification == requiresJustification)&&(identical(other.requiresIpAllowlist, requiresIpAllowlist) || other.requiresIpAllowlist == requiresIpAllowlist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowed,reason,requiresApproval,requiresJustification,requiresIpAllowlist);

@override
String toString() {
  return 'PolicyDecision(allowed: $allowed, reason: $reason, requiresApproval: $requiresApproval, requiresJustification: $requiresJustification, requiresIpAllowlist: $requiresIpAllowlist)';
}


}

/// @nodoc
abstract mixin class $PolicyDecisionCopyWith<$Res>  {
  factory $PolicyDecisionCopyWith(PolicyDecision value, $Res Function(PolicyDecision) _then) = _$PolicyDecisionCopyWithImpl;
@useResult
$Res call({
 bool allowed, String? reason, bool requiresApproval, bool requiresJustification, bool requiresIpAllowlist
});




}
/// @nodoc
class _$PolicyDecisionCopyWithImpl<$Res>
    implements $PolicyDecisionCopyWith<$Res> {
  _$PolicyDecisionCopyWithImpl(this._self, this._then);

  final PolicyDecision _self;
  final $Res Function(PolicyDecision) _then;

/// Create a copy of PolicyDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowed = null,Object? reason = freezed,Object? requiresApproval = null,Object? requiresJustification = null,Object? requiresIpAllowlist = null,}) {
  return _then(_self.copyWith(
allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,requiresApproval: null == requiresApproval ? _self.requiresApproval : requiresApproval // ignore: cast_nullable_to_non_nullable
as bool,requiresJustification: null == requiresJustification ? _self.requiresJustification : requiresJustification // ignore: cast_nullable_to_non_nullable
as bool,requiresIpAllowlist: null == requiresIpAllowlist ? _self.requiresIpAllowlist : requiresIpAllowlist // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PolicyDecision].
extension PolicyDecisionPatterns on PolicyDecision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PolicyDecision value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PolicyDecision() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PolicyDecision value)  $default,){
final _that = this;
switch (_that) {
case _PolicyDecision():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PolicyDecision value)?  $default,){
final _that = this;
switch (_that) {
case _PolicyDecision() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool allowed,  String? reason,  bool requiresApproval,  bool requiresJustification,  bool requiresIpAllowlist)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PolicyDecision() when $default != null:
return $default(_that.allowed,_that.reason,_that.requiresApproval,_that.requiresJustification,_that.requiresIpAllowlist);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool allowed,  String? reason,  bool requiresApproval,  bool requiresJustification,  bool requiresIpAllowlist)  $default,) {final _that = this;
switch (_that) {
case _PolicyDecision():
return $default(_that.allowed,_that.reason,_that.requiresApproval,_that.requiresJustification,_that.requiresIpAllowlist);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool allowed,  String? reason,  bool requiresApproval,  bool requiresJustification,  bool requiresIpAllowlist)?  $default,) {final _that = this;
switch (_that) {
case _PolicyDecision() when $default != null:
return $default(_that.allowed,_that.reason,_that.requiresApproval,_that.requiresJustification,_that.requiresIpAllowlist);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PolicyDecision implements PolicyDecision {
  const _PolicyDecision({required this.allowed, this.reason, this.requiresApproval = false, this.requiresJustification = false, this.requiresIpAllowlist = false});
  factory _PolicyDecision.fromJson(Map<String, dynamic> json) => _$PolicyDecisionFromJson(json);

@override final  bool allowed;
@override final  String? reason;
@override@JsonKey() final  bool requiresApproval;
@override@JsonKey() final  bool requiresJustification;
@override@JsonKey() final  bool requiresIpAllowlist;

/// Create a copy of PolicyDecision
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PolicyDecisionCopyWith<_PolicyDecision> get copyWith => __$PolicyDecisionCopyWithImpl<_PolicyDecision>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PolicyDecisionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PolicyDecision&&(identical(other.allowed, allowed) || other.allowed == allowed)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requiresApproval, requiresApproval) || other.requiresApproval == requiresApproval)&&(identical(other.requiresJustification, requiresJustification) || other.requiresJustification == requiresJustification)&&(identical(other.requiresIpAllowlist, requiresIpAllowlist) || other.requiresIpAllowlist == requiresIpAllowlist));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowed,reason,requiresApproval,requiresJustification,requiresIpAllowlist);

@override
String toString() {
  return 'PolicyDecision(allowed: $allowed, reason: $reason, requiresApproval: $requiresApproval, requiresJustification: $requiresJustification, requiresIpAllowlist: $requiresIpAllowlist)';
}


}

/// @nodoc
abstract mixin class _$PolicyDecisionCopyWith<$Res> implements $PolicyDecisionCopyWith<$Res> {
  factory _$PolicyDecisionCopyWith(_PolicyDecision value, $Res Function(_PolicyDecision) _then) = __$PolicyDecisionCopyWithImpl;
@override @useResult
$Res call({
 bool allowed, String? reason, bool requiresApproval, bool requiresJustification, bool requiresIpAllowlist
});




}
/// @nodoc
class __$PolicyDecisionCopyWithImpl<$Res>
    implements _$PolicyDecisionCopyWith<$Res> {
  __$PolicyDecisionCopyWithImpl(this._self, this._then);

  final _PolicyDecision _self;
  final $Res Function(_PolicyDecision) _then;

/// Create a copy of PolicyDecision
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowed = null,Object? reason = freezed,Object? requiresApproval = null,Object? requiresJustification = null,Object? requiresIpAllowlist = null,}) {
  return _then(_PolicyDecision(
allowed: null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,requiresApproval: null == requiresApproval ? _self.requiresApproval : requiresApproval // ignore: cast_nullable_to_non_nullable
as bool,requiresJustification: null == requiresJustification ? _self.requiresJustification : requiresJustification // ignore: cast_nullable_to_non_nullable
as bool,requiresIpAllowlist: null == requiresIpAllowlist ? _self.requiresIpAllowlist : requiresIpAllowlist // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$IdempotencyRecord {

 String get key; String get actionType; String get result; DateTime get createdAt; DateTime get expiresAt; String? get mutationId;
/// Create a copy of IdempotencyRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdempotencyRecordCopyWith<IdempotencyRecord> get copyWith => _$IdempotencyRecordCopyWithImpl<IdempotencyRecord>(this as IdempotencyRecord, _$identity);

  /// Serializes this IdempotencyRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdempotencyRecord&&(identical(other.key, key) || other.key == key)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.result, result) || other.result == result)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.mutationId, mutationId) || other.mutationId == mutationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,actionType,result,createdAt,expiresAt,mutationId);

@override
String toString() {
  return 'IdempotencyRecord(key: $key, actionType: $actionType, result: $result, createdAt: $createdAt, expiresAt: $expiresAt, mutationId: $mutationId)';
}


}

/// @nodoc
abstract mixin class $IdempotencyRecordCopyWith<$Res>  {
  factory $IdempotencyRecordCopyWith(IdempotencyRecord value, $Res Function(IdempotencyRecord) _then) = _$IdempotencyRecordCopyWithImpl;
@useResult
$Res call({
 String key, String actionType, String result, DateTime createdAt, DateTime expiresAt, String? mutationId
});




}
/// @nodoc
class _$IdempotencyRecordCopyWithImpl<$Res>
    implements $IdempotencyRecordCopyWith<$Res> {
  _$IdempotencyRecordCopyWithImpl(this._self, this._then);

  final IdempotencyRecord _self;
  final $Res Function(IdempotencyRecord) _then;

/// Create a copy of IdempotencyRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? actionType = null,Object? result = null,Object? createdAt = null,Object? expiresAt = null,Object? mutationId = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,mutationId: freezed == mutationId ? _self.mutationId : mutationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IdempotencyRecord].
extension IdempotencyRecordPatterns on IdempotencyRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdempotencyRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdempotencyRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdempotencyRecord value)  $default,){
final _that = this;
switch (_that) {
case _IdempotencyRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdempotencyRecord value)?  $default,){
final _that = this;
switch (_that) {
case _IdempotencyRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String actionType,  String result,  DateTime createdAt,  DateTime expiresAt,  String? mutationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdempotencyRecord() when $default != null:
return $default(_that.key,_that.actionType,_that.result,_that.createdAt,_that.expiresAt,_that.mutationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String actionType,  String result,  DateTime createdAt,  DateTime expiresAt,  String? mutationId)  $default,) {final _that = this;
switch (_that) {
case _IdempotencyRecord():
return $default(_that.key,_that.actionType,_that.result,_that.createdAt,_that.expiresAt,_that.mutationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String actionType,  String result,  DateTime createdAt,  DateTime expiresAt,  String? mutationId)?  $default,) {final _that = this;
switch (_that) {
case _IdempotencyRecord() when $default != null:
return $default(_that.key,_that.actionType,_that.result,_that.createdAt,_that.expiresAt,_that.mutationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdempotencyRecord implements IdempotencyRecord {
  const _IdempotencyRecord({required this.key, required this.actionType, required this.result, required this.createdAt, required this.expiresAt, this.mutationId});
  factory _IdempotencyRecord.fromJson(Map<String, dynamic> json) => _$IdempotencyRecordFromJson(json);

@override final  String key;
@override final  String actionType;
@override final  String result;
@override final  DateTime createdAt;
@override final  DateTime expiresAt;
@override final  String? mutationId;

/// Create a copy of IdempotencyRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdempotencyRecordCopyWith<_IdempotencyRecord> get copyWith => __$IdempotencyRecordCopyWithImpl<_IdempotencyRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdempotencyRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdempotencyRecord&&(identical(other.key, key) || other.key == key)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.result, result) || other.result == result)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.mutationId, mutationId) || other.mutationId == mutationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,actionType,result,createdAt,expiresAt,mutationId);

@override
String toString() {
  return 'IdempotencyRecord(key: $key, actionType: $actionType, result: $result, createdAt: $createdAt, expiresAt: $expiresAt, mutationId: $mutationId)';
}


}

/// @nodoc
abstract mixin class _$IdempotencyRecordCopyWith<$Res> implements $IdempotencyRecordCopyWith<$Res> {
  factory _$IdempotencyRecordCopyWith(_IdempotencyRecord value, $Res Function(_IdempotencyRecord) _then) = __$IdempotencyRecordCopyWithImpl;
@override @useResult
$Res call({
 String key, String actionType, String result, DateTime createdAt, DateTime expiresAt, String? mutationId
});




}
/// @nodoc
class __$IdempotencyRecordCopyWithImpl<$Res>
    implements _$IdempotencyRecordCopyWith<$Res> {
  __$IdempotencyRecordCopyWithImpl(this._self, this._then);

  final _IdempotencyRecord _self;
  final $Res Function(_IdempotencyRecord) _then;

/// Create a copy of IdempotencyRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? actionType = null,Object? result = null,Object? createdAt = null,Object? expiresAt = null,Object? mutationId = freezed,}) {
  return _then(_IdempotencyRecord(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,mutationId: freezed == mutationId ? _self.mutationId : mutationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OverrideGrant {

 String get id; String get userId; String get key; dynamic get value; String get reason; String get grantedBy; DateTime get createdAt; DateTime? get expiresAt; DateTime? get revokedAt; String? get revokedBy;
/// Create a copy of OverrideGrant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverrideGrantCopyWith<OverrideGrant> get copyWith => _$OverrideGrantCopyWithImpl<OverrideGrant>(this as OverrideGrant, _$identity);

  /// Serializes this OverrideGrant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverrideGrant&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.grantedBy, grantedBy) || other.grantedBy == grantedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.revokedAt, revokedAt) || other.revokedAt == revokedAt)&&(identical(other.revokedBy, revokedBy) || other.revokedBy == revokedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,key,const DeepCollectionEquality().hash(value),reason,grantedBy,createdAt,expiresAt,revokedAt,revokedBy);

@override
String toString() {
  return 'OverrideGrant(id: $id, userId: $userId, key: $key, value: $value, reason: $reason, grantedBy: $grantedBy, createdAt: $createdAt, expiresAt: $expiresAt, revokedAt: $revokedAt, revokedBy: $revokedBy)';
}


}

/// @nodoc
abstract mixin class $OverrideGrantCopyWith<$Res>  {
  factory $OverrideGrantCopyWith(OverrideGrant value, $Res Function(OverrideGrant) _then) = _$OverrideGrantCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String key, dynamic value, String reason, String grantedBy, DateTime createdAt, DateTime? expiresAt, DateTime? revokedAt, String? revokedBy
});




}
/// @nodoc
class _$OverrideGrantCopyWithImpl<$Res>
    implements $OverrideGrantCopyWith<$Res> {
  _$OverrideGrantCopyWithImpl(this._self, this._then);

  final OverrideGrant _self;
  final $Res Function(OverrideGrant) _then;

/// Create a copy of OverrideGrant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? key = null,Object? value = freezed,Object? reason = null,Object? grantedBy = null,Object? createdAt = null,Object? expiresAt = freezed,Object? revokedAt = freezed,Object? revokedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,grantedBy: null == grantedBy ? _self.grantedBy : grantedBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,revokedAt: freezed == revokedAt ? _self.revokedAt : revokedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,revokedBy: freezed == revokedBy ? _self.revokedBy : revokedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OverrideGrant].
extension OverrideGrantPatterns on OverrideGrant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverrideGrant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverrideGrant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverrideGrant value)  $default,){
final _that = this;
switch (_that) {
case _OverrideGrant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverrideGrant value)?  $default,){
final _that = this;
switch (_that) {
case _OverrideGrant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String key,  dynamic value,  String reason,  String grantedBy,  DateTime createdAt,  DateTime? expiresAt,  DateTime? revokedAt,  String? revokedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverrideGrant() when $default != null:
return $default(_that.id,_that.userId,_that.key,_that.value,_that.reason,_that.grantedBy,_that.createdAt,_that.expiresAt,_that.revokedAt,_that.revokedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String key,  dynamic value,  String reason,  String grantedBy,  DateTime createdAt,  DateTime? expiresAt,  DateTime? revokedAt,  String? revokedBy)  $default,) {final _that = this;
switch (_that) {
case _OverrideGrant():
return $default(_that.id,_that.userId,_that.key,_that.value,_that.reason,_that.grantedBy,_that.createdAt,_that.expiresAt,_that.revokedAt,_that.revokedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String key,  dynamic value,  String reason,  String grantedBy,  DateTime createdAt,  DateTime? expiresAt,  DateTime? revokedAt,  String? revokedBy)?  $default,) {final _that = this;
switch (_that) {
case _OverrideGrant() when $default != null:
return $default(_that.id,_that.userId,_that.key,_that.value,_that.reason,_that.grantedBy,_that.createdAt,_that.expiresAt,_that.revokedAt,_that.revokedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OverrideGrant extends OverrideGrant {
  const _OverrideGrant({required this.id, required this.userId, required this.key, required this.value, required this.reason, required this.grantedBy, required this.createdAt, this.expiresAt, this.revokedAt, this.revokedBy}): super._();
  factory _OverrideGrant.fromJson(Map<String, dynamic> json) => _$OverrideGrantFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String key;
@override final  dynamic value;
@override final  String reason;
@override final  String grantedBy;
@override final  DateTime createdAt;
@override final  DateTime? expiresAt;
@override final  DateTime? revokedAt;
@override final  String? revokedBy;

/// Create a copy of OverrideGrant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverrideGrantCopyWith<_OverrideGrant> get copyWith => __$OverrideGrantCopyWithImpl<_OverrideGrant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverrideGrantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverrideGrant&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.key, key) || other.key == key)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.grantedBy, grantedBy) || other.grantedBy == grantedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.revokedAt, revokedAt) || other.revokedAt == revokedAt)&&(identical(other.revokedBy, revokedBy) || other.revokedBy == revokedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,key,const DeepCollectionEquality().hash(value),reason,grantedBy,createdAt,expiresAt,revokedAt,revokedBy);

@override
String toString() {
  return 'OverrideGrant(id: $id, userId: $userId, key: $key, value: $value, reason: $reason, grantedBy: $grantedBy, createdAt: $createdAt, expiresAt: $expiresAt, revokedAt: $revokedAt, revokedBy: $revokedBy)';
}


}

/// @nodoc
abstract mixin class _$OverrideGrantCopyWith<$Res> implements $OverrideGrantCopyWith<$Res> {
  factory _$OverrideGrantCopyWith(_OverrideGrant value, $Res Function(_OverrideGrant) _then) = __$OverrideGrantCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String key, dynamic value, String reason, String grantedBy, DateTime createdAt, DateTime? expiresAt, DateTime? revokedAt, String? revokedBy
});




}
/// @nodoc
class __$OverrideGrantCopyWithImpl<$Res>
    implements _$OverrideGrantCopyWith<$Res> {
  __$OverrideGrantCopyWithImpl(this._self, this._then);

  final _OverrideGrant _self;
  final $Res Function(_OverrideGrant) _then;

/// Create a copy of OverrideGrant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? key = null,Object? value = freezed,Object? reason = null,Object? grantedBy = null,Object? createdAt = null,Object? expiresAt = freezed,Object? revokedAt = freezed,Object? revokedBy = freezed,}) {
  return _then(_OverrideGrant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,grantedBy: null == grantedBy ? _self.grantedBy : grantedBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,revokedAt: freezed == revokedAt ? _self.revokedAt : revokedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,revokedBy: freezed == revokedBy ? _self.revokedBy : revokedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AbuseSignal {

 String get id; String get userId; AbuseType get type; AbuseSeverity get severity; String get description; Map<String, dynamic>? get evidence; DateTime get detectedAt; DateTime? get reviewedAt; String? get reviewedBy; AbuseResolution? get resolution;
/// Create a copy of AbuseSignal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbuseSignalCopyWith<AbuseSignal> get copyWith => _$AbuseSignalCopyWithImpl<AbuseSignal>(this as AbuseSignal, _$identity);

  /// Serializes this AbuseSignal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbuseSignal&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.evidence, evidence)&&(identical(other.detectedAt, detectedAt) || other.detectedAt == detectedAt)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy)&&(identical(other.resolution, resolution) || other.resolution == resolution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,severity,description,const DeepCollectionEquality().hash(evidence),detectedAt,reviewedAt,reviewedBy,resolution);

@override
String toString() {
  return 'AbuseSignal(id: $id, userId: $userId, type: $type, severity: $severity, description: $description, evidence: $evidence, detectedAt: $detectedAt, reviewedAt: $reviewedAt, reviewedBy: $reviewedBy, resolution: $resolution)';
}


}

/// @nodoc
abstract mixin class $AbuseSignalCopyWith<$Res>  {
  factory $AbuseSignalCopyWith(AbuseSignal value, $Res Function(AbuseSignal) _then) = _$AbuseSignalCopyWithImpl;
@useResult
$Res call({
 String id, String userId, AbuseType type, AbuseSeverity severity, String description, Map<String, dynamic>? evidence, DateTime detectedAt, DateTime? reviewedAt, String? reviewedBy, AbuseResolution? resolution
});




}
/// @nodoc
class _$AbuseSignalCopyWithImpl<$Res>
    implements $AbuseSignalCopyWith<$Res> {
  _$AbuseSignalCopyWithImpl(this._self, this._then);

  final AbuseSignal _self;
  final $Res Function(AbuseSignal) _then;

/// Create a copy of AbuseSignal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? severity = null,Object? description = null,Object? evidence = freezed,Object? detectedAt = null,Object? reviewedAt = freezed,Object? reviewedBy = freezed,Object? resolution = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AbuseType,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AbuseSeverity,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,evidence: freezed == evidence ? _self.evidence : evidence // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,detectedAt: null == detectedAt ? _self.detectedAt : detectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,resolution: freezed == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as AbuseResolution?,
  ));
}

}


/// Adds pattern-matching-related methods to [AbuseSignal].
extension AbuseSignalPatterns on AbuseSignal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbuseSignal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbuseSignal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbuseSignal value)  $default,){
final _that = this;
switch (_that) {
case _AbuseSignal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbuseSignal value)?  $default,){
final _that = this;
switch (_that) {
case _AbuseSignal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  AbuseType type,  AbuseSeverity severity,  String description,  Map<String, dynamic>? evidence,  DateTime detectedAt,  DateTime? reviewedAt,  String? reviewedBy,  AbuseResolution? resolution)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbuseSignal() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.severity,_that.description,_that.evidence,_that.detectedAt,_that.reviewedAt,_that.reviewedBy,_that.resolution);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  AbuseType type,  AbuseSeverity severity,  String description,  Map<String, dynamic>? evidence,  DateTime detectedAt,  DateTime? reviewedAt,  String? reviewedBy,  AbuseResolution? resolution)  $default,) {final _that = this;
switch (_that) {
case _AbuseSignal():
return $default(_that.id,_that.userId,_that.type,_that.severity,_that.description,_that.evidence,_that.detectedAt,_that.reviewedAt,_that.reviewedBy,_that.resolution);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  AbuseType type,  AbuseSeverity severity,  String description,  Map<String, dynamic>? evidence,  DateTime detectedAt,  DateTime? reviewedAt,  String? reviewedBy,  AbuseResolution? resolution)?  $default,) {final _that = this;
switch (_that) {
case _AbuseSignal() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.severity,_that.description,_that.evidence,_that.detectedAt,_that.reviewedAt,_that.reviewedBy,_that.resolution);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbuseSignal implements AbuseSignal {
  const _AbuseSignal({required this.id, required this.userId, required this.type, required this.severity, required this.description, final  Map<String, dynamic>? evidence, required this.detectedAt, this.reviewedAt, this.reviewedBy, this.resolution}): _evidence = evidence;
  factory _AbuseSignal.fromJson(Map<String, dynamic> json) => _$AbuseSignalFromJson(json);

@override final  String id;
@override final  String userId;
@override final  AbuseType type;
@override final  AbuseSeverity severity;
@override final  String description;
 final  Map<String, dynamic>? _evidence;
@override Map<String, dynamic>? get evidence {
  final value = _evidence;
  if (value == null) return null;
  if (_evidence is EqualUnmodifiableMapView) return _evidence;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime detectedAt;
@override final  DateTime? reviewedAt;
@override final  String? reviewedBy;
@override final  AbuseResolution? resolution;

/// Create a copy of AbuseSignal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbuseSignalCopyWith<_AbuseSignal> get copyWith => __$AbuseSignalCopyWithImpl<_AbuseSignal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbuseSignalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbuseSignal&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._evidence, _evidence)&&(identical(other.detectedAt, detectedAt) || other.detectedAt == detectedAt)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy)&&(identical(other.resolution, resolution) || other.resolution == resolution));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,severity,description,const DeepCollectionEquality().hash(_evidence),detectedAt,reviewedAt,reviewedBy,resolution);

@override
String toString() {
  return 'AbuseSignal(id: $id, userId: $userId, type: $type, severity: $severity, description: $description, evidence: $evidence, detectedAt: $detectedAt, reviewedAt: $reviewedAt, reviewedBy: $reviewedBy, resolution: $resolution)';
}


}

/// @nodoc
abstract mixin class _$AbuseSignalCopyWith<$Res> implements $AbuseSignalCopyWith<$Res> {
  factory _$AbuseSignalCopyWith(_AbuseSignal value, $Res Function(_AbuseSignal) _then) = __$AbuseSignalCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, AbuseType type, AbuseSeverity severity, String description, Map<String, dynamic>? evidence, DateTime detectedAt, DateTime? reviewedAt, String? reviewedBy, AbuseResolution? resolution
});




}
/// @nodoc
class __$AbuseSignalCopyWithImpl<$Res>
    implements _$AbuseSignalCopyWith<$Res> {
  __$AbuseSignalCopyWithImpl(this._self, this._then);

  final _AbuseSignal _self;
  final $Res Function(_AbuseSignal) _then;

/// Create a copy of AbuseSignal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? severity = null,Object? description = null,Object? evidence = freezed,Object? detectedAt = null,Object? reviewedAt = freezed,Object? reviewedBy = freezed,Object? resolution = freezed,}) {
  return _then(_AbuseSignal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AbuseType,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AbuseSeverity,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,evidence: freezed == evidence ? _self._evidence : evidence // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,detectedAt: null == detectedAt ? _self.detectedAt : detectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,resolution: freezed == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as AbuseResolution?,
  ));
}


}


/// @nodoc
mixin _$TakedownRequest {

 String get id; String get targetType;// snapshot, itinerary, user
 String get targetId; String get reason; String get requestedBy; DateTime get requestedAt; String? get approvedBy; DateTime? get approvedAt; String? get deniedBy; DateTime? get deniedAt; String? get denyReason;
/// Create a copy of TakedownRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TakedownRequestCopyWith<TakedownRequest> get copyWith => _$TakedownRequestCopyWithImpl<TakedownRequest>(this as TakedownRequest, _$identity);

  /// Serializes this TakedownRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakedownRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.deniedBy, deniedBy) || other.deniedBy == deniedBy)&&(identical(other.deniedAt, deniedAt) || other.deniedAt == deniedAt)&&(identical(other.denyReason, denyReason) || other.denyReason == denyReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,targetType,targetId,reason,requestedBy,requestedAt,approvedBy,approvedAt,deniedBy,deniedAt,denyReason);

@override
String toString() {
  return 'TakedownRequest(id: $id, targetType: $targetType, targetId: $targetId, reason: $reason, requestedBy: $requestedBy, requestedAt: $requestedAt, approvedBy: $approvedBy, approvedAt: $approvedAt, deniedBy: $deniedBy, deniedAt: $deniedAt, denyReason: $denyReason)';
}


}

/// @nodoc
abstract mixin class $TakedownRequestCopyWith<$Res>  {
  factory $TakedownRequestCopyWith(TakedownRequest value, $Res Function(TakedownRequest) _then) = _$TakedownRequestCopyWithImpl;
@useResult
$Res call({
 String id, String targetType, String targetId, String reason, String requestedBy, DateTime requestedAt, String? approvedBy, DateTime? approvedAt, String? deniedBy, DateTime? deniedAt, String? denyReason
});




}
/// @nodoc
class _$TakedownRequestCopyWithImpl<$Res>
    implements $TakedownRequestCopyWith<$Res> {
  _$TakedownRequestCopyWithImpl(this._self, this._then);

  final TakedownRequest _self;
  final $Res Function(TakedownRequest) _then;

/// Create a copy of TakedownRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? targetType = null,Object? targetId = null,Object? reason = null,Object? requestedBy = null,Object? requestedAt = null,Object? approvedBy = freezed,Object? approvedAt = freezed,Object? deniedBy = freezed,Object? deniedAt = freezed,Object? denyReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deniedBy: freezed == deniedBy ? _self.deniedBy : deniedBy // ignore: cast_nullable_to_non_nullable
as String?,deniedAt: freezed == deniedAt ? _self.deniedAt : deniedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,denyReason: freezed == denyReason ? _self.denyReason : denyReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TakedownRequest].
extension TakedownRequestPatterns on TakedownRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TakedownRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TakedownRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TakedownRequest value)  $default,){
final _that = this;
switch (_that) {
case _TakedownRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TakedownRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TakedownRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String targetType,  String targetId,  String reason,  String requestedBy,  DateTime requestedAt,  String? approvedBy,  DateTime? approvedAt,  String? deniedBy,  DateTime? deniedAt,  String? denyReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TakedownRequest() when $default != null:
return $default(_that.id,_that.targetType,_that.targetId,_that.reason,_that.requestedBy,_that.requestedAt,_that.approvedBy,_that.approvedAt,_that.deniedBy,_that.deniedAt,_that.denyReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String targetType,  String targetId,  String reason,  String requestedBy,  DateTime requestedAt,  String? approvedBy,  DateTime? approvedAt,  String? deniedBy,  DateTime? deniedAt,  String? denyReason)  $default,) {final _that = this;
switch (_that) {
case _TakedownRequest():
return $default(_that.id,_that.targetType,_that.targetId,_that.reason,_that.requestedBy,_that.requestedAt,_that.approvedBy,_that.approvedAt,_that.deniedBy,_that.deniedAt,_that.denyReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String targetType,  String targetId,  String reason,  String requestedBy,  DateTime requestedAt,  String? approvedBy,  DateTime? approvedAt,  String? deniedBy,  DateTime? deniedAt,  String? denyReason)?  $default,) {final _that = this;
switch (_that) {
case _TakedownRequest() when $default != null:
return $default(_that.id,_that.targetType,_that.targetId,_that.reason,_that.requestedBy,_that.requestedAt,_that.approvedBy,_that.approvedAt,_that.deniedBy,_that.deniedAt,_that.denyReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TakedownRequest extends TakedownRequest {
  const _TakedownRequest({required this.id, required this.targetType, required this.targetId, required this.reason, required this.requestedBy, required this.requestedAt, this.approvedBy, this.approvedAt, this.deniedBy, this.deniedAt, this.denyReason}): super._();
  factory _TakedownRequest.fromJson(Map<String, dynamic> json) => _$TakedownRequestFromJson(json);

@override final  String id;
@override final  String targetType;
// snapshot, itinerary, user
@override final  String targetId;
@override final  String reason;
@override final  String requestedBy;
@override final  DateTime requestedAt;
@override final  String? approvedBy;
@override final  DateTime? approvedAt;
@override final  String? deniedBy;
@override final  DateTime? deniedAt;
@override final  String? denyReason;

/// Create a copy of TakedownRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TakedownRequestCopyWith<_TakedownRequest> get copyWith => __$TakedownRequestCopyWithImpl<_TakedownRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TakedownRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TakedownRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.deniedBy, deniedBy) || other.deniedBy == deniedBy)&&(identical(other.deniedAt, deniedAt) || other.deniedAt == deniedAt)&&(identical(other.denyReason, denyReason) || other.denyReason == denyReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,targetType,targetId,reason,requestedBy,requestedAt,approvedBy,approvedAt,deniedBy,deniedAt,denyReason);

@override
String toString() {
  return 'TakedownRequest(id: $id, targetType: $targetType, targetId: $targetId, reason: $reason, requestedBy: $requestedBy, requestedAt: $requestedAt, approvedBy: $approvedBy, approvedAt: $approvedAt, deniedBy: $deniedBy, deniedAt: $deniedAt, denyReason: $denyReason)';
}


}

/// @nodoc
abstract mixin class _$TakedownRequestCopyWith<$Res> implements $TakedownRequestCopyWith<$Res> {
  factory _$TakedownRequestCopyWith(_TakedownRequest value, $Res Function(_TakedownRequest) _then) = __$TakedownRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String targetType, String targetId, String reason, String requestedBy, DateTime requestedAt, String? approvedBy, DateTime? approvedAt, String? deniedBy, DateTime? deniedAt, String? denyReason
});




}
/// @nodoc
class __$TakedownRequestCopyWithImpl<$Res>
    implements _$TakedownRequestCopyWith<$Res> {
  __$TakedownRequestCopyWithImpl(this._self, this._then);

  final _TakedownRequest _self;
  final $Res Function(_TakedownRequest) _then;

/// Create a copy of TakedownRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? targetType = null,Object? targetId = null,Object? reason = null,Object? requestedBy = null,Object? requestedAt = null,Object? approvedBy = freezed,Object? approvedAt = freezed,Object? deniedBy = freezed,Object? deniedAt = freezed,Object? denyReason = freezed,}) {
  return _then(_TakedownRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deniedBy: freezed == deniedBy ? _self.deniedBy : deniedBy // ignore: cast_nullable_to_non_nullable
as String?,deniedAt: freezed == deniedAt ? _self.deniedAt : deniedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,denyReason: freezed == denyReason ? _self.denyReason : denyReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
