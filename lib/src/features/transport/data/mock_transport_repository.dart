import 'dart:math';

import '../domain/transport_item.dart';
import '../domain/transport_search_request.dart';
import 'transport_repository.dart';

class MockTransportRepository implements TransportRepository {
  final Random _random = Random();

  @override
  Future<List<TransportItem>> search(TransportSearchRequest request) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 500 + _random.nextInt(1000)));

    final results = <TransportItem>[];

    // Generate results based on request
    // This is a simple mock, so we just generate random items for the first leg's O->D
    if (request.legs.isEmpty) return [];

    final leg = request.legs.first;

    // Generate 5-10 items
    final count = 5 + _random.nextInt(5);
    for (int i = 0; i < count; i++) {
      results.add(_generateMockItem(leg, i));
    }

    return results;
  }

  @override
  Future<Map<DateTime, double>> getCalendarMinPrices(
    String origin,
    String destination,
    DateTime month,
  ) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final prices = <DateTime, double>{};
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    for (int i = 1; i <= daysInMonth; i++) {
      final date = DateTime.utc(month.year, month.month, i);
      // Random price between 50 and 300
      prices[date] = 50.0 + _random.nextInt(250).toDouble();
    }

    return prices;
  }

  TransportItem _generateMockItem(TransportSearchLeg leg, int index) {
    final isFlight =
        leg.mode == TransportMode.flight || leg.mode == TransportMode.any;
    final mode = isFlight ? TransportMode.flight : leg.mode;
    final durationMinutes = 60 + _random.nextInt(300);
    final departTime = leg.departDate.add(
      Duration(hours: 8 + _random.nextInt(12), minutes: _random.nextInt(60)),
    );
    final arriveTime = departTime.add(Duration(minutes: durationMinutes));

    return TransportItem(
      id: 'mock_${mode.name}_$index',
      mode: mode,
      price: Price(amount: 100.0 + _random.nextInt(500), currency: 'USD'),
      totalDuration: Duration(minutes: durationMinutes),
      departure: departTime,
      arrival: arriveTime,
      providers: [
        TransportProvider(
          name: mode == TransportMode.flight ? 'MockAir' : 'MockTrain',
          logoUrl: null,
          code: mode == TransportMode.flight ? 'MA' : null,
        ),
      ],
      segments: [
        TransportSegment(
          origin: leg.origin,
          destination: leg.destination,
          departure: departTime,
          arrival: arriveTime,
          duration: Duration(minutes: durationMinutes),
          carrier: mode == TransportMode.flight ? 'MockAir' : 'MockTrain',
          transportIdentifier:
              '${mode == TransportMode.flight ? "MA" : "MT"}${100 + index}',
          mode: mode,
        ),
      ],
    );
  }

  @override
  Future<List<RegionCity>> getRegionCheapest(String region) async {
    await Future.delayed(const Duration(milliseconds: 600));

    // Mock cities for different regions
    final regionCities = <String, List<Map<String, dynamic>>>{
      'Europe': [
        {'name': 'Paris', 'country': 'France', 'price': 150},
        {'name': 'Barcelona', 'country': 'Spain', 'price': 120},
        {'name': 'Rome', 'country': 'Italy', 'price': 180},
        {'name': 'Berlin', 'country': 'Germany', 'price': 100},
        {'name': 'Amsterdam', 'country': 'Netherlands', 'price': 140},
      ],
      'Asia': [
        {'name': 'Tokyo', 'country': 'Japan', 'price': 450},
        {'name': 'Bangkok', 'country': 'Thailand', 'price': 380},
        {'name': 'Singapore', 'country': 'Singapore', 'price': 420},
        {'name': 'Seoul', 'country': 'South Korea', 'price': 400},
      ],
      'North America': [
        {'name': 'New York', 'country': 'USA', 'price': 200},
        {'name': 'Los Angeles', 'country': 'USA', 'price': 180},
        {'name': 'Toronto', 'country': 'Canada', 'price': 220},
        {'name': 'Miami', 'country': 'USA', 'price': 160},
      ],
    };

    final cities = regionCities[region] ?? regionCities['Europe']!;
    return cities
        .map(
          (c) => RegionCity(
            name: c['name'] as String,
            country: c['country'] as String,
            minPrice: (c['price'] as int).toDouble() + _random.nextInt(50),
            currency: 'USD',
          ),
        )
        .toList()
      ..sort((a, b) => a.minPrice.compareTo(b.minPrice));
  }

  @override
  Future<List<GroupDestination>> searchGroupDestinations(
    List<String> origins,
  ) async {
    await Future.delayed(const Duration(milliseconds: 700));

    // Mock mutual destinations
    final destinations = ['Paris', 'Barcelona', 'Rome', 'Amsterdam', 'Berlin'];
    final results = <GroupDestination>[];

    for (final dest in destinations) {
      final pricePerOrigin = <String, double>{};
      double total = 0;
      for (final origin in origins) {
        final price = 100.0 + _random.nextInt(200).toDouble();
        pricePerOrigin[origin] = price;
        total += price;
      }
      results.add(
        GroupDestination(
          destination: dest,
          totalPrice: total,
          pricePerOrigin: pricePerOrigin,
          currency: 'USD',
        ),
      );
    }

    results.sort((a, b) => a.totalPrice.compareTo(b.totalPrice));
    return results;
  }
}
