import 'package:bakery_app/features/domain/entities/service_list.dart';

class ServiceListModel extends ServiceListEntity {
  const ServiceListModel({
    int? id,
    int? userId,
    DateTime? date,
  }) : super(id: id, userId: userId, date: date);

  factory ServiceListModel.fromJson(Map<String, dynamic> map) {
    return ServiceListModel(
      id: map["id"] ?? 0,
      userId: map["userId"] ?? 0,
      date: map["date"] != null ? DateTime.parse(map["date"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date?.toIso8601String(),
    };
  }

  factory ServiceListModel.fromEntity(ServiceListEntity entity) {
    return ServiceListModel(
      id: entity.id,
      userId: entity.userId,
      date: entity.date,
    );
  }
}
