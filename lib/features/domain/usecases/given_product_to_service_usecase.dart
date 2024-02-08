import 'package:bakery_app/features/domain/repositories/given_product_to_service_repository.dart';

import '../../../core/resources/data_state.dart';
import '../entities/given_product_to_service.dart';

class GivenProductToServiceUseCase {
  final GivenProductToServiceRepository _givenProductToServiceRepository;
  GivenProductToServiceUseCase(this._givenProductToServiceRepository);

  Future<DataState<List<GivenProductToServiceEntity>>>
      getGivenProductToServiceListByDateAndServiceType(
          DateTime date, int servisTypeId) async {
    return _givenProductToServiceRepository
        .getGivenProductToServiceListByDateAndServiceType(date, servisTypeId);
  }

  Future<DataState<void>> addGivenProductToService(
      GivenProductToServiceEntity givenProductToService) async {
    return _givenProductToServiceRepository
        .addGivenProductToService(givenProductToService);
  }

  Future<DataState<void>> deleteGivenProductToService(int id) async {
    return _givenProductToServiceRepository.deleteGivenProductToService(id);
  }

  Future<DataState<void>> updateGivenProductToService(
      GivenProductToServiceEntity givenProductToService) async {
    return _givenProductToServiceRepository
        .updateGivenProductToService(givenProductToService);
  }
}
