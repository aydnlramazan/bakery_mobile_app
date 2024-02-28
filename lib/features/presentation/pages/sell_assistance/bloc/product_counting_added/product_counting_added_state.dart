part of 'product_counting_added_bloc.dart';

sealed class ProductCountingAddedState extends Equatable {
  const ProductCountingAddedState();
  
 get productCountingAddedList => null;
}

final class ProductCountingAddedLoading extends ProductCountingAddedState {
  const ProductCountingAddedLoading();
  @override
  List<Object?> get props => [];
}

final class ProductCountingAddedFailure extends ProductCountingAddedState {
  final DioException? error;
  const ProductCountingAddedFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class ProductCountingAddedSuccess extends ProductCountingAddedState {
  
  @override
  final List<ProductCountingAddedModel>? productCountingAddedList;
  
  const ProductCountingAddedSuccess(
      {this.productCountingAddedList});

  @override
  List<Object?> get props => [productCountingAddedList];
}

