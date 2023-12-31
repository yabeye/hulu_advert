import 'package:intl/intl.dart';

extension dateTimeHelper on DateTime {
  String joinedFormat() {
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(this);
  }

  bool isSameDay(DateTime otherDay) {
    return year == otherDay.year &&
        month == otherDay.month &&
        day == otherDay.day;
  }
}
