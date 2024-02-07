import 'package:bakery_app/features/domain/repositories/expense_repository.dart';

import '../../../core/resources/data_state.dart';
import '../entities/expense.dart';

class ExpenseUseCase {
  final ExpenseRepository _expenseRepository;
  ExpenseUseCase(this._expenseRepository);

  Future<DataState<List<ExpenseEntity>>> getExpenseListByDate(
      DateTime date) async {
    return _expenseRepository.getExpenseListByDate(date);
  }

  Future<DataState<void>> addExpense(ExpenseEntity expense) async {
    return _expenseRepository.addExpense(expense);
  }

  Future<DataState<void>> deleteExpense(int id) async {
    return _expenseRepository.deleteExpense(id);
  }

  Future<DataState<void>> updateExpense(ExpenseEntity expense) async {
    return _expenseRepository.updateExpense(expense);
  }
}
