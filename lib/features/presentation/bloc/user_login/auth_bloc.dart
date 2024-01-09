import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/domain/entities/user.dart';
import 'package:bakery_app/features/domain/usecases/user_login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;
  AuthBloc(this._authUseCase) : super(AuthInitial()) {
    on<AuthLoginRequested>(onUserLogin);
  }

  void onUserLogin(AuthLoginRequested event, Emitter<AuthState> emit) async {
    print(event.userLoginParams.userName);
    emit(const AuthLoading());
    final dataState = await _authUseCase(params: event.userLoginParams);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(AuthSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(AuthFailure(dataState.error!));
    }
  }
}
