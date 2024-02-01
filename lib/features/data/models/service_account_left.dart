import '../../domain/entities/service_account_left.dart';

class ServiceAccountLeftModel extends ServiceAccountLeftEntity {
  const ServiceAccountLeftModel({
    required int marketId,
    required String marketName,
    required double totalAmount,
    required int staleBread,
    required int givenBread
  }) : super(
          marketId: marketId,
          marketName: marketName,
          totalAmount: totalAmount,
          staleBread: staleBread,
          givenBread: givenBread
        );

  factory ServiceAccountLeftModel.fromJson(Map<String, dynamic> map) {
    return ServiceAccountLeftModel(
      marketId: map["marketId"] ?? 0,
      marketName: map["marketName"] ?? "",
      totalAmount: map["totalAmount"] ?? 0.0,
      staleBread: map["staleBread"] ?? 0,
      givenBread: map["givenBread"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'marketId': marketId,
      'marketName': marketName,
      'totalAmount': totalAmount,
      'staleBread': staleBread,
      'givenBread': givenBread,
    };
  }

  factory ServiceAccountLeftModel.fromEntity(ServiceAccountLeftEntity entity) {
    return ServiceAccountLeftModel(
      marketId: entity.marketId,
      marketName: entity.marketName,
      totalAmount: entity.totalAmount,
      staleBread: entity.staleBread,
      givenBread: entity.givenBread,
    );
  }
}
