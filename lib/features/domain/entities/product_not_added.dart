import 'package:equatable/equatable.dart';

class ProductNotAddedEntity extends Equatable {
  final int? id;
  final String? name;

  const ProductNotAddedEntity({this.id, this.name});

  @override
  List<Object?> get props {
    return [id, name];
  }
}
