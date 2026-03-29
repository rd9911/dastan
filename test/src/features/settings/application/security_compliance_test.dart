import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:dastan/src/features/settings/application/settings_security_utils.dart';
import 'package:dastan/src/features/settings/application/compliance_service.dart';
import 'package:dastan/src/features/settings/domain/settings_models.dart';

void main() {
  group('SettingsSecurityUtils', () {
    test('deriveKey produces consistent results', () {
      final key1 = SettingsSecurityUtils.deriveKey('user1', 'secret');
      final key2 = SettingsSecurityUtils.deriveKey('user1', 'secret');
      final key3 = SettingsSecurityUtils.deriveKey('user2', 'secret');

      expect(key1, equals(key2));
      expect(key1, isNot(equals(key3)));
    });

    test('encrypt and decrypt roundtrip', () {
      final key = SettingsSecurityUtils.deriveKey('user1', 'secret');
      const plaintext = 'sensitive data';

      final encrypted = SettingsSecurityUtils.encryptSensitive(plaintext, key);
      expect(encrypted, startsWith('ENC:'));
      expect(encrypted, isNot(contains(plaintext)));

      final decrypted = SettingsSecurityUtils.decryptSensitive(encrypted, key);
      expect(decrypted, plaintext);
    });

    test('decryptSensitive handles unencrypted data', () {
      final key = SettingsSecurityUtils.deriveKey('user1', 'secret');
      const plaintext = 'not encrypted';

      final result = SettingsSecurityUtils.decryptSensitive(plaintext, key);
      expect(result, plaintext);
    });

    test('validateWriteAuthorization checks ownership', () {
      expect(
        SettingsSecurityUtils.validateWriteAuthorization(
          userId: 'user1',
          resourceOwnerId: 'user1',
          authToken: 'valid_token',
        ),
        true,
      );

      expect(
        SettingsSecurityUtils.validateWriteAuthorization(
          userId: 'user1',
          resourceOwnerId: 'user2',
          authToken: 'valid_token',
        ),
        false,
      );

      expect(
        SettingsSecurityUtils.validateWriteAuthorization(
          userId: 'user1',
          resourceOwnerId: 'user1',
          authToken: null,
        ),
        false,
      );
    });

    test('sanitizeForStorage removes script tags', () {
      final dirty = {
        'name': 'John<script>alert("xss")</script>',
        'bio': 'Hello javascript:alert("xss")',
        'nested': {'value': '<script>bad</script>clean'},
      };

      final clean = SettingsSecurityUtils.sanitizeForStorage(dirty);

      expect(clean['name'], 'John');
      expect(clean['bio'], isNot(contains('javascript:')));
      expect((clean['nested'] as Map)['value'], 'clean');
    });

    test('maskEmail hides middle characters', () {
      expect(
        SettingsSecurityUtils.maskEmail('john.doe@example.com'),
        'j******e@example.com',
      );
      expect(SettingsSecurityUtils.maskEmail('ab@test.com'), '**@test.com');
    });

    test('maskPhone shows last 4 digits', () {
      expect(
        SettingsSecurityUtils.maskPhone('+1 (555) 123-4567'),
        '*******4567',
      );
      expect(SettingsSecurityUtils.maskPhone('1234567890'), '******7890');
    });
  });

  group('ComplianceService', () {
    late ComplianceService service;

    setUp(() {
      service = ComplianceService();
    });

    test('exportUserData creates valid export', () async {
      final export = await service.exportUserData(
        userId: 'user1',
        profile: UserProfile(userId: 'user1', name: 'John Doe'),
        travelerPresets: [TravelerPreset(id: 'p1', name: 'Solo')],
        searchDefaults: const SearchDefaults(),
        notificationPrefs: const NotificationPrefs(),
        privacySettings: const PrivacySettings(),
        itineraries: [
          {'id': 'trip1', 'name': 'Paris'},
        ],
        savedItems: [
          {'id': 'item1', 'title': 'Restaurant'},
        ],
      );

      expect(export.data.isNotEmpty, true);
      expect(export.filename, contains('user1'));
      expect(export.integrityHash.isNotEmpty, true);

      // Verify JSON structure
      final json = jsonDecode(utf8.decode(export.data)) as Map<String, dynamic>;
      expect(json['user_id'], 'user1');
      expect(json['profile'], isNotNull);
      expect(json['itineraries'], hasLength(1));
    });

    test('initiateAccountDeletion creates pending request', () async {
      final request = await service.initiateAccountDeletion(
        userId: 'user1',
        gracePeriodDays: 30,
      );

      expect(request.userId, 'user1');
      expect(request.status, DeletionStatus.pending);
      expect(request.gracePeriodDays, 30);
      expect(request.isWithinGracePeriod, true);
      expect(request.daysRemaining, greaterThanOrEqualTo(29));
    });

    test('cancelDeletionRequest returns success', () async {
      final result = await service.cancelDeletionRequest('user1');
      expect(result, true);
    });

    test('createAuditEntry captures action details', () {
      final entry = service.createAuditEntry(
        userId: 'user1',
        action: 'settings_updated',
        details: {'field': 'locale', 'old': 'en', 'new': 'fr'},
      );

      expect(entry.userId, 'user1');
      expect(entry.action, 'settings_updated');
      expect(entry.details['field'], 'locale');
      expect(entry.timestamp, isNotNull);
    });
  });
}
