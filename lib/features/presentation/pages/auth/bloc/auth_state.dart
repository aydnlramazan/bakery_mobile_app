part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final UserEntity? user;
  final DioException? error;

  const AuthState({this.user, this.error});

  @override
  List<Object> get props => [user!, error!];
}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess(UserEntity user) : super(user: user);
}

class AuthFailure extends AuthState {
  const AuthFailure(DioException error) : super(error: error);
}
