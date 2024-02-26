part of 'stale_product_bloc.dart';

sealed class StaleProductState extends Equatable {
  const StaleProductState();
  
 get staleAddedProductList => null;
}

final class StaleAddedProductLoading extends StaleProductState {
  const StaleAddedProductLoading();
  @override
  List<Object?> get props => [];
}

final class StaleAddedProductFailure extends StaleProductState {
  final DioException? error;
  const StaleAddedProductFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class StaleAddedProductSuccess extends StaleProductState {
  
  @override
  final List<StaleProductAddedModel>? staleAddedProductList;
  
  const StaleAddedProductSuccess(
      {this.staleAddedProductList});

  @override
  List<Object?> get props => [staleAddedProductList];
}


