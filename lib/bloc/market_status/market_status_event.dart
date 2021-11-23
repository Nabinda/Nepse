import 'package:equatable/equatable.dart';

abstract class MarketStatusEvent extends Equatable {
  const MarketStatusEvent();
}

class FetchMarketStatus extends MarketStatusEvent {
  const FetchMarketStatus();

  @override
  List<Object> get props => [];
}
