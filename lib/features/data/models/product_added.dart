import 'package:bakery_app/features/domain/entities/added_product.dart';

class AddedProductModel extends AddedProductEntity {
  const AddedProductModel({
    int? id,
    int? productId,
    String? productName,
    double? price,
    int? productListId,
    int? quantity,
  }) : super(
          productId: productId,
          productName: productName,
          productListId: productListId,
          quantity: quantity,
          id: id,
          price: price,
        );
  factory AddedProductModel.fromJson(Map<String, dynamic> map) {
    return AddedProductModel(
      id: map["id"] ?? 0,
      productId: map["productId"] ?? 0,
      productName: map["productName"] ?? "",
      price: map["price"] ?? 0.0,
      productListId: map["productionListId"] ?? 0,
      quantity: map["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'price': price,
      'productionListId': productListId,
      'quantity': quantity,
    };
  }

  factory AddedProductModel.fromEntity(AddedProductEntity entity) {
    return AddedProductModel(
      id: entity.id,
      productId: entity.productId,
      productName: entity.productName,
      price: entity.price,
      productListId: entity.productListId,
      quantity: entity.quantity,
    );
  }
}
