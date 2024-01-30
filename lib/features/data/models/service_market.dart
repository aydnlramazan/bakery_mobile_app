import 'package:bakery_app/features/domain/entities/service_market.dart';

class ServiceMarketModel extends ServiceMarketEntity {
  const ServiceMarketModel({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory ServiceMarketModel.fromJson(Map<String, dynamic> map) {
    return ServiceMarketModel(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ServiceMarketModel.fromEntity(ServiceMarketEntity entity) {
    return ServiceMarketModel(
      id: entity.id,
      name: entity.name,
    );
  }
}
