part of 'service_stale_left_bloc.dart';

sealed class ServiceStaleLeftState extends Equatable {
  const ServiceStaleLeftState();
  get serviceStaleLeft => null;
}

final class ServiceStaleLeftLoading extends ServiceStaleLeftState {
  const ServiceStaleLeftLoading();
  @override
  List<Object?> get props => [];
}

final class ServiceStaleLeftFailure extends ServiceStaleLeftState {
  final DioException? error;
  const ServiceStaleLeftFailure({this.error});
  @override
  List<Object?> get props => [error];
}

final class ServiceStaleLeftSuccess extends ServiceStaleLeftState {
  @override
  final List<ServiceStaleModel>? serviceStaleLeft;
  const ServiceStaleLeftSuccess({this.serviceStaleLeft});
  @override
  List<Object?> get props => [serviceStaleLeft];
}
