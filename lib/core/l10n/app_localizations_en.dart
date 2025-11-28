// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get signinContinue => 'Sign in to continue';

  @override
  String get welcomeRespi => 'Welcome to ResPi';

  @override
  String get continueGoogle => 'Continue with Google';

  @override
  String get email => ' Email';

  @override
  String get password => ' Password';

  @override
  String get or => 'OR';

  @override
  String get signin => 'Sign In';

  @override
  String get welcomeRespiExcl => 'Welcome to ResPi!';

  @override
  String get fastAcces => 'Fast Acces';

  @override
  String get newReservation => 'New reservation';

  @override
  String get joinin => 'Join a game';

  @override
  String get basketball => 'Basketball';

  @override
  String get football => 'Football';

  @override
  String get padel => 'Padel';

  @override
  String get tennis => 'Tennis';

  @override
  String get upcomingReservations => 'Upcoming Reservations';

  @override
  String get preferences => 'Preferences';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get home => 'Home';

  @override
  String get reservations => 'Reservations';

  @override
  String get profile => 'Profile';

  @override
  String get selectcamp => 'Selected court';

  @override
  String get joinParty => 'Join';

  @override
  String get selectCourt => 'Select a court';

  @override
  String get enterCredentials => 'Please , enter user and password';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get enterEmail => 'You have to enter an email';

  @override
  String get enterPassword => 'You have to enter a password';

  @override
  String get createAccount => 'Create account';

  @override
  String get registerToContinue => 'Register to continue';

  @override
  String get phone => 'Phone';

  @override
  String get name => 'Name';

  @override
  String get surname => 'Surname';

  @override
  String get city => 'City';

  @override
  String get dateBirth => 'Date of Birth';

  @override
  String get reservationReviews => 'Booking reviews';

  @override
  String get basketBallCourt => 'Basketball Court';

  @override
  String get tennisCourt => 'Tennis Court';

  @override
  String get basketCourt => 'Basketball Court';

  @override
  String get basketCourtOutdoor => 'Outdoor Basketball Court';

  @override
  String get padelIndoorCourt => 'Indoor Padel Court';

  @override
  String get padelCourt => 'Padel Court';

  @override
  String get football11Field => 'Football 11 Field';

  @override
  String get courtNameBasket => 'Basketball Court';

  @override
  String get courtNamePadelIndoor => 'Indoor Padel Court';

  @override
  String get courtNameFutbol => '11-a-Side Football Field';

  @override
  String get courtNameTenis => 'Tennis Court';

  @override
  String get courtNamePadel => 'Padel Court';

  @override
  String get courtNameBasketExterior => 'Outdoor Basketball Court';

  @override
  String get courtLocationExterior => 'Outdoor Court, Respi Sports Center';

  @override
  String get courtLocationIndoor => 'Indoor Court, Respi Sports Center';

  @override
  String get courtLocationCampoExterior => 'Outdoor Field, Respi Sports Center';

  @override
  String get tagConcrete => 'Concrete';

  @override
  String get tagExterior => 'Outdoor';

  @override
  String get tagIndoor => 'Covered';

  @override
  String get tagLighted => 'Lighted';

  @override
  String get tagGrass => 'Grass';

  @override
  String get tagClay => 'Clay';

  @override
  String get capacity10 => '10 people';

  @override
  String get capacity4 => '4 people';

  @override
  String get capacity22 => '22 people';

  @override
  String get capacity3 => '3 people';

  @override
  String get charLedLight => 'LED lighting';

  @override
  String get charParquet => 'Non-slip parquet floor';

  @override
  String get charVentilation => 'Advanced ventilation system';

  @override
  String get charWindows => 'Panoramic windows';

  @override
  String get charArtificialGrass => 'Artificial grass floor';

  @override
  String get charLedHigh => 'High-efficiency LED lighting';

  @override
  String get charPadelRackets => 'Padel rackets available';

  @override
  String get charNaturalGrass => 'High-quality natural grass';

  @override
  String get charNightLight => 'Night lighting';

  @override
  String get charClaySurface => 'Professional clay surface';

  @override
  String get charStrongNet => 'High-resistance net';

  @override
  String get charAdvancedVentilation => 'Advanced ventilation';

  @override
  String get charCorkFloor => 'Non-slip cork floor';

  @override
  String get charWeatherResistantBoards => 'Weather-resistant backboards';

  @override
  String get descBasket =>
      'Basketball court with LED lighting, non-slip parquet floor and advanced ventilation system.';

  @override
  String get descPadelIndoor =>
      'Indoor padel court with panoramic windows, artificial grass floor and high-efficiency LED lighting.';

  @override
  String get descFutbol =>
      '11-a-side football field with high-quality natural grass and night lighting.';

  @override
  String get descTenis =>
      'Tennis court with professional clay surface and high-resistance net.';

  @override
  String get descPadel =>
      'Covered padel court with advanced ventilation and non-slip cork floor.';

  @override
  String get descBasketExterior =>
      'Outdoor basketball court with LED lighting and weather-resistant backboards.';

  @override
  String get reserveNow => 'Reserve';

  @override
  String get courtInfo => 'Court Information';

  @override
  String get capacity => 'Capacity';

  @override
  String get characteristics => 'Characteristics';

  @override
  String get description => 'Description';

  @override
  String get close => 'Close';

  @override
  String get join_basket_3v3 => '3v3 Basketball Court';

  @override
  String get join_padel_doble => 'Double Padel Court';

  @override
  String get join_futbol7 => '7-a-side Football Field';

  @override
  String get join_tenis_individual => 'Single Tennis Court';

  @override
  String get join_voley_2v2 => '2v2 Beach Volleyball Court';

  @override
  String get join_level_beginner => 'Beginner';

  @override
  String get join_level_intermediate => 'Intermediate';

  @override
  String join_missingPeople(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people needed',
      one: '$count person needed',
    );
    return '$_temp0';
  }

  @override
  String get join_perPerson => '/person';

  @override
  String get join_joinButton => 'Join';

  @override
  String get booking_perHour => '/hour';

  @override
  String get filter_all => 'All';

  @override
  String get filter_basket => 'Basketball';

  @override
  String get filter_padel => 'Padel';

  @override
  String get filter_futbol => 'Football';

  @override
  String get filter_tennis => 'Tennis';

  @override
  String get profileReservations => 'Bookings';

  @override
  String get profileMyReservations => 'My bookings';

  @override
  String get profileMyReservationsSubtitle =>
      'View your active and past bookings';

  @override
  String get profileAlerts => 'Alerts';

  @override
  String get profileAlertsSubtitle => 'Manage notifications and reminders';

  @override
  String get profileLogout => 'Log out';

  @override
  String get noNextReservations => 'No upcoming reservations';

  @override
  String get noUserLoggedIn => 'You aren\'t logged in';

  @override
  String get noCourtSel => 'No court selected';
}
