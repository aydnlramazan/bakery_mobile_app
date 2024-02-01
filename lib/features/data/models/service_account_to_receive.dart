import 'package:bakery_app/features/domain/entities/service_account_to_receive.dart';

class ServiceAccountToReceiveModel extends ServiceAccountToReceiveEntity {
  const ServiceAccountToReceiveModel({
    required int id,
    required int marketId,
    required DateTime date,
    required double amount,
  }) : super(id: id, marketId: marketId, date: date, amount: amount);

  factory ServiceAccountToReceiveModel.fromJson(Map<String, dynamic> map) {
    return ServiceAccountToReceiveModel(
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

  factory ServiceAccountToReceiveModel.fromEntity(
      ServiceAccountToReceiveEntity entity) {
    return ServiceAccountToReceiveModel(
      id: entity.id,
      marketId: entity.marketId,
      date: entity.date,
      amount: entity.amount,
    );
  }
}
