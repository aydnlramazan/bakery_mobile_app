import 'package:bakery_app/features/domain/repositories/service_debt_repository.dart';

import '../../../core/resources/data_state.dart';
import '../entities/service_debt_detail.dart';
import '../entities/service_debt_total.dart';

class ServiceDebtUseCase {
  final ServiceDebtRepository _serviceDebtRepository;
  ServiceDebtUseCase(this._serviceDebtRepository);

  Future<DataState<List<ServiceDebtTotalEntity>>>
      getServiceDebtMarketsList() async {
    return _serviceDebtRepository.getServiceDebtMarketsList();
  }

  Future<DataState<List<ServiceDebtDetailEntity>>>
      getServiceDebtDetailByMarketId(int marketId) async {
    return _serviceDebtRepository.getServiceDebtDetailByMarketId(marketId);
  }

  Future<DataState<void>> postServicePayDebt(
      ServiceDebtDetailEntity serviceDebtDetail) async {
    return _serviceDebtRepository.postServicePayDebt(serviceDebtDetail);
  }

  Future<DataState<void>> deleteServiceDebtDetail(int id) {
    return _serviceDebtRepository.deleteServiceDebtDetail(id);
  }

  Future<DataState<void>> updateServiceDebtDetail(
      ServiceDebtDetailEntity serviceDebtDetail) async {
    return _serviceDebtRepository.updateServiceDebtDetail(serviceDebtDetail);
  }
}
