import 'package:equatable/equatable.dart';

class ServiceAccountToReceiveEntity extends Equatable {
  final int id;
  final int marketId;
  final DateTime date;
  final double amount; // Using double for decimal in Dart

  const ServiceAccountToReceiveEntity({
    required this.id,
    required this.marketId,
    required this.date,
    required this.amount,
  });

  @override
  List<Object?> get props {
    return [id, marketId, date, amount];
  }
}
