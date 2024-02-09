import 'package:equatable/equatable.dart';

class StaleBreadAddedEntity extends Equatable {
  final int id;
  final int quantity;
  final DateTime date;
  final int doughFactoryProductId;
  final String doughFactoryProductName;

  const StaleBreadAddedEntity({
    required this.id,
    required this.quantity,
    required this.date,
    required this.doughFactoryProductId,
    required this.doughFactoryProductName,
  });

  @override
  List<Object?> get props {
    return [id, quantity, date, doughFactoryProductId, doughFactoryProductName];
  }
}
