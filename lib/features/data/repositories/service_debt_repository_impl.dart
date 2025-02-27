import 'dart:io';

import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/data/data_sources/remote/service_debt_service.dart';
import 'package:bakery_app/features/data/models/service_debt_detail.dart';
import 'package:bakery_app/features/domain/entities/service_debt_detail.dart';
import 'package:bakery_app/features/domain/entities/service_debt_total.dart';
import 'package:bakery_app/features/domain/repositories/service_debt_repository.dart';
import 'package:dio/dio.dart';

class ServiceDebtRepositoryImpl extends ServiceDebtRepository {
  final ServiceDebtApiService _serviceDebtApiService;
  ServiceDebtRepositoryImpl(this._serviceDebtApiService);
  @override
  Future<DataState<void>> deleteServiceDebtDetail(int id) async {
    try {
      final httpResponse = await _serviceDebtApiService.deleteServiceDebtDetail(
          id: id);
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
  Future<DataState<List<ServiceDebtDetailEntity>>>
      getServiceDebtDetailByMarketId(int marketId)async {
 try {
      final httpResponse = await _serviceDebtApiService.getServiceDebtDetailByMarketId(marketId: marketId);
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
  Future<DataState<List<ServiceDebtTotalEntity>>> getServiceDebtMarketsList()async {
 try {
      final httpResponse = await _serviceDebtApiService.getServiceDebtMarketsList();
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
  Future<DataState<void>> postServicePayDebt(
      ServiceDebtDetailEntity serviceDebtDetail)async {
   try{
 final ServiceDebtDetailModel serviceDebtDetailModel = ServiceDebtDetailModel.fromEntity(serviceDebtDetail);

      final httpResponse = await _serviceDebtApiService.postServicePayDebt(
          serviceDebtDetail: serviceDebtDetailModel
          );
      if (httpResponse.response.statusCode! >= 200 && httpResponse.response.statusCode! <= 300  ) {
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
  Future<DataState<void>> updateServiceDebtDetail(
      ServiceDebtDetailEntity serviceDebtDetail)async {
  try{
 final ServiceDebtDetailModel serviceDebtDetailModel = ServiceDebtDetailModel.fromEntity(serviceDebtDetail);

      final httpResponse = await _serviceDebtApiService.updateServiceDebtDetail(
          serviceDebtDetail: serviceDebtDetailModel
          );
      if (httpResponse.response.statusCode! >= 200 && httpResponse.response.statusCode! <= 300  ) {
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
