
import '../../domain/entities/product_counting_added.dart';

class ProductCountingAddedModel extends ProductCountingAddedEntity {
  const ProductCountingAddedModel({
    required int id,
    required String productName,
    required int productId,
    required int quantity,
  }) : super(
          id: id,
          productName: productName,
          productId: productId,
          quantity: quantity,
        );

  factory ProductCountingAddedModel.fromJson(Map<String, dynamic> map) {
    return ProductCountingAddedModel(
      id: map["id"] ?? 0,
      productName: map["productName"] ?? "",
      productId: map["productId"] ?? 0,
      quantity: map["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory ProductCountingAddedModel.fromEntity(ProductCountingAddedEntity entity) {
    return ProductCountingAddedModel(
      id: entity.id,
      productName: entity.productName,
      productId: entity.productId,
      quantity: entity.quantity,
    );
  }
}
