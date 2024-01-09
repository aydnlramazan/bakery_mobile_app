import 'package:equatable/equatable.dart';

class DoughListEntity extends Equatable {
  final int? id;
  final int? userId;
  final String? userName;
  final DateTime? date;

  const DoughListEntity({this.id, this.userId,this.userName, this.date});

  @override
  List<Object?> get props {
    return [id, userId,userName, date];
  }
}
