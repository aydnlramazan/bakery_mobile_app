part of 'stale_product_products_bloc.dart';

sealed class StaleProductProductsEvent {}

final class GetStaleProductsRequested extends StaleProductProductsEvent {
  final DateTime date;
  final int categoryId;
  GetStaleProductsRequested({required this.date, required this.categoryId});
}

final class PostStaleProductsRequested extends StaleProductProductsEvent {
  final ProductNotAddedModel staleBreadModel;
  final int staleQuantity;
  PostStaleProductsRequested({
    required this.staleBreadModel,
    required this.staleQuantity,
  });
}
