part of 'stale_product_products_bloc.dart';

sealed class StaleProductProductsState extends Equatable {
  const StaleProductProductsState();
  
 get staleProductsList => null;
}

final class StaleProductsLoading extends StaleProductProductsState {
  const StaleProductsLoading();
  @override
  List<Object?> get props => [];
}

final class StaleProductsFailure extends StaleProductProductsState {
  final DioException? error;
  const StaleProductsFailure({this.error});
  @override
  List<Object?> get props => [error];
}

final class StaleProductsSuccess extends StaleProductProductsState {
  
  @override
  final List<ProductNotAddedModel>? staleProductsList;
  const StaleProductsSuccess({this.staleProductsList});
  @override
  List<Object?> get props => [staleProductsList];
}
