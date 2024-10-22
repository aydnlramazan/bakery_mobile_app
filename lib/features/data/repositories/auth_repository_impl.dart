// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/data/data_sources/local/shared_preference.dart';
import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/data/data_sources/remote/auth_service.dart';

import 'package:bakery_app/features/domain/entities/user.dart';
import 'package:bakery_app/features/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;
  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<UserEntity?>> userLogin(
      UserLoginParams? userLoginParams) async {
    try {
      final httpResponse = await _authApiService.loginUser(
          userName: userLoginParams!.userName,
          password: userLoginParams.password);

  print("auth request response: ${httpResponse.response.statusCode}");

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        UserPreferences.saveUser(httpResponse.data!);
        return DataSuccess(httpResponse.data!);
      } else {
      
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> userLogout() {
    // TODO: implement userLogout
    throw UnimplementedError();
  }
}
