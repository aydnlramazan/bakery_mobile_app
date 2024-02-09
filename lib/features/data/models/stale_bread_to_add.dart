import '../../domain/entities/stale_bread_to_add.dart';

class StaleBreadToAddModel extends StaleBreadToAddEntity {
  const StaleBreadToAddModel({
    required int id,
    required int quantity,
    required DateTime date,
    required int doughFactoryProductId,
  }) : super(
          id: id,
          quantity: quantity,
          date: date,
          doughFactoryProductId: doughFactoryProductId,
        );

  factory StaleBreadToAddModel.fromJson(Map<String, dynamic> map) {
    return StaleBreadToAddModel(
      id: map["id"] ?? 0,
      quantity: map["quantity"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
      doughFactoryProductId: map["doughFactoryProductId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'date': date.toIso8601String(),
      'doughFactoryProductId': doughFactoryProductId,
    };
  }

  factory StaleBreadToAddModel.fromEntity(StaleBreadToAddEntity entity) {
    return StaleBreadToAddModel(
      id: entity.id,
      quantity: entity.quantity,
      date: entity.date,
      doughFactoryProductId: entity.doughFactoryProductId,
    );
  }
}
