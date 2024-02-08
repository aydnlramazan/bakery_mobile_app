part of 'given_product_to_service_bloc.dart';
@immutable
sealed class GivenProductToServiceState extends Equatable {
  const GivenProductToServiceState();
  get givenProductToServiceList => null;
  
}

final class GivenProductToServiceLoading extends GivenProductToServiceState {
  const GivenProductToServiceLoading();
  @override
  List<Object?> get props => [];
}

final class GivenProductToServiceFailure extends GivenProductToServiceState {
  final DioException? error;
  const GivenProductToServiceFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class GivenProductToServiceSuccess extends GivenProductToServiceState {
  
  @override
  final List<GivenProductToServiceModel>? givenProductToServiceList;
  
  const GivenProductToServiceSuccess(
      {this.givenProductToServiceList});

  @override
  List<Object?> get props => [givenProductToServiceList];
}
