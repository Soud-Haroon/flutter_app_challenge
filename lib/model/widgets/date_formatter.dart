import 'package:intl/intl.dart';

//===========Convert Time Formatter====================//
String convertToDMY(DateTime date) {
  return DateFormat.yMMMd().format(date);
}
