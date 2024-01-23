import 'package:bakery_app/core/utils/toast_message.dart';

int convertStringToInt(String text) {
  try {
    double result = double.parse(text);
    int intValue = result.toInt();
    return intValue;
  } catch (e) {
    showToastMessage(e.toString());
    return -1;
  }
}
