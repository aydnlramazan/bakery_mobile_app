part of 'service_account_left_bloc.dart';

sealed class ServiceAccountLeftEvent {}

final class ServiceGetAccountLeftRequested extends ServiceAccountLeftEvent {
  final DateTime date;
  ServiceGetAccountLeftRequested({required this.date});
}

final class ServiceRemoveAccountLeftRequested extends ServiceAccountLeftEvent {
  final ServiceAccountLeftModel serviceAccountLeftModel;
  ServiceRemoveAccountLeftRequested({required this.serviceAccountLeftModel});
}

final class ServicePostAccountLeftRequested extends ServiceAccountLeftEvent {
  final BuildContext context;
  final ServiceAccountLeftModel serviceAccountLeftModel;
  final double paidAmount;
  ServicePostAccountLeftRequested( {
    required this.context,
    required this.serviceAccountLeftModel,
    required this.paidAmount,
  });
}
