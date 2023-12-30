import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final int? operationClaim;
  final String? token;

  const UserEntity({this.id, this.name, this.operationClaim, this.token});

  @override
  List<Object?> get props {
    return [id, name, operationClaim,token];
  }
}
