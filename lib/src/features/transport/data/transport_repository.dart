import '../domain/transport_item.dart';
import '../domain/transport_search_request.dart';

abstract class TransportRepository {
  Future<List<TransportItem>> search(TransportSearchRequest request);

  /// Returns a map of date -> min price for the given month
  Future<Map<DateTime, double>> getCalendarMinPrices(
    String origin,
    String destination,
    DateTime month,
  );

  /// Returns cities ranked by cheapest price for a region
  Future<List<RegionCity>> getRegionCheapest(String region);

  /// Returns mutual destinations for group search, ranked by cheapest combined price
  Future<List<GroupDestination>> searchGroupDestinations(List<String> origins);
}

/// City with price info for region drill-down
class RegionCity {
  final String name;
  final String country;
  final double minPrice;
  final String currency;

  RegionCity({
    required this.name,
    required this.country,
    required this.minPrice,
    required this.currency,
  });
}

/// Mutual destination for group search
class GroupDestination {
  final String destination;
  final double totalPrice;
  final Map<String, double> pricePerOrigin;
  final String currency;

  GroupDestination({
    required this.destination,
    required this.totalPrice,
    required this.pricePerOrigin,
    required this.currency,
  });
}
