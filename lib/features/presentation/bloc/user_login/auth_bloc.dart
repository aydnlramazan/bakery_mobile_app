import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/domain/usecases/user_login_usecase.dart';
import 'package:bakery_app/features/presentation/bloc/user_login/auth_event.dart';
import 'package:bakery_app/features/presentation/bloc/user_login/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;
  AuthBloc(this._authUseCase) : super(AuthInitial()) {
    on<AuthLoginRequested>(onUserLogin);
  }

  void onUserLogin(AuthLoginRequested event, Emitter<AuthState> emit) async {
    final dataState = await _authUseCase(params: event.userLoginParams);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(AuthFailure(dataState.error!));
    }
  }
}
