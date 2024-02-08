part of 'expense_bloc.dart';
@immutable
sealed class ExpenseState extends Equatable {
  const ExpenseState();
  
get expenseList => null;
}

final class ExpenseLoading extends ExpenseState {
  const ExpenseLoading();
  @override
  List<Object?> get props => [];
}

final class ExpenseFailure extends ExpenseState {
  final DioException? error;
  const ExpenseFailure({this.error});

  @override
  List<Object?> get props => [error];
}

final class ExpenseSuccess extends ExpenseState {
  
  @override
  final List<ExpenseModel>? expenseList;
  
  const ExpenseSuccess(
      {this.expenseList});

  @override
  List<Object?> get props => [expenseList];
}

