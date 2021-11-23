import 'package:equatable/equatable.dart';
import 'package:nepse/model/market_summary/nepse_market_summary_list.dart';

abstract class MarketSummaryState extends Equatable {
  const MarketSummaryState();

  @override
  List<Object> get props => [];
}
//Empty State
class MarketSummaryEmpty extends MarketSummaryState {}
//Loading State
class MarketSummaryLoading extends MarketSummaryState {}
//Loaded State
class MarketSummaryLoaded extends MarketSummaryState {
  final NepseMarketSummaryList marketSummaryList;

  const MarketSummaryLoaded({required this.marketSummaryList});

  @override
  List<Object> get props => [marketSummaryList];
}
//Error State
class MarketSummaryError extends MarketSummaryState {
}
