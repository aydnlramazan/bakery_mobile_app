part of 'stale_bread_products_bloc.dart';

sealed class StaleBreadProductsState extends Equatable {
  const StaleBreadProductsState();
  
get staleBreadProductsList => null;
}

final class StaleBreadProductsLoading extends StaleBreadProductsState {
  const StaleBreadProductsLoading();
  @override
  List<Object?> get props => [];
}

final class StaleBreadProductsFailure extends StaleBreadProductsState {
  final DioException? error;
  const StaleBreadProductsFailure({this.error});
  @override
  List<Object?> get props => [error];
}

final class StaleBreadProductsSuccess extends StaleBreadProductsState {
  
  @override
  final List<StaleBreadModel>? staleBreadProductsList;
  const StaleBreadProductsSuccess({this.staleBreadProductsList});
  @override
  List<Object?> get props => [staleBreadProductsList];
}
