
import '../../domain/entities/product_counting_to_add.dart';

class ProductCountingToAddModel extends ProductCountingToAddEntity {
  const ProductCountingToAddModel({
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

  factory ProductCountingToAddModel.fromJson(Map<String, dynamic> map) {
    return ProductCountingToAddModel(
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

  factory ProductCountingToAddModel.fromEntity(ProductCountingToAddEntity entity) {
    return ProductCountingToAddModel(
      id: entity.id,
      productId: entity.productId,
      quantity: entity.quantity,
      date: entity.date,
    );
  }
}
