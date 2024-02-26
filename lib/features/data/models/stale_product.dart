
import '../../domain/entities/stale_product.dart';

class StaleProductModel extends StaleProductEntity {
  const StaleProductModel({
    required int id,
    required String name,
    required int categoryId,
    required double price,
  }) : super(
          id: id,
          name: name,
          categoryId: categoryId,
          price: price,
        );

  factory StaleProductModel.fromJson(Map<String, dynamic> map) {
    return StaleProductModel(
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

  factory StaleProductModel.fromEntity(StaleProductEntity entity) {
    return StaleProductModel(
      id: entity.id,
      name: entity.name,
      categoryId: entity.categoryId,
      price: entity.price,
    );
  }
}
