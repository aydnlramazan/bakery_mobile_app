

import '../../domain/entities/expense.dart';

class ExpenseModel extends ExpenseEntity {
  const ExpenseModel({
    required int id,
    required String detail,
    required DateTime date,
    required double amount,
    required int userId
  }) : super(id: id, detail: detail, date: date, amount: amount,userId: userId);

  factory ExpenseModel.fromJson(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map["id"] ?? 0,
      detail: map["detail"] ?? "",
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
      amount: map["amount"] ?? 0.0,
      userId: map["userId"] ?? 0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'detail': detail,
      'date': date.toIso8601String(),
      'amount': amount,
      'userId': userId,
    };
  }

  factory ExpenseModel.fromEntity(ExpenseEntity entity) {
    return ExpenseModel(
      id: entity.id,
      detail: entity.detail,
      date: entity.date,
      amount: entity.amount,
      userId: entity.userId
    );
  }
}
