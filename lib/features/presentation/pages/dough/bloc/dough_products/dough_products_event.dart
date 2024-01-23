part of 'dough_products_bloc.dart';

sealed class DoughProductsEvent{}

final class DoughGetProductsRequested extends DoughProductsEvent {
  int listId;
  DoughGetProductsRequested({required this.listId});
}

final class DoughAddProductRequested extends DoughProductsEvent {
  DoughProductModel product;
  DoughAddProductRequested({required this.product});
}

final class DoughRemoveProductRequested extends DoughProductsEvent {
  DoughProductModel product;
  DoughRemoveProductRequested({required this.product});
}