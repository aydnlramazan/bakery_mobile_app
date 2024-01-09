

import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/data/models/dough_list.dart';
import 'package:bakery_app/features/domain/usecases/dough_factory_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dio/dio.dart';

part 'dough_factory_event.dart';
part 'dough_factory_state.dart';

class DoughFactoryBloc extends Bloc<DoughFactoryEvent, DoughFactoryState> {
  final DoughUseCase _doughUseCase;
  DoughFactoryBloc(this._doughUseCase) : super(DoughFactoryInitial()) {
    on<DoughListsRequested>(onGetDoughLists);
  }

  void onGetDoughLists(
      DoughListsRequested event, Emitter<DoughFactoryState> emit) async {
    emit(const DoughFactoryLoading());
    final dataState = await _doughUseCase.getDoughListsByDate(event.dateTime);
    if (dataState is DataSuccess && dataState.data != null) {
       print("DoughFactorySuccess: "+dataState.data.toString());
      emit(DoughFactorySuccess(dataState.data as List<DoughListModel>));
    }

    if (dataState is DataFailed) {
      print("DoughFactoryFailure");
      emit(DoughFactoryFailure(dataState.error!));
    }
  }
}
