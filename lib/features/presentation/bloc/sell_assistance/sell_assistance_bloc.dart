import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sell_assistance_event.dart';
part 'sell_assistance_state.dart';

class SellAssistanceBloc extends Bloc<SellAssistanceEvent, SellAssistanceState> {
  SellAssistanceBloc() : super(SellAssistanceInitial()) {
    on<SellAssistanceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
