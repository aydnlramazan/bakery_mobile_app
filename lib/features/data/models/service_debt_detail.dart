
import '../../domain/entities/service_debt_detail.dart';

class ServiceDebtDetailModel extends ServiceDebtDetailEntity {
  const ServiceDebtDetailModel({
    required int id,
    required int marketId,
    required DateTime date,
    required double amount,
  }) : super(id: id, marketId: marketId, date: date, amount: amount);

  factory ServiceDebtDetailModel.fromJson(Map<String, dynamic> map) {
    return ServiceDebtDetailModel(
      id: map["id"] ?? 0,
      marketId: map["marketId"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
      amount: map["amount"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marketId': marketId,
      'date': date.toIso8601String(),
      'amount': amount,
    };
  }

  factory ServiceDebtDetailModel.fromEntity(ServiceDebtDetailEntity entity) {
    return ServiceDebtDetailModel(
      id: entity.id,
      marketId: entity.marketId,
      date: entity.date,
      amount: entity.amount,
    );
  }
}
