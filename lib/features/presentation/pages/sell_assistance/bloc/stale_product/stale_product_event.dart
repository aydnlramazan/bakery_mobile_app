part of 'stale_product_bloc.dart';

sealed class StaleProductEvent {}

final class GetStaleAddedProductRequested extends StaleProductEvent {
  final DateTime date;
  final int categoryId;
  GetStaleAddedProductRequested({required this.date, required this.categoryId});
}

final class RemoveStaleAddedProductRequested extends StaleProductEvent {
  final StaleProductAddedModel staleProductAddedModel;
  RemoveStaleAddedProductRequested({required this.staleProductAddedModel});
}

final class UpdateStaleAddedProductRequested extends StaleProductEvent {
  final StaleProductAddedModel staleProductAddedModel;

  UpdateStaleAddedProductRequested({required this.staleProductAddedModel});
}
