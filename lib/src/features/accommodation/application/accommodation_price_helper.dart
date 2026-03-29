import 'package:dastan/src/features/accommodation/domain/property_item.dart';

/// Utilities for normalizing and displaying accommodation prices.
class AccommodationPriceHelper {
  /// Computes total price including all taxes and fees.
  static double computeTotal(PriceBreakdown breakdown) {
    return breakdown.basePrice + breakdown.taxes + breakdown.fees;
  }

  /// Formats price for display with currency symbol.
  static String formatPrice(double amount, String currency) {
    final symbol = _currencySymbols[currency.toUpperCase()] ?? currency;
    return '$symbol${amount.toStringAsFixed(0)}';
  }

  /// Formats price breakdown for display.
  static String formatBreakdown(PriceBreakdown breakdown) {
    final buffer = StringBuffer();
    final symbol =
        _currencySymbols[breakdown.currency.toUpperCase()] ??
        breakdown.currency;

    if (breakdown.nights != null && breakdown.pricePerNight != null) {
      buffer.write(
        '$symbol${breakdown.pricePerNight!.toStringAsFixed(0)}/night × ${breakdown.nights} nights',
      );
    } else {
      buffer.write('Base: $symbol${breakdown.basePrice.toStringAsFixed(0)}');
    }

    if (breakdown.taxes > 0) {
      buffer.write('\nTaxes: $symbol${breakdown.taxes.toStringAsFixed(0)}');
    }
    if (breakdown.fees > 0) {
      buffer.write('\nFees: $symbol${breakdown.fees.toStringAsFixed(0)}');
    }

    buffer.write('\nTotal: $symbol${breakdown.total.toStringAsFixed(0)}');
    return buffer.toString();
  }

  /// Gets cancellation deadline display string.
  ///
  /// Returns relative time (e.g., "2 days left") if within a week,
  /// otherwise returns formatted date.
  static String formatCancellationDeadline(DateTime deadline) {
    final now = DateTime.now();
    final difference = deadline.difference(now);

    if (difference.isNegative) {
      return 'Deadline passed';
    }

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes} min left';
      }
      return '${difference.inHours}h left';
    }

    if (difference.inDays == 1) {
      return '1 day left';
    }

    if (difference.inDays < 7) {
      return '${difference.inDays} days left';
    }

    // Format as date
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[deadline.month - 1]} ${deadline.day}';
  }

  /// Gets refundability badge text.
  static String getRefundabilityBadge(RoomOption room) {
    if (!room.refundable) {
      return 'Non-refundable';
    }
    if (room.cancellationDeadline != null) {
      final deadline = formatCancellationDeadline(room.cancellationDeadline!);
      return 'Free cancellation ($deadline)';
    }
    return 'Free cancellation';
  }

  /// Formats ETA for display.
  static String formatEta(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (mins == 0) {
      return '${hours}h';
    }
    return '${hours}h ${mins}m';
  }

  /// Common currency symbols
  static const _currencySymbols = {
    'USD': '\$',
    'EUR': '€',
    'GBP': '£',
    'JPY': '¥',
    'CNY': '¥',
    'INR': '₹',
    'AUD': 'A\$',
    'CAD': 'C\$',
    'CHF': 'CHF ',
    'KRW': '₩',
    'MXN': 'MX\$',
    'BRL': 'R\$',
  };
}
