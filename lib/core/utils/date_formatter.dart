import 'package:timeago/timeago.dart' as timeago;

abstract final class DateFormatter {
  static String relative(DateTime dateTime) => timeago.format(dateTime);

  static String short(DateTime dateTime) {
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    return '${dateTime.year}-$month-$day';
  }
}
