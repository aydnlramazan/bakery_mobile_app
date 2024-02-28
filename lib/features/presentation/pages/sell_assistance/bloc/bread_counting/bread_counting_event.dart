part of 'bread_counting_bloc.dart';

sealed class BreadCountingEvent{}

final class BreadCountingGetListRequested
    extends BreadCountingEvent {
  final DateTime date;

  BreadCountingGetListRequested({required this.date});
}

final class BreadCountingPostRequested
    extends BreadCountingEvent {
  final BreadCountingModel breadCounting;
  BreadCountingPostRequested({required this.breadCounting});
}

final class BreadCountingUpdateRequested
    extends BreadCountingEvent {
  final BreadCountingModel breadCounting;
  BreadCountingUpdateRequested({required this.breadCounting});
}

final class BreadCountingDeleteRequested
    extends BreadCountingEvent {
  final int id;
  BreadCountingDeleteRequested({required this.id});
}
