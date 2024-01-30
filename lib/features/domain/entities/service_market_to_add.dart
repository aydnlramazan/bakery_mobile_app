import 'package:equatable/equatable.dart';

class ServiceMarketToAddEntity extends Equatable {
  final int? serviceListId;
  final int? quantity;
  final int? marketId;

  const ServiceMarketToAddEntity({
    this.serviceListId,
    this.quantity,
    this.marketId,
  });

  @override
  List<Object?> get props {
    return [serviceListId, quantity, marketId];
  }
}
