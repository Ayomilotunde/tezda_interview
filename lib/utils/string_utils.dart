import 'package:intl/intl.dart';

class StringUtils {
  static String formatDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String formatMonthDay(DateTime dateTime) {
    return DateFormat('MMMM dd').format(dateTime);
  }
}