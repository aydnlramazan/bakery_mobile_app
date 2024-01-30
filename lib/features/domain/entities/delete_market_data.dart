import 'package:equatable/equatable.dart';

class DeleteMarketDataEntity extends Equatable {
  final int? serviceListId;
  final int? marketId;


  const DeleteMarketDataEntity({this.serviceListId, this.marketId});

  @override
  List<Object?> get props {
    return [serviceListId, marketId];
  }
}
