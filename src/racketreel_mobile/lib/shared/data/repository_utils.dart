import 'package:intl/intl.dart';

class RepositoryUtils {
  static String getDateTimeString(DateTime dateTime)
  {
    final DateFormat formatter = DateFormat.yMMMMd('en_US').add_jm();
    return formatter.format(dateTime);
  }

  static String getDurationString(int seconds)
  {
    var minutes = (seconds / 60).floor();

    var hours = (minutes / 60).floor();

    var minutesRemaining = minutes - (60 * hours);

    return hours == 0 ? "${minutesRemaining}m" : "${hours}h ${minutesRemaining}m";
  }
}