import '../domain/location.dart';

/// Popular world cities bundled in the app for instant results.
///
/// These locations are searched first before hitting the API,
/// providing:
/// - Instant results for common destinations
/// - Offline fallback
/// - Reduced API calls
const List<Location> popularLocations = [
  // Europe
  Location(
    id: 'R62422',
    name: 'London',
    country: 'United Kingdom',
    lat: 51.5074,
    lng: -0.1278,
    osmType: 'R',
    osmId: 62422,
  ),
  Location(
    id: 'R7444',
    name: 'Paris',
    country: 'France',
    lat: 48.8566,
    lng: 2.3522,
    osmType: 'R',
    osmId: 7444,
  ),
  Location(
    id: 'R62428',
    name: 'Berlin',
    country: 'Germany',
    lat: 52.5200,
    lng: 13.4050,
    osmType: 'R',
    osmId: 62428,
  ),
  Location(
    id: 'R41485',
    name: 'Rome',
    country: 'Italy',
    lat: 41.9028,
    lng: 12.4964,
    osmType: 'R',
    osmId: 41485,
  ),
  Location(
    id: 'R347950',
    name: 'Barcelona',
    country: 'Spain',
    lat: 41.3851,
    lng: 2.1734,
    osmType: 'R',
    osmId: 347950,
  ),
  Location(
    id: 'R47811',
    name: 'Amsterdam',
    country: 'Netherlands',
    lat: 52.3676,
    lng: 4.9041,
    osmType: 'R',
    osmId: 47811,
  ),
  Location(
    id: 'R109166',
    name: 'Vienna',
    country: 'Austria',
    lat: 48.2082,
    lng: 16.3738,
    osmType: 'R',
    osmId: 109166,
  ),
  Location(
    id: 'R36990',
    name: 'Prague',
    country: 'Czech Republic',
    lat: 50.0755,
    lng: 14.4378,
    osmType: 'R',
    osmId: 36990,
  ),
  Location(
    id: 'R2324269',
    name: 'Lisbon',
    country: 'Portugal',
    lat: 38.7223,
    lng: -9.1393,
    osmType: 'R',
    osmId: 2324269,
  ),

  // Americas
  Location(
    id: 'R175905',
    name: 'New York',
    country: 'United States',
    state: 'New York',
    lat: 40.7128,
    lng: -74.0060,
    osmType: 'R',
    osmId: 175905,
  ),
  Location(
    id: 'R207359',
    name: 'Los Angeles',
    country: 'United States',
    state: 'California',
    lat: 34.0522,
    lng: -118.2437,
    osmType: 'R',
    osmId: 207359,
  ),
  Location(
    id: 'R122604',
    name: 'Miami',
    country: 'United States',
    state: 'Florida',
    lat: 25.7617,
    lng: -80.1918,
    osmType: 'R',
    osmId: 122604,
  ),
  Location(
    id: 'R5013942',
    name: 'São Paulo',
    country: 'Brazil',
    lat: -23.5505,
    lng: -46.6333,
    osmType: 'R',
    osmId: 5013942,
  ),
  Location(
    id: 'R2077456',
    name: 'Mexico City',
    country: 'Mexico',
    lat: 19.4326,
    lng: -99.1332,
    osmType: 'R',
    osmId: 2077456,
  ),

  // Asia
  Location(
    id: 'R1543125',
    name: 'Tokyo',
    country: 'Japan',
    lat: 35.6762,
    lng: 139.6503,
    osmType: 'R',
    osmId: 1543125,
  ),
  Location(
    id: 'R913110',
    name: 'Singapore',
    country: 'Singapore',
    lat: 1.3521,
    lng: 103.8198,
    osmType: 'R',
    osmId: 913110,
  ),
  Location(
    id: 'R4118157',
    name: 'Dubai',
    country: 'United Arab Emirates',
    lat: 25.2048,
    lng: 55.2708,
    osmType: 'R',
    osmId: 4118157,
  ),
  Location(
    id: 'R2192363',
    name: 'Bangkok',
    country: 'Thailand',
    lat: 13.7563,
    lng: 100.5018,
    osmType: 'R',
    osmId: 2192363,
  ),
  Location(
    id: 'R2218567',
    name: 'Hong Kong',
    country: 'China',
    lat: 22.3193,
    lng: 114.1694,
    osmType: 'R',
    osmId: 2218567,
  ),

  // Oceania
  Location(
    id: 'R5750005',
    name: 'Sydney',
    country: 'Australia',
    lat: -33.8688,
    lng: 151.2093,
    osmType: 'R',
    osmId: 5750005,
  ),
  Location(
    id: 'R4246124',
    name: 'Melbourne',
    country: 'Australia',
    lat: -37.8136,
    lng: 144.9631,
    osmType: 'R',
    osmId: 4246124,
  ),

  // Africa
  Location(
    id: 'R5765736',
    name: 'Cape Town',
    country: 'South Africa',
    lat: -33.9249,
    lng: 18.4241,
    osmType: 'R',
    osmId: 5765736,
  ),
  Location(
    id: 'R5765749',
    name: 'Marrakech',
    country: 'Morocco',
    lat: 31.6295,
    lng: -7.9811,
    osmType: 'R',
    osmId: 5765749,
  ),
  Location(
    id: 'R1130582',
    name: 'Cairo',
    country: 'Egypt',
    lat: 30.0444,
    lng: 31.2357,
    osmType: 'R',
    osmId: 1130582,
  ),
];

/// Search popular locations by query.
///
/// Returns matching locations from the bundled popular locations list.
/// Searches name, country, and state fields.
List<Location> searchPopularLocations(String query) {
  if (query.length < 2) return [];

  final lowerQuery = query.toLowerCase();
  return popularLocations.where((location) {
    return location.name.toLowerCase().contains(lowerQuery) ||
        location.country.toLowerCase().contains(lowerQuery) ||
        (location.state?.toLowerCase().contains(lowerQuery) ?? false);
  }).toList();
}
