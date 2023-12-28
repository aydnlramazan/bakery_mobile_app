import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'borek_event.dart';
part 'borek_state.dart';

class BorekBloc extends Bloc<BorekEvent, BorekState> {
  BorekBloc() : super(BorekInitial()) {
    on<BorekEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
