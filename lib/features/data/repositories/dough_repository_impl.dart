import 'dart:io';

import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/data/data_sources/remote/dough_service.dart';
import 'package:bakery_app/features/data/models/dough_list.dart';
import 'package:bakery_app/features/data/models/dough_list_product.dart';
import 'package:bakery_app/features/data/models/dough_product.dart';
import 'package:bakery_app/features/domain/entities/added_dough_list_product.dart';
import 'package:bakery_app/features/domain/entities/dough_list_product.dart';
import 'package:dio/dio.dart';
import 'package:bakery_app/features/domain/repositories/dough_repository.dart';

class DoughRepositoryImpl extends DoughRepository {
  final DoughApiService _doughApiService;
  DoughRepositoryImpl(this._doughApiService);

  @override
  Future<DataState<void>> deleteDoughProductById(int id) async {
    try {
      final httpResponse = await _doughApiService.deleteProductFromList(id: id);
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
  Future<DataState<List<DoughProductModel>>> getAvailableDoughProducts(
      int listId) async {
    try {
      final httpResponse =
          await _doughApiService.getAvailableProductsByListId(listId: listId);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data as List<DoughProductModel>);
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
  Future<DataState<List<AddedDoughListProductEntity>>>
      getDoughListProductsByListId(int listId) async {
    try {
      final httpResponse =
          await _doughApiService.getAddedProductsByListId(listId: listId);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
            httpResponse.data as List<AddedDoughListProductEntity>);
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
  Future<DataState<List<DoughListModel>>> getDoughListsByDate(
      DateTime date) async {
    try {
      final httpResponse = await _doughApiService.getListsByDate(date: date);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data as List<DoughListModel>);
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
  Future<DataState<void>> updateDoughProduct(
      DoughListProductEntity doughProduct) async {
    try {
      final httpResponse = await _doughApiService.updateProductFromList(
          doughListProduct: DoughListProductModel.fromEntity(doughProduct));
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
  Future<DataState<String>> addDoughProducts(
      int userId, List<DoughListProductEntity> doughListProduct)async {
   try {
     final List<DoughListProductModel> doughListProductModels =
        doughListProduct.map((entity) => DoughListProductModel.fromEntity(entity)).toList();

      final httpResponse = await _doughApiService.addDoughProducts(
          doughListProduct: doughListProductModels);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data as String);
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
