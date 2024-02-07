import 'package:equatable/equatable.dart';

class ExpenseEntity extends Equatable {
  final int id;
  final String detail;
  final DateTime date;
  final double amount; 

  const ExpenseEntity({
    required this.id,
    required this.detail,
    required this.date,
    required this.amount,
  });

  @override
  List<Object?> get props {
    return [id, detail, date, amount];
  }
}
