import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: "https://192.168.12.73:7207",
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
  sendTimeout: const Duration(seconds: 30),
));