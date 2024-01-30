part of 'service_lists_bloc.dart';

sealed class ServiceListsEvent{}

final class ServiceGetListsRequested extends ServiceListsEvent {
final DateTime dateTime;
 ServiceGetListsRequested({required this.dateTime});
}
