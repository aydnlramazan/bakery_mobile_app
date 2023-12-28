import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super(UserLoginInitial()) {
    on<UserLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
