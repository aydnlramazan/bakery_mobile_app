
import 'package:bakery_app/features/domain/entities/expense.dart';

import '../../../core/resources/data_state.dart';

abstract class ExpenseRepository {
    Future<DataState<List<ExpenseEntity>>>getExpenseListByDate(DateTime date);
  Future<DataState<void>> addExpense(ExpenseEntity expense);
  Future<DataState<void>> deleteExpense(int id);
  Future<DataState<void>> updateExpense(ExpenseEntity expense);
}