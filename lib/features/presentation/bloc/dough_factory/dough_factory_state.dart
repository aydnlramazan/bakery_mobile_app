part of 'dough_factory_bloc.dart';

abstract class DoughFactoryState extends Equatable {
  final List<DoughListModel>? doughLists;
  final DioException? error;

  const DoughFactoryState({this.doughLists, this.error});

  @override
  List<Object> get props => [doughLists!, error!];
}

final class DoughFactoryInitial extends DoughFactoryState {}

class DoughFactoryLoading extends DoughFactoryState {
  const DoughFactoryLoading();
}

class DoughFactorySuccess extends DoughFactoryState {
  const DoughFactorySuccess(List<DoughListModel> doughLists)
      : super(doughLists: doughLists);
}

class DoughFactoryFailure extends DoughFactoryState {
  const DoughFactoryFailure(DioException error) : super(error: error);
}
