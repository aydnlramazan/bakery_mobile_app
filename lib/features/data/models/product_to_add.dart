import 'package:bakery_app/features/domain/entities/product_to_add.dart';

class ProductToAddModel extends ProductToAddEntity {
  const ProductToAddModel({
    int? id,
    int? productId,
    double? price,
    int? productionListId,
    int? quantity,
  }) : super(
          id: id,
          productId: productId,
          price: price,
          productionListId: productionListId,
          quantity: quantity,
        );

  factory ProductToAddModel.fromJson(Map<String, dynamic> map) {
    return ProductToAddModel(
      id: map["id"] ?? 0,
      productId: map["productId"] ?? 0,
      price: map["price"] ?? 0.0,
      productionListId: map["productionListId"] ?? 0,
      quantity: map["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'price': price,
      'productionListId': productionListId,
      'quantity': quantity,
    };
  }

  factory ProductToAddModel.fromEntity(ProductToAddEntity entity) {
    return ProductToAddModel(
      id: entity.id,
      productId: entity.productId,
      price: entity.price,
      productionListId: entity.productionListId,
      quantity: entity.quantity,
    );
  }
}
