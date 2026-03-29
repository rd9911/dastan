class DedupeStrategy {
  static String transport({
    required String mode,
    required String origin,
    required String destination,
    required DateTime departAt,
    String? vendor,
  }) {
    final parts = [
      'transport',
      mode,
      origin,
      destination,
      departAt.toIso8601String(),
    ];
    if (vendor != null) {
      parts.add(vendor);
    }
    return parts.join('-');
  }

  static String accommodation({
    required String type,
    required String name,
    required DateTime checkIn,
  }) {
    return 'accommodation-$type-$name-${checkIn.toIso8601String()}';
  }
}
