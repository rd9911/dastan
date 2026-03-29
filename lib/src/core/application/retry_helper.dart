import 'dart:async';

/// Helper for retrying operations with exponential backoff
class RetryHelper {
  /// Retries the given operation with exponential backoff
  /// Default: 3 retries with 1s, 2s, 4s delays
  static Future<T> retry<T>({
    required Future<T> Function() operation,
    int maxAttempts = 3,
    Duration initialDelay = const Duration(seconds: 1),
    bool Function(Exception)? shouldRetry,
  }) async {
    int attempts = 0;
    Duration delay = initialDelay;

    while (true) {
      try {
        attempts++;
        return await operation();
      } on Exception catch (e) {
        if (attempts >= maxAttempts) {
          rethrow;
        }

        // Check if we should retry this exception
        if (shouldRetry != null && !shouldRetry(e)) {
          rethrow;
        }

        // Wait with exponential backoff
        await Future.delayed(delay);
        delay *= 2;
      }
    }
  }

  /// Check if an exception is retryable (network errors, timeouts)
  static bool isRetryable(Exception e) {
    final message = e.toString().toLowerCase();
    return message.contains('timeout') ||
        message.contains('network') ||
        message.contains('connection') ||
        message.contains('socket');
  }
}
