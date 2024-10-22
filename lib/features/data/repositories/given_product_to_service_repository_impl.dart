import 'dart:io';

import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/data/data_sources/remote/given_product_to_service_service.dart';
import 'package:bakery_app/features/data/models/given_product_to_service.dart';
import 'package:bakery_app/features/domain/entities/given_product_to_service.dart';
import 'package:bakery_app/features/domain/repositories/given_product_to_service_repository.dart';
import 'package:dio/dio.dart';

class GivenProductToServiceRepositoryImpl
    extends GivenProductToServiceRepository {
  final GivenProductToService _givenProductToService;
  GivenProductToServiceRepositoryImpl(this._givenProductToService);
  @override
  Future<DataState<void>> addGivenProductToService(
      GivenProductToServiceEntity givenProductToService) async {
    try {
      final httpResponse =
          await _givenProductToService.addGivenProductToService(
              givenProductToService:
                  GivenProductToServiceModel.fromEntity(givenProductToService));
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
  Future<DataState<void>> deleteGivenProductToService(int id) async {
    try {
      
      final httpResponse =
          await _givenProductToService.deleteGivenProductToService(id: id);
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
  Future<DataState<List<GivenProductToServiceEntity>>>
      getGivenProductToServiceListByDateAndServiceType(
          DateTime date, int servisTypeId) async {
    try {
      final httpResponse = await _givenProductToService
          .getGivenProductToServiceListByDateAndServiceType(
              date: date, servisTypeId: servisTypeId);
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
  Future<DataState<void>> updateGivenProductToService(
      GivenProductToServiceEntity givenProductToService) async {
    try {
      final httpResponse =
          await _givenProductToService.updateGivenProductToService(
              givenProductToService:
                  GivenProductToServiceModel.fromEntity(givenProductToService));
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
