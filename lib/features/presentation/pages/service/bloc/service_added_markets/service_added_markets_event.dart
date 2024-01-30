part of 'service_added_markets_bloc.dart';

sealed class ServiceAddedMarketsEvent{}

final class ServiceGetAddedMarketsRequested extends ServiceAddedMarketsEvent {
  int listId;
  ServiceGetAddedMarketsRequested({required this.listId});
}

final class ServiceAddAddedMarketRequested extends ServiceAddedMarketsEvent {
  ServiceAddedMarketModel market;
  ServiceAddAddedMarketRequested({required this.market});
}

final class ServiceRemoveAddedMarketRequested extends ServiceAddedMarketsEvent {
  ServiceAddedMarketModel market;
  ServiceRemoveAddedMarketRequested({required this.market});
}

final class ServiceUpdateAddedMarketRequested extends ServiceAddedMarketsEvent {
  final ServiceAddedMarketModel market;
  final int index;
  ServiceUpdateAddedMarketRequested({required this.market, required this.index});
}

final class ServicePostAddedMarketRequested extends ServiceAddedMarketsEvent {
  final List<ServiceMarketToAddModel> markets;
  final int userId;
  ServicePostAddedMarketRequested({required this.markets, required this.userId});
}