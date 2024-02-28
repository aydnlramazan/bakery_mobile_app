import '../../domain/entities/cash_counting.dart';

class CashCountingModel extends CashCountingEntity {
  const CashCountingModel({
    required int id,
    required double totalMoney,
    required double remainedMoney,
    required double creditCard,
    required DateTime date,
  }) : super(
          id: id,
          totalMoney: totalMoney,
          remainedMoney: remainedMoney,
          creditCard: creditCard,
          date: date,
        );

  factory CashCountingModel.fromJson(Map<String, dynamic> map) {
    return CashCountingModel(
      id: map["id"] ?? 0,
      totalMoney: map["totalMoney"] ?? 0.0,
      remainedMoney: map["remainedMoney"] ?? 0.0,
      creditCard: map["creditCard"] ?? 0.0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'totalMoney': totalMoney,
      'remainedMoney': remainedMoney,
      'creditCard': creditCard,
      'date': date.toIso8601String(),
    };
  }

  factory CashCountingModel.fromEntity(CashCountingEntity entity) {
    return CashCountingModel(
      id: entity.id,
      totalMoney: entity.totalMoney,
      remainedMoney: entity.remainedMoney,
      creditCard: entity.creditCard,
      date: entity.date,
    );
  }
}
