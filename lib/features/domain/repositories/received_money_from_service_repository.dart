import '../../../core/resources/data_state.dart';
import '../entities/received_money_from_service.dart';

abstract class ReceivedMoneyFromServiceRepository{
  Future<DataState<List<ReceivedMoneyFromServiceEntity>>> getReceivedMoneyFromServiceByDateAndServiceType(DateTime date, int servisTypeId);
  Future<DataState<void>> addReceivedMoneyFromService(ReceivedMoneyFromServiceEntity receivedMoneyFromService);
  Future<DataState<void>> deleteReceivedMoneyFromServiceById(int id);
  Future<DataState<void>> updateReceivedMoneyFromService(ReceivedMoneyFromServiceEntity receivedMoneyFromService);
}