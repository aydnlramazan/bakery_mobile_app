part of 'service_markets_bloc.dart';

sealed class ServiceMarketsEvent{}

final class ServiceGetMarketsRequested extends ServiceMarketsEvent {
  int listId;
  ServiceGetMarketsRequested({required this.listId});
}

final class ServiceAddMarketRequested extends ServiceMarketsEvent {
  ServiceMarketModel market;
  ServiceAddMarketRequested({required this.market});
}

final class ServiceRemoveMarketRequested extends ServiceMarketsEvent {
  ServiceMarketModel market;
  ServiceRemoveMarketRequested({required this.market});
}