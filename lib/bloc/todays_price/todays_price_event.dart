import 'package:equatable/equatable.dart';

abstract class TodaysPriceEvent extends Equatable {
  const TodaysPriceEvent();
}

class FetchTodaysPrice extends TodaysPriceEvent {
  final int pageNumber;
  const FetchTodaysPrice({required this.pageNumber});

  @override
  List<Object> get props => [];
}
