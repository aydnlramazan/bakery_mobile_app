import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToastMessage(String message){
  Fluttertoast.showToast(
  msg: message,
  toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
  gravity: ToastGravity.BOTTOM, // You can change the gravity to control the position
  timeInSecForIosWeb: 1, // Duration for iOS/Web
  backgroundColor:  Colors.grey.shade800,
  textColor: Colors.white,
  fontSize: 16.0,
);

}