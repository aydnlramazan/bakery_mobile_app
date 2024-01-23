part of 'auth_bloc.dart';




@immutable
sealed class AuthEvent{}

// ignore: must_be_immutable
final class AuthLoginRequested extends AuthEvent{
  UserLoginParams userLoginParams;
  AuthLoginRequested({required this.userLoginParams});
}

final class AuthLogoutRequested extends AuthEvent{}