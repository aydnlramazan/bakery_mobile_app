part of 'service_account_received_bloc.dart';
@immutable
sealed class ServiceAccountReceivedState extends Equatable {
  const ServiceAccountReceivedState();
   get serviceAccountReceived => null;
}

final class ServiceAccountReceivedLoading extends ServiceAccountReceivedState {
  const ServiceAccountReceivedLoading();
  @override
  List<Object?> get props => [];
}

final class ServiceAccountReceivedFailure extends ServiceAccountReceivedState {
  final DioException? error;
  const ServiceAccountReceivedFailure({this.error});
  @override
  List<Object?> get props => [error];
}

final class ServiceAccountReceivedSuccess extends ServiceAccountReceivedState {
  
  final List<ServiceAccountReceivedModel>? serviceAccountReceived;
  const ServiceAccountReceivedSuccess({this.serviceAccountReceived});
  @override
  List<Object?> get props => [serviceAccountReceived];
}