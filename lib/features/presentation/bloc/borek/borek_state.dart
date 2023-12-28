part of 'borek_bloc.dart';

sealed class BorekState extends Equatable {
  const BorekState();
  
  @override
  List<Object> get props => [];
}

final class BorekInitial extends BorekState {}
