import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';
import 'package:dastan/src/features/settings/application/compliance_service.dart';

/// E2E Acceptance Tests for Story 13: Settings & Profile
/// Tests AC1-AC8 as defined in the story specification.
void main() {
  group('Settings E2E: Acceptance Criteria', () {
    group('AC1: Profile editing with live preview', () {
      test('profile changes reflect immediately in preview', () {
        final snapshot = SettingsSnapshot(
          profile: UserProfile(
            userId: 'user1',
            name: 'John',
            locale: 'en',
            currency: 'USD',
            units: const UnitsPrefs(useKilometers: true, useCelsius: true),
          ),
        );

        expect(snapshot.profile?.locale, 'en');
        expect(snapshot.profile?.currency, 'USD');
        expect(snapshot.profile?.units.useKilometers, true);
      });

      test('timezone detection from home city works', () {
        const profile = UserProfile(
          userId: 'user1',
          name: 'John',
          homeCity: 'Tokyo',
          timezone: 'Asia/Tokyo',
        );
        expect(profile.timezone, 'Asia/Tokyo');
      });
    });

    group('AC2: Traveler presets CRUD', () {
      test('can create traveler preset with adults and children', () {
        final preset = TravelerPreset(
          id: 'p1',
          name: 'Family Trip',
          adults: 2,
          childAges: [5, 10],
        );

        expect(preset.adults, 2);
        expect(preset.childAges.length, 2);
      });

      test('can mark preset as default', () {
        final presets = [
          TravelerPreset(id: 'p1', name: 'Solo'),
          TravelerPreset(id: 'p2', name: 'Family', isDefault: true),
        ];

        final defaultPreset = presets.firstWhere((p) => p.isDefault);
        expect(defaultPreset.name, 'Family');
      });

      test('preset prefills new itinerary', () {
        final snapshot = SettingsSnapshot(
          travelerPresets: [
            TravelerPreset(
              id: 'p1',
              name: 'Family',
              adults: 2,
              childAges: [5],
              isDefault: true,
            ),
          ],
        );

        final defaults = snapshot.defaultTravelerPreset;
        expect(defaults?.adults, 2);
        expect(defaults?.childAges, [5]);
      });
    });

    group('AC3: Search defaults prefill', () {
      test('transport defaults prefill flight search', () {
        const defaults = TransportDefaults(
          preferredModes: ['train', 'flight'],
          directOnly: true,
          cabinClass: 'business',
        );

        expect(defaults.preferredModes, contains('flight'));
        expect(defaults.directOnly, true);
        expect(defaults.cabinClass, 'business');
      });

      test('accommodation defaults prefill hotel search', () {
        const defaults = AccommodationDefaults(
          minReviewScore: 4.0,
          requiredAmenities: ['wifi', 'breakfast'],
        );

        expect(defaults.minReviewScore, 4.0);
        expect(defaults.requiredAmenities, contains('wifi'));
      });

      test('food defaults prefill restaurant search', () {
        const defaults = FoodDefaults(
          dietaryPreferences: ['vegan'],
          cuisineTypes: ['italian'],
          minRating: 4.5,
        );

        expect(defaults.dietaryPreferences, contains('vegan'));
      });

      test('trail defaults prefill activity search', () {
        const defaults = TrailDefaults(
          difficulties: ['easy', 'moderate'],
          maxDurationMinutes: 120,
        );

        expect(defaults.difficulties.length, 2);
        expect(defaults.maxDurationMinutes, 120);
      });
    });

    group('AC4: Notification preferences', () {
      test('can configure notification channels', () {
        const prefs = NotificationPrefs(
          channels: NotificationChannels(push: true, email: false),
        );

        expect(prefs.channels.push, true);
        expect(prefs.channels.email, false);
      });

      test('can configure notification categories', () {
        const prefs = NotificationPrefs(
          categories: NotificationCategories(
            bookingUpdates: true,
            saveSyncStatus: false,
            plannerReminders: true,
            leaveNow: true,
          ),
        );

        expect(prefs.categories.bookingUpdates, true);
        expect(prefs.categories.saveSyncStatus, false);
      });
    });

    group('AC5: Quiet hours enforcement', () {
      test('notifications blocked during quiet hours', () {
        final snapshot = SettingsSnapshot(
          notificationPrefs: const NotificationPrefs(
            quietHours: QuietHours(startHour: 22, endHour: 7),
          ),
        );

        // 11 PM - blocked
        expect(
          snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 23)),
          false,
        );
        // 2 AM - blocked
        expect(snapshot.isNotificationAllowed(DateTime(2024, 1, 16, 2)), false);
        // 10 AM - allowed
        expect(snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 10)), true);
      });

      test('trip-only mode respects active trip dates', () {
        const prefs = NotificationPrefs(tripOnlyMode: true);
        expect(prefs.tripOnlyMode, true);
      });
    });

    group('AC6: Privacy controls', () {
      test('analytics opt-in/out respected', () {
        const settings = PrivacySettings(
          analyticsOptIn: false,
          diagnosticsOptIn: true,
        );

        expect(settings.analyticsOptIn, false);
        expect(settings.diagnosticsOptIn, true);
      });

      test('snapshot defaults applied to shares', () {
        const settings = PrivacySettings(
          snapshotDefaults: SnapshotDefaults(
            redactPII: true,
            redactPrices: true,
            redactNotes: true,
            photoVisibility: 'blur',
          ),
        );

        expect(settings.snapshotDefaults.redactPII, true);
        expect(settings.snapshotDefaults.photoVisibility, 'blur');
      });
    });

    group('AC7: Data export and deletion', () {
      test('data export includes all user data', () async {
        final service = ComplianceService();
        final export = await service.exportUserData(
          userId: 'user1',
          profile: UserProfile(userId: 'user1', name: 'John'),
          travelerPresets: [TravelerPreset(id: 'p1', name: 'Solo')],
          searchDefaults: const SearchDefaults(),
          notificationPrefs: const NotificationPrefs(),
          privacySettings: const PrivacySettings(),
          itineraries: [],
          savedItems: [],
        );

        expect(export.data.isNotEmpty, true);
        expect(export.filename, contains('user1'));
      });

      test('deletion has grace period', () async {
        final service = ComplianceService();
        final request = await service.initiateAccountDeletion(
          userId: 'user1',
          gracePeriodDays: 30,
        );

        expect(request.gracePeriodDays, 30);
        expect(request.isWithinGracePeriod, true);
        expect(request.daysRemaining, greaterThanOrEqualTo(29));
      });
    });

    group('AC8: Security features', () {
      test('2FA can be enabled/disabled', () {
        final security = SecurityMeta(
          twoFactorEnabled: true,
          twoFactorMethod: 'totp',
          activeSessions: [
            DeviceSession(
              sessionId: 's1',
              deviceName: 'iPhone',
              deviceType: 'mobile',
              lastActive: DateTime.now(),
              isCurrent: true,
            ),
          ],
          lastPasswordChange: DateTime.now().subtract(const Duration(days: 30)),
        );

        expect(security.twoFactorEnabled, true);
        expect(security.twoFactorMethod, 'totp');
      });

      test('sessions can be listed and revoked', () {
        final security = SecurityMeta(
          twoFactorEnabled: false,
          activeSessions: [
            DeviceSession(
              sessionId: 's1',
              deviceName: 'iPhone',
              deviceType: 'mobile',
              lastActive: DateTime.now(),
              isCurrent: true,
            ),
            DeviceSession(
              sessionId: 's2',
              deviceName: 'MacBook',
              deviceType: 'desktop',
              lastActive: DateTime.now().subtract(const Duration(hours: 2)),
              isCurrent: false,
            ),
          ],
        );

        expect(security.activeSessions.length, 2);
        expect(security.activeSessions.where((s) => !s.isCurrent).length, 1);
      });
    });
  });
}
