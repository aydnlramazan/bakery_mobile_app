import '../../../core/resources/data_state.dart';
import '../entities/received_money_from_service.dart';
import '../repositories/received_money_from_service_repository.dart';

class ReceivedMoneyFromServiceUseCase {
  final ReceivedMoneyFromServiceRepository _receivedMoneyFromServiceRepository;
  ReceivedMoneyFromServiceUseCase(this._receivedMoneyFromServiceRepository);

  Future<DataState<ReceivedMoneyFromServiceEntity?>>
      getReceivedMoneyFromServiceByDateAndServiceType(DateTime date, int servisTypeId) {
    return _receivedMoneyFromServiceRepository
        .getReceivedMoneyFromServiceByDateAndServiceType(date, servisTypeId);
  }

  Future<DataState<void>> addReceivedMoneyFromService(
      ReceivedMoneyFromServiceEntity receivedMoneyFromService) {
    return _receivedMoneyFromServiceRepository
        .addReceivedMoneyFromService(receivedMoneyFromService);
  }

  Future<DataState<void>> deleteReceivedMoneyFromServiceById(int id) {
    return _receivedMoneyFromServiceRepository
        .deleteReceivedMoneyFromServiceById(id);
  }

  Future<DataState<void>> updateReceivedMoneyFromService(
      ReceivedMoneyFromServiceEntity receivedMoneyFromService) {
    return _receivedMoneyFromServiceRepository
        .updateReceivedMoneyFromService(receivedMoneyFromService);
  }
}
