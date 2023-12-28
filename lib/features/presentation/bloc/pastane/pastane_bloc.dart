import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pastane_event.dart';
part 'pastane_state.dart';

class PastaneBloc extends Bloc<PastaneEvent, PastaneState> {
  PastaneBloc() : super(PastaneInitial()) {
    on<PastaneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
