import 'package:equatable/equatable.dart';

class BreadCountingEntity extends Equatable {
  final int id;
  final int quantity;
  final DateTime date;
  final int userId;

  const BreadCountingEntity({
    required this.id,
    required this.quantity,
    required this.date,
    required this.userId,
  });

  @override
  List<Object?> get props {
    return [id, quantity, date, userId];
  }
}
