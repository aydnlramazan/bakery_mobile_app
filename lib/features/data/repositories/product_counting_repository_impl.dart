import 'dart:io';

import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/data/data_sources/remote/product_counting_service.dart';
import 'package:bakery_app/features/data/models/product_counting_to_add.dart';

import 'package:bakery_app/features/domain/entities/product_counting_added.dart';

import 'package:bakery_app/features/domain/entities/product_counting_to_add.dart';

import 'package:bakery_app/features/domain/entities/product_not_added.dart';

import '../../domain/repositories/product_counting_repository.dart';
import 'package:dio/dio.dart';

class ProductCountingRepositoryImpl extends ProductCountingRepository {
  final ProductCountingService _productCountingService;
  ProductCountingRepositoryImpl(this._productCountingService);
  @override
  Future<DataState<String>> addProduct(
      ProductCountingToAddEntity product) async {
    try {
      
      final httpResponse = await _productCountingService.addProducts(product: ProductCountingToAddModel.fromEntity(product));
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
  Future<DataState<void>> deleteProductById(int id)async {
     try {
      final httpResponse = await _productCountingService.deleteProductById(id: id);
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
  Future<DataState<List<ProductCountingAddedEntity>>>getAddedProductsByDateAndCategoryId(DateTime date, int categoryId) async {
  try {
      final httpResponse = await _productCountingService.getAddedProductsByDateAndCategoryId(date: date,categoryId: categoryId);
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
  Future<DataState<List<ProductNotAddedEntity>>>
      getNotAddedProductsByDateAndCategoryId(
          DateTime date, int categoryId) async {
 try {
      final httpResponse = await _productCountingService.getNotAddedProductsByCategoryId(date: date,categoryId: categoryId);
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
  Future<DataState<void>> updateProduct(
      ProductCountingToAddEntity product) async {
 try {
      final httpResponse = await _productCountingService.updateProduct(product: ProductCountingToAddModel.fromEntity(product));
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
