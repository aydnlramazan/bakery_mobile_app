part of 'given_product_to_service_bloc.dart';

sealed class GivenProductToServiceEvent {}

final class GivenProductToServiceGetListRequested
    extends GivenProductToServiceEvent {
  final DateTime date;
  final int servisTypeId;
  GivenProductToServiceGetListRequested({required this.date, required this.servisTypeId});
}

final class GivenProductToServicePostRequested
    extends GivenProductToServiceEvent {
  final GivenProductToServiceModel givenProductToService;
  GivenProductToServicePostRequested({required this.givenProductToService});
}

final class GivenProductToServiceUpdateRequested
    extends GivenProductToServiceEvent {
  final GivenProductToServiceModel givenProductToService;
  GivenProductToServiceUpdateRequested({required this.givenProductToService});
}

final class GivenProductToServiceDeleteRequested
    extends GivenProductToServiceEvent {
  final GivenProductToServiceModel givenProductToService;
  GivenProductToServiceDeleteRequested({required this.givenProductToService});
}
