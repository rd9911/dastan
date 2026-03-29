# Locations Feature

> Location data and geocoding utilities using Photon API

## Overview

The Locations feature provides geocoding, location search, and place data used by other features.
Uses **Photon API** (photon.komoot.io) which supports autocomplete search.

## Structure

```
locations/
├── data/
│   ├── photon_data_source.dart    # HTTP client for Photon API
│   ├── photon_dto.dart            # GeoJSON response DTOs
│   ├── location_mapper.dart       # DTO to domain mapper
│   ├── location_cache.dart        # LRU cache with TTL
│   ├── location_repository.dart   # Main repository + providers
│   └── popular_locations.dart     # Embedded major cities
├── domain/
│   └── location.dart              # Domain model
└── presentation/
    └── location_autocomplete.dart # Autocomplete widget
```

## Features

- **Place Autocomplete**: Location search with debouncing (500ms)
- **Location Type Filter**: Cities-only or cities+airports
- **Multi-layer Caching**: Memory → Popular locations → API
- **Reverse Geocoding**: Coordinates to address

## Location Types

Use `LocationSearchType` to filter results:

```dart
// For Accommodation, Entertainment, Events, Gastronomy, Trails:
LocationAutocomplete(
  searchType: LocationSearchType.citiesOnly,  // default
  // ...
)

// For Transport (flights, trains):
LocationAutocomplete(
  searchType: LocationSearchType.citiesAndAirports,
  // ...
)
```

## Providers

| Provider | Type | Purpose |
|----------|------|---------|
| `locationRepositoryProvider` | `LocationRepository` | Main geocoding service |
| `photonDataSourceProvider` | `PhotonDataSource` | Photon API client |
| `locationCacheProvider` | `LocationCache` | Search result cache |
