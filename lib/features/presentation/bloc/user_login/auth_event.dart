import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:flutter/material.dart';

@immutable
sealed class AuthEvent{}

final class AuthLoginRequested extends AuthEvent{
  UserLoginParams userLoginParams;
  AuthLoginRequested({required this.userLoginParams});
}

final class AuthLogoutRequested extends AuthEvent{}