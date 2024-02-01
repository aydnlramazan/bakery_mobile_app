part of 'service_account_left_bloc.dart';

@immutable
sealed class ServiceAccountLeftState extends Equatable {
  const ServiceAccountLeftState();
  get serviceAccountLeft => null;
}

final class ServiceAccountLeftLoading extends ServiceAccountLeftState {
  const ServiceAccountLeftLoading();
  @override
  List<Object?> get props => [];
}

final class ServiceAccountLeftFailure extends ServiceAccountLeftState {
  final DioException? error;
  const ServiceAccountLeftFailure({this.error});
  @override
  List<Object?> get props => [error];
}

final class ServiceAccountLeftSuccess extends ServiceAccountLeftState {
  @override
  final List<ServiceAccountLeftModel>? serviceAccountLeft;
  const ServiceAccountLeftSuccess({this.serviceAccountLeft});
  @override
  List<Object?> get props => [serviceAccountLeft];
}
