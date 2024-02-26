
import '../../domain/entities/received_money_from_service.dart';

class ReceivedMoneyFromServiceModel extends ReceivedMoneyFromServiceEntity {
  const ReceivedMoneyFromServiceModel({
    required int id,
    required int userId,
    required double amount,
    required int serviceTypeId,
    required DateTime date,
  }) : super(
          id: id,
          userId: userId,
          amount: amount,
          serviceTypeId: serviceTypeId,
          date: date,
        );

  factory ReceivedMoneyFromServiceModel.fromJson(Map<String, dynamic> map) {
    return ReceivedMoneyFromServiceModel(
      id: map["id"] ?? 0,
      userId: map["userId"] ?? 0,
      amount: map["amount"] ?? 0.0,
      serviceTypeId: map["serviceTypeId"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'serviceTypeId': serviceTypeId,
      'date': date.toIso8601String(),
    };
  }

  factory ReceivedMoneyFromServiceModel.fromEntity(ReceivedMoneyFromServiceEntity entity) {
    return ReceivedMoneyFromServiceModel(
      id: entity.id,
      userId: entity.userId,
      amount: entity.amount,
      serviceTypeId: entity.serviceTypeId,
      date: entity.date,
    );
  }
}
