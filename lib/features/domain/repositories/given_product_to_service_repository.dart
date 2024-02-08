import 'package:bakery_app/features/domain/entities/given_product_to_service.dart';

import '../../../core/resources/data_state.dart';

abstract class GivenProductToServiceRepository{
  Future<DataState<List<GivenProductToServiceEntity>>>getGivenProductToServiceListByDateAndServiceType(DateTime date, int servisTypeId);
  Future<DataState<void>> addGivenProductToService(GivenProductToServiceEntity givenProductToService);
  Future<DataState<void>> deleteGivenProductToService(int id);
  Future<DataState<void>> updateGivenProductToService(GivenProductToServiceEntity givenProductToService);
}