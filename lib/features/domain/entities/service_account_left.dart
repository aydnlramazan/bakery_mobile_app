import 'package:equatable/equatable.dart';

class ServiceAccountLeftEntity extends Equatable {
  final int marketId;
  final String marketName;
  final double totalAmount; // Using double for decimal in Dart
  final int staleBread;
  final int givenBread;


  const ServiceAccountLeftEntity({
    required this.marketId,
    required this.marketName,
    required this.totalAmount,
    required this.staleBread,
    required this.givenBread
  });

  @override
  List<Object?> get props {
    return [marketId, marketName, totalAmount, staleBread, givenBread];
  }
}
