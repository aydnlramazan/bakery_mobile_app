part of 'admin_bloc.dart';

sealed class AdminState extends Equatable {
  const AdminState();
  
  @override
  List<Object> get props => [];
}

final class AdminInitial extends AdminState {}
