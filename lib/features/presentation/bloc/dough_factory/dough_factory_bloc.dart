import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dough_factory_event.dart';
part 'dough_factory_state.dart';

class DoughFactoryBloc extends Bloc<DoughFactoryEvent, DoughFactoryState> {
  DoughFactoryBloc() : super(DoughFactoryInitial()) {
    on<DoughFactoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
