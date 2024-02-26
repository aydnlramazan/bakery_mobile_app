
import '../../domain/entities/stale_bread.dart';

class StaleBreadModel extends StaleBreadEntity {
  const StaleBreadModel({
    required int id,
    required double breadEquivalent,
    required String name,
  }) : super(
          id: id,
          breadEquivalent: breadEquivalent,
          name: name,
        );

  factory StaleBreadModel.fromJson(Map<String, dynamic> map) {
    return StaleBreadModel(
      id: map["id"] ?? 0,
      breadEquivalent: (map["breadEquivalent"] ?? 0).toDouble(),
      name: map["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'breadEquivalent': breadEquivalent,
      'name': name,
    };
  }

  factory StaleBreadModel.fromEntity(StaleBreadEntity entity) {
    return StaleBreadModel(
      id: entity.id,
      breadEquivalent: entity.breadEquivalent,
      name: entity.name,
    );
  }
}
