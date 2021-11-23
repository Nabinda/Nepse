import 'package:equatable/equatable.dart';

abstract class MarketSummaryEvent extends Equatable {
  const MarketSummaryEvent();
}

class FetchMarketSummary extends MarketSummaryEvent {
  const FetchMarketSummary();

  @override
  List<Object> get props => [];
}
