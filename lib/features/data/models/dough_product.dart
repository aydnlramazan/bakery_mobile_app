import 'package:bakery_app/features/domain/entities/dough_product.dart';

class DoughProductModel extends DoughProductEntity {
  const DoughProductModel({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory DoughProductModel.fromJson(Map<String, dynamic> map) {
    return DoughProductModel(
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

  factory DoughProductModel.fromEntity(DoughProductEntity entity) {
    return DoughProductModel(
      id: entity.id,
      name: entity.name,
    );
  }
}
