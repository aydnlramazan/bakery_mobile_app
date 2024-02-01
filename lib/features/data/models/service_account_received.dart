
import '../../domain/entities/service_account_received.dart';

class ServiceAccountReceivedModel extends ServiceAccountReceivedEntity {
  const ServiceAccountReceivedModel({
    required int id,
    required double amount,
    required int marketId,
    required String marketName,
    required double totalAmount,
    required int staleBread,
    required int givenBread,
  }) : super(
          id: id,
          amount: amount,
          marketId: marketId,
          marketName: marketName,
          totalAmount: totalAmount,
          staleBread: staleBread,
          givenBread: givenBread,
        );

  factory ServiceAccountReceivedModel.fromJson(Map<String, dynamic> map) {
    return ServiceAccountReceivedModel(
      id: map["id"] ?? 0,
      amount: map["amount"] ?? 0.0,
      marketId: map["marketId"] ?? 0,
      marketName: map["marketName"] ?? "",
      totalAmount: map["totalAmount"] ?? 0.0,
      staleBread: map["staleBread"] ?? 0,
      givenBread: map["givenBread"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'marketId': marketId,
      'marketName': marketName,
      'totalAmount': totalAmount,
      'staleBread': staleBread,
      'givenBread': givenBread,
    };
  }

  factory ServiceAccountReceivedModel.fromEntity(ServiceAccountReceivedEntity entity) {
    return ServiceAccountReceivedModel(
      id: entity.id,
      amount: entity.amount,
      marketId: entity.marketId,
      marketName: entity.marketName,
      totalAmount: entity.totalAmount,
      staleBread: entity.staleBread,
      givenBread: entity.givenBread,
    );
  }
}
