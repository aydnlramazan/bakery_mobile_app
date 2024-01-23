part of 'product_bloc.dart';

sealed class ProductEvent {}

final class GetProductsRequested extends ProductEvent {
  DateTime date;
  int categoryId;
  GetProductsRequested({required this.date, required this.categoryId});
}

final class AddProductRequested extends ProductEvent {
  ProductModel product;
  AddProductRequested({required this.product});
}

final class RemoveProductRequested extends ProductEvent {
  ProductModel product;
  RemoveProductRequested({required this.product});
}
