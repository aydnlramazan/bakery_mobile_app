part of 'stale_bread_bloc.dart';

sealed class StaleBreadEvent{
}

final class GetStaleBreadRequested
    extends StaleBreadEvent {
  final DateTime date;
  GetStaleBreadRequested({required this.date});
}

final class RemoveStaleBreadRequested
    extends StaleBreadEvent {

  final StaleBreadAddedModel staleBreadAddedModel;
  RemoveStaleBreadRequested(
      {required this.staleBreadAddedModel});
}

final class UpdateStaleBreadRequested
    extends StaleBreadEvent {
  final StaleBreadAddedModel staleBreadAddedModel;

  UpdateStaleBreadRequested(
      {required this.staleBreadAddedModel});
}