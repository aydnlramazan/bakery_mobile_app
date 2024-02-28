

import 'package:intl/intl.dart';

const String  baseUrl= "https://10.80.11.66:7207";

String getFormattedDateTime(DateTime dateTime){
  return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
}

