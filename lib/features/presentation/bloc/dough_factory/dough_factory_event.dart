part of 'dough_factory_bloc.dart';

sealed class DoughFactoryEvent {}

final class DoughListsRequested extends DoughFactoryEvent {
  DateTime dateTime;
  DoughListsRequested({required this.dateTime});
}
