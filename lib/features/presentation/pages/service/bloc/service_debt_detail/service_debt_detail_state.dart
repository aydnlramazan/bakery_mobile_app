part of 'service_debt_detail_bloc.dart';

@immutable
sealed class ServiceDebtDetailState extends Equatable {
  const ServiceDebtDetailState();
  get serviceDebtDetailList => null;
}

final class ServiceDebtDetailLoading extends ServiceDebtDetailState {
  const ServiceDebtDetailLoading();
  @override
  List<Object?> get props => [];
}

final class ServiceDebtDetailFailure extends ServiceDebtDetailState {
  final DioException? error;
  const ServiceDebtDetailFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class ServiceDebtDetailSuccess extends ServiceDebtDetailState {

  @override
  final List<ServiceDebtDetailModel>? serviceDebtDetailList;
  const ServiceDebtDetailSuccess(
      {this.serviceDebtDetailList});

  @override
  List<Object?> get props => [serviceDebtDetailList];
}


