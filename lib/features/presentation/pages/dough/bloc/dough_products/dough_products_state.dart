part of 'dough_products_bloc.dart';

@immutable
sealed class DoughProductsState extends Equatable {
  const DoughProductsState();

  get doughProducts => null;
}

final class DoughProductsLoading extends DoughProductsState {
  const DoughProductsLoading();

  @override
  List<Object?> get props => [];
}

final class DoughProductsFailure extends DoughProductsState {
  final DioException? error;
  const DoughProductsFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class DoughProductsSuccess extends DoughProductsState {
  @override
  final List<ProductNotAddedModel>? doughProducts;
  const DoughProductsSuccess({this.doughProducts});

  @override
  List<Object?> get props => [doughProducts];
}
