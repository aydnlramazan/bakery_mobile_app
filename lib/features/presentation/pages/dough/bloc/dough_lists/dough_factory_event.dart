part of 'dough_factory_bloc.dart';

sealed class DoughFactoryEvent {}

final class DoughGetListsRequested extends DoughFactoryEvent {
  DateTime dateTime;
  DoughGetListsRequested({required this.dateTime});
}

