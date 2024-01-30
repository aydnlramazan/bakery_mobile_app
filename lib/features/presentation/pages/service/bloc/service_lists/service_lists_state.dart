part of 'service_lists_bloc.dart';

@immutable
sealed class ServiceListsState extends Equatable {
  const ServiceListsState();

  get serviceLists => null;
}

final class ServiceListsLoading extends ServiceListsState {
  const ServiceListsLoading();
  @override
  List<Object?> get props => [];
}

final class ServiceListsFailure extends ServiceListsState {
  final DioException? error;
  const ServiceListsFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class ServiceListsSuccess extends ServiceListsState {
  @override
  final List<ServiceListModel>? serviceLists;
  const ServiceListsSuccess({this.serviceLists});

  @override
  List<Object?> get props => [serviceLists];
}
