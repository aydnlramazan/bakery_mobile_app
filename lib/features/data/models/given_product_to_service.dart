import '../../domain/entities/given_product_to_service.dart';

class GivenProductToServiceModel extends GivenProductToServiceEntity {
  const GivenProductToServiceModel({
    required int id,
    required int userId,
    required int quantity,
    required DateTime date,
    required int serviceProductId,
    required int serviceTypeId,
  }) : super(
          id: id,
          userId: userId,
          quantity: quantity,
          date: date,
          serviceProductId: serviceProductId,
          serviceTypeId: serviceTypeId,
        );

  factory GivenProductToServiceModel.fromJson(Map<String, dynamic> map) {
    return GivenProductToServiceModel(
      id: map["id"] ?? 0,
      userId: map["userId"] ?? 0,
      quantity: map["quantity"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
      serviceProductId: map["serviceProductId"] ?? 0,
      serviceTypeId: map["serviceTypeId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'quantity': quantity,
      'date': date.toIso8601String(),
      'serviceProductId': serviceProductId,
      'serviceTypeId': serviceTypeId,
    };
  }

  factory GivenProductToServiceModel.fromEntity(GivenProductToServiceEntity entity) {
    return GivenProductToServiceModel(
      id: entity.id,
      userId: entity.userId,
      quantity: entity.quantity,
      date: entity.date,
      serviceProductId: entity.serviceProductId,
      serviceTypeId: entity.serviceTypeId,
    );
  }
}
