import 'package:bakery_app/features/domain/entities/product_not_added.dart';

class ProductNotAddedModel extends ProductNotAddedEntity {
  const ProductNotAddedModel({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory ProductNotAddedModel.fromJson(Map<String, dynamic> map) {
    return ProductNotAddedModel(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ProductNotAddedModel.fromEntity(ProductNotAddedEntity entity) {
    return ProductNotAddedModel(
      id: entity.id,
      name: entity.name,
    );
  }
}
