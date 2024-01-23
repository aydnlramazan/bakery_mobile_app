import 'package:bakery_app/features/domain/entities/product.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    int? id,
    String? name,
    int? categoryId,
    double? price,
  }) : super(id: id, name: name, categoryId: categoryId, price: price);

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      categoryId: map["categoryId"] ?? 0,
      price: map["price"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'price': price,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      categoryId: entity.categoryId,
      price: entity.price,
    );
  }
}