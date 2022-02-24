import 'package:equatable/equatable.dart';
import 'package:nepse/model/top_traders/top_traders_list.dart';
import 'package:nepse/model/top_transaction/top_transaction_list.dart';
import 'package:nepse/model/top_turnover/top_turnover_list.dart';
import 'package:nepse/model/top_volume/top_volume_list.dart';

abstract class TopTradersState extends Equatable {
  const TopTradersState();

  @override
  List<Object> get props => [];
}
//Empty State
class TopTradersEmpty extends TopTradersState {}
//Loading State
class TopTradersLoading extends TopTradersState {}
//Loaded State
class TopTradersLoaded extends TopTradersState {
  final TopTradersList topTradersList;

  const TopTradersLoaded({required this.topTradersList});

  @override
  List<Object> get props => [topTradersList];
}
//TurnOverLoaded State
class TopTurnOverLoaded extends TopTradersState {
  final TopTurnOverList topTurnOverList;

  const TopTurnOverLoaded({required this.topTurnOverList});

  @override
  List<Object> get props => [topTurnOverList];
}
//VolumeLoaded State
class TopVolumeLoaded extends TopTradersState {
  final TopVolumeList topVolumeList;

  const TopVolumeLoaded({required this.topVolumeList});

  @override
  List<Object> get props => [topVolumeList];
}
//TransactionLoaded State
class TopTransactionLoaded extends TopTradersState {
  final TopTransactionList topTransactionList;

  const TopTransactionLoaded({required this.topTransactionList});

  @override
  List<Object> get props => [topTransactionList];
}

//Error State
class TopTradersError extends TopTradersState {
}
