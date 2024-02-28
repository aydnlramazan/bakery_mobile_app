part of 'product_counting_not_added_bloc.dart';

sealed class ProductCountingNotAddedEvent {}

final class GetProductCountingNotAddedRequested
    extends ProductCountingNotAddedEvent {
  final DateTime date;
  final int categoryId;
  GetProductCountingNotAddedRequested({required this.date, required this.categoryId});
}

final class PostProductCountingNotAddedRequested
    extends ProductCountingNotAddedEvent {
  final ProductNotAddedModel productNotAdded;
  final int productQuantity;
  PostProductCountingNotAddedRequested({
    required this.productNotAdded,
    required this.productQuantity,
  });
}
