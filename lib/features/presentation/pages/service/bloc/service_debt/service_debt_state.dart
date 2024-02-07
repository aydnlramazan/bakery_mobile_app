part of 'service_debt_bloc.dart';

@immutable
sealed class ServiceDebtState extends Equatable {
  const ServiceDebtState();
  get serviceTotalDebtList => null;
  get serviceDebtDetailList => null;
}

final class ServiceDebtLoading extends ServiceDebtState {
  const ServiceDebtLoading();
  @override
  List<Object?> get props => [];
}

final class ServiceDebtFailure extends ServiceDebtState {
  final DioException? error;
  const ServiceDebtFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class ServiceTotalDebtSuccess extends ServiceDebtState {
  @override
  final List<ServiceDebtTotalModel>? serviceTotalDebtList;
  @override
  final List<ServiceDebtDetailModel>? serviceDebtDetailList;
  const ServiceTotalDebtSuccess(
      {this.serviceTotalDebtList, this.serviceDebtDetailList});

  @override
  List<Object?> get props => [serviceTotalDebtList, serviceDebtDetailList];
}


