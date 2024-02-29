import 'package:bakery_app/features/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    String? name,
    int? operationClaimId,
    String ? token,
  }) : super(id: id,name: name,operationClaim: operationClaimId,token: token
        );

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"] ?? 0,
      name: map["firstName"] ?? "",
      operationClaimId: map["operationClaimId"] ?? 0,
      token: map["token"] ?? "",
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'operationClaimId': operationClaim,
      'token': token,
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      operationClaimId: entity.operationClaim,
      token:entity.token,
    );
  }
}
