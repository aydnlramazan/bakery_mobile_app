part of 'received_money_from_service_bloc.dart';

sealed class ReceivedMoneyFromServiceEvent{
 
}

final class ReceivedMoneyFromServiceGetListRequested
    extends ReceivedMoneyFromServiceEvent {
  final DateTime date;
  final int servisTypeId;
  ReceivedMoneyFromServiceGetListRequested({required this.date, required this.servisTypeId});
}

final class ReceivedMoneyFromServicePostRequested
    extends ReceivedMoneyFromServiceEvent {
  final ReceivedMoneyFromServiceModel receivedMoneyFromService;
  ReceivedMoneyFromServicePostRequested({required this.receivedMoneyFromService});
}

final class ReceivedMoneyFromServiceUpdateRequested
    extends ReceivedMoneyFromServiceEvent {
  final ReceivedMoneyFromServiceModel receivedMoneyFromService;
  ReceivedMoneyFromServiceUpdateRequested({required this.receivedMoneyFromService});
}

final class ReceivedMoneyFromServiceDeleteRequested
    extends ReceivedMoneyFromServiceEvent {
  final int id;
  ReceivedMoneyFromServiceDeleteRequested({required this.id});
}
