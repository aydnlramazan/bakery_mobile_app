part of 'service_stale_left_bloc.dart';

sealed class ServiceStaleLeftEvent{}


final class ServiceGetStaleLeftRequested extends ServiceStaleLeftEvent {
  final DateTime date;
  ServiceGetStaleLeftRequested({required this.date});
}

final class ServicePostAccountLeftRequested extends ServiceStaleLeftEvent {
  final BuildContext context;
  final ServiceStaleModel serviceStaleModel;
  final int staleQuantity;
  ServicePostAccountLeftRequested( {
    required this.context,
    required this.serviceStaleModel,
    required this.staleQuantity,
  });
}
