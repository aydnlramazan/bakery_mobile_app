import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? name;
  final int? categoryId;
  final double? price;

  const ProductEntity( {this.id, this.name,this.categoryId, this.price});

  @override
  List<Object?> get props {
    return [id, name,categoryId,price];
  }
}
