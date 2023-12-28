import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int ? id;
  final String ? name;
  final int ? operationClaim;

  const UserEntity({
    this.id,
    this.name,
    this.operationClaim
  });
  
  @override
  List<Object?> get props {
    return [
      id,
      name,
      operationClaim
    ];
  }
}
