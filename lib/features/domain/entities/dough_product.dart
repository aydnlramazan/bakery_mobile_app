import 'package:equatable/equatable.dart';

class DoughProductEntity extends Equatable {
  final int? id;
  final String? name;


  const DoughProductEntity(
      {this.id,
      this.name});

  @override
  List<Object?> get props {
    return [id, name];
  }
}
