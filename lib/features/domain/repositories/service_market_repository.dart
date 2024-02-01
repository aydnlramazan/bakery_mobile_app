

import 'package:bakery_app/features/domain/entities/service_added_market.dart';
import 'package:bakery_app/features/domain/entities/service_list.dart';
import 'package:bakery_app/features/domain/entities/service_market.dart';
import 'package:bakery_app/features/domain/entities/service_market_to_add.dart';

import '../../../core/resources/data_state.dart';

abstract class ServiceMarketRepository {
  Future<DataState<List<ServiceListEntity>>> getServiceListsByDate(DateTime date);
  Future<DataState<List<ServiceAddedMarketEntity>>>getServiceListMarketsByListId(int listId);
  Future<DataState<List<ServiceMarketEntity>>> getAvailableServiceMarkets(int listId); // if list id is 0 then it will retrieve all Service Market else retrieve Markets that are not exist in this list
  Future<DataState<int>> addServiceMarkets(int userId, List<ServiceMarketToAddEntity> serviceListMarket);
  Future<DataState<void>> deleteServiceMarketById(int id);
  Future<DataState<void>> updateServiceMarket(ServiceMarketToAddEntity serviceMarket);
}