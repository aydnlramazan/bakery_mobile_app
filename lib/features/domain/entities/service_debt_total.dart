import 'package:equatable/equatable.dart';

class ServiceDebtTotalEntity extends Equatable {
  final int marketId;
  final String marketName;
  final double amount; // Using double for decimal in Dart

  const ServiceDebtTotalEntity({
    required this.marketId,
    required this.marketName,
    required this.amount,
  });

  @override
  List<Object?> get props {
    return [marketId, marketName, amount];
  }
}
