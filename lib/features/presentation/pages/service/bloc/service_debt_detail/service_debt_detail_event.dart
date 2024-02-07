part of 'service_debt_detail_bloc.dart';

sealed class ServiceDebtDetailEvent {}

final class ServiceGetDebtDetailList extends ServiceDebtDetailEvent {
  final int marketId;
  ServiceGetDebtDetailList({required this.marketId});
}

final class ServiceDeleteDebtPayment extends ServiceDebtDetailEvent {
  final BuildContext context;
  final ServiceDebtDetailModel serviceDebtDetail;
  ServiceDeleteDebtPayment(
      {required this.serviceDebtDetail, required this.context});
}

final class ServiceUpdateDebtPayment extends ServiceDebtDetailEvent {
  final BuildContext context;
  final ServiceDebtDetailModel serviceDebtDetail;
  ServiceUpdateDebtPayment({required this.serviceDebtDetail, required this.context});
}
