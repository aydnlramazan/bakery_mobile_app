import 'package:equatable/equatable.dart';

class AddedProductEntity extends Equatable {
  final int? id;
  final int? productId;
  final String? productName;
  final double? price;
  final int? productListId;
  final int? quantity;

  const AddedProductEntity({this.productId, this.productName, this.productListId, this.quantity, this.id, this.price});

  @override
  List<Object?> get props {
    return [id, productId,productName,price,productListId,quantity];
  }
}
