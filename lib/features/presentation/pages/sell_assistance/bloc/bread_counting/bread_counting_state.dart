part of 'bread_counting_bloc.dart';
@immutable
sealed class BreadCountingState extends Equatable {
  const BreadCountingState();
 get breadCounting => [];
}

final class BreadCountingLoading extends BreadCountingState {
  const BreadCountingLoading();
  @override
  List<Object?> get props => [];
}

final class BreadCountingFailure extends BreadCountingState {
  final DioException? error;
  const BreadCountingFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class BreadCountingSuccess extends BreadCountingState {
  
  @override
  final BreadCountingModel? breadCounting;
  
  const BreadCountingSuccess({this.breadCounting});

  @override
  List<Object?> get props => [breadCounting];
}

