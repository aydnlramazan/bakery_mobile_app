import 'package:equatable/equatable.dart';

class DoughListProductEntity extends Equatable {
  final int? id;
  final int? doughFactoryProductId;
  final int? quantity;
  final int? doughFactoryListId;

  const DoughListProductEntity(
      {this.id,
      this.doughFactoryProductId,
      this.quantity,
      this.doughFactoryListId});

  @override
  List<Object?> get props {
    return [id, doughFactoryProductId, quantity, doughFactoryListId];
  }
}
