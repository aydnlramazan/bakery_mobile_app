
import '../../domain/entities/stale_product_to_add.dart';

class StaleProductToAddModel extends StaleProductToAddEntity {
  const StaleProductToAddModel({
    required int id,
    required int productId,
    required int quantity,
    required DateTime date,
  }) : super(
          id: id,
          productId: productId,
          quantity: quantity,
          date: date,
        );

  factory StaleProductToAddModel.fromJson(Map<String, dynamic> map) {
    return StaleProductToAddModel(
      id: map["id"] ?? 0,
      productId: map["productId"] ?? 0,
      quantity: map["quantity"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'date': date.toIso8601String(),
    };
  }

  factory StaleProductToAddModel.fromEntity(StaleProductToAddEntity entity) {
    return StaleProductToAddModel(
      id: entity.id,
      productId: entity.productId,
      quantity: entity.quantity,
      date: entity.date,
    );
  }
}
