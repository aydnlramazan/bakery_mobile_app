import 'package:equatable/equatable.dart';

class ServiceAddedMarketEntity extends Equatable {
  final int? id;
  final int? serviceListId;
  final int? quantity;
  final int? marketId;
  final String? marketName;

  const ServiceAddedMarketEntity({
    this.id,
    this.serviceListId,
    this.quantity,
    this.marketId,
    this.marketName,
  });

  @override
  List<Object?> get props {
    return [id,serviceListId, quantity, marketId, marketName];
  }
}
