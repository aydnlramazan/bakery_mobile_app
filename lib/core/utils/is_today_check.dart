import 'dart:convert';

bool isToday(DateTime selectedDate) {
  DateTime currentDate = DateTime.now();
  return currentDate.year == selectedDate.year &&
      currentDate.month == selectedDate.month &&
      currentDate.day == selectedDate.day;
}

bool isAdminCheck(String token) {
  Map<String, dynamic> decodedToken = _decodeJwt(token);
  print('decoded Token: ${decodedToken}');



  // Checking if user is an admin
  print('isAdmin: ${decodedToken.toString().contains("Admin")}');
  return decodedToken.toString().contains("Admin");
}

Map<String, dynamic> _decodeJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid token');
  }

  final payload = parts[1];
  var normalized = base64Url.normalize(payload);
  var decoded = utf8.decode(base64Url.decode(normalized));

  return jsonDecode(decoded);
}
