
import '../../domain/entities/stale_product_added.dart';

class StaleProductAddedModel extends StaleProductAddedEntity {
  const StaleProductAddedModel({
    required int id,
    required int productId,
    required String productName,
    required int quantity,
    required DateTime date,
  }) : super(
          id: id,
          productId: productId,
          productName: productName,
          quantity: quantity,
          date: date,
        );

  factory StaleProductAddedModel.fromJson(Map<String, dynamic> map) {
    return StaleProductAddedModel(
      id: map["id"] ?? 0,
      productId: map["productId"] ?? 0,
      productName: map["productName"] ?? "",
      quantity: map["quantity"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'date': date.toIso8601String(),
    };
  }

  factory StaleProductAddedModel.fromEntity(StaleProductAddedEntity entity) {
    return StaleProductAddedModel(
      id: entity.id,
      productId: entity.productId,
      productName: entity.productName,
      quantity: entity.quantity,
      date: entity.date,
    );
  }
}
