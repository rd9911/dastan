# Map Feature

> Core map functionality and utilities

## Overview

The Map feature provides the foundational map infrastructure used by other features (itinerary_map, planner, search).

## Structure

```
map/
├── presentation/          # UI Layer (3 files)
│   ├── map_screen.dart
│   └── map_widget.dart
├── application/           # Service Layer (2 files)
│   └── map_providers.dart
└── domain/                # Models (1 file)
    └── map_config.dart
```

## Features

- **Map Rendering**: Display interactive maps
- **Markers**: Custom marker rendering
- **Clustering**: Group nearby markers
- **Tile Caching**: Offline map tiles
- **User Location**: GPS tracking
- **Gestures**: Pan, zoom, rotate

## Providers

| Provider | Type | Purpose |
|----------|------|---------|
| `mapControllerProvider` | `Provider` | Map controller |

## Routes

| Route | Screen |
|-------|--------|
| `/map` | `MapScreen` |

## Used By

- `itinerary_map` - Itinerary visualization
- `planner` - Route/commute visualization
- Search screens - Location selection
