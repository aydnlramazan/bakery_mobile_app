 import 'package:bakery_app/features/domain/entities/service_debt_detail.dart';
import 'package:bakery_app/features/domain/entities/service_debt_total.dart';

import '../../../core/resources/data_state.dart';

abstract class ServiceDebtRepository{
Future<DataState<List<ServiceDebtTotalEntity>>> getServiceDebtMarketsList();
  Future<DataState<List<ServiceDebtDetailEntity>>>getServiceDebtDetailByMarketId(int marketId);
  Future<DataState<void>> postServicePayDebt(ServiceDebtDetailEntity serviceDebtDetail);
  Future<DataState<void>> deleteServiceDebtDetail(int id);
  Future<DataState<void>> updateServiceDebtDetail(ServiceDebtDetailEntity serviceDebtDetail);
  }