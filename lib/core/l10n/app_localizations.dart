import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// Este es un texto convencional que muestra el hola mundo
  ///
  /// In es, this message translates to:
  /// **'¡Hola Mundo!'**
  String get helloWorld;

  /// No description provided for @signinContinue.
  ///
  /// In es, this message translates to:
  /// **'Inicia sesión para continuar'**
  String get signinContinue;

  /// No description provided for @welcomeRespi.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido a ResPi'**
  String get welcomeRespi;

  /// No description provided for @continueGoogle.
  ///
  /// In es, this message translates to:
  /// **'Seguir con Google'**
  String get continueGoogle;

  /// Texto que aparece en la cajita donde se introduce el email
  ///
  /// In es, this message translates to:
  /// **' Correo electrónico'**
  String get email;

  /// Texto que aparece en la cajita donde se introduce la contraseña
  ///
  /// In es, this message translates to:
  /// **' Contraseña'**
  String get password;

  /// Texto en el separador entre iniciar sesion con correo y contraseña o google
  ///
  /// In es, this message translates to:
  /// **'O'**
  String get or;

  /// texto del boton de iniciar sesion
  ///
  /// In es, this message translates to:
  /// **'Iniciar Session'**
  String get signin;

  /// igual que el anterior welcome to respi pero con exclamaciones
  ///
  /// In es, this message translates to:
  /// **'¡Bienvenido a ResPi!'**
  String get welcomeRespiExcl;

  /// No description provided for @fastAcces.
  ///
  /// In es, this message translates to:
  /// **'Acceso Rápido'**
  String get fastAcces;

  /// No description provided for @newReservation.
  ///
  /// In es, this message translates to:
  /// **'Nueva Reserva'**
  String get newReservation;

  /// No description provided for @joinin.
  ///
  /// In es, this message translates to:
  /// **'Unirse a una partida'**
  String get joinin;

  /// No description provided for @basketball.
  ///
  /// In es, this message translates to:
  /// **'Baloncesto'**
  String get basketball;

  /// No description provided for @football.
  ///
  /// In es, this message translates to:
  /// **'Fútbol'**
  String get football;

  /// No description provided for @padel.
  ///
  /// In es, this message translates to:
  /// **'Pádel'**
  String get padel;

  /// No description provided for @tennis.
  ///
  /// In es, this message translates to:
  /// **'Tenis'**
  String get tennis;

  /// No description provided for @upcomingReservations.
  ///
  /// In es, this message translates to:
  /// **'Proximas Reservas'**
  String get upcomingReservations;

  /// titulo appbar de pagina de ajustes
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get preferences;

  /// No description provided for @darkMode.
  ///
  /// In es, this message translates to:
  /// **'Modo Oscuro'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get language;

  /// No description provided for @home.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get home;

  /// No description provided for @reservations.
  ///
  /// In es, this message translates to:
  /// **'Reservas'**
  String get reservations;

  /// No description provided for @profile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// No description provided for @selectcamp.
  ///
  /// In es, this message translates to:
  /// **'Selecionar Pista'**
  String get selectcamp;

  /// No description provided for @joinParty.
  ///
  /// In es, this message translates to:
  /// **'Unirse'**
  String get joinParty;

  /// No description provided for @selectCourt.
  ///
  /// In es, this message translates to:
  /// **'Selecciona una pista'**
  String get selectCourt;

  /// Mensaje que salta cuando se hace login sin rellenar campos
  ///
  /// In es, this message translates to:
  /// **'Por favor, introduce usuario y contraseña'**
  String get enterCredentials;

  /// No description provided for @loginFailed.
  ///
  /// In es, this message translates to:
  /// **'Login fallido'**
  String get loginFailed;

  /// No description provided for @enterEmail.
  ///
  /// In es, this message translates to:
  /// **'Tienes que introducir un email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In es, this message translates to:
  /// **'Tienes que introducir una contraseña'**
  String get enterPassword;

  /// No description provided for @createAccount.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta'**
  String get createAccount;

  /// No description provided for @registerToContinue.
  ///
  /// In es, this message translates to:
  /// **'Registrarse para continuar'**
  String get registerToContinue;

  /// No description provided for @phone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get phone;

  /// No description provided for @name.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get name;

  /// No description provided for @surname.
  ///
  /// In es, this message translates to:
  /// **'Apellido'**
  String get surname;

  /// No description provided for @city.
  ///
  /// In es, this message translates to:
  /// **'Localidad'**
  String get city;

  /// No description provided for @dateBirth.
  ///
  /// In es, this message translates to:
  /// **'Fecha de nacimiento'**
  String get dateBirth;

  /// No description provided for @reservationReviews.
  ///
  /// In es, this message translates to:
  /// **'Reseñas de Reservas'**
  String get reservationReviews;

  /// No description provided for @basketBallCourt.
  ///
  /// In es, this message translates to:
  /// **'Cancha'**
  String get basketBallCourt;

  /// No description provided for @tennisCourt.
  ///
  /// In es, this message translates to:
  /// **'Pista de Tenis'**
  String get tennisCourt;

  /// No description provided for @basketCourt.
  ///
  /// In es, this message translates to:
  /// **'Cancha de Baloncesto'**
  String get basketCourt;

  /// No description provided for @basketCourtOutdoor.
  ///
  /// In es, this message translates to:
  /// **'Cancha de Baloncesto Exterior'**
  String get basketCourtOutdoor;

  /// No description provided for @padelIndoorCourt.
  ///
  /// In es, this message translates to:
  /// **'Pista de Pádel Indoor'**
  String get padelIndoorCourt;

  /// No description provided for @padelCourt.
  ///
  /// In es, this message translates to:
  /// **'Pista de Pádel'**
  String get padelCourt;

  /// No description provided for @football11Field.
  ///
  /// In es, this message translates to:
  /// **'Campo de Fútbol 11'**
  String get football11Field;

  /// No description provided for @courtNameBasket.
  ///
  /// In es, this message translates to:
  /// **'Cancha de Baloncesto'**
  String get courtNameBasket;

  /// No description provided for @courtNamePadelIndoor.
  ///
  /// In es, this message translates to:
  /// **'Pista de Pádel Indoor'**
  String get courtNamePadelIndoor;

  /// No description provided for @courtNameFutbol.
  ///
  /// In es, this message translates to:
  /// **'Campo de Fútbol 11'**
  String get courtNameFutbol;

  /// No description provided for @courtNameTenis.
  ///
  /// In es, this message translates to:
  /// **'Pista de Tenis'**
  String get courtNameTenis;

  /// No description provided for @courtNamePadel.
  ///
  /// In es, this message translates to:
  /// **'Pista de Pádel'**
  String get courtNamePadel;

  /// No description provided for @courtNameBasketExterior.
  ///
  /// In es, this message translates to:
  /// **'Cancha de Baloncesto Exterior'**
  String get courtNameBasketExterior;

  /// No description provided for @courtLocationExterior.
  ///
  /// In es, this message translates to:
  /// **'Pista Exterior, Centro Deportivo Respi'**
  String get courtLocationExterior;

  /// No description provided for @courtLocationIndoor.
  ///
  /// In es, this message translates to:
  /// **'Pista Indoor, Centro Deportivo Respi'**
  String get courtLocationIndoor;

  /// No description provided for @courtLocationCampoExterior.
  ///
  /// In es, this message translates to:
  /// **'Campo Exterior, Centro Deportivo Respi'**
  String get courtLocationCampoExterior;

  /// No description provided for @tagConcrete.
  ///
  /// In es, this message translates to:
  /// **'Concreto'**
  String get tagConcrete;

  /// No description provided for @tagExterior.
  ///
  /// In es, this message translates to:
  /// **'Exterior'**
  String get tagExterior;

  /// No description provided for @tagIndoor.
  ///
  /// In es, this message translates to:
  /// **'Cubierta'**
  String get tagIndoor;

  /// No description provided for @tagLighted.
  ///
  /// In es, this message translates to:
  /// **'Iluminada'**
  String get tagLighted;

  /// No description provided for @tagGrass.
  ///
  /// In es, this message translates to:
  /// **'Césped'**
  String get tagGrass;

  /// No description provided for @tagClay.
  ///
  /// In es, this message translates to:
  /// **'Arcilla'**
  String get tagClay;

  /// No description provided for @capacity10.
  ///
  /// In es, this message translates to:
  /// **'10 personas'**
  String get capacity10;

  /// No description provided for @capacity4.
  ///
  /// In es, this message translates to:
  /// **'4 personas'**
  String get capacity4;

  /// No description provided for @capacity22.
  ///
  /// In es, this message translates to:
  /// **'22 personas'**
  String get capacity22;

  /// No description provided for @capacity3.
  ///
  /// In es, this message translates to:
  /// **'3 personas'**
  String get capacity3;

  /// No description provided for @charLedLight.
  ///
  /// In es, this message translates to:
  /// **'Iluminación LED'**
  String get charLedLight;

  /// No description provided for @charParquet.
  ///
  /// In es, this message translates to:
  /// **'Suelo de parquet antideslizante'**
  String get charParquet;

  /// No description provided for @charVentilation.
  ///
  /// In es, this message translates to:
  /// **'Sistema de ventilación avanzado'**
  String get charVentilation;

  /// No description provided for @charWindows.
  ///
  /// In es, this message translates to:
  /// **'Ventanales panorámicos'**
  String get charWindows;

  /// No description provided for @charArtificialGrass.
  ///
  /// In es, this message translates to:
  /// **'Suelo de césped artificial'**
  String get charArtificialGrass;

  /// No description provided for @charLedHigh.
  ///
  /// In es, this message translates to:
  /// **'Iluminación LED de alta eficiencia'**
  String get charLedHigh;

  /// No description provided for @charPadelRackets.
  ///
  /// In es, this message translates to:
  /// **'Palas de pádel disponibles'**
  String get charPadelRackets;

  /// No description provided for @charNaturalGrass.
  ///
  /// In es, this message translates to:
  /// **'Césped natural de alta calidad'**
  String get charNaturalGrass;

  /// No description provided for @charNightLight.
  ///
  /// In es, this message translates to:
  /// **'Iluminación nocturna'**
  String get charNightLight;

  /// No description provided for @charClaySurface.
  ///
  /// In es, this message translates to:
  /// **'Superficie de arcilla profesional'**
  String get charClaySurface;

  /// No description provided for @charStrongNet.
  ///
  /// In es, this message translates to:
  /// **'Red de alta resistencia'**
  String get charStrongNet;

  /// No description provided for @charAdvancedVentilation.
  ///
  /// In es, this message translates to:
  /// **'Ventilación avanzada'**
  String get charAdvancedVentilation;

  /// No description provided for @charCorkFloor.
  ///
  /// In es, this message translates to:
  /// **'Suelo de corcho antideslizante'**
  String get charCorkFloor;

  /// No description provided for @charWeatherResistantBoards.
  ///
  /// In es, this message translates to:
  /// **'Tableros resistentes a la intemperie'**
  String get charWeatherResistantBoards;

  /// No description provided for @descBasket.
  ///
  /// In es, this message translates to:
  /// **'Cancha de baloncesto con iluminación LED, suelo de parquet antideslizante y sistema de ventilación avanzado.'**
  String get descBasket;

  /// No description provided for @descPadelIndoor.
  ///
  /// In es, this message translates to:
  /// **'Pista de pádel indoor con ventanales panorámicos, suelo de césped artificial e iluminación LED de alta eficiencia.'**
  String get descPadelIndoor;

  /// No description provided for @descFutbol.
  ///
  /// In es, this message translates to:
  /// **'Campo de fútbol 11 con césped natural de alta calidad e iluminación nocturna.'**
  String get descFutbol;

  /// No description provided for @descTenis.
  ///
  /// In es, this message translates to:
  /// **'Pista de tenis con superficie de arcilla profesional y red de alta resistencia.'**
  String get descTenis;

  /// No description provided for @descPadel.
  ///
  /// In es, this message translates to:
  /// **'Pista de pádel cubierta con ventilación avanzada y suelo de corcho antideslizante.'**
  String get descPadel;

  /// No description provided for @descBasketExterior.
  ///
  /// In es, this message translates to:
  /// **'Cancha de baloncesto con iluminación LED y tableros resistentes a la intemperie.'**
  String get descBasketExterior;

  /// No description provided for @reserveNow.
  ///
  /// In es, this message translates to:
  /// **'Reservar'**
  String get reserveNow;

  /// No description provided for @courtInfo.
  ///
  /// In es, this message translates to:
  /// **'Información de Pista'**
  String get courtInfo;

  /// No description provided for @capacity.
  ///
  /// In es, this message translates to:
  /// **'Capacidad'**
  String get capacity;

  /// No description provided for @characteristics.
  ///
  /// In es, this message translates to:
  /// **'Características'**
  String get characteristics;

  /// No description provided for @description.
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get description;

  /// No description provided for @close.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get close;

  /// No description provided for @join_basket_3v3.
  ///
  /// In es, this message translates to:
  /// **'Cancha de Basket 3 vs 3'**
  String get join_basket_3v3;

  /// No description provided for @join_padel_doble.
  ///
  /// In es, this message translates to:
  /// **'Pista de Pádel Doble'**
  String get join_padel_doble;

  /// No description provided for @join_futbol7.
  ///
  /// In es, this message translates to:
  /// **'Campo de Fútbol 7'**
  String get join_futbol7;

  /// No description provided for @join_tenis_individual.
  ///
  /// In es, this message translates to:
  /// **'Cancha de Tenis Individual'**
  String get join_tenis_individual;

  /// No description provided for @join_voley_2v2.
  ///
  /// In es, this message translates to:
  /// **'Cancha de Vóley Playa 2 vs 2'**
  String get join_voley_2v2;

  /// No description provided for @join_level_beginner.
  ///
  /// In es, this message translates to:
  /// **'Principiante'**
  String get join_level_beginner;

  /// No description provided for @join_level_intermediate.
  ///
  /// In es, this message translates to:
  /// **'Intermedio'**
  String get join_level_intermediate;

  /// No description provided for @join_missingPeople.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, one {Falta {count} persona} other {Faltan {count} personas}}'**
  String join_missingPeople(num count);

  /// No description provided for @join_perPerson.
  ///
  /// In es, this message translates to:
  /// **'/persona'**
  String get join_perPerson;

  /// No description provided for @join_joinButton.
  ///
  /// In es, this message translates to:
  /// **'Unirse'**
  String get join_joinButton;

  /// No description provided for @booking_perHour.
  ///
  /// In es, this message translates to:
  /// **'/hora'**
  String get booking_perHour;

  /// No description provided for @filter_all.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get filter_all;

  /// No description provided for @filter_basket.
  ///
  /// In es, this message translates to:
  /// **'Basket'**
  String get filter_basket;

  /// No description provided for @filter_padel.
  ///
  /// In es, this message translates to:
  /// **'Pádel'**
  String get filter_padel;

  /// No description provided for @filter_futbol.
  ///
  /// In es, this message translates to:
  /// **'Fútbol'**
  String get filter_futbol;

  /// No description provided for @filter_tennis.
  ///
  /// In es, this message translates to:
  /// **'Tenis'**
  String get filter_tennis;

  /// No description provided for @profileReservations.
  ///
  /// In es, this message translates to:
  /// **'Reservas'**
  String get profileReservations;

  /// No description provided for @profileMyReservations.
  ///
  /// In es, this message translates to:
  /// **'Mis reservas'**
  String get profileMyReservations;

  /// No description provided for @profileMyReservationsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Consulta tus reservas activas y pasadas'**
  String get profileMyReservationsSubtitle;

  /// No description provided for @profileAlerts.
  ///
  /// In es, this message translates to:
  /// **'Alertas'**
  String get profileAlerts;

  /// No description provided for @profileAlertsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Controla notificaciones y recordatorios'**
  String get profileAlertsSubtitle;

  /// No description provided for @profileLogout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get profileLogout;

  /// No description provided for @noNextReservations.
  ///
  /// In es, this message translates to:
  /// **'No hay reservas próximas'**
  String get noNextReservations;

  /// No description provided for @noUserLoggedIn.
  ///
  /// In es, this message translates to:
  /// **'no hay usuario registrado'**
  String get noUserLoggedIn;

  /// No description provided for @noCourtSel.
  ///
  /// In es, this message translates to:
  /// **'Ninguna pista seleccionada'**
  String get noCourtSel;
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
      <String>['de', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
