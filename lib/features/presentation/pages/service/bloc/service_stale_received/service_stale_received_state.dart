part of 'service_stale_received_bloc.dart';

sealed class ServiceStaleReceivedState extends Equatable {
  const ServiceStaleReceivedState();
get serviceReceivedStale => null;
}

final class ServiceStaleReceivedLoading extends ServiceStaleReceivedState {
  const ServiceStaleReceivedLoading();
  @override
  List<Object?> get props => [];
}

final class ServiceStaleReceivedFailure extends ServiceStaleReceivedState {
  final DioException? error;
  const ServiceStaleReceivedFailure({this.error});
  @override
  List<Object?> get props => [error];
}

final class ServiceStaleReceivedSuccess extends ServiceStaleReceivedState {
  
  @override
  final List<ServiceReceivedStaleModel>? serviceReceivedStale;
  const ServiceStaleReceivedSuccess({this.serviceReceivedStale});
  @override
  List<Object?> get props => [serviceReceivedStale];
}
