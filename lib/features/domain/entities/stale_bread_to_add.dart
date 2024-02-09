import 'package:equatable/equatable.dart';

class StaleBreadToAddEntity extends Equatable {
  final int id;
  final int quantity;
  final DateTime date;
  final int doughFactoryProductId;

  const StaleBreadToAddEntity({
    required this.id,
    required this.quantity,
    required this.date,
    required this.doughFactoryProductId,
  });

  @override
  List<Object?> get props {
    return [id, quantity, date, doughFactoryProductId];
  }
}
