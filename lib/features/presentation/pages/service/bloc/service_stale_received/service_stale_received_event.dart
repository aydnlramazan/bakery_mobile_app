part of 'service_stale_received_bloc.dart';

sealed class ServiceStaleReceivedEvent{}

final class ServiceGetReceivedStaleRequested
    extends ServiceStaleReceivedEvent {
  final DateTime date;
  ServiceGetReceivedStaleRequested({required this.date});
}

final class ServiceRemoveReceivedStaleRequested
    extends ServiceStaleReceivedEvent {
 final BuildContext context;
  final ServiceReceivedStaleModel serviceReceivedStaleModel;
  ServiceRemoveReceivedStaleRequested(
      {required this.serviceReceivedStaleModel, required this.context});
}

final class ServiceUpdateReceivedStaleRequested
    extends ServiceStaleReceivedEvent {
  final ServiceReceivedStaleModel serviceReceivedStaleModel;

  ServiceUpdateReceivedStaleRequested(
      {required this.serviceReceivedStaleModel});
}