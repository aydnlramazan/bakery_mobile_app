import 'package:bakery_app/features/domain/entities/delete_market_data.dart';

class DeleteMarketDataModel extends DeleteMarketDataEntity {
  const DeleteMarketDataModel({
    int? serviceListId,
    int? marketId,
  }) : super(serviceListId: serviceListId, marketId: marketId);

  factory DeleteMarketDataModel.fromJson(Map<String, dynamic> map) {
    return DeleteMarketDataModel(
      serviceListId: map["serviceListId"] ?? 0,
      marketId: map["marketId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceListId': serviceListId,
      'marketId': marketId,
    };
  }

  factory DeleteMarketDataModel.fromEntity(DeleteMarketDataEntity entity) {
    return DeleteMarketDataModel(
      serviceListId: entity.serviceListId,
      marketId: entity.marketId,
    );
  }
}
