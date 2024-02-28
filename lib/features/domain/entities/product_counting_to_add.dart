import 'package:equatable/equatable.dart';

class ProductCountingToAddEntity extends Equatable {
  final int id;
  final int productId;
  final int quantity;
  final DateTime date;

  const ProductCountingToAddEntity({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.date,
  });

  @override
  List<Object?> get props {
    return [id, productId, quantity, date];
  }
}
