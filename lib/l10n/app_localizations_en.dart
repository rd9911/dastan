// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Dastan';

  @override
  String get searchTransport => 'Search Transport';

  @override
  String get selectOrigin => 'Select origin';

  @override
  String get selectDestination => 'Select destination';

  @override
  String get departureDate => 'Departure date';

  @override
  String get returnDate => 'Return date';

  @override
  String get passengers => 'Passengers';

  @override
  String get adults => 'Adults';

  @override
  String get children => 'Children';

  @override
  String get infants => 'Infants';

  @override
  String get search => 'Search';

  @override
  String get noResultsFound => 'No results found';

  @override
  String priceFrom(String price) {
    return 'From $price';
  }

  @override
  String get tripTypeOneWay => 'One way';

  @override
  String get tripTypeRoundTrip => 'Round trip';

  @override
  String get tripTypeMultiCity => 'Multi-city';

  @override
  String get previousMonth => 'Previous month';

  @override
  String get nextMonth => 'Next month';

  @override
  String dateUnavailable(String date) {
    return '$date, unavailable';
  }

  @override
  String dateTapToSelect(String date) {
    return '$date, tap to select';
  }

  @override
  String cheapestDestinationsIn(String region) {
    return 'Cheapest destinations in $region';
  }

  @override
  String get groupSearch => 'Group Search';

  @override
  String get groupSearchDescription =>
      'Find destinations that work for everyone';

  @override
  String get originCity => 'Origin city';

  @override
  String get addOrigin => 'Add origin';

  @override
  String removeOrigin(String origin) {
    return 'Remove $origin';
  }

  @override
  String get findMutualDestinations => 'Find Mutual Destinations';

  @override
  String get bestDestinationsForGroup => 'Best destinations for your group:';

  @override
  String get addAtLeastTwoOrigins => 'Add at least 2 origins';

  @override
  String get transportDetailTitle => 'Transport Details';

  @override
  String vendorGoTo(String vendor) {
    return 'Go to $vendor';
  }

  @override
  String get save => 'Save';

  @override
  String get unsave => 'Unsave';

  @override
  String get saved => 'Saved';

  @override
  String get errorGeneric => 'Something went wrong';

  @override
  String get errorNetwork => 'Network error. Please check your connection.';

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading...';
}
