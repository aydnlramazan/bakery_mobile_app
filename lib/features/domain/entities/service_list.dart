import 'package:equatable/equatable.dart';

class ServiceListEntity extends Equatable {
  final int? id;
  final int? userId;
  final DateTime? date;

  const ServiceListEntity({this.id, this.userId, this.date});

  @override
  List<Object?> get props {
    return [id, userId, date];
  }
}
