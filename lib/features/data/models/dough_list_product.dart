import 'package:bakery_app/features/domain/entities/dough_list_product.dart';

class DoughListProductModel extends DoughListProductEntity  {
  const DoughListProductModel({
   int? id,
   int? doughFactoryProductId,
   int? quantity,
   int? doughFactoryListId,
  }):super(
    id:id,
    doughFactoryProductId : doughFactoryProductId,
    quantity: quantity,
    doughFactoryListId: doughFactoryListId
  );
   
 factory DoughListProductModel.fromJson(Map<String, dynamic> map) {
    return DoughListProductModel(
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

  factory DoughListProductModel.fromEntity(DoughListProductEntity entity) {
    return DoughListProductModel(
      id: entity.id,
      doughFactoryProductId: entity.doughFactoryProductId,
      quantity: entity.quantity,
      doughFactoryListId: entity.doughFactoryListId,
    );
  }
}