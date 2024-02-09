part of 'service_stale_product_bloc.dart';

sealed class ServiceStaleProductState extends Equatable {
  const ServiceStaleProductState();
  
 get serviceStaleProductList => null;
}

final class ServiceStaleProductLoading extends ServiceStaleProductState {
  const ServiceStaleProductLoading();
  @override
  List<Object?> get props => [];
}

final class ServiceStaleProductFailure extends ServiceStaleProductState {
  final DioException? error;
  const ServiceStaleProductFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class ServiceStaleProductSuccess extends ServiceStaleProductState {
  
  @override
  final List<ServiceStaleProductModel>? serviceStaleProductList;
  
  const ServiceStaleProductSuccess(
      {this.serviceStaleProductList});

  @override
  List<Object?> get props => [serviceStaleProductList];
}

