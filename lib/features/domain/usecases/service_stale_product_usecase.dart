import '../../../core/resources/data_state.dart';
import '../entities/service_stale_product.dart';
import '../repositories/service_stale_product_repository.dart';

class ServiceStaleProductUseCase {
  final ServiceStaleProductRepository _serviceStaleProductRepository;
  ServiceStaleProductUseCase(this._serviceStaleProductRepository);

  Future<DataState<List<ServiceStaleProductEntity>>>
      getServiceStaleProductListByDateAndServiceType(
          DateTime date, int serviceTypeId) async {
    return _serviceStaleProductRepository
        .getServiceStaleProductListByDateAndServiceType(date, serviceTypeId);
  }

  Future<DataState<void>> addServiceStaleProduct(
      ServiceStaleProductEntity serviceStaleProduct) async {
    return _serviceStaleProductRepository
        .addServiceStaleProduct(serviceStaleProduct);
  }

  Future<DataState<void>> deleteServiceStaleProduct(int id) async {
    return _serviceStaleProductRepository.deleteServiceStaleProduct(id);
  }

  Future<DataState<void>> updateServiceStaleProduct(
      ServiceStaleProductEntity serviceStaleProduct) async {
    return _serviceStaleProductRepository
        .updateServiceStaleProduct(serviceStaleProduct);
  }
}
