part of 'service_stale_product_bloc.dart';

sealed class ServiceStaleProductEvent {}

final class ServiceStaleProductGetListRequested
    extends ServiceStaleProductEvent {
  final DateTime date;
  final int serviceTypeId;
  ServiceStaleProductGetListRequested(
      {required this.date, required this.serviceTypeId});
}

final class ServiceStaleProductPostRequested extends ServiceStaleProductEvent {
  final ServiceStaleProductModel serviceStaleProduct;
  ServiceStaleProductPostRequested({required this.serviceStaleProduct});
}

final class ServiceStaleProductUpdateRequested
    extends ServiceStaleProductEvent {
  final ServiceStaleProductModel serviceStaleProduct;
  
  ServiceStaleProductUpdateRequested({required this.serviceStaleProduct});
}

final class ServiceStaleProductDeleteRequested
    extends ServiceStaleProductEvent {
  final ServiceStaleProductModel serviceStaleProduct;
  ServiceStaleProductDeleteRequested({required this.serviceStaleProduct});
}
