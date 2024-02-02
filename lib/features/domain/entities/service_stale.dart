import 'package:equatable/equatable.dart';

class ServiceStaleEntity extends Equatable {
  final int marketId;
  final String marketName;

  const ServiceStaleEntity({
    required this.marketId,
    required this.marketName,
  });

  @override
  List<Object?> get props {
    return [marketId, marketName];
  }
}
