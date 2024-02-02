
import '../../domain/entities/service_received_stale.dart';

class ServiceReceivedStaleModel extends ServiceReceivedStaleEntity {
  const ServiceReceivedStaleModel({
    required int id,
    required int marketId,
    required String marketName,
    required int quantity,
  }) : super(id: id, marketId: marketId, marketName: marketName, quantity: quantity);

  factory ServiceReceivedStaleModel.fromJson(Map<String, dynamic> map) {
    return ServiceReceivedStaleModel(
      id: map["id"] ?? 0,
      marketId: map["marketId"] ?? 0,
      marketName: map["marketName"] ?? "",
      quantity: map["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marketId': marketId,
      'marketName': marketName,
      'quantity': quantity,
    };
  }

  factory ServiceReceivedStaleModel.fromEntity(ServiceReceivedStaleEntity entity) {
    return ServiceReceivedStaleModel(
      id: entity.id,
      marketId: entity.marketId,
      marketName: entity.marketName,
      quantity: entity.quantity,
    );
  }
}
