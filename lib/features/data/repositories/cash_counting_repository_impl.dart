import 'dart:io';
import 'package:dio/dio.dart';


import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/data/data_sources/remote/cash_counting_service.dart';

import 'package:bakery_app/features/domain/entities/cash_counting.dart';

import '../../domain/repositories/cash_counting_repository.dart';
import '../models/cash_counting.dart';

class CashCountingRepositoryImpl extends CashCountingRepository {
  final CashCountingService _cashCountingService;
  CashCountingRepositoryImpl(this._cashCountingService);
  @override
  Future<DataState<void>> addCashCounting(CashCountingEntity cashCounting)async {
   try {
      final httpResponse = await _cashCountingService.addCashCounting(cashCounting:CashCountingModel.fromEntity(cashCounting));
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<DataState<void>> deleteCashCountingById(int id)async {
   try {
      
      final httpResponse =
          await _cashCountingService.deleteCashCountingById(id: id);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<DataState<CashCountingEntity?>> getCashCountingByDate(DateTime date)async {
 try {
      final httpResponse = await _cashCountingService.getCashCountingByDate(date: date);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      if(httpResponse.response.statusCode == HttpStatus.noContent){
         return const DataSuccess(null);
      }
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              requestOptions: httpResponse.response.requestOptions),
        );
     
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<DataState<void>> updateCashCounting(CashCountingEntity cashCounting)async {
    try {
      final httpResponse =
          await _cashCountingService.updateCashCounting(cashCounting: CashCountingModel.fromEntity(cashCounting));
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } catch (e) {
      throw e;
    }
  }
}
