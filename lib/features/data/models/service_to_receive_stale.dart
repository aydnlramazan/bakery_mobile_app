
import '../../domain/entities/service_to_receive_stale.dart';

class ServiceToReceiveStaleModel extends ServiceToReceiveStaleEntity {
  const ServiceToReceiveStaleModel({
    required int id,
    required int marketId,
    required DateTime date,
    required int quantity,
  }) : super(id: id, marketId: marketId, date: date, quantity: quantity);

  factory ServiceToReceiveStaleModel.fromJson(Map<String, dynamic> map) {
    return ServiceToReceiveStaleModel(
      id: map["id"] ?? 0,
      marketId: map["marketId"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
      quantity: map["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marketId': marketId,
      'date': date.toIso8601String(),
      'quantity': quantity,
    };
  }

  factory ServiceToReceiveStaleModel.fromEntity(ServiceToReceiveStaleEntity entity) {
    return ServiceToReceiveStaleModel(
      id: entity.id,
      marketId: entity.marketId,
      date: entity.date,
      quantity: entity.quantity,
    );
  }
}
