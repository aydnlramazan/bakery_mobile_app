import 'package:equatable/equatable.dart';

class ServiceToReceiveStaleEntity extends Equatable {
  final int id;
  final int marketId;
  final DateTime date;
  final int quantity;

  const ServiceToReceiveStaleEntity({
    required this.id,
    required this.marketId,
    required this.date,
    required this.quantity,
  });

  @override
  List<Object?> get props {
    return [id, marketId, date, quantity];
  }
}
