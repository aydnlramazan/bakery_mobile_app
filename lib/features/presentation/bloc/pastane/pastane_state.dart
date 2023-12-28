part of 'pastane_bloc.dart';

sealed class PastaneState extends Equatable {
  const PastaneState();
  
  @override
  List<Object> get props => [];
}

final class PastaneInitial extends PastaneState {}
