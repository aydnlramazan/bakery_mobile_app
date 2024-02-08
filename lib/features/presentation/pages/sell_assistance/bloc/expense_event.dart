part of 'expense_bloc.dart';

sealed class ExpenseEvent {}

final class ExpenseGetListRequested extends ExpenseEvent {
  final DateTime date;
  ExpenseGetListRequested({required this.date});
}

final class ExpensePostRequested extends ExpenseEvent {
  final ExpenseModel expense;
  ExpensePostRequested({required this.expense});
}

final class ExpenseUpdateRequested extends ExpenseEvent {
  final ExpenseModel expense;
  ExpenseUpdateRequested({required this.expense});
}

final class ExpenseDeleteRequested extends ExpenseEvent {
  final ExpenseModel expense;
  ExpenseDeleteRequested({required this.expense});
}




