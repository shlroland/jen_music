class JenUtil {
  static String dateToString(DateTime dateTime, type) {
    String monthStr, dayStr;
    var month = dateTime.month;
    monthStr = '$month';
    var day = dateTime.day;
    dayStr = '$day';
    if (month < 10) monthStr = '0$month';
    if (day < 10) dayStr = '0$day';
    if (type == 1) return '$dayStr';
    return '$monthStr / ';
  }
}
