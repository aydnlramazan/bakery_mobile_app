
import 'dart:io';

import 'package:bakery_app/core/resources/data_state.dart';
import 'package:bakery_app/features/data/data_sources/remote/expense_service.dart';
import 'package:bakery_app/features/data/models/expense.dart';
import 'package:bakery_app/features/domain/entities/expense.dart';
import 'package:bakery_app/features/domain/repositories/expense_repository.dart';
import 'package:dio/dio.dart';

class ExpenseRepositoryImpl extends ExpenseRepository{
  final ExpenseService _expenseService;
  ExpenseRepositoryImpl(this._expenseService);
  @override
  Future<DataState<void>> addExpense(ExpenseEntity expense) async{
 try {
      final httpResponse = await _expenseService.addExpense(expense: ExpenseModel.fromEntity(expense));
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
  Future<DataState<void>> deleteExpense(int id)async {
 try {
      final httpResponse = await _expenseService.deleteExpense(id: id);
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
  Future<DataState<List<ExpenseEntity>>> getExpenseListByDate(DateTime date)async {
   try {
      final httpResponse = await _expenseService.getExpenseListByDate(date: date);
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
  Future<DataState<void>> updateExpense(ExpenseEntity expense)async {
 try {
      final httpResponse = await _expenseService.updateExpense(expense: ExpenseModel.fromEntity(expense));
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