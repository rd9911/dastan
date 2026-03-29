# Admin Feature

> Developer and admin tools

## Overview

The Admin feature provides a console for developers and administrators to access debugging tools, feature flags, and system information.

## Structure

```
admin/
├── presentation/          # UI Layer (5 files)
│   ├── admin_console_screen.dart
│   └── widgets/
└── application/           # Service Layer (4 files)
    └── admin_providers.dart
```

## Features

### Feature Flags

- Toggle experimental features
- A/B test variants
- Kill switches

### Debug Tools

- View app logs
- Network request inspector
- Cache inspector
- Database viewer

### Analytics Dashboard

- Search metrics
- User activity
- Error rates
- Performance stats

### Cache Management

- Clear search cache
- Clear offline cache
- Reset app state

## Access Control

Admin console is hidden in production and requires:
- Developer mode enabled
- Or admin role assigned

## Routes

| Route | Screen |
|-------|--------|
| `/admin` | `AdminConsoleScreen` |

## Note

This feature is **not in the main navigation**. Access via:
- Settings → Developer Options
- Or direct URL navigation
