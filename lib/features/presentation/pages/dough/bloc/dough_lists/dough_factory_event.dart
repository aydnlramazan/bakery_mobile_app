part of 'dough_factory_bloc.dart';

sealed class DoughFactoryEvent {}

final class DoughGetListsRequested extends DoughFactoryEvent {
  DateTime dateTime;
  DoughGetListsRequested({required this.dateTime});
}

// final class DoughGetAddedProductsRequested extends DoughFactoryEvent {
//   int listId;
//   DoughGetAddedProductsRequested({required this.listId});
// }

// final class DoughGetProductsRequested extends DoughFactoryEvent {
//   int listId;
//   DoughGetProductsRequested({required this.listId});
// }

final class DoughPostProductsRequested extends DoughFactoryEvent {
  int userId;
  List<DoughProductToAddModel> doughProductList;
  DoughPostProductsRequested({required this.userId ,required this.doughProductList});
}

final class DoughUpdateProductRequest extends DoughFactoryEvent {
  DoughProductToAddModel product;
  DoughUpdateProductRequest({required this.product});
}

final class DoughDeleteProductRequest extends DoughFactoryEvent {
  int id;
  DoughDeleteProductRequest({required this.id});
}
