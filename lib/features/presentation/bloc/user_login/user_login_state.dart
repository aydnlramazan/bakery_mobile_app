part of 'user_login_bloc.dart';

sealed class UserLoginState extends Equatable {
  const UserLoginState();
  
  @override
  List<Object> get props => [];
}

final class UserLoginInitial extends UserLoginState {}
