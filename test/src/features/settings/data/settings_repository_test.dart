import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:dastan/src/core/data/drift_database.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';
import 'package:dastan/src/features/settings/data/settings_repository.dart';

void main() {
  late AppDatabase db;
  late SettingsRepository repository;

  setUp(() {
    db = AppDatabase.connect(NativeDatabase.memory());
    repository = SettingsRepository(db);
  });

  tearDown(() => db.close());

  group('SettingsRepository', () {
    group('UserProfile', () {
      test('saves and retrieves profile', () async {
        final profile = UserProfile(
          userId: 'u1',
          name: 'Alice',
          locale: 'fr',
          currency: 'EUR',
        );

        await repository.saveUserProfile(profile);
        final retrieved = await repository.getUserProfile('u1');

        expect(retrieved, isNotNull);
        expect(retrieved!.name, 'Alice');
        expect(retrieved.locale, 'fr');
      });

      test('returns null for non-existent user', () async {
        final result = await repository.getUserProfile('nonexistent');
        expect(result, isNull);
      });
    });

    group('TravelerPresets', () {
      test('saves and retrieves presets', () async {
        final presets = [
          TravelerPreset(id: 'p1', name: 'Family', adults: 2, childAges: [5]),
          TravelerPreset(id: 'p2', name: 'Solo', adults: 1, isDefault: true),
        ];

        await repository.saveTravelerPresets('u1', presets);
        final retrieved = await repository.getTravelerPresets('u1');

        expect(retrieved.length, 2);
        expect(retrieved[1].isDefault, true);
      });

      test('returns empty for new user', () async {
        final result = await repository.getTravelerPresets('newuser');
        expect(result, isEmpty);
      });
    });

    group('SearchDefaults', () {
      test('saves and retrieves defaults', () async {
        final defaults = SearchDefaults(
          transport: const TransportDefaults(preferredModes: ['train']),
          accommodation: const AccommodationDefaults(minReviewScore: 4.0),
        );

        await repository.saveSearchDefaults('u1', defaults);
        final retrieved = await repository.getSearchDefaults('u1');

        expect(retrieved, isNotNull);
        expect(retrieved!.transport!.preferredModes, contains('train'));
      });
    });

    group('NotificationPrefs', () {
      test('saves and retrieves prefs', () async {
        final prefs = NotificationPrefs(
          quietHours: const QuietHours(startHour: 22, endHour: 7),
          tripOnlyMode: true,
        );

        await repository.saveNotificationPrefs('u1', prefs);
        final retrieved = await repository.getNotificationPrefs('u1');

        expect(retrieved, isNotNull);
        expect(retrieved!.tripOnlyMode, true);
        expect(retrieved.quietHours!.startHour, 22);
      });
    });

    group('PrivacySettings', () {
      test('saves and retrieves settings', () async {
        final settings = PrivacySettings(
          analyticsOptIn: false,
          connectedIntegrations: ['email'],
        );

        await repository.savePrivacySettings('u1', settings);
        final retrieved = await repository.getPrivacySettings('u1');

        expect(retrieved, isNotNull);
        expect(retrieved!.analyticsOptIn, false);
        expect(retrieved.connectedIntegrations, contains('email'));
      });
    });
  });
}
