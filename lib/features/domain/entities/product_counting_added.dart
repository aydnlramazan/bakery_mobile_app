import 'package:equatable/equatable.dart';

class ProductCountingAddedEntity extends Equatable {
  final int id;
  final String productName;
  final int productId;
  final int quantity;
  final DateTime date;

  const ProductCountingAddedEntity({
    required this.id,
    required this.productName,
    required this.productId,
    required this.quantity,
    required this.date
  });

  @override
  List<Object?> get props {
    return [id, productName, productId, quantity,date];
  }
}
