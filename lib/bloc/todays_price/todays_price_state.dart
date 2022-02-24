import 'package:equatable/equatable.dart';

import '../../model/todays_price/todays_price_list.dart';

abstract class TodaysPriceState extends Equatable {
  const TodaysPriceState();

  @override
  List<Object> get props => [];
}
//Empty State
class TodaysPriceEmpty extends TodaysPriceState {}
//Loading State
class TodaysPriceLoading extends TodaysPriceState {
}
//Loaded State
class TodaysPriceLoaded extends TodaysPriceState {
  final TodaysPriceList todaysPrice;

  const TodaysPriceLoaded({required this.todaysPrice});

  @override
  List<Object> get props => [todaysPrice];
}
//Error State
class TodaysPriceError extends TodaysPriceState {
}
