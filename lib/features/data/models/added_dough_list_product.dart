import 'package:bakery_app/features/domain/entities/added_dough_list_product.dart';

class AddedDoughListProductModel extends AddedDoughListProductEntity {
  const AddedDoughListProductModel({
    int? id,
    int? doughFactoryProductId,
    String? doughFactoryProductName,
    int? quantity,
    int? doughFactoryListId,
  }) : super(
          id: id,
          doughFactoryProductId: doughFactoryProductId,
          doughFactoryProductName: doughFactoryProductName,
          quantity: quantity,
          doughFactoryListId: doughFactoryListId,
        );

  factory AddedDoughListProductModel.fromJson(Map<String, dynamic> map) {
    return AddedDoughListProductModel(
      id: map["id"] ?? 0,
      doughFactoryProductId: map["doughFactoryProductId"] ?? 0,
      doughFactoryProductName: map["doughFactoryProductName"] ?? "",
      quantity: map["quantity"] ?? 0,
      doughFactoryListId: map["doughFactoryListId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doughFactoryProductId': doughFactoryProductId,
      'doughFactoryProductName': doughFactoryProductName,
      'quantity': quantity,
      'doughFactoryListId': doughFactoryListId,
    };
  }

  factory AddedDoughListProductModel.fromEntity(
      AddedDoughListProductEntity entity) {
    return AddedDoughListProductModel(
      id: entity.id,
      doughFactoryProductId: entity.doughFactoryProductId,
      doughFactoryProductName: entity.doughFactoryProductName,
      quantity: entity.quantity,
      doughFactoryListId: entity.doughFactoryListId,
    );
  }
}
