/// Result type for explicit error handling.
///
/// Use this pattern instead of throwing exceptions for expected failure cases.
/// This makes error handling explicit and type-safe.
///
/// Example:
/// ```dart
/// Future<Result<User>> getUser(String id) async {
///   try {
///     final user = await api.fetchUser(id);
///     return Success(user);
///   } on NetworkException catch (e) {
///     return Failure(NetworkError(message: e.message));
///   }
/// }
///
/// // Usage:
/// final result = await getUser('123');
/// switch (result) {
///   case Success(:final data):
///     print('Got user: ${data.name}');
///   case Failure(:final error):
///     print('Error: ${error.userMessage}');
/// }
/// ```
library;

/// A result that is either a [Success] with data or a [Failure] with an error.
sealed class Result<T> {
  const Result();

  /// Returns true if this is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Returns true if this is a [Failure].
  bool get isFailure => this is Failure<T>;

  /// Maps the success value to a new type.
  Result<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      Success(:final data) => Success(transform(data)),
      Failure(:final error) => Failure(error),
    };
  }

  /// Maps the success value to a new Result.
  Result<R> flatMap<R>(Result<R> Function(T data) transform) {
    return switch (this) {
      Success(:final data) => transform(data),
      Failure(:final error) => Failure(error),
    };
  }

  /// Returns the success value or a default.
  T getOrElse(T Function() orElse) {
    return switch (this) {
      Success(:final data) => data,
      Failure() => orElse(),
    };
  }

  /// Returns the success value or null.
  T? getOrNull() {
    return switch (this) {
      Success(:final data) => data,
      Failure() => null,
    };
  }
}

/// A successful result containing data.
final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  String toString() => 'Success($data)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Success<T> && data == other.data;

  @override
  int get hashCode => data.hashCode;
}

/// A failed result containing an error.
final class Failure<T> extends Result<T> {
  final AppError error;
  const Failure(this.error);

  @override
  String toString() => 'Failure($error)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Failure<T> && error == other.error;

  @override
  int get hashCode => error.hashCode;
}

/// Base class for application errors.
///
/// Provides user-friendly messages and optional technical details for logging.
sealed class AppError {
  /// User-friendly error message for display in UI.
  String get userMessage;

  /// Optional technical details for logging/debugging.
  String? get technicalDetails => null;

  /// Optional error code for analytics/support.
  String? get errorCode => null;

  const AppError();
}

/// Network-related errors (no connection, timeout, server error).
final class NetworkError extends AppError {
  @override
  final String userMessage;
  @override
  final String? technicalDetails;
  final int? statusCode;

  const NetworkError({
    this.userMessage = 'Unable to connect. Please check your internet.',
    this.technicalDetails,
    this.statusCode,
  });

  @override
  String? get errorCode => statusCode != null ? 'NET_$statusCode' : 'NET_ERR';

  @override
  String toString() => 'NetworkError($userMessage, status: $statusCode)';
}

/// Validation errors for user input.
final class ValidationError extends AppError {
  @override
  final String userMessage;
  final Map<String, String> fieldErrors;

  const ValidationError({
    this.userMessage = 'Please check your input.',
    this.fieldErrors = const {},
  });

  @override
  String? get errorCode => 'VALIDATION';

  @override
  String toString() => 'ValidationError($userMessage, fields: $fieldErrors)';
}

/// Authentication/authorization errors.
final class AuthError extends AppError {
  @override
  final String userMessage;
  final bool requiresReauth;

  const AuthError({
    this.userMessage = 'Please sign in to continue.',
    this.requiresReauth = false,
  });

  @override
  String? get errorCode => 'AUTH';

  @override
  String toString() => 'AuthError($userMessage, reauth: $requiresReauth)';
}

/// Resource not found errors.
final class NotFoundError extends AppError {
  @override
  final String userMessage;
  final String? resourceType;
  final String? resourceId;

  const NotFoundError({
    this.userMessage = 'The requested item was not found.',
    this.resourceType,
    this.resourceId,
  });

  @override
  String? get errorCode => 'NOT_FOUND';

  @override
  String toString() =>
      'NotFoundError($userMessage, type: $resourceType, id: $resourceId)';
}

/// Rate limiting errors.
final class RateLimitError extends AppError {
  @override
  final String userMessage;
  final Duration? retryAfter;

  const RateLimitError({
    this.userMessage = 'Too many requests. Please wait a moment.',
    this.retryAfter,
  });

  @override
  String? get errorCode => 'RATE_LIMIT';

  @override
  String toString() => 'RateLimitError($userMessage, retry: $retryAfter)';
}

/// Unknown/unexpected errors.
final class UnknownError extends AppError {
  @override
  final String userMessage;
  @override
  final String? technicalDetails;
  final Object? originalError;

  const UnknownError({
    this.userMessage = 'Something went wrong. Please try again.',
    this.technicalDetails,
    this.originalError,
  });

  @override
  String? get errorCode => 'UNKNOWN';

  @override
  String toString() => 'UnknownError($userMessage)';
}
