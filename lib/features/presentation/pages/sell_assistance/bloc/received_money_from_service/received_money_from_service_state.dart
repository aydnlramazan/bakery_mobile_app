part of 'received_money_from_service_bloc.dart';
@immutable
sealed class ReceivedMoneyFromServiceState extends Equatable {
  const ReceivedMoneyFromServiceState();
  
 get receivedMoneyFromService => null;
}

final class ReceivedMoneyFromServiceLoading extends ReceivedMoneyFromServiceState {
  const ReceivedMoneyFromServiceLoading();
  @override
  List<Object?> get props => [];
}

final class ReceivedMoneyFromServiceFailure extends ReceivedMoneyFromServiceState {
  final DioException? error;
  const ReceivedMoneyFromServiceFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class ReceivedMoneyFromServiceSuccess extends ReceivedMoneyFromServiceState {
  
  @override
  final ReceivedMoneyFromServiceModel? receivedMoneyFromService;
  
  const ReceivedMoneyFromServiceSuccess({this.receivedMoneyFromService});

  @override
  List<Object?> get props => [receivedMoneyFromService];
}

