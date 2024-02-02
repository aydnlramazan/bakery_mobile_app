import 'package:bakery_app/features/domain/entities/service_received_stale.dart';
import 'package:bakery_app/features/domain/entities/service_to_receive_stale.dart';

import '../../../core/resources/data_state.dart';
import '../entities/service_stale.dart';

abstract class ServiceStaleRepository{
    Future<DataState<List<ServiceReceivedStaleEntity>>>getServiceReceivedStaleByDate(DateTime date);
  Future<DataState<List<ServiceStaleEntity>>> getServiceNotReceivedStaleByDate(DateTime date);
  Future<DataState<void>> addServiceReceivedStale(ServiceToReceiveStaleEntity serviceToReceiveStale);
  Future<DataState<void>> deleteServiceReceivedStale(int id);
  Future<DataState<void>> updateServiceReceivedStale(ServiceToReceiveStaleEntity serviceToReceiveStale);
}