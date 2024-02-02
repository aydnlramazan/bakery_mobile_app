import 'package:bakery_app/features/domain/entities/service_account_left.dart';
import 'package:bakery_app/features/domain/entities/service_account_to_receive.dart';

import '../../../core/resources/data_state.dart';
import '../entities/service_account_received.dart';

abstract class ServiceAccountRepository {
  Future<DataState<List<ServiceAccountReceivedEntity>>>getServiceAccountReceivedByDate(DateTime date);
  Future<DataState<List<ServiceAccountLeftEntity>>> getServiceAccountLeftByDate(DateTime date);
  Future<DataState<void>> addServiceAccountReceived(ServiceAccountToReceiveEntity serviceAccountReceived);
  Future<DataState<void>> deleteServiceAccountReceived(ServiceAccountToReceiveEntity serviceAccountReceived);
  Future<DataState<void>> updateServiceAccountReceived(ServiceAccountToReceiveEntity serviceAccountReceived);
}
