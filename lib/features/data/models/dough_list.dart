import 'package:bakery_app/features/domain/entities/dough_list.dart';

class DoughListModel extends DoughListEntity {
  const DoughListModel({
    int? id,
    int? userId,
    String? userName,
    DateTime? date,
  }) : super(id: id, userId: userId, userName: userName, date: date);

  factory DoughListModel.fromJson(Map<String, dynamic> map) {
    return DoughListModel(
      id: map["id"] ?? 0,
      userId: map["userId"] ?? 0,
      userName: map["userName"] ?? "",
      date: map["date"] != null ? DateTime.parse(map["date"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'date': date?.toIso8601String(),
    };
  }

  factory DoughListModel.fromEntity(DoughListEntity entity) {
    return DoughListModel(
      id: entity.id,
      userId: entity.userId,
      userName: entity.userName,
      date: entity.date,
    );
  }
}
