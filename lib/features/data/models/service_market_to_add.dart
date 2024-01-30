import 'package:bakery_app/features/domain/entities/service_market_to_add.dart';

class ServiceMarketToAddModel extends ServiceMarketToAddEntity {
  const ServiceMarketToAddModel({
    int? serviceListId,
    int? quantity,
    int? marketId,
  }) : super(serviceListId: serviceListId, quantity: quantity, marketId: marketId);

  factory ServiceMarketToAddModel.fromJson(Map<String, dynamic> map) {
    return ServiceMarketToAddModel(
      serviceListId: map["serviceListId"] ?? 0,
      quantity: map["quantity"] ?? 0,
      marketId: map["marketId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceListId': serviceListId,
      'quantity': quantity,
      'marketId': marketId,
    };
  }

  factory ServiceMarketToAddModel.fromEntity(ServiceMarketToAddEntity entity) {
    return ServiceMarketToAddModel(
      serviceListId: entity.serviceListId,
      quantity: entity.quantity,
      marketId: entity.marketId,
    );
  }
}
