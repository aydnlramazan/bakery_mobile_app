part of 'stale_bread_bloc.dart';

sealed class StaleBreadState extends Equatable {
  const StaleBreadState();
  
 get staleBreadList => null;
}

final class StaleBreadLoading extends StaleBreadState {
  const StaleBreadLoading();
  @override
  List<Object?> get props => [];
}

final class StaleBreadFailure extends StaleBreadState {
  final DioException? error;
  const StaleBreadFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class StaleBreadSuccess extends StaleBreadState {
  
  @override
  final List<StaleBreadAddedModel>? staleBreadList;
  
  const StaleBreadSuccess(
      {this.staleBreadList});

  @override
  List<Object?> get props => [staleBreadList];
}

