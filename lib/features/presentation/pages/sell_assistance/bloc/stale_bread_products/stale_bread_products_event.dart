part of 'stale_bread_products_bloc.dart';

sealed class StaleBreadProductsEvent  {}

final class GetStaleBreadProductsRequested
    extends StaleBreadProductsEvent {
  final DateTime date;
  GetStaleBreadProductsRequested({required this.date});
}

final class PostStaleBreadProductsRequested extends StaleBreadProductsEvent {

  final StaleBreadModel staleBreadModel;
  final int staleQuantity;
  PostStaleBreadProductsRequested( {
    required this.staleBreadModel,
    required this.staleQuantity,
  });
}
