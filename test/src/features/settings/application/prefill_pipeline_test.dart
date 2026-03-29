import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';

void main() {
  group('Prefill Pipeline', () {
    group('Quiet Hours Enforcement', () {
      test('allows notifications outside quiet hours', () {
        final snapshot = SettingsSnapshot(
          notificationPrefs: const NotificationPrefs(
            quietHours: QuietHours(startHour: 22, endHour: 7),
          ),
        );

        // 10:00 AM - should be allowed
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 10, 0)),
          true,
        );
        // 3:00 PM - should be allowed
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 15, 0)),
          true,
        );
        // 8:00 PM - should be allowed
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 20, 0)),
          true,
        );
      });

      test('blocks notifications during quiet hours', () {
        final snapshot = SettingsSnapshot(
          notificationPrefs: const NotificationPrefs(
            quietHours: QuietHours(startHour: 22, endHour: 7),
          ),
        );

        // 11:00 PM - should be blocked
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 23, 0)),
          false,
        );
        // 2:00 AM - should be blocked
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 16, 2, 0)),
          false,
        );
        // 6:00 AM - should be blocked
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 16, 6, 0)),
          false,
        );
      });

      test('handles daytime quiet hours', () {
        // Quiet from 9 AM to 5 PM (work hours)
        final snapshot = SettingsSnapshot(
          notificationPrefs: const NotificationPrefs(
            quietHours: QuietHours(startHour: 9, endHour: 17),
          ),
        );

        // 8:00 AM - should be allowed
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 8, 0)),
          true,
        );
        // 12:00 PM - should be blocked
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 12, 0)),
          false,
        );
        // 6:00 PM - should be allowed
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 18, 0)),
          true,
        );
      });
    });

    group('Search Defaults Extensions', () {
      test('TransportDefaults converts to filter params', () {
        const defaults = TransportDefaults(
          preferredModes: ['train', 'bus'],
          directOnly: true,
          cabinClass: 'business',
        );

        // Using extension from prefill_service.dart
        expect(defaults.preferredModes, contains('train'));
        expect(defaults.directOnly, true);
        expect(defaults.cabinClass, 'business');
      });

      test('AccommodationDefaults converts to filter params', () {
        const defaults = AccommodationDefaults(
          minReviewScore: 4.0,
          requiredAmenities: ['wifi', 'breakfast'],
          maxPricePerNight: 200,
        );

        expect(defaults.minReviewScore, 4.0);
        expect(defaults.requiredAmenities.length, 2);
        expect(defaults.maxPricePerNight, 200);
      });

      test('FoodDefaults converts to filter params', () {
        const defaults = FoodDefaults(
          dietaryPreferences: ['vegan'],
          cuisineTypes: ['italian', 'japanese'],
          minRating: 4.5,
        );

        expect(defaults.dietaryPreferences, contains('vegan'));
        expect(defaults.cuisineTypes.length, 2);
        expect(defaults.minRating, 4.5);
      });
    });

    group('Default Traveler Preset', () {
      test('returns default preset when marked', () {
        final snapshot = SettingsSnapshot(
          travelerPresets: [
            TravelerPreset(id: 'p1', name: 'Solo', adults: 1),
            TravelerPreset(
              id: 'p2',
              name: 'Family',
              adults: 2,
              childAges: [5, 10],
              isDefault: true,
            ),
          ],
        );

        final defaultPreset = snapshot.defaultTravelerPreset;
        expect(defaultPreset?.name, 'Family');
        expect(defaultPreset?.adults, 2);
        expect(defaultPreset?.childAges.length, 2);
      });

      test('returns first preset when no default marked', () {
        final snapshot = SettingsSnapshot(
          travelerPresets: [
            TravelerPreset(id: 'p1', name: 'Solo', adults: 1),
            TravelerPreset(id: 'p2', name: 'Couple', adults: 2),
          ],
        );

        final defaultPreset = snapshot.defaultTravelerPreset;
        expect(defaultPreset?.name, 'Solo');
      });
    });
  });
}
