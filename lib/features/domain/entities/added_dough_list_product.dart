import 'package:equatable/equatable.dart';

class AddedDoughListProductEntity extends Equatable {
  final int? id;
  final int? doughFactoryProductId;
  final String? doughFactoryProductName;
  final int? quantity;
  final int? doughFactoryListId;

  const AddedDoughListProductEntity(
      {this.id,
      this.doughFactoryProductId,
      this.doughFactoryProductName,
      this.quantity,
      this.doughFactoryListId});

  @override
  List<Object?> get props {
    return [id, doughFactoryProductId, quantity, doughFactoryListId];
  }
}
