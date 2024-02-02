import 'package:bakery_app/features/domain/repositories/service_account_repository.dart';

import '../../../core/resources/data_state.dart';
import '../entities/service_account_left.dart';
import '../entities/service_account_received.dart';
import '../entities/service_account_to_receive.dart';

class ServiceAccountUseCase {
  final ServiceAccountRepository _serviceAccountRepository;
  ServiceAccountUseCase(this._serviceAccountRepository);
  Future<DataState<List<ServiceAccountReceivedEntity>>>getServiceAccountReceivedByDate(DateTime date) async {
    return await _serviceAccountRepository
        .getServiceAccountReceivedByDate(date);
  }

  Future<DataState<List<ServiceAccountLeftEntity>>> getServiceAccountLeftByDate(
      DateTime date) async {
    return await _serviceAccountRepository.getServiceAccountLeftByDate(date);
  }

  Future<DataState<void>> addServiceAccountReceived(
      ServiceAccountToReceiveEntity serviceAccountReceived) async {
    return await _serviceAccountRepository
        .addServiceAccountReceived(serviceAccountReceived);
  }

  Future<DataState<void>> deleteServiceAccountReceived(
      ServiceAccountToReceiveEntity serviceAccountReceived) async {
    return await _serviceAccountRepository
        .deleteServiceAccountReceived(serviceAccountReceived);
  }

  Future<DataState<void>> updateServiceAccountReceived(
      ServiceAccountToReceiveEntity serviceAccountReceived) async {
    return await _serviceAccountRepository
        .updateServiceAccountReceived(serviceAccountReceived);
  }
}
