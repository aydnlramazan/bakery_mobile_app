import 'package:bakery_app/features/domain/entities/service_added_market.dart';
import 'package:bakery_app/features/domain/entities/service_list.dart';
import 'package:bakery_app/features/domain/entities/service_market.dart';
import 'package:bakery_app/features/domain/entities/service_market_to_add.dart';

import '../../../core/resources/data_state.dart';
import '../repositories/service_market_repository.dart';

class ServiceMarketUseCase {
  final ServiceMarketRepository _serviceMarketRepository;

  ServiceMarketUseCase(this._serviceMarketRepository);

  Future<DataState<List<ServiceListEntity>>> getServiceListsByDate(
      DateTime date) async {
    return await _serviceMarketRepository.getServiceListsByDate(date);
  }

  Future<DataState<List<ServiceAddedMarketEntity>>>
      getServiceListMarketsByListId(int listId) async {
    return await _serviceMarketRepository.getServiceListMarketsByListId(listId);
  }

  Future<DataState<List<ServiceMarketEntity>>> getAvailableServiceMarkets(
      int listId) async {
    return await _serviceMarketRepository.getAvailableServiceMarkets(listId);
  }

  Future<DataState<int>> addServiceMarkets(
      int userId, List<ServiceMarketToAddEntity> serviceMarkets) async {
    return await _serviceMarketRepository.addServiceMarkets(userId, serviceMarkets);
  }

  Future<DataState<void>> deleteServiceMarketById(int id) async {
    return await _serviceMarketRepository.deleteServiceMarketById(id);
  }

  Future<DataState<void>> updateServiceMarket(
      ServiceMarketToAddEntity serviceMarket) async {
    return await _serviceMarketRepository.updateServiceMarket(serviceMarket);
  }
}
