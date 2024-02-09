

import 'package:bakery_app/features/domain/entities/service_stale_product.dart';

import '../../../core/resources/data_state.dart';

abstract class ServiceStaleProductRepository{
  Future<DataState<List<ServiceStaleProductEntity>>>getServiceStaleProductListByDateAndServiceType(DateTime date, int serviceTypeId);
  Future<DataState<void>> addServiceStaleProduct(ServiceStaleProductEntity serviceStaleProduct);
  Future<DataState<void>> deleteServiceStaleProduct(int id);
  Future<DataState<void>> updateServiceStaleProduct(ServiceStaleProductEntity serviceStaleProduct);
}