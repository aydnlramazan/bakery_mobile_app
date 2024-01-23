import 'package:bakery_app/features/domain/entities/dough_product.dart';

class DoughProductModel extends DoughProductEntity {
  const DoughProductModel({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory DoughProductModel.fromJson(Map<String, dynamic> map) {
    return DoughProductModel(
      id: map["doughFactoryProductId"] ?? 0,
      name: map["doughFactoryProductName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doughFactoryProductId': id,
      'doughFactoryProductName': name,
    };
  }

  factory DoughProductModel.fromEntity(DoughProductEntity entity) {
    return DoughProductModel(
      id: entity.id,
      name: entity.name,
    );
  }
}
