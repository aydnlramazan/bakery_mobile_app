part of 'service_debt_bloc.dart';

sealed class ServiceDebtEvent {}

final class ServiceGetTotalDebtList extends ServiceDebtEvent {}



final class ServicePostDebtPayment extends ServiceDebtEvent {
  final ServiceDebtDetailModel serviceDebtDetail;
  ServicePostDebtPayment({required this.serviceDebtDetail});
}


