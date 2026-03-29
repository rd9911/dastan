import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/accommodation/application/accommodation_price_helper.dart';
import 'package:dastan/src/features/accommodation/domain/property_item.dart';

void main() {
  group('AccommodationPriceHelper', () {
    group('computeTotal', () {
      test('should compute total including taxes and fees', () {
        const breakdown = PriceBreakdown(
          basePrice: 100,
          taxes: 12,
          fees: 8,
          total: 120,
          currency: 'USD',
        );

        final total = AccommodationPriceHelper.computeTotal(breakdown);

        expect(total, 120);
      });
    });

    group('formatPrice', () {
      test('should format USD with dollar sign', () {
        final formatted = AccommodationPriceHelper.formatPrice(150, 'USD');
        expect(formatted, '\$150');
      });

      test('should format EUR with euro sign', () {
        final formatted = AccommodationPriceHelper.formatPrice(200, 'EUR');
        expect(formatted, '€200');
      });

      test('should format GBP with pound sign', () {
        final formatted = AccommodationPriceHelper.formatPrice(175, 'GBP');
        expect(formatted, '£175');
      });

      test('should handle unknown currencies', () {
        final formatted = AccommodationPriceHelper.formatPrice(100, 'XYZ');
        expect(formatted, 'XYZ100');
      });

      test('should truncate decimals', () {
        final formatted = AccommodationPriceHelper.formatPrice(99.99, 'USD');
        expect(formatted, '\$100'); // Rounds to nearest
      });
    });

    group('formatBreakdown', () {
      test('should format breakdown with all components', () {
        const breakdown = PriceBreakdown(
          basePrice: 300,
          taxes: 36,
          fees: 15,
          total: 351,
          currency: 'USD',
          pricePerNight: 100,
          nights: 3,
        );

        final formatted = AccommodationPriceHelper.formatBreakdown(breakdown);

        expect(formatted, contains('\$100/night × 3 nights'));
        expect(formatted, contains('Taxes: \$36'));
        expect(formatted, contains('Fees: \$15'));
        expect(formatted, contains('Total: \$351'));
      });

      test('should handle breakdown without per-night info', () {
        const breakdown = PriceBreakdown(
          basePrice: 200,
          taxes: 24,
          fees: 0,
          total: 224,
          currency: 'EUR',
        );

        final formatted = AccommodationPriceHelper.formatBreakdown(breakdown);

        expect(formatted, contains('Base: €200'));
        expect(formatted, contains('Taxes: €24'));
        expect(formatted, isNot(contains('Fees'))); // No fees
        expect(formatted, contains('Total: €224'));
      });
    });

    group('formatCancellationDeadline', () {
      test('should show relative time for near deadlines', () {
        final deadline = DateTime.now().add(const Duration(days: 2, hours: 12));
        final formatted = AccommodationPriceHelper.formatCancellationDeadline(
          deadline,
        );
        expect(formatted, contains('days left'));
      });

      test('should show "1 day left" for tomorrow', () {
        final deadline = DateTime.now().add(const Duration(days: 1, hours: 12));
        final formatted = AccommodationPriceHelper.formatCancellationDeadline(
          deadline,
        );
        expect(formatted, anyOf(contains('1 day'), contains('day left')));
      });

      test('should show hours for same-day deadline', () {
        final deadline = DateTime.now().add(
          const Duration(hours: 5, minutes: 30),
        );
        final formatted = AccommodationPriceHelper.formatCancellationDeadline(
          deadline,
        );
        expect(formatted, contains('h left'));
      });

      test('should show date for distant deadlines', () {
        // Use a date in the future
        final deadline = DateTime.now().add(const Duration(days: 30));
        final formatted = AccommodationPriceHelper.formatCancellationDeadline(
          deadline,
        );
        // Should be a formatted date with month name and day number
        expect(
          formatted,
          matches(
            RegExp(r'(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) \d+'),
          ),
        );
      });

      test('should show "Deadline passed" for past dates', () {
        final deadline = DateTime.now().subtract(const Duration(days: 1));
        final formatted = AccommodationPriceHelper.formatCancellationDeadline(
          deadline,
        );
        expect(formatted, 'Deadline passed');
      });
    });

    group('getRefundabilityBadge', () {
      test('should return "Non-refundable" for non-refundable rooms', () {
        const room = RoomOption(
          id: 'room-1',
          name: 'Standard',
          boardPlan: 'Room Only',
          maxOccupancy: 2,
          price: PriceBreakdown(basePrice: 100, total: 100, currency: 'USD'),
          refundable: false,
        );

        final badge = AccommodationPriceHelper.getRefundabilityBadge(room);
        expect(badge, 'Non-refundable');
      });

      test('should show deadline for refundable rooms', () {
        final room = RoomOption(
          id: 'room-2',
          name: 'Flexible',
          boardPlan: 'Breakfast',
          maxOccupancy: 2,
          price: const PriceBreakdown(
            basePrice: 120,
            total: 120,
            currency: 'USD',
          ),
          refundable: true,
          cancellationDeadline: DateTime.now().add(
            const Duration(days: 3, hours: 12),
          ),
        );

        final badge = AccommodationPriceHelper.getRefundabilityBadge(room);
        expect(badge, contains('Free cancellation'));
        expect(badge, contains('days left'));
      });

      test('should return simple message for refundable without deadline', () {
        const room = RoomOption(
          id: 'room-3',
          name: 'Flexible',
          boardPlan: 'Room Only',
          maxOccupancy: 2,
          price: PriceBreakdown(basePrice: 100, total: 100, currency: 'USD'),
          refundable: true,
        );

        final badge = AccommodationPriceHelper.getRefundabilityBadge(room);
        expect(badge, 'Free cancellation');
      });
    });

    group('formatEta', () {
      test('should format minutes under an hour', () {
        expect(AccommodationPriceHelper.formatEta(15), '15 min');
        expect(AccommodationPriceHelper.formatEta(45), '45 min');
      });

      test('should format hours', () {
        expect(AccommodationPriceHelper.formatEta(60), '1h');
        expect(AccommodationPriceHelper.formatEta(120), '2h');
      });

      test('should format hours and minutes', () {
        expect(AccommodationPriceHelper.formatEta(90), '1h 30m');
        expect(AccommodationPriceHelper.formatEta(75), '1h 15m');
      });
    });
  });
}
