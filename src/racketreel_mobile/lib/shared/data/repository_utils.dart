import 'package:intl/intl.dart';

class RepositoryUtils {
  static String getDateTimeString(DateTime dateTime)
  {
    final DateFormat formatter = DateFormat.yMMMMd('en_US').add_jm();
    return formatter.format(dateTime);
  }
}