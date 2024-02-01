part of 'service_account_received_bloc.dart';

sealed class ServiceAccountReceivedEvent {}

final class ServiceGetAccountReceivedRequested
    extends ServiceAccountReceivedEvent {
  final DateTime date;
  ServiceGetAccountReceivedRequested({required this.date});
}

final class ServiceRemoveAccountReceivedRequested
    extends ServiceAccountReceivedEvent {
 final BuildContext context;
  final ServiceAccountReceivedModel serviceAccountReceivedModel;
  ServiceRemoveAccountReceivedRequested(
      {required this.serviceAccountReceivedModel, required this.context});
}

final class ServiceUpdateAccountReceivedRequested
    extends ServiceAccountReceivedEvent {
  final ServiceAccountReceivedModel serviceAccountReceivedModel;

  ServiceUpdateAccountReceivedRequested(
      {required this.serviceAccountReceivedModel});
}
