
import '../../domain/entities/stale_bread_added.dart';

class StaleBreadAddedModel extends StaleBreadAddedEntity {
  const StaleBreadAddedModel({
    required int id,
    required int quantity,
    required DateTime date,
    required int doughFactoryProductId,
    required String doughFactoryProductName,
  }) : super(
          id: id,
          quantity: quantity,
          date: date,
          doughFactoryProductId: doughFactoryProductId,
          doughFactoryProductName: doughFactoryProductName,
        );

  factory StaleBreadAddedModel.fromJson(Map<String, dynamic> map) {
    return StaleBreadAddedModel(
      id: map["id"] ?? 0,
      quantity: map["quantity"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
      doughFactoryProductId: map["doughFactoryProductId"] ?? 0,
      doughFactoryProductName: map["doughFactoryProductName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'date': date.toIso8601String(),
      'doughFactoryProductId': doughFactoryProductId,
      'doughFactoryProductName': doughFactoryProductName,
    };
  }

  factory StaleBreadAddedModel.fromEntity(StaleBreadAddedEntity entity) {
    return StaleBreadAddedModel(
      id: entity.id,
      quantity: entity.quantity,
      date: entity.date,
      doughFactoryProductId: entity.doughFactoryProductId,
      doughFactoryProductName: entity.doughFactoryProductName,
    );
  }
}
