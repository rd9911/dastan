# Settings Feature

> App configuration and user preferences

## Overview

The Settings feature manages user preferences, app configuration, and access to admin features.

## Structure

```
settings/
├── presentation/          # UI Layer (9 files)
│   ├── settings_screen.dart
│   └── widgets/
├── application/           # Service Layer (5 files)
│   ├── settings_providers.dart
│   └── settings_service.dart
└── domain/                # Models (4 files)
    ├── settings_models.dart
    └── settings_models.freezed.dart
```

## Features

### User Preferences

- **Locale**: Language selection
- **Currency**: Default currency for prices
- **Units**: Metric/Imperial
- **Theme**: Light/Dark/System

### Notifications

- **Push Notifications**: Enable/disable
- **Email Notifications**: Newsletter, updates
- **Reminder Settings**: Trip reminders

### Privacy

- **Location Sharing**: GPS permissions
- **Analytics**: Usage analytics opt-in
- **Data Export**: Download user data
- **Account Deletion**: GDPR compliance

### App Info

- **Version**: App version
- **Terms of Service**: Legal links
- **Privacy Policy**: Legal links
- **Support**: Contact info

## Key Models

```dart
@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    @Default('en') String locale,
    @Default('USD') String currency,
    @Default(MeasurementUnit.metric) MeasurementUnit unit,
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(true) bool pushNotifications,
    @Default(true) bool analyticsEnabled,
  }) = _UserSettings;
}
```

## Providers

| Provider | Type | Purpose |
|----------|------|---------|
| `settingsServiceProvider` | `Provider` | Settings management |
| `userSettingsProvider` | `NotifierProvider` | Current settings |

## Routes

| Route | Screen |
|-------|--------|
| `/settings` | `SettingsScreen` |

## Dependencies

- `core/data/drift_database` - Local storage
- `admin` - Admin console access
