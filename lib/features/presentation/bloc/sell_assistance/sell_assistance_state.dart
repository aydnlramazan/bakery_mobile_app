part of 'sell_assistance_bloc.dart';

sealed class SellAssistanceState extends Equatable {
  const SellAssistanceState();
  
  @override
  List<Object> get props => [];
}

final class SellAssistanceInitial extends SellAssistanceState {}
