part of 'dough_added_products_bloc.dart';

sealed class DoughAddedProductsEvent {}

final class DoughGetAddedProductsRequested extends DoughAddedProductsEvent {
  int listId;
  DoughGetAddedProductsRequested({required this.listId});
}

final class DoughAddAddedProductRequested extends DoughAddedProductsEvent {
  DoughAddedProductModel product;
  DoughAddAddedProductRequested({required this.product});
}

final class DoughRemoveAddedProductRequested extends DoughAddedProductsEvent {
  DoughAddedProductModel product;
  DoughRemoveAddedProductRequested({required this.product});
}

final class DoughUpdateAddedProductRequested extends DoughAddedProductsEvent {
  final DoughAddedProductModel product;
  final int index;
  DoughUpdateAddedProductRequested({required this.product, required this.index});
}

final class DoughPostAddedProductRequested extends DoughAddedProductsEvent {
  final List<DoughProductToAddModel> products;
  final int userId;
  DoughPostAddedProductRequested({required this.products, required this.userId});
}

