import 'package:bakery_app/features/domain/repositories/service_stale_repository.dart';

import '../../../core/resources/data_state.dart';
import '../entities/service_received_stale.dart';
import '../entities/service_stale.dart';
import '../entities/service_to_receive_stale.dart';

class ServiceStaleUseCase {
  final ServiceStaleRepository _serviceStaleRepository;
  ServiceStaleUseCase(this._serviceStaleRepository);
  Future<DataState<List<ServiceReceivedStaleEntity>>>
      getServiceReceivedStaleByDate(DateTime date) async {
    return _serviceStaleRepository.getServiceReceivedStaleByDate(date);
  }

  Future<DataState<List<ServiceStaleEntity>>> getServiceNotReceivedStaleByDate(
      DateTime date) async {
    return _serviceStaleRepository.getServiceNotReceivedStaleByDate(date);
  }

  Future<DataState<void>> addServiceReceivedStale(
      ServiceToReceiveStaleEntity serviceToReceiveStale) async {
    return _serviceStaleRepository
        .addServiceReceivedStale(serviceToReceiveStale);
  }

  Future<DataState<void>> deleteServiceReceivedStale(
      int id) async {
    return _serviceStaleRepository
        .deleteServiceReceivedStale(id);
  }

  Future<DataState<void>> updateServiceReceivedStale(
      ServiceToReceiveStaleEntity serviceToReceiveStale) async {
    return _serviceStaleRepository
        .updateServiceReceivedStale(serviceToReceiveStale);
  }
}
