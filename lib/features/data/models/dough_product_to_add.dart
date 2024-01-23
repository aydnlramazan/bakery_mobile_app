import 'package:bakery_app/features/domain/entities/dough_product_to_add.dart';

class DoughProductToAddModel extends DoughProductToAddEntity {
  const DoughProductToAddModel({
    int? id = 0,
    int? doughFactoryProductId,
    int? quantity,
    int? doughFactoryListId,
  }) : super(
            id: id,
            doughFactoryProductId: doughFactoryProductId,
            quantity: quantity,
            doughFactoryListId: doughFactoryListId);

  factory DoughProductToAddModel.fromJson(Map<String, dynamic> map) {
    return DoughProductToAddModel(
      id: map["id"] ?? 0,
      doughFactoryProductId: map["doughFactoryProductId"] ?? 0,
      quantity: map["quantity"] ?? 0,
      doughFactoryListId: map["doughFactoryListId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doughFactoryProductId': doughFactoryProductId,
      'quantity': quantity,
      'doughFactoryListId': doughFactoryListId,
    };
  }

  factory DoughProductToAddModel.fromEntity(DoughProductToAddEntity entity) {
    return DoughProductToAddModel(
      id: entity.id,
      doughFactoryProductId: entity.doughFactoryProductId,
      quantity: entity.quantity,
      doughFactoryListId: entity.doughFactoryListId,
    );
  }
}
