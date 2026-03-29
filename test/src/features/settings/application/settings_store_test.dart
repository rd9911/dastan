import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';
import 'package:dastan/src/features/settings/data/settings_repository.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late MockSettingsRepository mockRepo;
  late SettingsStoreNotifier store;

  setUpAll(() {
    registerFallbackValue(const SearchDefaults());
    registerFallbackValue(const PrivacySettings());
    registerFallbackValue(const NotificationPrefs());
    registerFallbackValue(UserProfile(userId: '', name: ''));
    registerFallbackValue(<TravelerPreset>[]);
  });

  setUp(() {
    mockRepo = MockSettingsRepository();
    store = SettingsStoreNotifier(mockRepo);
  });

  group('SettingsStoreNotifier', () {
    test('loads all settings for user', () async {
      when(
        () => mockRepo.getUserProfile('u1'),
      ).thenAnswer((_) async => UserProfile(userId: 'u1', name: 'Alice'));
      when(() => mockRepo.getTravelerPresets('u1')).thenAnswer(
        (_) async => [TravelerPreset(id: 'p1', name: 'Solo', isDefault: true)],
      );
      when(
        () => mockRepo.getSearchDefaults('u1'),
      ).thenAnswer((_) async => const SearchDefaults());
      when(
        () => mockRepo.getNotificationPrefs('u1'),
      ).thenAnswer((_) async => const NotificationPrefs());
      when(
        () => mockRepo.getPrivacySettings('u1'),
      ).thenAnswer((_) async => const PrivacySettings());

      await store.loadSettings('u1');

      expect(store.state.profile?.name, 'Alice');
      expect(store.state.travelerPresets.length, 1);
      expect(store.state.defaultTravelerPreset?.name, 'Solo');
    });

    test('updates profile and emits new state', () async {
      when(() => mockRepo.saveUserProfile(any())).thenAnswer((_) async {});

      final profile = UserProfile(userId: 'u1', name: 'Bob');
      await store.updateProfile(profile);

      expect(store.state.profile?.name, 'Bob');
      verify(() => mockRepo.saveUserProfile(profile)).called(1);
    });

    test('updates search defaults', () async {
      when(
        () => mockRepo.saveSearchDefaults(any(), any()),
      ).thenAnswer((_) async {});

      // Load first to set userId
      when(() => mockRepo.getUserProfile('u1')).thenAnswer((_) async => null);
      when(() => mockRepo.getTravelerPresets('u1')).thenAnswer((_) async => []);
      when(
        () => mockRepo.getSearchDefaults('u1'),
      ).thenAnswer((_) async => null);
      when(
        () => mockRepo.getNotificationPrefs('u1'),
      ).thenAnswer((_) async => null);
      when(
        () => mockRepo.getPrivacySettings('u1'),
      ).thenAnswer((_) async => null);
      await store.loadSettings('u1');

      const defaults = SearchDefaults(
        transport: TransportDefaults(preferredModes: ['train']),
      );
      await store.updateSearchDefaults(defaults);

      expect(
        store.state.searchDefaults?.transport?.preferredModes,
        contains('train'),
      );
    });
  });

  group('SettingsSnapshot', () {
    test('isNotificationAllowed respects quiet hours', () {
      final snapshot = SettingsSnapshot(
        notificationPrefs: const NotificationPrefs(
          quietHours: QuietHours(startHour: 22, endHour: 7),
        ),
      );

      // During quiet hours (23:00)
      expect(
        snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 23, 0)),
        false,
      );
      // Outside quiet hours (10:00)
      expect(
        snapshot.isNotificationAllowed(DateTime(2024, 1, 15, 10, 0)),
        true,
      );
    });

    test('defaultTravelerPreset returns marked default', () {
      final snapshot = SettingsSnapshot(
        travelerPresets: [
          TravelerPreset(id: 'p1', name: 'Family', adults: 2),
          TravelerPreset(id: 'p2', name: 'Solo', adults: 1, isDefault: true),
        ],
      );

      expect(snapshot.defaultTravelerPreset?.name, 'Solo');
    });
  });
}
