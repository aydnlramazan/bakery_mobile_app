import '../../domain/entities/service_stale_product.dart';

class ServiceStaleProductModel extends ServiceStaleProductEntity {
  const ServiceStaleProductModel({
    required int id,
    required int userId,
    required DateTime date,
    required int serviceTypeId,
    required int serviceProductId,
    required int quantity,
  }) : super(
          id: id,
          userId: userId,
          date: date,
          serviceTypeId: serviceTypeId,
          serviceProductId: serviceProductId,
          quantity: quantity,
        );

  factory ServiceStaleProductModel.fromJson(Map<String, dynamic> map) {
    return ServiceStaleProductModel(
      id: map["id"] ?? 0,
      userId: map["userId"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
      serviceTypeId: map["serviceTypeId"] ?? 0,
      serviceProductId: map["serviceProductId"] ?? 0,
      quantity: map["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'serviceTypeId': serviceTypeId,
      'serviceProductId': serviceProductId,
      'quantity': quantity,
    };
  }

  factory ServiceStaleProductModel.fromEntity(ServiceStaleProductEntity entity) {
    return ServiceStaleProductModel(
      id: entity.id,
      userId: entity.userId,
      date: entity.date,
      serviceTypeId: entity.serviceTypeId,
      serviceProductId: entity.serviceProductId,
      quantity: entity.quantity,
    );
  }
}
