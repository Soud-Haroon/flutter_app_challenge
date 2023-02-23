import 'package:intl/intl.dart';

//===========Time Formatter====================//
String convertToDMY(DateTime date) {
  return DateFormat.yMMMd().format(date);
}
