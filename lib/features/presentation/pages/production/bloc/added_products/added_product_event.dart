part of 'added_product_bloc.dart';

sealed class AddedProductsEvent {}

final class GetAddedProductsRequested extends AddedProductsEvent {
  DateTime date;
  int categoryId;
  GetAddedProductsRequested({required this.date, required this.categoryId});
}

final class AddAddedProductRequested extends AddedProductsEvent {
  AddedProductModel product;
  AddAddedProductRequested({required this.product});
}

final class RemoveAddedProductRequested extends AddedProductsEvent {
  AddedProductModel product;
  RemoveAddedProductRequested({required this.product});
}

final class UpdateAddedProductRequested extends AddedProductsEvent {
  final AddedProductModel product;
  final int index;
  UpdateAddedProductRequested({required this.product, required this.index});
}

final class PostAddedProductRequested extends AddedProductsEvent {
  final List<ProductToAddModel> products;
  final int userId;
  final int categoryId;
  PostAddedProductRequested({required this.products, required this.userId, required this.categoryId});
}
