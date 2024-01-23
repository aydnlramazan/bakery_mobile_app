import 'package:equatable/equatable.dart';

class ProductToAddEntity extends Equatable {
  final int? id;
  final int? productId;
  final double? price;
  final int? productionListId; // Corrected typo in the property name
  final int? quantity;

  const ProductToAddEntity({
    this.id,
    this.productId,
    this.price,
    this.productionListId,
    this.quantity,
  });

  @override
  List<Object?> get props {
    return [id, productId, price, productionListId, quantity];
  }
}
