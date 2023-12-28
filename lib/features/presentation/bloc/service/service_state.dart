part of 'service_bloc.dart';

sealed class ServiceState extends Equatable {
  const ServiceState();
  
  @override
  List<Object> get props => [];
}

final class ServiceInitial extends ServiceState {}
