import 'package:equatable/equatable.dart';

class ServiceMarketEntity extends Equatable {
  final int? id;
  final String? name;

  const ServiceMarketEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props {
    return [id, name];
  }
}
