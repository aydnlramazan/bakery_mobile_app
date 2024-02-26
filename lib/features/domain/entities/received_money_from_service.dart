import 'package:equatable/equatable.dart';

class ReceivedMoneyFromServiceEntity extends Equatable {
  final int id;
  final int userId;
  final double amount; // Using double for decimal in Dart
  final int serviceTypeId;
  final DateTime date;

  const ReceivedMoneyFromServiceEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.serviceTypeId,
    required this.date,
  });

  @override
  List<Object?> get props {
    return [id, userId, amount, serviceTypeId, date];
  }
}
