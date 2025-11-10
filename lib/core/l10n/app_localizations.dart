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
  /// **' correo'**
  String get email;

  /// Texto que aparece en la cajita donde se introduce la contraseña
  ///
  /// In es, this message translates to:
  /// **' contraseña'**
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
