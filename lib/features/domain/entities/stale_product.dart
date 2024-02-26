import 'package:equatable/equatable.dart';

class StaleProductEntity extends Equatable {
  final int id;
  final String name;
  final int categoryId;
  final double price; // Using double for decimal in Dart

  const StaleProductEntity({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
  });

  @override
  List<Object?> get props {
    return [id, name, categoryId, price];
  }
}
