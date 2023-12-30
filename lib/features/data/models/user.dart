import 'package:bakery_app/features/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    String? name,
    int? operationClaim,
    String ? token,
  }) : super(
          id: id,
          name: name,
          operationClaim: operationClaim,
          token: token
        );

  factory UserModel.fromJsom(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"] ?? 0,
      name: map["firstName"] ?? "",
      operationClaim: map["operationClaimId"] ?? 0,
      token: map["token"] ?? "",
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      operationClaim: entity.operationClaim,
      token:entity.token,
    );
  }
}
