import 'package:equatable/equatable.dart';
import 'package:nepse/model/market_status/market_status_model.dart';

abstract class MarketStatusState extends Equatable {
  const MarketStatusState();

  @override
  List<Object> get props => [];
}
//Empty State
class MarketStatusEmpty extends MarketStatusState {}
//Loading State
class MarketStatusLoading extends MarketStatusState {}
//Loaded State
class MarketStatusLoaded extends MarketStatusState {
  final MarketStatusModel marketStatus;
  const MarketStatusLoaded({required this.marketStatus});

  @override
  List<Object> get props => [marketStatus];
}
//Error State
class MarketStatusError extends MarketStatusState {
}
