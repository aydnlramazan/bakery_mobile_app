part of 'dough_factory_bloc.dart';

@immutable
sealed class DoughFactoryState extends Equatable {
  const DoughFactoryState();
  get doughLists => null;
}

final class DoughFactoryLoading extends DoughFactoryState {
  const DoughFactoryLoading();

  @override
  List<Object?> get props => [];
}

final class DoughFactoryFailure extends DoughFactoryState {
  final DioException? error;
  const DoughFactoryFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class DoughGetListsSuccess extends DoughFactoryState {
  @override
  final List<DoughListModel>? doughLists;
  const DoughGetListsSuccess({this.doughLists});

  @override
  List<Object?> get props => [doughLists];
}
