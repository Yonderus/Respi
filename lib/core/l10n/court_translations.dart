import 'package:respi/core/l10n/app_localizations.dart';

extension CourtTranslations on AppLocalizations {
  // NAME TRANSLATIONS --------------------------------------------------------
  String courtName(String key) {
    switch (key) {
      case 'Cancha de Baloncesto':
        return courtNameBasket;
      case 'Pista de Pádel Indoor':
        return courtNamePadelIndoor;
      case 'Campo de Fútbol 11':
        return courtNameFutbol;
      case 'Pista de Tenis':
        return courtNameTenis;
      case 'Pista de Pádel':
        return courtNamePadel;
      case 'Cancha de Baloncesto Exterior':
        return courtNameBasketExterior;
      default:
        return key;
    }
  }

  // LOCATION TRANSLATIONS -----------------------------------------------------
  String courtLocation(String key) {
    switch (key) {
      case 'Pista Exterior, Centro Deportivo Respi':
        return courtLocationExterior;
      case 'Pista Indoor, Centro Deportivo Respi':
        return courtLocationIndoor;
      case 'Campo Exterior, Centro Deportivo Respi':
        return courtLocationCampoExterior;
      default:
        return key;
    }
  }

  // TAGS (etiquetas) ----------------------------------------------------------
  String courtTag(String key) {
    switch (key) {
      case 'Concreto':
        return tagConcrete;
      case 'Exterior':
        return tagExterior;
      case 'Cubierta':
        return tagIndoor;
      case 'Iluminada':
        return tagLighted;
      case 'Césped':
        return tagGrass;
      case 'Iluminado':
        return tagLighted;
      case 'Arcilla':
        return tagClay;
      default:
        return key;
    }
  }

  // CAPACITY ------------------------------------------------------------------
  String courtCapacity(String key) {
    switch (key) {
      case '10 personas':
        return capacity10;
      case '4 personas':
        return capacity4;
      case '22 personas':
        return capacity22;
      case '3 personas':
        return capacity3;
      default:
        return key;
    }
  }

  // CHARACTERISTICS -----------------------------------------------------------
  String courtChar(String key) {
    switch (key) {
      case 'Iluminación LED':
        return charLedLight;
      case 'Suelo de parquet antideslizante':
        return charParquet;
      case 'Sistema de ventilación avanzado':
        return charVentilation;

      case 'Ventanales panorámicos':
        return charWindows;
      case 'Suelo de césped artificial':
        return charArtificialGrass;
      case 'Iluminación LED de alta eficiencia':
        return charLedHigh;

      case 'Palas de pádel disponibles':
        return charPadelRackets;

      case 'Césped natural de alta calidad':
        return charNaturalGrass;
      case 'Iluminación nocturna':
        return charNightLight;

      case 'Superficie de arcilla profesional':
        return charClaySurface;
      case 'Red de alta resistencia':
        return charStrongNet;

      case 'Ventilación avanzada':
        return charAdvancedVentilation;
      case 'Suelo de corcho antideslizante':
        return charCorkFloor;

      case 'Tableros resistentes a la intemperie':
        return charWeatherResistantBoards;

      default:
        return key;
    }
  }

  // DESCRIPTION ---------------------------------------------------------------
  String courtDescription(String key) {
    switch (key) {
      case 'Cancha de baloncesto con iluminación LED, suelo de parquet antideslizante y sistema de ventilación avanzado.':
        return descBasket;

      case 'Pista de pádel indoor con ventanales panorámicos, suelo de césped artificial e iluminación LED de alta eficiencia.':
        return descPadelIndoor;

      case 'Campo de fútbol 11 con césped natural de alta calidad e iluminación nocturna.':
        return descFutbol;

      case 'Pista de tenis con superficie de arcilla profesional y red de alta resistencia.':
        return descTenis;

      case 'Pista de pádel cubierta con ventilación avanzada y suelo de corcho antideslizante.':
        return descPadel;

      case 'Cancha de baloncesto con iluminación LED y tableros resistentes a la intemperie.':
        return descBasketExterior;

      default:
        return key;
    }
  }
}
