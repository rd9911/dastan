import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The application title
  ///
  /// In en, this message translates to:
  /// **'Dastan'**
  String get appTitle;

  /// Label for transport search feature
  ///
  /// In en, this message translates to:
  /// **'Search Transport'**
  String get searchTransport;

  /// Placeholder for origin input
  ///
  /// In en, this message translates to:
  /// **'Select origin'**
  String get selectOrigin;

  /// Placeholder for destination input
  ///
  /// In en, this message translates to:
  /// **'Select destination'**
  String get selectDestination;

  /// Label for departure date field
  ///
  /// In en, this message translates to:
  /// **'Departure date'**
  String get departureDate;

  /// Label for return date field
  ///
  /// In en, this message translates to:
  /// **'Return date'**
  String get returnDate;

  /// Label for passengers field
  ///
  /// In en, this message translates to:
  /// **'Passengers'**
  String get passengers;

  /// Label for adult passengers
  ///
  /// In en, this message translates to:
  /// **'Adults'**
  String get adults;

  /// Label for child passengers
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get children;

  /// Label for infant passengers
  ///
  /// In en, this message translates to:
  /// **'Infants'**
  String get infants;

  /// Search button label
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Message when search returns no results
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// Price display with currency
  ///
  /// In en, this message translates to:
  /// **'From {price}'**
  String priceFrom(String price);

  /// One way trip type
  ///
  /// In en, this message translates to:
  /// **'One way'**
  String get tripTypeOneWay;

  /// Round trip type
  ///
  /// In en, this message translates to:
  /// **'Round trip'**
  String get tripTypeRoundTrip;

  /// Multi-city trip type
  ///
  /// In en, this message translates to:
  /// **'Multi-city'**
  String get tripTypeMultiCity;

  /// Tooltip for previous month button in calendar
  ///
  /// In en, this message translates to:
  /// **'Previous month'**
  String get previousMonth;

  /// Tooltip for next month button in calendar
  ///
  /// In en, this message translates to:
  /// **'Next month'**
  String get nextMonth;

  /// Accessibility label for unavailable dates
  ///
  /// In en, this message translates to:
  /// **'{date}, unavailable'**
  String dateUnavailable(String date);

  /// Accessibility label for selectable dates
  ///
  /// In en, this message translates to:
  /// **'{date}, tap to select'**
  String dateTapToSelect(String date);

  /// Header for region drilldown
  ///
  /// In en, this message translates to:
  /// **'Cheapest destinations in {region}'**
  String cheapestDestinationsIn(String region);

  /// Title for group search feature
  ///
  /// In en, this message translates to:
  /// **'Group Search'**
  String get groupSearch;

  /// Description for group search feature
  ///
  /// In en, this message translates to:
  /// **'Find destinations that work for everyone'**
  String get groupSearchDescription;

  /// Label for origin city input
  ///
  /// In en, this message translates to:
  /// **'Origin city'**
  String get originCity;

  /// Tooltip for add origin button
  ///
  /// In en, this message translates to:
  /// **'Add origin'**
  String get addOrigin;

  /// Tooltip for remove origin button
  ///
  /// In en, this message translates to:
  /// **'Remove {origin}'**
  String removeOrigin(String origin);

  /// Button label for group search
  ///
  /// In en, this message translates to:
  /// **'Find Mutual Destinations'**
  String get findMutualDestinations;

  /// Header for group search results
  ///
  /// In en, this message translates to:
  /// **'Best destinations for your group:'**
  String get bestDestinationsForGroup;

  /// Error message when not enough origins
  ///
  /// In en, this message translates to:
  /// **'Add at least 2 origins'**
  String get addAtLeastTwoOrigins;

  /// Title for transport detail screen
  ///
  /// In en, this message translates to:
  /// **'Transport Details'**
  String get transportDetailTitle;

  /// Button label to navigate to vendor
  ///
  /// In en, this message translates to:
  /// **'Go to {vendor}'**
  String vendorGoTo(String vendor);

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Unsave button label
  ///
  /// In en, this message translates to:
  /// **'Unsave'**
  String get unsave;

  /// Confirmation message when item is saved
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGeneric;

  /// Network error message
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your connection.'**
  String get errorNetwork;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Loading indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
