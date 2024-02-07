
import '../../domain/entities/service_debt_total.dart';

class ServiceDebtTotalModel extends ServiceDebtTotalEntity {
  const ServiceDebtTotalModel({
    required int marketId,
    required String marketName,
    required double amount,
  }) : super(marketId: marketId, marketName: marketName, amount: amount);

  factory ServiceDebtTotalModel.fromJson(Map<String, dynamic> map) {
    return ServiceDebtTotalModel(
      marketId: map["marketId"] ?? 0,
      marketName: map["marketName"] ?? "",
      amount: map["amount"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'marketId': marketId,
      'marketName': marketName,
      'amount': amount,
    };
  }

  factory ServiceDebtTotalModel.fromEntity(ServiceDebtTotalEntity entity) {
    return ServiceDebtTotalModel(
      marketId: entity.marketId,
      marketName: entity.marketName,
      amount: entity.amount,
    );
  }
}
