import 'package:flutter_test/flutter_test.dart';

import 'package:dastan/src/core/domain/result.dart';

void main() {
  group('Result', () {
    group('Success', () {
      test('isSuccess returns true', () {
        const result = Success(42);
        expect(result.isSuccess, isTrue);
        expect(result.isFailure, isFalse);
      });

      test('data returns the wrapped value', () {
        const result = Success('hello');
        expect(result.data, equals('hello'));
      });

      test('getOrNull returns the data', () {
        const result = Success(42);
        expect(result.getOrNull(), equals(42));
      });

      test('getOrElse returns the data, not the fallback', () {
        const result = Success(42);
        expect(result.getOrElse(() => 0), equals(42));
      });

      test('map transforms the data', () {
        const result = Success(21);
        final mapped = result.map((x) => x * 2);
        expect(mapped, isA<Success<int>>());
        expect((mapped as Success<int>).data, equals(42));
      });

      test('flatMap chains results', () {
        const result = Success(21);
        final chained = result.flatMap((x) => Success(x * 2));
        expect(chained, isA<Success<int>>());
        expect((chained as Success<int>).data, equals(42));
      });

      test('equality works correctly', () {
        expect(const Success(42), equals(const Success(42)));
        expect(const Success(42), isNot(equals(const Success(43))));
      });
    });

    group('Failure', () {
      test('isFailure returns true', () {
        const result = Failure<int>(NetworkError());
        expect(result.isFailure, isTrue);
        expect(result.isSuccess, isFalse);
      });

      test('getOrNull returns null', () {
        const result = Failure<int>(NetworkError());
        expect(result.getOrNull(), isNull);
      });

      test('getOrElse returns the fallback', () {
        const result = Failure<int>(NetworkError());
        expect(result.getOrElse(() => 42), equals(42));
      });

      test('map preserves the failure', () {
        const result = Failure<int>(NetworkError());
        final mapped = result.map((x) => x * 2);
        expect(mapped, isA<Failure<int>>());
      });

      test('flatMap preserves the failure', () {
        const result = Failure<int>(NetworkError());
        final chained = result.flatMap((x) => Success(x * 2));
        expect(chained, isA<Failure<int>>());
      });

      test('equality works correctly', () {
        const error = NetworkError();
        expect(const Failure<int>(error), equals(const Failure<int>(error)));
      });
    });
  });

  group('AppError', () {
    test('NetworkError has correct defaults', () {
      const error = NetworkError();
      expect(error.userMessage, contains('Unable to connect'));
      expect(error.errorCode, equals('NET_ERR'));
    });

    test('NetworkError with status code', () {
      const error = NetworkError(statusCode: 404);
      expect(error.errorCode, equals('NET_404'));
    });

    test('ValidationError contains field errors', () {
      const error = ValidationError(
        userMessage: 'Invalid input',
        fieldErrors: {'email': 'Invalid email format'},
      );
      expect(error.fieldErrors['email'], equals('Invalid email format'));
      expect(error.errorCode, equals('VALIDATION'));
    });

    test('AuthError indicates reauth requirement', () {
      const error = AuthError(requiresReauth: true);
      expect(error.requiresReauth, isTrue);
      expect(error.errorCode, equals('AUTH'));
    });

    test('NotFoundError contains resource info', () {
      const error = NotFoundError(resourceType: 'User', resourceId: '123');
      expect(error.resourceType, equals('User'));
      expect(error.resourceId, equals('123'));
      expect(error.errorCode, equals('NOT_FOUND'));
    });

    test('RateLimitError contains retry info', () {
      const error = RateLimitError(retryAfter: Duration(seconds: 30));
      expect(error.retryAfter, equals(const Duration(seconds: 30)));
      expect(error.errorCode, equals('RATE_LIMIT'));
    });

    test('UnknownError wraps original error', () {
      final originalError = Exception('Something went wrong');
      final error = UnknownError(originalError: originalError);
      expect(error.originalError, equals(originalError));
      expect(error.errorCode, equals('UNKNOWN'));
    });
  });
}
