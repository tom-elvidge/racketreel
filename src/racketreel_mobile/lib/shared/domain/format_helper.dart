import 'package:racketreel/client/matches.pbenum.dart';

class FormatHelper {
  static String getFormatText(Format format) {
    switch (format) {
      case Format.BEST_OF_FIVE:
        return "Best of five sets";
      case Format.BEST_OF_FIVE_FST:
        return "Best of five sets with a final set tiebreak";
      case Format.BEST_OF_ONE:
        return "Single set";
      case Format.BEST_OF_THREE:
        return "Best of three sets";
      case Format.BEST_OF_THREE_FST:
        return "Best of three sets with a final set tiebreak";
      case Format.FAST4:
        return "FAST4";
      case Format.TIEBREAK_TO_TEN:
        return "Tiebreak to 10";
      case Format.LTA_CAMBRIDGE_DOUBLES_LEAGUE:
        return "LTA Cambridge Doubles League";
      default:
        return "Unknown match format";
    }
  }
}