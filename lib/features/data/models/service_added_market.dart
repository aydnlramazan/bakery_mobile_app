import 'package:bakery_app/features/domain/entities/service_added_market.dart';

class ServiceAddedMarketModel extends ServiceAddedMarketEntity {
  const ServiceAddedMarketModel({
    int? id,
    int? serviceListId,
    int? quantity,
    int? marketId,
    String? marketName,
  }) : super(id:id,serviceListId: serviceListId, quantity: quantity, marketId: marketId, marketName: marketName);

  factory ServiceAddedMarketModel.fromJson(Map<String, dynamic> map) {
    return ServiceAddedMarketModel(
      id: map["id"] ?? 0,
      serviceListId: map["serviceListId"] ?? 0,
      quantity: map["quantity"] ?? 0,
      marketId: map["marketId"] ?? 0,
      marketName: map["marketName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
         'id': id,
      'serviceListId': serviceListId,
      'quantity': quantity,
      'marketId': marketId,
      'marketName': marketName,
    };
  }

  factory ServiceAddedMarketModel.fromEntity(ServiceAddedMarketEntity entity) {
    return ServiceAddedMarketModel(
      id: entity.id,
      serviceListId: entity.serviceListId,
      quantity: entity.quantity,
      marketId: entity.marketId,
      marketName: entity.marketName,
    );
  }
}
