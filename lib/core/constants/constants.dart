

import 'package:intl/intl.dart';

const String  baseUrl= "https://192.168.12.54:7207";

String getFormattedDateTime(DateTime dateTime){
  return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
}

