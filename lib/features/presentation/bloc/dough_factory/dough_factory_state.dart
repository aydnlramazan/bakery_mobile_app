part of 'dough_factory_bloc.dart';

sealed class DoughFactoryState extends Equatable {
  const DoughFactoryState();
  
  @override
  List<Object> get props => [];
}

final class DoughFactoryInitial extends DoughFactoryState {}
