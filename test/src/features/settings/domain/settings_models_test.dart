import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';

void main() {
  group('UserProfile', () {
    test('supports JSON round-trip', () {
      final profile = UserProfile(
        userId: 'u1',
        name: 'Alice',
        avatarUrl: 'https://example.com/avatar.jpg',
        homeCity: 'Paris',
        timezone: 'Europe/Paris',
        locale: 'fr',
        currency: 'EUR',
        units: const UnitsPrefs(
          useKilometers: true,
          useCelsius: true,
          use24HourClock: true,
        ),
      );

      final json = profile.toJson();
      final decoded = UserProfile.fromJson(json);

      expect(decoded.userId, profile.userId);
      expect(decoded.name, profile.name);
      expect(decoded.currency, 'EUR');
      expect(decoded.units.useKilometers, true);
    });

    test('has sensible defaults', () {
      final profile = UserProfile(userId: 'u1', name: 'Bob');

      expect(profile.timezone, 'UTC');
      expect(profile.locale, 'en');
      expect(profile.currency, 'USD');
    });
  });

  group('TravelerPreset', () {
    test('supports JSON round-trip', () {
      final preset = TravelerPreset(
        id: 'p1',
        name: 'Family Trip',
        adults: 2,
        childAges: [5, 10],
        isDefault: true,
      );

      final json = preset.toJson();
      final decoded = TravelerPreset.fromJson(json);

      expect(decoded.name, 'Family Trip');
      expect(decoded.childAges, [5, 10]);
      expect(decoded.isDefault, true);
    });

    test('defaults to 2 adults no children', () {
      final preset = TravelerPreset(id: 'p1', name: 'Solo');

      expect(preset.adults, 2);
      expect(preset.childAges, isEmpty);
    });
  });

  group('SearchDefaults', () {
    test('supports nested defaults round-trip', () {
      final defaults = SearchDefaults(
        transport: const TransportDefaults(
          preferredModes: ['train', 'bus'],
          directOnly: true,
        ),
        accommodation: const AccommodationDefaults(
          minReviewScore: 4.0,
          requiredAmenities: ['wifi', 'breakfast'],
        ),
        food: const FoodDefaults(dietaryPreferences: ['vegan']),
        trails: const TrailDefaults(
          difficulties: ['easy', 'moderate'],
          maxDurationMinutes: 180,
        ),
      );

      final json = defaults.toJson();
      final decoded = SearchDefaults.fromJson(json);

      expect(decoded.transport!.preferredModes, contains('train'));
      expect(decoded.accommodation!.minReviewScore, 4.0);
      expect(decoded.food!.dietaryPreferences, contains('vegan'));
      expect(decoded.trails!.maxDurationMinutes, 180);
    });
  });

  group('NotificationPrefs', () {
    test('supports quiet hours and trip-only mode', () {
      final prefs = NotificationPrefs(
        channels: const NotificationChannels(push: true, email: false),
        categories: const NotificationCategories(
          bookingUpdates: true,
          leaveNow: true,
          plannerReminders: false,
        ),
        quietHours: const QuietHours(startHour: 22, endHour: 7),
        tripOnlyMode: true,
      );

      final json = prefs.toJson();
      final decoded = NotificationPrefs.fromJson(json);

      expect(decoded.channels.email, false);
      expect(decoded.quietHours!.startHour, 22);
      expect(decoded.tripOnlyMode, true);
    });
  });

  group('PrivacySettings', () {
    test('supports snapshot defaults and integrations', () {
      final settings = PrivacySettings(
        analyticsOptIn: false,
        diagnosticsOptIn: true,
        snapshotDefaults: const SnapshotDefaults(
          redactPII: true,
          redactPrices: true,
          photoVisibility: 'blur',
        ),
        connectedIntegrations: ['email', 'calendar'],
      );

      final json = settings.toJson();
      final decoded = PrivacySettings.fromJson(json);

      expect(decoded.analyticsOptIn, false);
      expect(decoded.snapshotDefaults.redactPrices, true);
      expect(decoded.connectedIntegrations, contains('email'));
    });
  });

  group('SecurityMeta', () {
    test('tracks 2FA and sessions', () {
      final meta = SecurityMeta(
        twoFactorEnabled: true,
        twoFactorMethod: 'totp',
        activeSessions: [
          DeviceSession(
            sessionId: 's1',
            deviceName: 'iPhone 15',
            deviceType: 'mobile',
            lastActive: DateTime(2024, 1, 15),
            isCurrent: true,
          ),
        ],
        lastPasswordChange: DateTime(2024, 1, 1),
      );

      final json = meta.toJson();
      final decoded = SecurityMeta.fromJson(json);

      expect(decoded.twoFactorEnabled, true);
      expect(decoded.activeSessions.length, 1);
      expect(decoded.activeSessions.first.isCurrent, true);
    });
  });

  group('StorageEntry', () {
    test('tracks offline bundle info', () {
      final entry = StorageEntry(
        itineraryId: 'i1',
        itineraryName: 'Paris Trip',
        sizeBytes: 52428800, // 50MB
        downloadedAt: DateTime(2024, 1, 15),
      );

      final json = entry.toJson();
      final decoded = StorageEntry.fromJson(json);

      expect(decoded.itineraryName, 'Paris Trip');
      expect(decoded.sizeBytes, 52428800);
    });
  });
}
