
import '../../domain/entities/service_stale.dart';

class ServiceStaleModel extends ServiceStaleEntity {
  const ServiceStaleModel({
    required int marketId,
    required String marketName,
  }) : super(marketId: marketId, marketName: marketName);

  factory ServiceStaleModel.fromJson(Map<String, dynamic> map) {
    return ServiceStaleModel(
      marketId: map["marketId"] ?? 0,
      marketName: map["marketName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'marketId': marketId,
      'marketName': marketName,
    };
  }

  factory ServiceStaleModel.fromEntity(ServiceStaleEntity entity) {
    return ServiceStaleModel(
      marketId: entity.marketId,
      marketName: entity.marketName,
    );
  }
}
