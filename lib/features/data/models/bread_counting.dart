import '../../domain/entities/bread_counting.dart';

class BreadCountingModel extends BreadCountingEntity {
  const BreadCountingModel({
    required int id,
    required int quantity,
    required DateTime date,
    required int userId,
  }) : super(
          id: id,
          quantity: quantity,
          date: date,
          userId: userId,
        );

  factory BreadCountingModel.fromJson(Map<String, dynamic> map) {
    return BreadCountingModel(
      id: map["id"] ?? 0,
      quantity: map["quantity"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime(0),
      userId: map["userId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'date': date.toIso8601String(),
      'userId': userId,
    };
  }

  factory BreadCountingModel.fromEntity(BreadCountingEntity entity) {
    return BreadCountingModel(
      id: entity.id,
      quantity: entity.quantity,
      date: entity.date,
      userId: entity.userId,
    );
  }
}
