import 'package:equatable/equatable.dart';

class ServiceReceivedStaleEntity extends Equatable {
  final int id;
  final int marketId;
  final String marketName;
  final int quantity;

  const ServiceReceivedStaleEntity({
    required this.id,
    required this.marketId,
    required this.marketName,
    required this.quantity,
  });

  @override
  List<Object?> get props {
    return [id, marketId, marketName, quantity];
  }
}
