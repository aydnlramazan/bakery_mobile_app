part of 'product_counting_added_bloc.dart';

sealed class ProductCountingAddedEvent {}

final class GetProductCountingAddedRequested extends ProductCountingAddedEvent {
  final DateTime date;
  final int categoryId;
  GetProductCountingAddedRequested(
      {required this.date, required this.categoryId});
}

final class RemoveProductCountingAddedRequested
    extends ProductCountingAddedEvent {
  final ProductCountingAddedModel productCountingAddedModel;
  RemoveProductCountingAddedRequested(
      {required this.productCountingAddedModel});
}

final class UpdateProductCountingAddedRequested
    extends ProductCountingAddedEvent {
  final ProductCountingAddedModel productCountingAddedModel;


  UpdateProductCountingAddedRequested(
      {required this.productCountingAddedModel});
}
