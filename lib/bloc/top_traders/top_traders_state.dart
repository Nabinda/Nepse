import 'package:equatable/equatable.dart';
import 'package:nepse/model/top_traders/top_traders_list.dart';

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

//Error State
class TopTradersError extends TopTradersState {
}
