part of 'product_counting_not_added_bloc.dart';

sealed class ProductCountingNotAddedState extends Equatable {
  const ProductCountingNotAddedState();
  
get productNotAddedList => null;
}

final class ProductCountingNotAddedLoading extends ProductCountingNotAddedState {
  const ProductCountingNotAddedLoading();
  @override
  List<Object?> get props => [];
}

final class ProductCountingNotAddedFailure extends ProductCountingNotAddedState {
  final DioException? error;
  const ProductCountingNotAddedFailure({this.error});
  @override
  List<Object?> get props => [error];
}

final class ProductCountingNotAddedSuccess extends ProductCountingNotAddedState {
  
  @override
  final List<ProductNotAddedModel>? productNotAddedList;
  const ProductCountingNotAddedSuccess({this.productNotAddedList});
  @override
  List<Object?> get props => [productNotAddedList];
}
